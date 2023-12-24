Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01CDC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9614440018;
	Sun, 24 Dec 2023 16:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9614440018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vor-6-UweTcf; Sun, 24 Dec 2023 16:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C3B3404AB;
	Sun, 24 Dec 2023 16:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C3B3404AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16D851BF304
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAFA5404AB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAFA5404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWQWt1L4nadO for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:55:21 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A869F40018
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A869F40018
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 96084B0037C;
 Sun, 24 Dec 2023 17:55:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Dec 2023 17:55:16 +0100
Date: Sun, 24 Dec 2023 17:55:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZYhidG-NVNvDhx9i@landeda>
References: <20231222105655.444328-1-ju.o@free.fr> <ZYhf_BKuhSJPyNrJ@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZYhf_BKuhSJPyNrJ@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703436919;
 bh=7lLu3otT7Z3gChxw2HESyyTw4p/6uTNCXIToFDyx4ng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvkJX7G5Rerdf+nZIYvL3DTf0n05rAog5GSaOK1QEDpmQBRc9YOJT6DG9hlvHmwIJ
 ReFzguD9WpIQIZTH4pwCo5f/FeD/c6tXOkkrRLsW7DrFI+w4hosrOZq4mt/vacgzlH
 VBUhQtV60iL0QI57M8x61z/EucpJHNy5Qrf3RFoqP7FXawRI/ef76JBdE3NAjQzxih
 Hx8Xx+F7DU3ppgOQAW0qH7tteKTNFIxWyamrA5TObsij34xycZ5syP8bA3+WF8U/Iu
 DoSlyO81RfErWJFTznlL5BXdn3p6AQlBhAGynU0s/wAbIM8m8KTx7YGdrLRkhrQayL
 wA6salONyHMkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hvkJX7G5
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/edk2: add support for RISC-V
 64bit architecture
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

Julien, All,

On 2023-12-24 17:44 +0100, Yann E. MORIN spake thusly:
> On 2023-12-22 11:56 +0100, Julien Olivain spake thusly:
> > RISC-V 64bit qemu virt machine support has been added in edk2
> > version "stable202302". See [1].
> > 
> > Since edk2-stable202308, introduced in buildroot in commit 5c9f310
> > "boot/edk2: bump to version edk2-stable202308", it is now possible
> > to boot the edk2 UEFI shell in qemu.
> > 
> > This commit adds this early RISC-V support to edk2.
> 
> Building edk2 for risc-v is broken with per-package directories. For
> example, this defconfig fails to build:

It seems it is not related to risc-v, finally, as an AArch64 build is
broken similarly;

    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
    # BR2_TARGET_ROOTFS_TAR is not set
    BR2_TARGET_EDK2=y

    build.py...
     : error 7000: Failed to execute command
        make tbuild [/home/ymorin/dev/buildroot/O/master/build/edk2-edk2-stable202308/Build/ArmVirtQemu-AARCH64/RELEASE_GCC5/AARCH64/MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe]
    build.py...
     : error 7000: Failed to execute command
        make tbuild [/home/ymorin/dev/buildroot/O/master/build/edk2-edk2-stable202308/Build/ArmVirtQemu-AARCH64/RELEASE_GCC5/AARCH64/MdeModulePkg/Universal/DriverHealthManagerDxe/DriverHealthManagerDxe]
    build.py...
     : error F002: Failed to build module
        /home/ymorin/dev/buildroot/O/master/build/edk2-edk2-stable202308/MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe.inf [AARCH64, GCC5, RELEASE]
    - Failed -
    Build end time: 17:50:47, Dec.24 2023
    Build total time: 00:00:11
    make[1]: *** [package/pkg-generic.mk:283: /home/ymorin/dev/buildroot/O/master/build/edk2-edk2-stable202308/.stamp_built] Error 1
    make: *** [Makefile:23: _all] Error 2

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
