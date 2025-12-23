Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A935DE74900
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 23:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D91280C6F;
	Tue, 23 Dec 2025 23:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2oLCE90MrKS; Tue, 23 Dec 2025 23:10:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A4B80C04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766531449;
	bh=NRvqgsVYinb9xIKAirdkUnO1IAuDyLYbgbm94WE1kfE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E8NE7I8sWBy8JnyDyegzsT7y35xTlpThFZs9/ufF6nnFSKGpjxxcQclpqTGMO3oaE
	 hn7td8hz7EJ9skp400zG7pBuk3O/DSjEJx3f9Vy+60FlZI5+5isHjlahqk2mZkqg9q
	 8+n7UpZsJoer4Ja/1yfSivVVOOKCQT5sBRD8aKaA/OaEnSLmiV0tmn9ph5jP1sEcch
	 KAgg1deWoGb7DYcIsDDdu7ksOEehPg9BkY8nzf0GZKoLjwDEhA+fBSoYnwtGv6OtVB
	 qP/VPIpkH5zOSfvj4HM+V6immiW544z5+XVlkuBv1gOlenJP5E6RzXGVrAFCgDQCUw
	 JbR8wJvMiDzDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40A4B80C04;
	Tue, 23 Dec 2025 23:10:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D7D9119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 23:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90EB5402DE
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 23:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQ1MgfzoXC2X for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 23:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A1C402F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40A1C402F3
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 23:10:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A79887645; Tue, 23 Dec 2025 23:10:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Dec 2025 00:09:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bcc99b57b2b021daf72cfc4604708e3138736f6
X-Git-Newrev: 1f5a9ab0837accd519484259f436763c93218fba
X-Patchwork-Hint: ignore
Message-Id: <20251223231044.2A79887645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi*: bump kernel version
 to 21b4101 (6.12.61)
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1f5a9ab0837accd519484259f436763c93218fba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now based on 6.12.61 (from 6.12.41)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/raspberrypi/patches/linux/linux.hash | 2 +-
 configs/raspberrypi0_defconfig             | 2 +-
 configs/raspberrypi0w_defconfig            | 2 +-
 configs/raspberrypi2_64_defconfig          | 2 +-
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
 configs/raspberrypicm5io_defconfig         | 2 +-
 configs/raspberrypizero2w_64_defconfig     | 2 +-
 configs/raspberrypizero2w_defconfig        | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
index 51b0684b20..fedfd9d4c9 100644
--- a/board/raspberrypi/patches/linux/linux.hash
+++ b/board/raspberrypi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  afc44e2899a3c32a1b968272a5816e5c90bea346341153807553396621e65dde  linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz
+sha256  7c31df8061aae748a6e72417bfe743a54198fb5bdc96e229ecc605dc621d32ef  linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 1be48c32dc..9c000dc39d 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index c7803c5af6..a2392faf0b 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_64_defconfig b/configs/raspberrypi2_64_defconfig
index 57f98c7396..f8cadcb731 100644
--- a/configs/raspberrypi2_64_defconfig
+++ b/configs/raspberrypi2_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-2-b"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 60eb62b473..5e3af7864b 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b broadcom/bcm2710-rpi-2-b"
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 59b8b3fc6f..31568129ac 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 3f7fdeb3ab..4cc73708e8 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 8cbb8b0d41..48284513dd 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index c0a33c3eb5..ce79952ff7 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 75078a3c2c..a6df6fd923 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 6928e2ba0f..63432f45d5 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 00525e050e..fd8508661c 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b-rev1 broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 648740c273..53f5193db4 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index e5bbff76c1..01e02fd300 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
diff --git a/configs/raspberrypicm5io_defconfig b/configs/raspberrypicm5io_defconfig
index 122a25ed92..706f759832 100644
--- a/configs/raspberrypicm5io_defconfig
+++ b/configs/raspberrypicm5io_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm5io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm5io/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/raspberrypizero2w_64_defconfig b/configs/raspberrypizero2w_64_defconfig
index 7a00fa14ac..e926f6f23d 100644
--- a/configs/raspberrypizero2w_64_defconfig
+++ b/configs/raspberrypizero2w_64_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index 36e66676fa..eb23324e11 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
