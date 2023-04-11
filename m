Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B7CC7619A
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 20:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 269C981401;
	Tue, 11 Apr 2023 20:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 269C981401
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUlG0xdNuAzz; Tue, 11 Apr 2023 20:33:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BAF381406;
	Tue, 11 Apr 2023 20:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BAF381406
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECC5B1C3C52
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3B1841CEC
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 20:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3B1841CEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJB4uPoVns9J for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 20:33:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6733400C4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6733400C4
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 20:33:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E5B595FF93;
 Tue, 11 Apr 2023 22:33:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 11 Apr 2023 22:33:28 +0200
Date: Tue, 11 Apr 2023 22:33:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yann.morin@orange.com
Message-ID: <20230411203328.GR2819@scaer>
References: <20230329193028.775041-1-sebastian.weyer@smile.fr>
 <27991_1681212690_64354512_27991_146_1_20230411113128.GA483930@tl-lnx-nyma7486>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27991_1681212690_64354512_27991_146_1_20230411113128.GA483930@tl-lnx-nyma7486>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681245215;
 bh=YWmve5lrkYlvgXdwp/D7lGrl1ZkiHlMiEug1Dw2ZzwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LdhRD1+hPOhYIlfvCsWNbwqlTIobwSP+l0ZxSpANpKuUSdKj+w4DnDw4pBKtcTod1
 Z9H23bEVSg7aFz2pDzszaoU3XucbRecwuZTgYH+iQqeFyVHuKEg6VSpJKjQcujbngm
 cxpIIYWC+P+ZjYnmbuomjcWdaO3WwkktlkPmma88dDdCXiIwlJ68iPyAuvtkHG6xyr
 8a8rSz3YSFbAngCSoIvYntsq0F9bogF0ieZTzhvcmC+wCrLdmXKmVjDEIkOqBCumKO
 JT5KoZgjhO8sIrCO/CsmUV78eAEImmYPxeb/9IvR8Yul+UGYQE9HIWtfHVlJQn3DiD
 p8jRB9ztlbsnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LdhRD1+h
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: bump to version 2.37
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
 Sebastian Weyer <sebastian.weyer@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, Sebastian, Romain, All,

On 2023-04-11 13:31 +0200, yann.morin@orange.com spake thusly:
> On 2023-03-29 21:30 +0200, Sebastian Weyer spake thusly:
> > From: Romain Naour <romain.naour@smile.fr>
> > 
> > See:
> > https://sourceware.org/glibc/wiki/Release/2.37
> > https://lists.gnu.org/archive/html/info-gnu/2023-02/msg00000.html
> Thos bump breaks the build of host-localedef, as a patch can't be
> applied:
>     >>> host-localedef 2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa Patching
>     Applying 0001-HACK-only-build-and-install-localedef.patch using patch:
>     patching file Rules
>     Hunk #1 succeeded at 224 (offset 8 lines).
>     patching file locale/Makefile
> 
>     Applying 0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch using patch:
>     patching file configure
>     Hunk #1 succeeded at 4178 with fuzz 1 (offset -473 lines).
>     Hunk #2 FAILED at 4781.
>     Hunk #3 succeeded at 4589 (offset -600 lines).
>     1 out of 3 hunks FAILED -- saving rejects to file configure.rej

Thanks for the report, I've sent a patch:
    https://patchwork.ozlabs.org/project/buildroot/patch/20230411203113.1573787-1-yann.morin.1998@free.fr/

Care to test that, please?

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
