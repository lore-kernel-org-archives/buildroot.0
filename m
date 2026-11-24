Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD0606A326
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qLk7sy2p
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672D180998;
	Tue, 24 Nov 2026 19:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trUNiMMmw1FH; Tue, 24 Nov 2026 19:49:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0FBFE809C1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795549785;
	b=MHYBc/S1g8dpjHOEVGYj4EBJ3YzUVPPc8U6ay5CIW1RYoVG3ZPaTilcLwd0dKwbp2F4E
	 2iN1pRksmdJepQ8Sd0g0wYhMOVtpVTG2i23N6E1C0ujgxvaxxSgva+CVcgEQcMHEKkb1e
	 vj68Rj53iKKOH0QCLT+d/N8elfJs4itAIFkouSIkjC58x9dcJeEyd3wvsMsRLFhaghudg
	 pNd5fXUQVlhRcwj2Pp0+i8y8igGPtEnQXA2SXQwF0by5bIh/rHUX1WbNtU/uQp1oK/Eom
	 +EZk2VpoEqpYXJces3EsiXFBkZOjo26fmce1FwwV9dKOTYy5j5rZ0pAVNAx9OURLYSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795549785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+RQtEXXzI2thndqOFb48sW43nBXZZ/vX1QBYjD9eiu0=;
	b=FT6rUGTzRS8VReTn3sxHt5F1oWQhxbme0L+tU0eVZnJwgOhU4mg0xcDxqj8h69Tj6j4Q
	 ILc4iWulaeKnNjWgbNgv4GCdWFjcUxg5ozSymuOAqOUKYizK5uTHA/ieJOtPCTWnVuo/e
	 XN7JZnb1eU6R/zR/vnKZssUKu9W+H+I9h217bQ/aeZw4D8ffdT6hi0A+XPnAqWJOzyYQG
	 IDivUuVFRT9VE2R1jmHgw4ONc8W7xcBdgZZb/9amHGwwGqVsn90+mmF+e5ef+NoOBoymD
	 Pfs33hRICBkD/V4Qb8cdfswcXeNgI+TLMJZCxOB5NtrZUwSntpwaCl0QSCShR7H6VKg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795549785;
	bh=+RQtEXXzI2thndqOFb48sW43nBXZZ/vX1QBYjD9eiu0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qLk7sy2pnUdm1nz6ND0Ya59za1VSFOTSxtB/gwWfSe0jRV0EasvGRrwJXh7wtnNqL
	 Q+Y78ZjDsybXF1ZEp20KBCN5+j9GSX+pmRljdrdJ14NsPf+l/VmoSG83wp0nZGDIBI
	 2l8I0QeGTh3wBEK/xZBNb3XEmlic63dhDjgzDrtwVnbgyH0eyiaba+9ZmTMaP7rfpj
	 e6ZfxqMVaazs+37osnkPi0yJlESu/DbudRE9S8m/wLWwy+0G5xVXTBh11mZC8qlcrt
	 255Jb0Hilhc6589Lmg2r/pjJOhanLe2jkgn3fAwEEWQb2GKRW7miuR0LqJRTcLa+Ih
	 98bcR4TMSsQ1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FBFE809C1;
	Tue, 24 Nov 2026 19:49:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A529325
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 19:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C16540343
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 19:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyhLPTu31wA0 for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 19:49:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0433340330
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0433340330
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 19:49:41 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8B5B260129;
 Tue, 24 Nov 2026 20:49:36 +0100 (CET)
To: buildroot@buildroot.org
Cc: Lothar Felten <lothar.felten@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Tue, 24 Nov 2026 20:49:25 +0100
Message-ID: <20261124194926.1160092-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] configs/beaglebone_qt5: remove defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The configs/beaglebone_qt5_defconfig has not been maintained for some
time. It uses a Kernel 4.19 which is end-of-life since December 2024.
Qt5 is also end-of-life.

It was also decided in [1] that Buildroot should keep only minimal
defconfigs. Extra demos could be kept in board readme.txt and/or extra
config fragments.

For those reasons, this commit removes this defconfig.

[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                              |  2 --
 board/beagleboard/beaglebone/readme.txt | 10 ------
 configs/beaglebone_qt5_defconfig        | 44 -------------------------
 3 files changed, 56 deletions(-)
 delete mode 100644 configs/beaglebone_qt5_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26b..5c21fd4e3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2210,7 +2210,6 @@ F:	board/bananapi/bananapi-m2-ultra/
 F:	board/beagleboard/beaglebone/
 F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/beaglebone_defconfig
-F:	configs/beaglebone_qt5_defconfig
 F:	package/ti-sgx-demos/
 F:	package/ti-sgx-km/
 F:	package/ti-sgx-um/
@@ -3610,7 +3609,6 @@ F:	package/skopeo/
 
 N:	Yegor Yefremov <yegorslists@googlemail.com>
 F:	configs/beaglebone_defconfig
-F:	configs/beaglebone_qt5_defconfig
 F:	package/acl/
 F:	package/attr/
 F:	package/avrdude/
diff --git a/board/beagleboard/beaglebone/readme.txt b/board/beagleboard/beaglebone/readme.txt
index f896e1285a..9fc91c0d97 100644
--- a/board/beagleboard/beaglebone/readme.txt
+++ b/board/beagleboard/beaglebone/readme.txt
@@ -10,8 +10,6 @@ EEPROM. The configuration is based on the
 ti-processor-sdk-06.01.00.08. Device tree blobs for beaglebone
 variants and the evm-sk are built too.
 
-For Qt5 support support use the beaglebone_qt5_defconfig.
-
 How to build it
 ===============
 
@@ -49,14 +47,6 @@ To copy the image file to the sdcard use dd:
 $ dd if=output/images/sdcard.img of=/dev/XXX
 
 
-Running Qt5 hellowindow opengl demo:
-===================
-# export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
-# export QT_QPA_PLATFORM=eglfs
-# export QT_QPA_EGLFS_INTEGRATION=none
-# /usr/lib/qt/examples/opengl/hellowindow/hellowindow
-
-
 Tested hardware
 ===============
 am335x-evm (rev. 1.1A)
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
deleted file mode 100644
index 5d06af3990..0000000000
--- a/configs/beaglebone_qt5_defconfig
+++ /dev/null
@@ -1,44 +0,0 @@
-BR2_arm=y
-BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone-qt5/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_ROOTFS_OVERLAY="board/beagleboard/beaglebone/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.94-ti-r72)/linux-4.19.94-ti-r72.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglebone/linux-sgx.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_PACKAGE_FBV=y
-BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_EXAMPLES=y
-BR2_PACKAGE_QT5BASE_EGLFS=y
-BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
-BR2_PACKAGE_QT5QUICKCONTROLS=y
-BR2_PACKAGE_TI_SGX_DEMOS=y
-BR2_PACKAGE_TI_SGX_UM=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-# BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="MLO"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
