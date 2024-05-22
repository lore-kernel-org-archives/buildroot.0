Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9C1C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 16:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD6E460AC8;
	Wed, 22 May 2024 16:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWnSNT52hdHB; Wed, 22 May 2024 16:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9513460ACE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9513460ACE;
	Wed, 22 May 2024 16:09:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39BC11C5D48
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 223438144A
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaZ1HTi2Jn6h for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 16:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57232813E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57232813E9
 for <buildroot@buildroot.org>; Wed, 22 May 2024 16:09:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FDBC87554; Wed, 22 May 2024 16:09:46 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 17:54:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3a78b1176e6b816959a962a005fcd4030d022ca
X-Git-Newrev: 459c8c95c76cf442debee5bed516a746c24a4aca
X-Patchwork-Hint: ignore
Message-Id: <20240522160946.3FDBC87554@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_r1_defconfig: add hashes
 for Linux/headers/u-boot
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=459c8c95c76cf442debee5bed516a746c24a4aca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.  With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                                 | 1 -
 board/orangepi/orangepi-r1/patches/linux-headers/linux-headers.hash | 1 +
 board/orangepi/orangepi-r1/patches/linux/linux.hash                 | 2 ++
 board/orangepi/orangepi-r1/patches/uboot/uboot.hash                 | 2 ++
 configs/orangepi_r1_defconfig                                       | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3fcb842dff..798dc33978 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -270,7 +270,6 @@ configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc_plus_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_r1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus2_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-r1/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-r1/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-r1/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-r1/patches/linux/linux.hash b/board/orangepi/orangepi-r1/patches/linux/linux.hash
new file mode 100644
index 0000000000..2ec07fd81b
--- /dev/null
+++ b/board/orangepi/orangepi-r1/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d6ecff966f8c95ec4cb3bb303904f757b7de6a6bcfef0d0771cb852158e61c20  linux-6.6.31.tar.xz
diff --git a/board/orangepi/orangepi-r1/patches/uboot/uboot.hash b/board/orangepi/orangepi-r1/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..bc999536af
--- /dev/null
+++ b/board/orangepi/orangepi-r1/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index 80f88a168f..b48e6d0015 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -2,6 +2,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-r1/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_R1"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi R1"
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
