Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA7BC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEA1E403CF;
	Wed, 10 Jul 2024 22:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0nVZu-bvobe; Wed, 10 Jul 2024 22:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67384415CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67384415CF;
	Wed, 10 Jul 2024 22:00:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 085AE1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA7FC61073
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbIoiNvPPnMP for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F3E0607DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F3E0607DE
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:00:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BAAB848DF; Wed, 10 Jul 2024 22:00:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:59:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48790b43296f45aa7f9f8c6701e94fe86269c241
X-Git-Newrev: 0ffff6106cd2686cb08cfe2a60d7900929270af5
X-Patchwork-Hint: ignore
Message-Id: <20240710220051.1BAAB848DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/arm_foundationv8: bump to Linux
 6.8.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3184680065271639818=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3184680065271639818==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0ffff6106cd2686cb08cfe2a60d7900929270af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump Linux kernel to v6.8.10.
- Bump the FVP in the readme to version 11.25 build 15.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/arm/foundation-v8/patches/linux-headers/linux-headers.hash | 1 +
 board/arm/foundation-v8/patches/linux/linux.hash                 | 2 ++
 board/arm/foundation-v8/readme.txt                               | 2 +-
 configs/arm_foundationv8_defconfig                               | 7 ++++---
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/board/arm/foundation-v8/patches/linux-headers/linux-headers.hash b/board/arm/foundation-v8/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/arm/foundation-v8/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/arm/foundation-v8/patches/linux/linux.hash b/board/arm/foundation-v8/patches/linux/linux.hash
new file mode 100644
index 0000000000..559b53be2d
--- /dev/null
+++ b/board/arm/foundation-v8/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b0bb92d982f88380e5b2059349c3a862e0afa712e0646eb0e082b9c2c5cb5176  linux-6.8.10.tar.xz
diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index cb0fe08b87..701cf3ceb0 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -3,7 +3,7 @@ ARM software simulator of the AArch64 architecture.
 
 First, one has to download the AArch64 software simulator from:
 
-  https://armkeil.blob.core.windows.net/developer/Files/downloads/ecosystem-models/Foundation_Platform_11.20_15_Linux64.tgz
+  https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FM_11_25/Foundation_Platform_11.25_15_Linux64.tgz
 
 Then, use the arm_foundationv8_defconfig configuration to build your
 Buildroot system.
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 102fe8fd09..69266894e1 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,10 +1,11 @@
 BR2_aarch64=y
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_GLOBAL_PATCH_DIR="board/arm/foundation-v8/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8-gicv3-psci"

--===============3184680065271639818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3184680065271639818==--
