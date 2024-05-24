Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D71FC25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27DA383342;
	Fri, 24 May 2024 12:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFJ2e_uod_Rx; Fri, 24 May 2024 12:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0738A833A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0738A833A3;
	Fri, 24 May 2024 12:55:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7CBB1CF9A4
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E4B94055A
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saxEXosAoS7c for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E4A240589
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E4A240589
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:55:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38D0A875DD; Fri, 24 May 2024 12:55:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 14:53:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b92c88a09ca8d536a095a830d76e73f5ded04ec6
X-Git-Newrev: 6ee86ada7212b6bb38089fe00bf375fd4cd2a024
X-Patchwork-Hint: ignore
Message-Id: <20240524125523.38D0A875DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_pc_defconfig: add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ee86ada7212b6bb38089fe00bf375fd4cd2a024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.  With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                 | 1 -
 board/orangepi/orangepi-pc/patches/linux-headers/linux-headers.hash | 1 +
 board/orangepi/orangepi-pc/patches/linux/linux.hash                 | 2 ++
 board/orangepi/orangepi-pc/patches/uboot/uboot.hash                 | 2 ++
 configs/orangepi_pc_defconfig                                       | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 798dc33978..ebf320c3c5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -268,7 +268,6 @@ configs/orangepi_lite_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_pc_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-pc/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-pc/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-pc/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc/patches/linux/linux.hash b/board/orangepi/orangepi-pc/patches/linux/linux.hash
new file mode 100644
index 0000000000..b763fc947a
--- /dev/null
+++ b/board/orangepi/orangepi-pc/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  880ace63ca2291b8b639e9bd862cc828649d3e1e00ccfee5861473debd2e4dec  linux-6.1.91.tar.xz
diff --git a/board/orangepi/orangepi-pc/patches/uboot/uboot.hash b/board/orangepi/orangepi-pc/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..bc999536af
--- /dev/null
+++ b/board/orangepi/orangepi-pc/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 731f5fdfcc..1713fc609f 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -2,6 +2,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-pc/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
