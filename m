Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FADC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 20:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B045360E48;
	Mon, 10 Jan 2022 20:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2Ob7QOWrnlN; Mon, 10 Jan 2022 20:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05D3860E3D;
	Mon, 10 Jan 2022 20:18:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19A7A1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 20:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07E1782A29
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 20:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PKD1MPb4bAk for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 20:18:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FD6E819F3
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 20:18:28 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id m57so851504vkf.9
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 12:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHc8tAvtOoZqnFykiwSvoEOHsDSqcABeH8YAT5ebnWs=;
 b=Pc8TA0dSokK5U+atLliqogKWWHaDG+rAe7nnXKR1x6kbxQ9xuqXbVXtIMTSkmJ7wRB
 etvq0JOZ2jETzj0QsQSSIdRKCddIfQbUYmptyzkl8URI3zjL9UgtWqtE+2B5OZZ9VVWG
 UWq+WeMWC2/YJcrY4p8eks+gzAer+5YHvSLO7jevV62/36mzwA6qnmLHQ2VTZ/qPcQyv
 xAJC4LL+D027grHk0klFA1nfGvSd+qTLPghTxI+H0NQhC7/g6n2laQ36lDhINH2wF7Ng
 7ntbSSGX0OlRCeX/h89hNxFez5/bh67R++HZcNLFGRoyMgtNSQNV3cprsc2vALtsoTwe
 b1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHc8tAvtOoZqnFykiwSvoEOHsDSqcABeH8YAT5ebnWs=;
 b=AnmTEtXIq4INi0Y2SY8h43C0X8CKqcALuawmoFkfCywYEPYhAc2HElhCdeOccfSOJC
 EI1rDJf3sVK47VYAMrxY4XuZ2sznF6szOcltvbwjPWCzE7Dj9It5Jo4ce66S7mmP55iz
 TAYzRRVTO0juHVLOtEponoQi2/gqTg0z4F+UOEoVydUSwpsQU9W8Tcl6kH2W3IDO2xk6
 EbIADO4hQgUWuPa7Rmk9xudXMFY13Y8Xu3h+bQCK4LlyOsDrhBGNsNcOew213m44+NGg
 ua3NWApGVRyCBBgCR+HbRtjpFc/ePzLnoQX0h10Tw7oj45hjb6HRYPHlnzlGIHO2OxFW
 M89Q==
X-Gm-Message-State: AOAM533YuOewhzl8ae/b/NZHLTWw4l9icb5xPOu9ZvCddrX9y8MgpXsl
 LYFCindcffkZeoa2yZBUa+L+MX8j1/0=
X-Google-Smtp-Source: ABdhPJydGy+18rhtIgXv1+W1WEw8+IQrzbGdVidWyU1wmBVmwicA63sLrdl8V+5gSEHJA+d5NOO6bA==
X-Received: by 2002:a1f:a6cc:: with SMTP id p195mr562188vke.41.1641845906861; 
 Mon, 10 Jan 2022 12:18:26 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:9e9e:dcdc:97da:bf2b])
 by smtp.gmail.com with ESMTPSA id
 t22sm4774796vsk.0.2022.01.10.12.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 12:18:26 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 17:18:10 -0300
Message-Id: <20220110201810.2277642-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/mx6sx_udoo: Bump U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to 2022.01 and kernel to 5.15.13.

After the conversion to U-Boot device model, the SD card is
device '1', so change the boot script accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/udoo/common/boot.scr.txt   | 6 +++---
 configs/mx6sx_udoo_neo_defconfig | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/udoo/common/boot.scr.txt b/board/udoo/common/boot.scr.txt
index 7acceed0fb29..7a7d756c3c71 100644
--- a/board/udoo/common/boot.scr.txt
+++ b/board/udoo/common/boot.scr.txt
@@ -1,7 +1,7 @@
-setenv finduuid "part uuid mmc 0:1 uuid"
+setenv finduuid "part uuid mmc 1:1 uuid"
 run finduuid
 run findfdt
 setenv bootargs "console=${console} root=PARTUUID=${uuid} rootwait rootfstype=ext4"
-load mmc 0:1 ${fdt_addr} boot/${fdtfile}
-load mmc 0:1 ${loadaddr} boot/zImage
+load mmc 1:1 ${fdt_addr} boot/${fdtfile}
+load mmc 1:1 ${loadaddr} boot/zImage
 bootz ${loadaddr} - ${fdt_addr}
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 2bdcade25296..3e1dc33bd4ba 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -12,13 +12,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo_neo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-udoo-neo-basic imx6sx-udoo-neo-full imx6sx-udoo-neo-extended"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
