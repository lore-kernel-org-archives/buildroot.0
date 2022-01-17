Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733B3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 08:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2BD7607B0;
	Mon, 17 Jan 2022 08:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xL133mDpP_oI; Mon, 17 Jan 2022 08:06:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A16B607F9;
	Mon, 17 Jan 2022 08:06:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93D351BF2C0
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 08:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8121C401A1
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 08:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAff6rBAQHje for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 08:06:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15D8240192
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 08:06:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m1so54510353lfq.4
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 00:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O8BKbZ2SPmCLLBgK95KucCICmZi+dJHftx2eSIJBvbY=;
 b=dNUpqCNDA8CTPWeIgJzcfrzcLx/Do4XqNrthYtxC51bO0iixzGyw+MnB4HRAmSOZ84
 ccgjTTMjVoIjW2Q1bN3GxqCg91LbJ4XcnCumj0QI3rQR+84v6Ve95X+XHYDkxiKhVAi5
 krJIhpZvxdbtBZpaD1+MPzMJrAE3ioeibdYXIFTfkSXA+XrtxEPOUdjpziaPiybHmsi6
 Z5ns/GxRMxMEWFe1jHhwbJhRrmey9HnCto6P9xLIgD4yLXZrkMgpwuFisY0uysD8NkYM
 RpFsuEQnCVacOuWZX34mtLqplcuzjThRpFgsFKjRxaor3pdafy/oMMGe0wHj4dQjaVJ/
 rPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O8BKbZ2SPmCLLBgK95KucCICmZi+dJHftx2eSIJBvbY=;
 b=Rg2nUln+XT416HBc8bRpUcjo7K73l/PGwGOvg67mjFcf3IqARuGVVp1hLsa9PmI3td
 eTMvjAGLhoazrVtwMo39OxEM0hobUMIYy5Q4ZI1MpUYrZ2gaocfnXwws72ZSlsAly3tk
 NtmfKr9Luamf6xruURX4gwfg6fIEIEsP4rDx1pC/8OxetbyagE+zxuTTqO4Fzvm1gcXk
 ZpfTYYG5S3/hNt6tFn4t6KxgMtPHqkslH1vhu0s9Yj8WEdi/pf+JgXqlkHNaBj8i7qDi
 /xIYcVGSdUbvMeOJUiKsrHPlgMFf3MFVVRzLVX+rrDvX2jRNW/78Kkq500w3ngsr7Mul
 fyUg==
X-Gm-Message-State: AOAM531IL+l/puoOvaEpUloi7AehursC8Joa4a5oBOd3HqfS/CjuMqU0
 XtA69KUwXo4ZD1ZXvnqqz9+0k6j8S2WFVA==
X-Google-Smtp-Source: ABdhPJzn0tm11ltRiAejojzH36noFB7pQPJ2ZA5z6nWH9os3i8Zs4JQYux+F6DUlu5YulP4eOlUj9g==
X-Received: by 2002:a2e:a885:: with SMTP id m5mr15067427ljq.519.1642406781710; 
 Mon, 17 Jan 2022 00:06:21 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id w28sm1316654lfu.115.2022.01.17.00.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:06:21 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jan 2022 09:06:16 +0100
Message-Id: <20220117080616.10563-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] board/kontron/pitx-imx8m: use extlinux
 instead of U-Boot boot script
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 board/kontron/pitx-imx8m/boot.cmd      | 8 --------
 board/kontron/pitx-imx8m/extlinux.conf | 4 ++++
 board/kontron/pitx-imx8m/genimage.cfg  | 5 +++--
 board/kontron/pitx-imx8m/post-build.sh | 7 +++++--
 board/kontron/pitx-imx8m/post-image.sh | 2 +-
 configs/kontron_pitx_imx8m_defconfig   | 3 +--
 6 files changed, 14 insertions(+), 15 deletions(-)
 delete mode 100644 board/kontron/pitx-imx8m/boot.cmd
 create mode 100644 board/kontron/pitx-imx8m/extlinux.conf

diff --git a/board/kontron/pitx-imx8m/boot.cmd b/board/kontron/pitx-imx8m/boot.cmd
deleted file mode 100644
index 4d89235392..0000000000
--- a/board/kontron/pitx-imx8m/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-echo "Root File Sytem on MMC${devnum}"
-setenv rootfs /dev/mmcblk${devnum}p1
-setenv bootargs root=${rootfs} rootwait rw ${extrabootargs}
-
-load ${devtype} ${devnum} ${kernel_addr_r} boot/Image
-load ${devtype} ${devnum} ${fdt_addr_r} boot/imx8mq-kontron-pitx-imx8m.dtb
-
-booti ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/kontron/pitx-imx8m/extlinux.conf b/board/kontron/pitx-imx8m/extlinux.conf
new file mode 100644
index 0000000000..2911acec59
--- /dev/null
+++ b/board/kontron/pitx-imx8m/extlinux.conf
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx8mq-kontron-pitx-imx8m.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
index c78ef0f910..4a0aa117fb 100644
--- a/board/kontron/pitx-imx8m/genimage.cfg
+++ b/board/kontron/pitx-imx8m/genimage.cfg
@@ -1,5 +1,6 @@
 image sdcard.img {
 	hdimage {
+		partition-table-type = "gpt"
 	}
 
 	partition imx-boot {
@@ -9,8 +10,8 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
 		offset = 8M
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
 	}
 }
diff --git a/board/kontron/pitx-imx8m/post-build.sh b/board/kontron/pitx-imx8m/post-build.sh
index 4574221fe5..bf8861f6a9 100755
--- a/board/kontron/pitx-imx8m/post-build.sh
+++ b/board/kontron/pitx-imx8m/post-build.sh
@@ -1,4 +1,7 @@
 #!/bin/sh
+BOARD_DIR="$(dirname $0)"
+PARTUUID="$($HOST_DIR/bin/uuidgen)"
 
-mkdir -p $TARGET_DIR/boot/
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/kontron/pitx-imx8m/post-image.sh b/board/kontron/pitx-imx8m/post-image.sh
index 564211c829..3452fd4501 100755
--- a/board/kontron/pitx-imx8m/post-image.sh
+++ b/board/kontron/pitx-imx8m/post-image.sh
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-support/scripts/genimage.sh -c $(dirname $0)/genimage.cfg
+support/scripts/genimage.sh -c ${BINARIES_DIR}/genimage.cfg
diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 4053e1e398..458083160b 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -50,5 +51,3 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_IMX_MKIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/kontron/pitx-imx8m/boot.cmd"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
