Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F241C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 21:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCACF417AB;
	Thu, 28 Dec 2023 21:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCACF417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBSiR-HHf8Q6; Thu, 28 Dec 2023 21:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B60E417A5;
	Thu, 28 Dec 2023 21:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B60E417A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8461B1BF336
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6888382B3E
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 21:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6888382B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7YAszokhdm0 for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 21:06:06 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 624AB82660
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 21:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 624AB82660
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 572ACB00548;
 Thu, 28 Dec 2023 22:05:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Dec 2023 22:05:59 +0100
Date: Thu, 28 Dec 2023 22:05:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZY3jN2pXiI6ZEb-A@landeda>
References: <20231227171343.2903354-1-thomas.petazzoni@bootlin.com>
 <20231227171343.2903354-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227171343.2903354-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703797564;
 bh=VNi1I4WOKkIr/KTQeLdrLiSND+E7G9AUJaE7h8CQoaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iCW0Fw6ort18B5NBUMVy1GVIazREAOezDfz3mVFOoPL9lanjlFEVisEdmzRH9jJr3
 1/VSIFwtIvv2FgpOheTv2pB0EReLjX3LdI404erYp/fSsNlBNuVbHUTv57KxZCEYkY
 JsS4vV1BCe5rTq7COGGBDBEv239EGgTpIo8AZp15TGTIYUMzildkxjz/kydliXxP8t
 ajs2372LIBmGf7utFhclHHpVRthLGKEDCj8HRNvaxU/v+THAQcx++pjkrLZ1xDhUkP
 idfPJzhOs2JgtME20BBLdFgFlo+ZamNiRZx71l6XUfIULLAZLNCgtQs+fiXC9YkPol
 nzSAVRMhoBQ0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iCW0Fw6o
Subject: Re: [Buildroot] [PATCH 2/2]
 toolchain/toolchain-external/toolchain-external-bootlin: update to
 2023.11-1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-12-27 18:13 +0100, Thomas Petazzoni via buildroot spake thusly:
> New toolchains have been released, with the following changes:
> 
> - The bleeding-edge toolchains are based on gcc 13.2, binutils 2.41,
>   gdb 14.1, kernel headers 5.10, glibc 2.38, musl 1.2.4 or uclibc-ng
>   1.0.45.
> 
> - The stable toolchains are based on gcc 12.3, binutils 2.40, gdb
>   13.2, kernel headers 4.14, glibc 2.38, musl 1.2.4 or uclibc-ng
>   1.0.45.
> 
> - The glibc version is no longer affected by CVE-2023-4911
> 
> - The gdb build has been fixed to no longer rely on uninstalled
>   libbfd.so and libopcodes.so libraries
> 
> - The zlib library, which was incorrectly present in the toolchain
>   sysroot, is gone, fixing various build failures encountered with
>   2023.08 toolchains.
> 
> - There are now toolchains for m68k 68xxx based on uclibc and musl in
>   addition to glibc, which was already supported
> 
> The careful reviewer will notice that a number of
> 
>     depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
> 
> are being added to the toolchains that use gcc 13.x, as per
> a0d2a5cfec0ade7cb577cbff25aac289e746e61b
> ("support/scripts/gen-bootlin-toolchains: generate
> BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard").
> 
> All 214 test cases were successfully run:
> 
>   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1120323562
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

[--SNIP big patch--]

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
