Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6716C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 19:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9820881E98;
	Mon,  7 Aug 2023 19:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9820881E98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id um3yRpmbX5_C; Mon,  7 Aug 2023 19:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BC0381E1A;
	Mon,  7 Aug 2023 19:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BC0381E1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0EB81BF284
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 19:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B521E4098F
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 19:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B521E4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNldwvLquJDN for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 19:58:53 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BC804099A
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 19:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BC804099A
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3177f520802so3583072f8f.1
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 12:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691438331; x=1692043131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4xK90sDsS5+uPgbVpXeKqkZl1LBlHM7yQqbPyS9Yxqk=;
 b=bFMtTldEHXoMzTPwh5o1BbLGjQ095dPQhvCO0o/c/QrgYecXOXM/FkF6w3e5PoI6H6
 Xgzb3lZ5gUVU0PCZEO3sKL+VK4Pk3JkKkJv77KQLV9opXhxQoyeOZiZKPOjicuYs5kWl
 YFOE50KkZgDhzjythImCwTt2s0/Z6NHWCunkYIDUH0MojRmb3xax9XXwv7757Mh5MAbe
 ZKqzWLU5wrMu6ffxU/9ZTxYSUQM/CGFx9ZxV83Do52egHa8bRt4boXBvZudJhe+KZarG
 TgcTR5M1b615tbXeosaTJEbxgKzPsu6qXh/4S8YcZjbdSEuPtn1M0G1BLTd9WTwsYCdL
 dpFw==
X-Gm-Message-State: AOJu0Yym0IEPFx2qZUHfWVvJw+1mNK+ERJnj1Gpxx3eKH+5W+12/Qt7d
 0LgU4iBWZka1ocdD+6cpgSTX9P+tGhE=
X-Google-Smtp-Source: AGHT+IGBXIJp+x8b6ZH2bN1mStLsMbzy6MPJ48vc3q7XVygF2/BXk+v7J38Y3ibC5ITknrTeoOjmkQ==
X-Received: by 2002:adf:f907:0:b0:317:5efa:c46a with SMTP id
 b7-20020adff907000000b003175efac46amr5815231wrr.27.1691438330812; 
 Mon, 07 Aug 2023 12:58:50 -0700 (PDT)
Received: from p1g2.home (2a01cb000fac0c0088f09ee77063439d.ipv6.abo.wanadoo.fr.
 [2a01:cb00:fac:c00:88f0:9ee7:7063:439d])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adfffcb000000b0031779e82414sm11451294wrs.79.2023.08.07.12.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 12:58:50 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 21:58:46 +0200
Message-Id: <20230807195846.1553615-4-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807195846.1553615-1-bisson.gary@gmail.com>
References: <20230807195846.1553615-1-bisson.gary@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691438331; x=1692043131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4xK90sDsS5+uPgbVpXeKqkZl1LBlHM7yQqbPyS9Yxqk=;
 b=bT7MY/V2OxfmuhAh0eSbo+hOfFfZC1YK6Uhw1ToGCn2ZBtZQBBqh7ru7vSi3nCZIui
 ETNMhwhUgi7RMHKQFsbma0pwSbSPgcFUHM+bJ+74njIRvfdWpwiNh9Q6mWTbuxFfm/2D
 x4pM0fDbG8EDJfwXX4hDaXGo+06iz/zJAllTEnpu3/2ox6u5B5VBh2iaCw5u1jHjITFp
 +gG1RROHcB6g3Oi2bGn8irAOrZcO4GiromPM08/gp55P58oZNosnXHU/BvSSIjyDZpjM
 Zrt8b0LM0iDpi/V4UcI/vkE0zkQP4IvAzM4OTCQWY6XyRReoJ2EgMFpZt6SeaKr8v4UU
 rXgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bT7MY/V2
Subject: [Buildroot] [PATCH 3/3] configs/nitrogen*: update kernel to
 lf-6.1.22-2.0.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump the kernel headers to 6.1
- add nitrogen8mp smarc device tree
- this version fixes the gcc12 build issues

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673573
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673576
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673580

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 configs/nitrogen6sx_defconfig |  8 ++++----
 configs/nitrogen6x_defconfig  |  8 ++++----
 configs/nitrogen7_defconfig   |  8 ++++----
 configs/nitrogen8m_defconfig  |  8 ++++----
 configs/nitrogen8mm_defconfig |  8 ++++----
 configs/nitrogen8mn_defconfig |  8 ++++----
 configs/nitrogen8mp_defconfig | 10 +++++-----
 7 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index c2ca324d53..ba2c79d4a7 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -36,8 +36,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
+# Latest revision  of branch boundary-imx_6.1.y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index f805ae94b0..d490ec3c46 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -16,8 +16,8 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -35,8 +35,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
+# Latest revision  of branch boundary-imx_6.1.y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 068df6eb41..429d84c1d4 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -16,8 +16,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -35,8 +35,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
+# Latest revision  of branch boundary-imx_6.1.y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 4a2a259d54..ea5f21cb3d 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -18,8 +18,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -51,8 +51,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
+# Latest revision  of branch boundary-imx_6.1.y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index bf98244b1e..5b7fb4a3bc 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -18,8 +18,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -51,8 +51,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
+# Latest revision  of branch boundary-imx_6.1.y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 677640cf8d..2fc9442d9e 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -18,8 +18,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -51,8 +51,8 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
+# Latest revision  of branch boundary-imx_6.1.y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 6f49dfc839..c5f79c3913 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -18,8 +18,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # DDR training binaries
 BR2_PACKAGE_FREESCALE_IMX=y
@@ -51,10 +51,10 @@ BR2_TARGET_UBOOT_SPL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
+# Latest revision  of branch boundary-imx_6.1.y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-nitrogen8mp freescale/imx8mp-nitrogen8mp-m4 freescale/imx8mp-nitrogen8mp-enc freescale/imx8mp-nitrogen8mp-enc-tc358743"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-nitrogen_smarc freescale/imx8mp-nitrogen8mp freescale/imx8mp-nitrogen8mp-m4 freescale/imx8mp-nitrogen8mp-enc freescale/imx8mp-nitrogen8mp-enc-tc358743"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
