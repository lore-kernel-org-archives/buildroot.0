Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB523C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 20:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0962182A56;
	Sun, 14 Aug 2022 20:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0962182A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlkYoCjKMUqz; Sun, 14 Aug 2022 20:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F632827A8;
	Sun, 14 Aug 2022 20:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F632827A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86DA61BF3BD
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61D3160AD1
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61D3160AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyTv0CN6eZi1 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 20:23:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D2A560AA4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D2A560AA4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 20:23:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 731CE60130;
 Sun, 14 Aug 2022 22:23:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 22:23:00 +0200
Date: Sun, 14 Aug 2022 22:23:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220814202300.GM2854108@scaer>
References: <20220813093627.369221-1-ju.o@free.fr>
 <20220813125424.6caa746b@windsurf>
 <e0634cb156656205a84bc7ecce8a9412@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0634cb156656205a84bc7ecce8a9412@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660508583;
 bh=4PKykoRV2uP4xWgfSRDIJ9Ma9pdOvJd+G9k4ZNExsaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EDX17IzqCrIetNJ0KWpAVpeBPti8ezapPhOdP0U1BC+gug2WhUhaAc1zkvdnAKZc9
 mbnaag+zs5FRBRCrwmM1VbMTsM0xA20jIGGrR9J4dRLqUQalPRAmm2bt851eDHc5IZ
 Lf1s67smm2/wrS9XV99jPLBgvTXpTL3untnX6JrGNEyHleQS60oIuJ94Bprb+DstHN
 BzUwDoZsrsY/Az5jkwtK4M6xOBRpso6VE6pXT6dOsrYkMzWhuKXVmvGWqENbPVmnOf
 ksz9G+z1Ql/rRnDp+fyw6mqsi2tlvfppZ5RNCCkn4fel9DfqNslHyN8E1dH6/OY54T
 VjmKHr0oNZxqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EDX17Izq
Subject: Re: [Buildroot] [PATCH next 1/1] package/linux-backports: bump
 version to 5.15.58
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Julien, All,

On 2022-08-13 22:01 +0200, Julien Olivain spake thusly:
> On 13/08/2022 12:54, Thomas Petazzoni wrote:
> >On Sat, 13 Aug 2022 11:36:27 +0200
> >Julien Olivain <ju.o@free.fr> wrote:
> >>This commit also change the minimal supported kernel version from 3.10
> >>to 4.4. See [1].
> >Could this be problematic for some of our users? Do we want to keep
> >support for an older linux-backports release to still support 3.10
> >kernels?
> >
> >I can imagine that the people who end up using linux-backports are
> >probably stuck with an old kernel for some reason, so raising the
> >minimum kernel version required to use linux-backports is probably
> >something we should do with a bit of care?

But then, one could argue that this is the same with other packages that
get requirements on newer kernel headers (and thus probably about newer
running kernel). We can't hold back forever.

The alternate solution is not great: we could add a version choice:

    config BR2_PKG_LNX_BACKPORTS_5_15_X
        bool "5.15.x (for kernels back to 4.4)"

    config BR2_PKG_LNX_BACKPORTS_5_8_X
        bool "5.8.x (for kernels back to 3.10)"

But this is not ideal... :-/

> - Trying to compile kernel v3.10.108 in qemu_aarch64_virt_defconfig
>   did not worked out-of-the-box for me (on Buildroot tag
>   2022.08-rc1, in utils/docker-run). Build fails with:
> 
>     dtc-lexer.lex.c: In function 'yylex':
>     dtc-lexer.l:46:18: error: 'yylloc' undeclared (first use in this
> function); did you mean 'yyalloc'?

Gah. This is 9b41b54be077 (linux: fix build with host-gcc 10+)...

That's because in 3.10, the dtc sub-dir still had the pre-generated
lexer and parser. And with 9b41b54be077, we remove all lines that
instanciate yylloc as a YYLTYPE:

    grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
    |xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'

So, this will remove it in bot the actual source and the pre-generated C
files.

So, yeah, we might even be able to build a 3.10 kernel with contemporary
Buildroot versions anyway...

We could fix that by passing REGENERATE_PARSERS=1 in LINUX_MAKE_FLAGS...
Julien, could you test that, please?

Regards,
Yann E. MORIN.

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
