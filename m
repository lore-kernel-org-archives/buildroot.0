Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DA4EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 07:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF64340142;
	Sun, 25 Jun 2023 07:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF64340142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqwrZUYP3gML; Sun, 25 Jun 2023 07:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06376400D2;
	Sun, 25 Jun 2023 07:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06376400D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A67B1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 07:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10A06400D2
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 07:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10A06400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPjRLS1jAq7z for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 07:08:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E542C400BA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E542C400BA
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 07:08:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0C9F7B0054E;
 Sun, 25 Jun 2023 09:08:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 09:08:50 +0200
Date: Sun, 25 Jun 2023 09:08:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20230625070850.GH24952@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-4-dannenberg@ti.com>
 <20230625070230.GG24952@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230625070230.GG24952@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687676933;
 bh=5/ANb2SLs9fyR8UySf5Q0Io519yrjt3pVjne1g8Nw5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T7bZCzcCog8+diMYxIrCWZuOGvnNHk9CScLBGUjYCookFKUVk8yTuUiae8b5EkwUF
 FHbby+bcdspJzpQt36u60xUyTOvrWdX9TsBW2IFmLA/EOUD9zqGuj0FRnwYUAFMe9S
 lZEpgx2mL2ZAxdMlWTMj/udoeb/Mf/1GSKfZlLwYEy1Ipm2RM6qRR6CAwKkKyI9rzN
 nt7m6KSt0SVxSMrFta9TxlrBLiL+WGGyjeJoytexq9ucqDqGh79Nr8oK2isV04bxNr
 Vtws1xZYxta1I/BlC7Dq2F0SkwkrYMsDMtl+ij8+mCouD3LQb/Si0YRH+a8u2quYGy
 7yUGmkfYFnXeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T7bZCzcC
Subject: Re: [Buildroot] [PATCH v9 03/11] boot/uboot: add support for
 building the TI K3 DM into U-Boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2023-06-25 09:02 +0200, Yann E. MORIN spake thusly:
> On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
[--SNIP--]
> > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
> > +# Currently supports the FW from Git tag 08.06.00.006 by default
> > +TI_K3_DM_VERSION = 340194800a581baf976360386dfc7b5acab8d948
> > +TI_K3_DM_SITE = https://git.ti.com/processor-firmware/ti-linux-firmware/blobs/raw/$(TI_K3_DM_VERSION)/ti-dm/$(BR2_TARGET_UBOOT_TI_K3_DM_SOC)
> > +TI_K3_DM_SOURCE = ipc_echo_testb_mcu1_0_release_strip.xer5f
> > +# This is not really nice but disable the hash check for the DM FW file. Main
> > +# reason is all those DM FW files for different SoCs have the same(!) name in
> > +# the Git repository they reside in, so it would be more difficult to distinguish
> > +# between them for hash checking purposes. To work around this let's just
> > +# rely and trust the official Git repo at ti.com is known-good which is also
> > +# accessed through a secure transport.
> > +BR_NO_CHECK_HASH_FOR += $(TI_K3_DM_SOURCE)
> > +UBOOT_EXTRA_DOWNLOADS = $(TI_K3_DM_SITE)/$(TI_K3_DM_SOURCE)
> > +UBOOT_MAKE_OPTS += DM=$(UBOOT_DL_DIR)/$(TI_K3_DM_SOURCE)
> > +endif
> 
> I again am not very fond of this injecting extra downloads n uboot. I'd
> rather we have a separate package, ti-linux-firmware. That way, it can
> be used by both uboot and ti-k3-image-gen.
> 
> The ti-linux-firmware repository is not small (git clone reports 750MiB
> today) but the repository exposes snapshots, so that is a bit more easy
> on the networks connection (althoiugh we should take the .gz, not the
> .xz, as the on-the-fly compression is much slower for xz than gz).

Well, the .tar.gz is 432MiB, so not so much an improvement over the
750MiB of the repository, and the same download size will have to be
done again when we later bump the version, so I think it is better to
do a git clone...

The other pro of doing a git clone, is that we do have a known-working
way of generating reproducible arhives locally, while relying on the
remote site do generate the archive risk generating non-reproducible
archives (e.g. if they update their git version, there is no guarantee
the archive is reproducible across git versions; we've been bitten quite
hard early in the year when github (and now gitlab?) broke the whole
world that was checking hashes).

Regards,
Yann E. MORIN.

> Then it is again just a matter of ti-linux-firmware copying the
> appropriate blobs into $(BINARIES_DIR) and then uboot grabbing what's
> necessary.
> 
> Regards,
> Yann E. MORIN.
> 
> >  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
> >  UBOOT_DEPENDENCIES += opensbi
> >  UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
> > -- 
> > 2.34.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
