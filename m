Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137BD606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 19:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HGXJlACt
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8DA8600C4;
	Tue, 24 Nov 2026 19:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjyZ3PZvoOuW; Tue, 24 Nov 2026 19:49:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 704C7605E7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795549789;
	b=BcuGc+aw/6YtU6BrGSpLI5WBDktQ2Km5t4maITbj/mi48SiDl4zH75Pfqm3lyTFhFjAQ
	 cekMim2zsTgO5U4SLU6SZ5P684/k0sUiWGge4GAZacOmjF0j0nQleRZksjWowZaW0L0d4
	 qTg6S+fkpY6wJZeu7dgYNMuqhha9vRy5osi7HMp+2wohU29rQRxFGlzsbI2F3DB8C2Fk+
	 5ldrMXQ3VP+uZjYV2k27WnDVNSMDnSwvEI3Yri70uoZCjs2LC3053ynFvMqreqoS3SlRB
	 NHedsMwiPGYPJK+S2m7hYkdA5NsbyDxfabysOpsLkTrWsvsIzqg88H0bsVKxWxBBZMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795549789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=psRap3admBgtbGVcMIk2hiiyQuoDPInwAJ7l1Hq/pVs=;
	b=mtj++7YwIMGMG7as9PzbYolQGC1/eMc6zTqVCulGmWKHvrhwRU6Y/v97SNhevkexwhHy
	 OPdGgxi95wEWBJGdhsuIRlXliRnebj2W/yVUVLaUgjlzTCr8s7mOzMeYh+Vc72QLlfnwL
	 tmd8taiGpOFp4MWzQS2YFBNhJkMaGXkluj4gGBGwv8TeJAp9Oq2weTDF5GNgfUQBp1feu
	 uOc3ZaCrc4ZYwZcr0cEx+eOdfXOq2hPbMmf7KGy+nlfwfyFaqVnTj22610BsFOWdVVZj0
	 eJjyiRO731JoSrBbJly4N87/z/uhefGNeoK/sDPyeV5kcXiq42Xn+HTFz/PQ8LXzBoA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795549789;
	bh=psRap3admBgtbGVcMIk2hiiyQuoDPInwAJ7l1Hq/pVs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HGXJlACt7nRj+L1YWDDLksYBvodJ7I/SoG+xSFDiT013BzKi7bhYAnxWe6O4NkVZd
	 aDlniuTF54aFFEG4DJ9tphW59pqLRdCJB2iQh6jcbpEeejEW+UI2joIrrd/MqF2JK3
	 FD6oXihxxkuN5caZnkFJqp0TQGZyErANOD7mcmL1kSH/Mj0rh8r5V1RQcRNPth7GkK
	 R8QaIBP+kkrPQXwwWAMQK/Dr10I+Lvk4GQUSCCTZK2Urf6kov1FwmSWOmxrIZ06gAG
	 u4ShCcGNUsTNmgoO36QhEpPWlsBDoL5aTZ9EW9N4xMLKNmHOl86ANp3KpNDgyQGbNZ
	 7CIWFEbdBpnsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 704C7605E7;
	Tue, 24 Nov 2026 19:49:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E051F325
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 19:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C37EA80A6D
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 19:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jR8m1JXhNumf for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 19:49:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6967D80C1A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6967D80C1A
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 19:49:45 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 485425FFBA;
 Tue, 24 Nov 2026 20:49:40 +0100 (CET)
To: buildroot@buildroot.org
Cc: Lothar Felten <lothar.felten@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Tue, 24 Nov 2026 20:49:26 +0100
Message-ID: <20261124194926.1160092-2-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124194926.1160092-1-ju.o@free.fr>
References: <20261124194926.1160092-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/imx6-sabresd_qt5: remove defconfig
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

It was decided in [1] that Buildroot should keep only minimal
defconfigs. Extra demos could be kept in board readme.txt and/or extra
config fragments.

For those reasons, this commit removes this defconfig. It also removes
.checkpackageignore entry and readme.txt sections referring to it.

[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                     |  1 -
 board/freescale/imx6-sabresd/readme.txt | 49 ------------------
 configs/imx6-sabresd_qt5_defconfig      | 69 -------------------------
 3 files changed, 119 deletions(-)
 delete mode 100644 configs/imx6-sabresd_qt5_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 6a64d06fc9..bdfec30139 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -95,7 +95,6 @@ configs/globalscale_espressobin_defconfig lib_defconfig.ForceCheckHash
 configs/imx23evk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabreauto_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabresd_defconfig lib_defconfig.ForceCheckHash
-configs/imx6-sabresd_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/imx6slevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6sx-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulevk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx6-sabresd/readme.txt b/board/freescale/imx6-sabresd/readme.txt
index 292dab72c4..26141d6303 100644
--- a/board/freescale/imx6-sabresd/readme.txt
+++ b/board/freescale/imx6-sabresd/readme.txt
@@ -59,53 +59,4 @@ To boot your newly created system:
   emulator at 115200 bps, 8n1;
 - power on the board.
 
-Testing graphics on the i.MX6 Sabre SD board
-============================================
-
-The imx6-sabresd_qt5_defconfig allows to quickly test the graphics
-capabilities of i.MX6 using the opensource Etnaviv graphics stack
-and kernel mainline.
-
-In order to build it:
-
-make imx6-sabresd_qt5_defconfig
-make
-
-Then flash the SD card as explained above.
-
-Running kmscube application:
-
-# kmscube
-
-Running Qt5 Cinematic Demo:
-
-# export QT_QPA_EGLFS_KMS_CONFIG=/root/sabresd.json
-# export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
-# /usr/share/Qt5/CinematicExperience/Qt5_CinematicExperience
-
-Running gl2mark benchmark:
-
-# glmark2-es2-drm
-
-Testing video playback on the i.MX6 Sabre SD board
-==================================================
-
-As the mx6sabresd has two display outputs (LVDS and HDMI), it is necessary to
-know what is the connector that corresponds to the HDMI output.
-
-This information can be found by running:
-
-# modetest
-
-And search for the HDMI connector number. In our case it shows up as 37.
-
-In the mx6sabresd prompt run the following Gstreamer pipeline:
-
-# gst-launch-1.0 filesrc location=/root/trailer_1080p_h264_mp3.avi ! avidemux ! \
-h264parse ! v4l2video1dec capture-io-mode=dmabuf ! kmssink connector-id=37    \
-name=imx-drm sync=0
-
-(The video used on this example was retrieved from:
-http://linode.boundarydevices.com/videos/trailer_1080p_h264_mp3.avi)
-
 Enjoy!
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
deleted file mode 100644
index d3151819fb..0000000000
--- a/configs/imx6-sabresd_qt5_defconfig
+++ /dev/null
@@ -1,69 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6-sabresd/linux_qt5.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabresd nxp/imx/imx6dl-sabresd nxp/imx/imx6qp-sabresd"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_PACKAGE_GSTREAMER1=y
-BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
-BR2_PACKAGE_GST1_PLUGINS_GOOD=y
-BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2=y
-BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE=y
-BR2_PACKAGE_GST1_PLUGINS_BAD=y
-BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS=y
-BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS=y
-BR2_PACKAGE_BITSTREAM_VERA=y
-BR2_PACKAGE_CANTARELL=y
-BR2_PACKAGE_DEJAVU=y
-BR2_PACKAGE_FONT_AWESOME=y
-BR2_PACKAGE_GHOSTSCRIPT_FONTS=y
-BR2_PACKAGE_INCONSOLATA=y
-BR2_PACKAGE_LIBERATION=y
-BR2_PACKAGE_GLMARK2=y
-BR2_PACKAGE_KMSCUBE=y
-BR2_PACKAGE_MESA3D_DEMOS=y
-BR2_PACKAGE_QT5CINEX=y
-BR2_PACKAGE_QT5CINEX_HD=y
-BR2_PACKAGE_MESA3D=y
-BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
-BR2_PACKAGE_MESA3D_OPENGL_EGL=y
-BR2_PACKAGE_MESA3D_OPENGL_ES=y
-BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
-BR2_PACKAGE_QT5BASE_LINUXFB=y
-BR2_PACKAGE_QT5BASE_FONTCONFIG=y
-BR2_PACKAGE_QT5BASE_GIF=y
-BR2_PACKAGE_QT5BASE_JPEG=y
-BR2_PACKAGE_FREESCALE_IMX=y
-BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
-BR2_PACKAGE_FIRMWARE_IMX=y
-BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
-BR2_PACKAGE_LIBV4L=y
-BR2_PACKAGE_LIBV4L_UTILS=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="320M"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
