Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8AEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 14:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACF988183D;
	Sun, 13 Feb 2022 14:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id leJa4BJmSZBd; Sun, 13 Feb 2022 14:58:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C58681836;
	Sun, 13 Feb 2022 14:58:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 157DA1BF841
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0065E6080B
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4122MHJiAt5A for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 14:58:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CD4C607DE
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 14:58:12 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout05.t-online.de (Postfix) with SMTP id 4C3308FF3;
 Sun, 13 Feb 2022 15:58:09 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nJGKC-4U2v3J0; Sun, 13 Feb 2022 15:58:04 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37684)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nJGKB-0000w2-LN;
 Sun, 13 Feb 2022 15:58:03 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 15:58:03 +0100
Message-Id: <20220213145803.3132537-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1644764284-00009E39-37FC7F79/0/0 CLEAN NORMAL
X-TOI-MSGID: 1dff42ed-429f-49d0-a16d-d033ca36df12
Subject: [Buildroot] [PATCH v2 1/1] package/libdeflate: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for transmission:
https://github.com/transmission/transmission/commit/d8d765c59551b97ffb10bedb6f66133a54954a0e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bumped to v1.10, added commit URL for patch

Build test using this defconfig

BR2_PACKAGE_LIBDEFLATE=y

was successful:

                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: OK
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: OK
               bootlin-m68k-68040-uclibc [10/45]: OK
             bootlin-microblazeel-uclibc [11/45]: OK
                bootlin-mipsel32r6-glibc [12/45]: OK
                   bootlin-mipsel-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
        bootlin-powerpc64le-power8-glibc [16/45]: OK
           bootlin-powerpc-e500mc-uclibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...e-ARM-CRC32-intrinsics-when-affected.patch | 66 +++++++++++++++++++
 package/libdeflate/Config.in                  |  7 ++
 package/libdeflate/libdeflate.hash            |  3 +
 package/libdeflate/libdeflate.mk              | 34 ++++++++++
 6 files changed, 112 insertions(+)
 create mode 100644 package/libdeflate/0001-Don-t-use-ARM-CRC32-intrinsics-when-affected.patch
 create mode 100644 package/libdeflate/Config.in
 create mode 100644 package/libdeflate/libdeflate.hash
 create mode 100644 package/libdeflate/libdeflate.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0f..53795ba67c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -361,6 +361,7 @@ F:	package/libcec/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libdcadec/
+F:	package/libdeflate/
 F:	package/libdrm/
 F:	package/libdvbcsa/
 F:	package/libdvdcss/
diff --git a/package/Config.in b/package/Config.in
index e4a0f35cb8..268549c4a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1376,6 +1376,7 @@ endmenu
 
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
+	source "package/libdeflate/Config.in"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
diff --git a/package/libdeflate/0001-Don-t-use-ARM-CRC32-intrinsics-when-affected.patch b/package/libdeflate/0001-Don-t-use-ARM-CRC32-intrinsics-when-affected.patch
new file mode 100644
index 0000000000..63832810e9
--- /dev/null
+++ b/package/libdeflate/0001-Don-t-use-ARM-CRC32-intrinsics-when-affected.patch
@@ -0,0 +1,66 @@
+From d045a4933585fceef38d235727c49d9eac61cd61 Mon Sep 17 00:00:00 2001
+From: Eric Biggers <ebiggers3@gmail.com>
+Date: Tue, 8 Feb 2022 00:22:00 -0800
+Subject: [PATCH] Don't use ARM CRC32 intrinsics when affected by gcc bug
+ 104439
+
+The following build error was reported at
+https://github.com/ebiggers/libdeflate/pull/163:
+
+    /tmp/ccAwbDTP.s:140: Error: selected processor does not support crc32b r0,r0,r3' in ARM mode
+    [followed by lots of similar errors]
+
+This is caused by https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104439, a
+gcc bug that has been fixed.  To work around this, disable building
+crc32_arm() as dynamically-dispatched code on the affected gcc versions.
+
+Downloaded from upstream commit
+https://github.com/ebiggers/libdeflate/commit/d045a4933585fceef38d235727c49d9eac61cd61
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ common/compiler_gcc.h | 29 ++++++++++++++++++++++-------
+ 1 file changed, 22 insertions(+), 7 deletions(-)
+
+diff --git a/common/compiler_gcc.h b/common/compiler_gcc.h
+index 2a45b05..8ea3ff8 100644
+--- a/common/compiler_gcc.h
++++ b/common/compiler_gcc.h
+@@ -122,15 +122,30 @@
+ #    endif
+ 
+      /*
+-      * Determine whether CRC32 intrinsics are supported.
++      * Determine whether ARM CRC32 intrinsics are supported.
+       *
+-      * With gcc r274827 or later (gcc 10.1+, 9.3+, or 8.4+), or with clang,
+-      * they work as expected.  (Well, not quite.  There's still a bug, but we
+-      * have to work around it later when including arm_acle.h.)
++      * This support has been affected by several gcc bugs, which we must avoid
++      * by only allowing gcc versions that have the corresponding fixes.  First,
++      * gcc commit 943766d37ae4 ("[arm] Fix use of CRC32 intrinsics with Armv8-a
++      * and hard-float"), i.e. gcc 8.4+, 9.3+, 10.1+, or 11+, is needed.
++      * Second, gcc commit c1cdabe3aab8 ("arm: reorder assembler architecture
++      * directives [PR101723]"), i.e. gcc 9.5+, 10.4+, 11.3+, or 12+, is needed
++      * when binutils is 2.34 or later, due to
++      * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104439.  We use the second
++      * set of prerequisites, as they are stricter and we have no way to detect
++      * the binutils version in C source without requiring a configure script.
++      *
++      * Yet another gcc bug makes arm_acle.h sometimes not define the crc
++      * functions even when the corresponding builtins are available.  However,
++      * we work around this later when including arm_acle.h.
++      *
++      * Things are a bit easier with clang -- we can just check whether the
++      * crc builtins are available.  However, clang's arm_acle.h is broken in
++      * the same way as gcc's, which we work around later in the same way.
+       */
+-#    if GCC_PREREQ(10, 1) || \
+-        (GCC_PREREQ(9, 3) && !GCC_PREREQ(10, 0)) || \
+-        (GCC_PREREQ(8, 4) && !GCC_PREREQ(9, 0)) || \
++#    if GCC_PREREQ(11, 3) || \
++        (GCC_PREREQ(10, 4) && !GCC_PREREQ(11, 0)) || \
++        (GCC_PREREQ(9, 5) && !GCC_PREREQ(10, 0)) || \
+         (defined(__clang__) && __has_builtin(__builtin_arm_crc32b))
+ #      define COMPILER_SUPPORTS_CRC32_TARGET_INTRINSICS 1
+ #    endif
diff --git a/package/libdeflate/Config.in b/package/libdeflate/Config.in
new file mode 100644
index 0000000000..d2fb0d6c55
--- /dev/null
+++ b/package/libdeflate/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDEFLATE
+	bool "libdeflate"
+	help
+	  Libdeflate is a heavily optimized library for DEFLATE/zlib/
+	  gzip compression and decompression
+
+	  https://github.com/ebiggers/libdeflate
diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
new file mode 100644
index 0000000000..0a941bd8d6
--- /dev/null
+++ b/package/libdeflate/libdeflate.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5c1f75c285cd87202226f4de49985dcb75732f527eefba2b3ddd70a8865f2533  libdeflate-1.10.tar.gz
+sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
new file mode 100644
index 0000000000..08901ed5ed
--- /dev/null
+++ b/package/libdeflate/libdeflate.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libdeflate
+#
+################################################################################
+
+LIBDEFLATE_VERSION = 1.10
+LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
+LIBDEFLATE_LICENSE = MIT
+LIBDEFLATE_LICENSE_FILES = COPYING
+LIBDEFLATE_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBDEFLATE_MAKE_OPTS += DISABLE_SHARED=yes
+endif
+
+define LIBDEFLATE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBDEFLATE_MAKE_OPTS)
+endef
+
+define LIBDEFLATE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBDEFLATE_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" PREFIX=/usr install
+endef
+
+define LIBDEFLATE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBDEFLATE_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
