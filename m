Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7484EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 05:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 233A340894;
	Tue,  4 Jul 2023 05:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233A340894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nrlEFIcl4frO; Tue,  4 Jul 2023 05:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1BAF40899;
	Tue,  4 Jul 2023 05:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1BAF40899
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1FF1BF285
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 05:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 546684018F
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 05:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 546684018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Opqodk1SBowm for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 05:24:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84256400BF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84256400BF
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 05:24:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8D8E02003A4;
 Tue,  4 Jul 2023 07:24:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jul 2023 07:24:49 +0200
Date: Tue, 4 Jul 2023 07:24:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Message-ID: <20230704052449.GM2510@scaer>
References: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
 <20230629053130.3976-2-jeanmichel.hautbois@yoseli.org>
 <20230703185532.GC2510@scaer>
 <34f2156d-2f2e-c77f-b002-ec0c01bbc6ae@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34f2156d-2f2e-c77f-b002-ec0c01bbc6ae@yoseli.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688448295;
 bh=xg3onHxJJ/0o23JNCE+hTEjxMEQVz2wfoBl6Br1G7O8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FcN6K1TGOW3NV0u+p3moEoGjSRTQjqjJp84rrh979UMxNO32Dz82wuXT1XrfW+mFl
 MslRbHgqo9VtvvLJTz3KzJtO2LBpLwMtT8DW10wW2s+m0iURfYG08IgkgYHUjg7Fm/
 ee952dN1ZxlX3MKa+JbeNNQCCVKjvjGB/a6erEd50VNUce6JrRz7MmJMjW9UVL+Tiv
 mGiOug/GC/qMyTPLrpxbBFUe781Bjo4EcXinZKZjOnwH8mpT355wu3LlhooQkrElrJ
 w3uyfwUPDXENWN6IHD/JWkiXQhNJ9fpuAn12sLBXSeo7IYtivb3Ys9MReZfeL4fhsq
 Tz9XG4sp/r4UA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FcN6K1TG
Subject: Re: [Buildroot] [PATCH 1/3] arch: add support for mcf54418 Colfdire
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jean-Michel, All,

On 2023-07-03 22:37 +0200, Jean-Michel Hautbois spake thusly:
> On 03/07/2023 20:55, Yann E. MORIN wrote:
> >On 2023-06-29 07:31 +0200, Jean-Michel Hautbois spake thusly:
> >>The m68k family ony has one Coldfire variant, namely the 5208. Add the
> >>support for the MCF54418 CPU in the configuration file.
> >As your cover-letter said, eda11417beaf (m68k: remove
> >BR2_GCC_TARGET_ARCH), setting it breaks use of external toolchains.
[--SNIP--]
> >So, your commit log should explain how/why it is safe to re-introduce
> >BR2_GCC_TARGET_ARCH. I see you only set ig for this new CPU variant, so
> >maybe that's enough of a reason.
> >
> >Still, it'd be nice to have it explained in plain letters.
> 
> OK, so get the content from the plain letter and have it in this commit
> message too ;-).

Yes, the reference to commit eda11417beaf is very important to have in
the nez commit mess is very important to have in the nez commit messagee

> >Also, it'd be nice if you could try with an external toolchain, and
> >explain that in the commit log. If you do not have an external toolchain
> >available, you can generate one with Buildroot, and re-use it as an
> >external toolchain.
> Sadly, the only external toolchain I tried is the one from bootlin, and it
> is not compatible with a CPU which has a MMU. Considering I might miss some
> things !

If there is no other pre-built toolchain, then build one with Buildroot
(with this change!), and re-user it as an external toolchain, just to be
sure that this case at least still works; see the manual [0] on how to
do that.

[0] https://buildroot.org/downloads/manual/manual.html#_advanced_usage

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
