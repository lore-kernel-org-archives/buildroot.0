Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C95C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D8ED8175A;
	Mon,  1 Aug 2022 20:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D8ED8175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvrM0dSGw4D3; Mon,  1 Aug 2022 20:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B6181756;
	Mon,  1 Aug 2022 20:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B6181756
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD5AB1BF9AD
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A80D1605B1
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80D1605B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWid2XU8dnfk for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:09:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDBA7605A2
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDBA7605A2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7B63886C09; Mon,  1 Aug 2022 19:55:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 22:06:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccc3900326fd185c854b3b572c6cc776c7c0746f
X-Git-Newrev: 4231e7b10b87de71e33bb9906eede3751bed5dfe
X-Patchwork-Hint: ignore
Message-Id: <20220801195519.7B63886C09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdeflate: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4231e7b10b87de71e33bb9906eede3751bed5dfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for upcoming version bump of transmission:
https://github.com/transmission/transmission/commit/d8d765c59551b97ffb10bedb6f66133a54954a0e

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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libdeflate/Config.in       |  7 +++++++
 package/libdeflate/libdeflate.hash |  3 +++
 package/libdeflate/libdeflate.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cb86b7100d..a85b611ccb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -360,6 +360,7 @@ F:	package/libcec/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libdcadec/
+F:	package/libdeflate/
 F:	package/libdrm/
 F:	package/libdvbcsa/
 F:	package/libdvdcss/
diff --git a/package/Config.in b/package/Config.in
index 5518067252..b26b41821f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1397,6 +1397,7 @@ endmenu
 
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
+	source "package/libdeflate/Config.in"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
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
index 0000000000..7dae12921f
--- /dev/null
+++ b/package/libdeflate/libdeflate.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  ba89fb167a5ab6bbdfa6ee3b1a71636e8140fa8471cce8a311697584948e4d06  libdeflate-1.12.tar.gz
+sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
new file mode 100644
index 0000000000..93ec5909a5
--- /dev/null
+++ b/package/libdeflate/libdeflate.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libdeflate
+#
+################################################################################
+
+LIBDEFLATE_VERSION = 1.12
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
