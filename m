Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA488D65559
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 21:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 271B2400F3;
	Tue, 26 Nov 2024 21:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzDWSaKgv8r9; Tue, 26 Nov 2024 21:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0E454ECAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0E454ECAD;
	Tue, 26 Nov 2024 21:12:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68842DB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 21:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5389C400F3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 21:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c244FqN1WMej for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 21:12:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=51.77.79.158;
 helo=mail-0201.mail-europe.com; envelope-from=pasha@fstn.top;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBFB84ECC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBFB84ECC5
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBFB84ECC5
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 21:12:41 +0000 (UTC)
Date: Tue, 26 Nov 2024 21:12:27 +0000
To: buildroot@buildroot.org
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, Pasha Fistanto <pasha@fstn.top>
Message-ID: <20241126211211.144312-1-pasha@fstn.top>
Feedback-ID: 106435328:user:proton
X-Pm-Message-ID: dbd9b4f951ac1f352a3c672b1fd8eb4cf9047135
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fstn.top; 
 s=protonmail2; t=1732655552; x=1732914752;
 bh=fyfsY2tAJBGtRAPegsQqlwjJCf9CKinmVYPsEXXwkdY=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=mqlLhvOJDPkW22va/iiUV/8NvESul74KVZFJI18JGMoFCZC30TACN8Za1V3Yr7lz5
 /XP2259aU7gdalsu479Xhodhg96tU8rsIHeWJuY3+ct4ArnVZW/wOjHNKjeIvjo5HK
 rzJ3Erfae881KjJVylto7b+GNjN8Za48XamOqJVDume4TLKYRh55xn9GjTj/H8f/wZ
 4dFxQKg39b26JXiGHr7lXzv17KQrtMrGR4UxeMHoJWq/qhOWeC5xt+vFu7TsDA8xDL
 bdjHIlRy+rdVv7djO9FPaN3QoboWAldotfrONTcumI6qKTEf2WUPl0Svrr3c3AGoYz
 i2diNYcX4FWdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=fstn.top
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=fstn.top header.i=@fstn.top header.a=rsa-sha256
 header.s=protonmail2 header.b=mqlLhvOJ
Subject: [Buildroot] [PATCH 1/1] configs/raspberrypi*: bump kernel version
 to 5aeec (6.6.51)
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
From: Pasha Fistanto via buildroot <buildroot@buildroot.org>
Reply-To: Pasha Fistanto <pasha@fstn.top>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now based on 6.6.51 (from 6.6.28).

Signed-off-by: Pasha Fistanto <pasha@fstn.top>
---
 board/raspberrypi/patches/linux/linux.hash | 2 +-
 configs/raspberrypi0_defconfig             | 2 +-
 configs/raspberrypi0w_defconfig            | 2 +-
 configs/raspberrypi2_defconfig             | 2 +-
 configs/raspberrypi3_64_defconfig          | 2 +-
 configs/raspberrypi3_defconfig             | 2 +-
 configs/raspberrypi3_qt5we_defconfig       | 2 +-
 configs/raspberrypi4_64_defconfig          | 2 +-
 configs/raspberrypi4_defconfig             | 2 +-
 configs/raspberrypi5_defconfig             | 2 +-
 configs/raspberrypi_defconfig              | 2 +-
 configs/raspberrypicm4io_64_defconfig      | 2 +-
 configs/raspberrypicm4io_defconfig         | 2 +-
 configs/raspberrypizero2w_defconfig        | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
index 8d43c25151..7b4fa335b1 100644
--- a/board/raspberrypi/patches/linux/linux.hash
+++ b/board/raspberrypi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  dab3052783c68c46a5bc645b1c38d9705da995ab42823566518b62eb1fa1ef97  linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz
+sha256  262390e2a5b1122b37db26eb66c50263b0091cb4a858ba894a32db02bcbb9f8a  linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index dc4f1ea86c..9ddd1bd86b 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 2c1e42543f..757189c795 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index ce19a7fd5d..84a737bf3e 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b broadcom/bcm2710-rpi-2-b"
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 9e301d8d96..969349dbb8 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 38c680d541..3bebf4ceb9 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index da3f657734..41558fcfd2 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 66ed5f0045..58878374ad 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 89cfd58a90..e0a0969897 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 8cbd533eee..f6ba1bdd01 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 694b7925af..00671d0f3c 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b-rev1 broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 44c625a4d4..4eceaef8e5 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index d52eae82a4..42ddd51f83 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index 796fcf9ab3..41c0e8a49a 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5aeecea9f4a45248bcf564dec924965e066a7bfd)/linux-5aeecea9f4a45248bcf564dec924965e066a7bfd.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
-- 
2.47.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
