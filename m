Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D07AE94628
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E4E040CD4;
	Tue, 10 Feb 2026 00:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQR35iaZ2Xlc; Tue, 10 Feb 2026 00:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26CC240CA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682076;
	bh=feQKRW+X4qcAW8HvK1eHxaaNjUFZ3WXjnYeZHY4Y1yU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JKN6OP6rvr/oAYN+zRfYFf0rcuN1Vl1M7LZrvWR7SMnEnFEZvoZ8mrUASlrTyfzvq
	 BHErsYwKcMPmOxNfKlj64W6hPj8aYu5zAeAyPr66wbtZRBIUuefVS/YrNpWE6NqsuW
	 NHu/UXoCBRwmF4CXpk1RQGtlVLasqFMpVjO7bWSLbspwY+7oaAVn4Jq30plWSvx6Zz
	 h0JduUhPjtcVkNqmJCezISPxgeEPjVMm2EYkE6ZLFi9qB3iaVa6GcZM8kb6CLz1Yt8
	 QNvKELwPNR/Upe4dehAA7yzUsAIfHfzYh1cypX1jdalW64XuNhOJX0zSluPuWEOJ01
	 +Z3JG67hPDLDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26CC240CA8;
	Tue, 10 Feb 2026 00:07:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA9021A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CED3F60ACA
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3c2AdpnfSiD for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92D2760ABF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92D2760ABF
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92D2760ABF
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbI7vTZGv5gYjpbIAvmshI; Tue, 10 Feb 2026 01:07:46 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:07:34 +0100
Message-ID: <20260210000739.3810940-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEMHzqnfwX4o+wGyNUavrHrAz7QNqxD2sgNCmUlM817Jta96G9gDhpfmzCD6GTE8XWRjkrvhP0huF4XXSWNI0k28fudFCh340C9z74XGS4iO8oCOb3lD
 VbiF8MTxxyBoZtmjLlZP4J+QfRrB8g0bW8jb4h37qlIAjI50sLAn04KFqJf2QrudKqcVswrujVZSiAhs0a/3RGSQaVTtEI8bHH0RxitvZRyiquxILlmtDcsv
 Ib2f9s0woVRWJKpveHowrBFC3dEIqofyPKEW6ZbkSqsGK5rgGUIFolbDSP77FoKBDjMB2JHttMXQMnAvQMnujmaklUuWRzrpiS+XY4MIjlNlyjk7X3i4hv60
 XorX7ty+vA5yzNyrRQYDNjT077YEV6D9yS06Br4C3pSOGA0RPhRawlfT7gEWMuuG9yWMdlMmTT2jUG0WgRYBITV5Cy8YlJLTL9tuHI/Gx43OWxmtexG+Poid
 fSXwJe1KOnJ1+2kRv5HPXOfekG/G85HweI3R5X27GUxRv8OJ2xdAtdXFM9FGxdQ7v7P/TPxscRfGxXV7FKQmGzNCsy281eJvi/6EsXzZVzERmHWEdTvMcnRJ
 R78=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682066; bh=nBGCPgzCH3wrWEivr1rodJ+GormLWMeSc/Qr9WebVz0=;
 h=From:To:Subject:Date:MIME-Version;
 b=K+D5luliOd5tYBEW+rAwK4q8rJUQGmVXYqFb5fL4m63eSLIT6NFgq6zoPawRi6wVZ
 iDy3QbwUoxlr+JEYuk0S5Vwakfoj4Gk8J4Fac5WF2Gk/x/FDJbcce7MV3ltHQzSLev
 0J2KVWQtkPbPU3bguqkuRR8xOZWWbOEflTzsxBkLWxWToAprL3PO1Kv/wzC5o9Yt4j
 EDDCw250NezHtvwdFcQ2HMsmRGSxsBlMTOobPc+DS2h7x6KdfnLvkAGR+6SOmhaaDx
 v/lAIp9nL9yA+qPVKA0ltUZ39hfhQMTiSJDcNrgSnyMy65iU7k7CdXLgkyCQgug5ok
 +24Zf1MbnB42Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=K+D5luli
Subject: [Buildroot] [PATCH v2 08/13] configs/olimex_a10_olinuxino: bump
 Linux to 6.18.8 and U-Boot to 2026.01
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                              |  1 -
 board/olimex/a10_olinuxino/boot.cmd              |  1 -
 .../patches/linux-headers/linux-headers.hash     |  1 +
 .../a10_olinuxino/patches/linux/linux.hash       |  2 ++
 .../a10_olinuxino/patches/uboot/uboot.hash       |  2 ++
 board/olimex/a10_olinuxino/post-build.sh         |  1 -
 .../rootfs_overlay/boot/extlinux/extlinux.conf   |  4 ++++
 configs/olimex_a10_olinuxino_lime_defconfig      | 16 ++++++++--------
 8 files changed, 17 insertions(+), 11 deletions(-)
 delete mode 120000 board/olimex/a10_olinuxino/boot.cmd
 create mode 120000 board/olimex/a10_olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/a10_olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/a10_olinuxino/patches/uboot/uboot.hash
 delete mode 120000 board/olimex/a10_olinuxino/post-build.sh
 create mode 100644 board/olimex/a10_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/.checkpackageignore b/.checkpackageignore
index 469d053292..433be11ff0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -133,7 +133,6 @@ configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a10_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a13_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
deleted file mode 120000
index 612c745500..0000000000
--- a/board/olimex/a10_olinuxino/boot.cmd
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/boot.cmd
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/a10_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/a10_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/patches/linux/linux.hash b/board/olimex/a10_olinuxino/patches/linux/linux.hash
new file mode 100644
index 0000000000..b1a0042a91
--- /dev/null
+++ b/board/olimex/a10_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/olimex/a10_olinuxino/patches/uboot/uboot.hash b/board/olimex/a10_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/olimex/a10_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
deleted file mode 120000
index b346896024..0000000000
--- a/board/olimex/a10_olinuxino/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/post-build.sh
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a10_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..24a3e18b5c
--- /dev/null
+++ b/board/olimex/a10_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label A10-Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
index 101796cc12..625491d69b 100644
--- a/configs/olimex_a10_olinuxino_lime_defconfig
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -1,18 +1,20 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/a10_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a10-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a10_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a10_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a10_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-olinuxino-lime"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-olinuxino-lime"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -20,14 +22,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A10-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a10_olinuxino/boot.cmd"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
