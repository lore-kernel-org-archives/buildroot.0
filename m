Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609B8C54EE9
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 13:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCF4040C12;
	Thu, 22 Sep 2022 13:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCF4040C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwWtZZYWjQpo; Thu, 22 Sep 2022 13:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B376404BB;
	Thu, 22 Sep 2022 13:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B376404BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9BE1BF2A4
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 13:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A4F5404BB
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 13:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A4F5404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cxwC0no8tzNc for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 13:18:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E9640C31
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18E9640C31
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 13:18:07 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BC7F23520684; Thu, 22 Sep 2022 15:18:04 +0200 (CEST)
Date: Thu, 22 Sep 2022 15:18:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Ben Wolsieffer <benwolsieffer@gmail.com>
Message-ID: <YyxgjEsbOShV0aQN@waldemar-brodkorb.de>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
X-Operating-System: Linux 5.10.0-18-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1663852684; bh=GzioNeyU++CqyN0/oKuTXlGf8jQjWouOqprIOtNriyc=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=fEqyKToheeR3VjCDZ2pSORuxiGhir5oqRFZc8IBNJmO4IxeXGGK5+BwBsEtBOc6qV
 7F8f0kGMnzRghB0IAMLyiMJ2zZ9hEUr4dpJAKjEh4E0wTAXqyDACVFZf3bcWcRv9dK
 5PLySiTf4/6O4xJIwK/fhNQIKF3lPZVoZdeuiWmp3UqdWJZTQRyOn6j5y8CAFNTfaW
 1ezVDXSAAsElgtpz3B6FR5flYOb8MjfP6zmb/X45FTapaxg3GvO/t8cmuSUuLEZjCt
 xYHHbfQ3peOndF7htLwhF0LCVCYm8+AK8N5cqg6ixpwhkigMpx8bVEQ1WRdbWtqCMP
 /888r7uJ99qrQ==
Subject: Re: [Buildroot] [PATCH v3 0/8] Add support for FDPIC binaries on ARM
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
Reply-To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ben, Hi all,

I tested this on my STM32F746G-DISCO device I got via eBay.

I had to tweak the userland a little bit. I had to disable
BUSYBOX_STATIC as static FDPIC is not supported. The binary
will end up using /usr/lib/ld.so.1 as interpreter even when static 
build is used. This is a known limitation.

Secondly I had to disable libm in uClibc-ng to get a smaller libc
otherwise busybox hush was triggering a malloc failure trying to use 
to much memory for this small device.

I am now testing to use individual busybox binaries and libbusybox,
which might work, too.

So for the complete series you can add a:
Tested-By: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar

Ben Wolsieffer wrote,

> Introduce support for the FDPIC binary format on ARM. FDPIC binaries
> enable memory sharing between processes on no-MMU systems.
> 
> Changes in v3:
>   * Don't change default binary format
>   * Disable FDPIC support with external toolchains
>   * Enable NPTL if FDPIC is used
>   * Patch libtool to support ARM FDPIC shared libraries
> 
> Changes in v2:
>   * Simplify special casing of FDPIC toolchain target
>   * Add additional patches to fix building Linux and U-Boot with an
>     FDPIC toolchain by passing -mno-fdpic. I have submitted fixes
>     upstream to do this automatically, but they have not yet been
>     accepted and will take a while to end up in Buildroot.
> 
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Ben Wolsieffer (8):
>   Revert "arch: drop now useless support for FDPIC"
>   arch: don't enable FDPIC binaries by default
>   arch: make FDPIC dependent on toolchain support
>   arch/arm: add support for FDPIC
>   boot/uboot: pass -mno-fdpic if FDPIC is enabled
>   linux: pass -mno-fdpic if FDPIC is enabled
>   package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC
>   package/pkg-autotools: patch libtool to support ARM FDPIC
> 
>  arch/Config.in           | 15 +++++++++++++++
>  boot/uboot/uboot.mk      |  5 +++++
>  linux/linux.mk           |  8 +++++++-
>  package/Makefile.in      |  6 ++++++
>  package/pkg-autotools.mk | 17 +++++++++++++++++
>  package/uclibc/Config.in |  2 +-
>  package/uclibc/uclibc.mk |  8 ++++++++
>  toolchain/Config.in      |  4 ++++
>  8 files changed, 63 insertions(+), 2 deletions(-)
> 
> -- 
> 2.37.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
