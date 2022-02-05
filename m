Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EEBC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 18:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58458134E;
	Sat,  5 Feb 2022 18:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jn0EDchh3i9O; Sat,  5 Feb 2022 18:08:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E051812E6;
	Sat,  5 Feb 2022 18:08:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2114E1BF95F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 18:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E01060B66
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 18:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rX-kd7Io8OXm for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 18:08:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCF8260758
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 18:08:27 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout06.t-online.de (Postfix) with SMTP id 85D955084;
 Sat,  5 Feb 2022 19:08:25 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nGPTt-2KTpCr0; Sat, 5 Feb 2022 19:08:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44586)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nGPTt-0002vI-Ff;
 Sat, 05 Feb 2022 19:08:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 19:08:15 +0100
Message-Id: <20220205180817.2103343-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1644084498-00013579-8D19FD75/0/0 CLEAN NORMAL
X-TOI-MSGID: cc713386-6011-49c2-a7b3-56e202e82c06
Subject: [Buildroot] [PATCH 1/3] package/libdeflate: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for upcoming version bump of transmission:
https://github.com/transmission/transmission/commit/d8d765c59551b97ffb10bedb6f66133a54954a0e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
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
 .../0001-fix-crc32-build-on-arm.patch         | 49 +++++++++++++++++++
 package/libdeflate/Config.in                  |  7 +++
 package/libdeflate/libdeflate.hash            |  3 ++
 package/libdeflate/libdeflate.mk              | 34 +++++++++++++
 6 files changed, 95 insertions(+)
 create mode 100644 package/libdeflate/0001-fix-crc32-build-on-arm.patch
 create mode 100644 package/libdeflate/Config.in
 create mode 100644 package/libdeflate/libdeflate.hash
 create mode 100644 package/libdeflate/libdeflate.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a1ec9a091e..70021ef823 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -364,6 +364,7 @@ F:	package/libcec/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libdcadec/
+F:	package/libdeflate/
 F:	package/libdrm/
 F:	package/libdvbcsa/
 F:	package/libdvdcss/
diff --git a/package/Config.in b/package/Config.in
index 5e6fed6dec..52a8ff8fe3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1393,6 +1393,7 @@ endmenu
 
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
+	source "package/libdeflate/Config.in"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
diff --git a/package/libdeflate/0001-fix-crc32-build-on-arm.patch b/package/libdeflate/0001-fix-crc32-build-on-arm.patch
new file mode 100644
index 0000000000..1ea3d6d564
--- /dev/null
+++ b/package/libdeflate/0001-fix-crc32-build-on-arm.patch
@@ -0,0 +1,49 @@
+From ce096af0f9f9c76ba98408daeee45c4f456be602 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 5 Feb 2022 14:32:18 +0100
+Subject: [PATCH] fix crc32 build on arm
+
+Fixes build error
+
+/tmp/ccAwbDTP.s: Assembler messages:
+/tmp/ccAwbDTP.s:140: Error: selected processor does not support `crc32b r0,r0,r3' in ARM mode
+/tmp/ccAwbDTP.s:146: Error: selected processor does not support `crc32w r3,r0,r3' in ARM mode
+/tmp/ccAwbDTP.s:148: Error: selected processor does not support `crc32w r3,r3,r4' in ARM mode
+/tmp/ccAwbDTP.s:150: Error: selected processor does not support `crc32w r3,r3,r4' in ARM mode
+/tmp/ccAwbDTP.s:152: Error: selected processor does not support `crc32w r3,r3,r0' in ARM mode
+/tmp/ccAwbDTP.s:154: Error: selected processor does not support `crc32w r3,r3,r4' in ARM mode
+/tmp/ccAwbDTP.s:156: Error: selected processor does not support `crc32w r3,r3,r0' in ARM mode
+/tmp/ccAwbDTP.s:158: Error: selected processor does not support `crc32w r3,r3,r4' in ARM mode
+/tmp/ccAwbDTP.s:159: Error: selected processor does not support `crc32w r0,r3,r0' in ARM mode
+/tmp/ccAwbDTP.s:165: Error: selected processor does not support `crc32w lr,r0,lr' in ARM mode
+/tmp/ccAwbDTP.s:166: Error: selected processor does not support `crc32w r0,lr,r4' in ARM mode
+/tmp/ccAwbDTP.s:170: Error: selected processor does not support `crc32b r0,r0,r3' in ARM mode
+/tmp/ccAwbDTP.s:177: Error: selected processor does not support `crc32b r0,r0,r3' in ARM mode
+
+Patch sent upstream as RFC:
+https://github.com/ebiggers/libdeflate/pull/163
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ common/compiler_gcc.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/common/compiler_gcc.h b/common/compiler_gcc.h
+index 2a45b05..ea16c2d 100644
+--- a/common/compiler_gcc.h
++++ b/common/compiler_gcc.h
+@@ -128,9 +128,9 @@
+       * they work as expected.  (Well, not quite.  There's still a bug, but we
+       * have to work around it later when including arm_acle.h.)
+       */
+-#    if GCC_PREREQ(10, 1) || \
++#    if ((GCC_PREREQ(10, 1) || \
+         (GCC_PREREQ(9, 3) && !GCC_PREREQ(10, 0)) || \
+-        (GCC_PREREQ(8, 4) && !GCC_PREREQ(9, 0)) || \
++        (GCC_PREREQ(8, 4) && !GCC_PREREQ(9, 0))) && defined(__aarch64__)) || \
+         (defined(__clang__) && __has_builtin(__builtin_arm_crc32b))
+ #      define COMPILER_SUPPORTS_CRC32_TARGET_INTRINSICS 1
+ #    endif
+-- 
+2.30.2
+
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
index 0000000000..ef480ab270
--- /dev/null
+++ b/package/libdeflate/libdeflate.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  a537ab6125c226b874c02b166488b326aece954930260dbf682d88fc339137e3  libdeflate-1.9.tar.gz
+sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
new file mode 100644
index 0000000000..2453804989
--- /dev/null
+++ b/package/libdeflate/libdeflate.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libdeflate
+#
+################################################################################
+
+LIBDEFLATE_VERSION = 1.9
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
