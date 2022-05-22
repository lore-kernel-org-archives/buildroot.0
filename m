Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3F0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 18:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA21660D5A;
	Sun, 22 May 2022 18:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96iknVFewNPS; Sun, 22 May 2022 18:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4DB60B1B;
	Sun, 22 May 2022 18:47:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABA811BF318
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 18:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A1D083E48
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 18:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1qhq1a3vfdU for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 18:47:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 417BE83E3E
 for <buildroot@buildroot.org>; Sun, 22 May 2022 18:47:45 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout07.t-online.de (Postfix) with SMTP id 36ED18E4F
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:47:42 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.201.144]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nsqc9-2JJEIL0; Sun, 22 May 2022 20:47:41 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41712)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nsqc9-0000CZ-3i
 for buildroot@buildroot.org; Sun, 22 May 2022 20:47:41 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 20:47:41 +0200
Message-Id: <20220522184741.2309805-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653245261-0001619A-D0EC53C9/0/0 CLEAN NORMAL
X-TOI-MSGID: 8f52942c-7857-44e4-b194-0a81cd412602
Subject: [Buildroot] [PATCH/next 1/1] package/xmrig: enable for avmv7a
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Available since 2017:
https://github.com/xmrig/xmrig/commit/aa4f8b6fa78eb8331b5927ba5315b926ac75ce9c

We noticed it since its addition to the readme:
https://github.com/xmrig/xmrig/commit/97869f3347a621d9dbf20210289ce10c68a5bd34

Added patch to fix build with gcc-4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build-tested using this defconfig:

BR2_PACKAGE_XMRIG=y

                             andes-nds32 [ 1/45]: SKIPPED
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: SKIPPED
                    bootlin-armv5-uclibc [ 5/45]: SKIPPED
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: SKIPPED
               bootlin-m68k-68040-uclibc [10/45]: SKIPPED
             bootlin-microblazeel-uclibc [11/45]: SKIPPED
                bootlin-mipsel32r6-glibc [12/45]: SKIPPED
                   bootlin-mipsel-uclibc [13/45]: SKIPPED
                     bootlin-nios2-glibc [14/45]: SKIPPED
                 bootlin-openrisc-uclibc [15/45]: SKIPPED
        bootlin-powerpc64le-power8-glibc [16/45]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [17/45]: SKIPPED
                   bootlin-riscv32-glibc [18/45]: SKIPPED
                   bootlin-riscv64-glibc [19/45]: SKIPPED
                    bootlin-riscv64-musl [20/45]: SKIPPED
                      bootlin-sh4-uclibc [21/45]: SKIPPED
                   bootlin-sparc64-glibc [22/45]: SKIPPED
                    bootlin-sparc-uclibc [23/45]: SKIPPED
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: SKIPPED
                   bootlin-xtensa-uclibc [27/45]: SKIPPED
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: SKIPPED
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: SKIPPED
                 br-mips64r6-el-hf-glibc [34/45]: SKIPPED
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: SKIPPED
                       linaro-aarch64-be [37/45]: SKIPPED
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: SKIPPED
                            sourcery-arm [41/45]: SKIPPED
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: SKIPPED
                           sourcery-mips [44/45]: SKIPPED
                          sourcery-nios2 [45/45]: SKIPPED
45 builds, 35 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 ...0001-astrobwt-fix-build-with-gcc-4.8.patch | 40 +++++++++++++++++++
 package/xmrig/Config.in                       |  4 +-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch

diff --git a/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch b/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..694d7b203c
--- /dev/null
+++ b/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,40 @@
+From 72234ae73590fa93d837034a3fb48b71eb071a2a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 22 May 2022 20:24:14 +0200
+Subject: [PATCH] astrobwt: fix build with gcc-4.8
+
+Fixes build error:
+
+xmrig-6.17.0/src/crypto/astrobwt/sort_indices2.cpp:40:24: error: missing binary operator before token "("
+ #if __has_cpp_attribute(unlikely)
+
+found with the buildroot toolchain
+arm-none-linux-gnueabi-gcc (Sourcery CodeBench Lite 2014.05-29) 4.8.3 20140320 (prerelease)
+
+Inspired by
+https://reviews.llvm.org/rG91c32fd8c8fa395971a028f7091273fa2c8f44e6
+
+Patch sent upstream: https://github.com/xmrig/xmrig/pull/3057
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/crypto/astrobwt/sort_indices2.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/crypto/astrobwt/sort_indices2.cpp b/src/crypto/astrobwt/sort_indices2.cpp
+index 2d86d462..3a70f619 100644
+--- a/src/crypto/astrobwt/sort_indices2.cpp
++++ b/src/crypto/astrobwt/sort_indices2.cpp
+@@ -36,6 +36,9 @@
+ #define RESTRICT
+ #endif
+ 
++#ifndef __has_cpp_attribute
++#define __has_cpp_attribute(x) 0
++#endif
+ 
+ #if __has_cpp_attribute(unlikely)
+ #define UNLIKELY(X) (X) [[unlikely]]
+-- 
+2.30.2
+
diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
index c5c6b3e37b..4c70abec6f 100644
--- a/package/xmrig/Config.in
+++ b/package/xmrig/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XMRIG
 	bool "xmrig"
 	# archs officially supported by upstream
-	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
+	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64 || BR2_i386
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
@@ -16,7 +16,7 @@ config BR2_PACKAGE_XMRIG
 	  https://xmrig.com
 
 comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++"
-	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
+	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64 || BR2_i386
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
