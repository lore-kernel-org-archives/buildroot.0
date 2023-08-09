Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AC3C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 13:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E0EB4053C;
	Wed,  9 Aug 2023 13:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E0EB4053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozEiQTeAr74p; Wed,  9 Aug 2023 13:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D2E40908;
	Wed,  9 Aug 2023 13:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D2E40908
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8269C1BF842
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 13:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BFDD611DE
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 13:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BFDD611DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIBKQRMDL_ld for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 13:57:25 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00412611D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 13:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00412611D9
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id DE932A05D7
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 15:57:22 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id C4E028014B
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 15:57:22 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 852E7C003C
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 15:57:22 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 09 Aug 2023 15:57:21 +0200
Message-ID: <2691942.mvXUDI8C0e@kilian-aisec>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3773
X-purgate-ID: 154282::1691589442-A6FF9C09-A3788076/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691589442;
 bh=bMMj0wtyY358XwGDCF+M4LGHapV3IrZg5LnRwfTDoxc=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=xC+TmlIjirxNDQKoEGt3BjBYSieSfxg5rzHSPJ2UBnvl4xDIxIiq52oo4Njxp3xpf
 nHIWGfIYPoxKJGhIRZ2eYIxJC5//cwcFyUVaxYdBpo72oDMUhIqySWuJJQz7SB1EXz
 el2FWDMCjTHDrvcATaaCtVxbg2n2t04gqf5rBNGCOvTpy4fdAgO/0sAd1Tjlkl+uBT
 v5fi1zDYlDuhwFJ9O15zHI5VazI5sQyvtoLax3TKARD1zIFTXv67Q0+erzDwHo3djN
 tXFE7Bus3PvqZSmk0Rzz0hODcEJ/IcGwTUbuJXr4LAGqbBOhxs4X9YxAyYO2xT53tp
 WHp2UB2ImzAFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=xC+TmlIj
Subject: [Buildroot] Interested in board support for BeagleV-Ahead
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I am interested in adding board support for the BeagleV-Ahead.

I already started trying to setup the board support, but at the moment it does 
not work yet, due to some gcc 12 and zicsr and zifencei RiscV extension issue 
(see below).

My first question is: As long as it does not yet work: Shall I already send 
(not yet working) patches to the mailing list, so that people can discuss 
about it and potentially help me? Maybe marked as RFC? Or shall I describe 
what I try as part of a normal email (like I do in this mail)?


Regarding board support, Yocto support already seems to exist:

https://git.beagleboard.org/beaglev-ahead/xuantie-yocto

Also a uboot and kernel:

https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-u-boot
https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux

I was able to successfully build the uboot, flash it onto an SD card and boot 
uboot. I then started to write a defconfig for the BeagleV-Ahead, starting from 
the already existing beaglev_defconfig. I used the following uboot settings:

BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/beagleboard/beaglev-ahead-u-boot.git"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="beaglev-v2020.01-1.1.2"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="light_beagle"
BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beaglev-ahead/uboot.fragment"

The uboot fragment file overwrites a switch of the custom uboot defconfig, such 
that the custom uboot generates u-boot.dtb (without it the build fails):

CONFIG_OF_EMBED=n

For the kernel I use:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/archive/beaglev-v5.10.113-1.1.2/beaglev-ahead-linux-beaglev-v5.10.113-1.1.2.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="light"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="thead/light-beagle"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y


When trying to build, I currently encounter the following problems:

The SoC of the BeagleV-Ahead needs RiscV Vector Extension support enabled, 
else the build fails, because it cannot deal with the assembly instructions in 
some parts of the code. Hence, I believe one needs to activate support for 
this:

BR2_RISCV_ISA_CUSTOM_RVV=y

However, this enforces that gcc 12 or higher is used, see Config.in.riscv:

https://gitlab.com/buildroot.org/buildroot/-/blob/
b10ceec75520fab80f76081f50daaaab9df890f5/arch/Config.in.riscv#L69-72

It seems that the RiscV ISA was reorganized at some point, regarding which 
extension some microarch maintenance instructions belong to. Also it seems 
that this change was adopted in gcc 12 and that this caused some issues in the 
past, also within buildroot, see here:

https://lists.buildroot.org/pipermail/buildroot/2022-July/646795.html

The patch seems to be active in buildroot currently, see here:

https://gitlab.com/buildroot.org/buildroot/-/blob/
b10ceec75520fab80f76081f50daaaab9df890f5/arch/arch.mk.riscv#L38-39

However, when trying to build, I get lots of errors, that opcodes are not 
recognised and the zicsr and zifencei extension are required, e.g.:

"arch/riscv/cpu/mtrap.S:68: Error: unrecognized opcode `csrr a0,mcause', 
extension `zicsr' required"

I already tried using gcc 11 instead (omitting BR2_RISCV_ISA_CUSTOM_RVV and 
setting BR2_GCC_VERSION_11_X=y), however, as expected I get errors that vector 
instructions are unknown. Does anyone has an idea and can help me?

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
