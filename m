Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE61C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E28A6606BF;
	Wed, 22 Feb 2023 20:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E28A6606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rc65teKqLaeM; Wed, 22 Feb 2023 20:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 123D4606F9;
	Wed, 22 Feb 2023 20:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123D4606F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6C21BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7246B401B2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7246B401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpqEatrd68cH for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:41:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75CF540135
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75CF540135
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:41:54 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.192.177])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9DB0119F58D;
 Wed, 22 Feb 2023 21:41:47 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 21:41:33 +0100
Message-Id: <20230222204134.38884-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677098511;
 bh=CICaSQGwYHLjTRvQZ6rjMg5GgDl0irivH6nzZV6ID1I=;
 h=From:To:Cc:Subject:Date:From;
 b=e6Zycw7FcTSV65ORkgkag13zcYJ3dswq54mc6CGQsliLfGZEc6OAvR8f0tl2KOa0f
 egkhiIhMMk1KmTrJ67/bSs2A+W+ED5FnTiRudEACBumHcDAZRCHsJYgkL9e8gvAWy+
 HQssqLFu/juNdbwbEsvSqZo4Yg+PB8tJzgbvecSHDYNgMmaNxNkOZogqhwgJ2faaZa
 4bvN0qswnRgTe4GahZPiCAej2weSBxpVAyiXSSeM53zNS17+Zz45/YU/18y147+BA3
 MmHM5e6GSjSO9aV9A3Eh8UsWV6/jcDDKJQVib92x6mhCJA+sb691pdQh7r85nygkP3
 UIWNizZn9jbfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e6Zycw7F
Subject: [Buildroot] [PATCH next 1/2] package/opencsd: new package
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This library provides an API suitable for the decode of
ARM(r) CoreSight(tm) trace streams.

OpenCSD is for example an optional dependency in the Linux
"perf" tool, starting from kernel version 5.1.

https://github.com/Linaro/OpenCSD

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit 9793454 with commands:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -a -p opencsd
                             arm-aarch64 [ 1/45]: OK
                   bootlin-aarch64-glibc [ 2/45]: OK
               bootlin-arcle-hs38-uclibc [ 3/45]: SKIPPED
                    bootlin-armv5-uclibc [ 4/45]: OK
                     bootlin-armv7-glibc [ 5/45]: OK
                   bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                      bootlin-armv7-musl [ 7/45]: OK
                bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/45]: SKIPPED
             bootlin-microblazeel-uclibc [10/45]: SKIPPED
                bootlin-mipsel32r6-glibc [11/45]: SKIPPED
                   bootlin-mipsel-uclibc [12/45]: SKIPPED
                     bootlin-nios2-glibc [13/45]: SKIPPED
                 bootlin-openrisc-uclibc [14/45]: SKIPPED
        bootlin-powerpc64le-power8-glibc [15/45]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [16/45]: SKIPPED
                   bootlin-riscv32-glibc [17/45]: SKIPPED
                   bootlin-riscv64-glibc [18/45]: SKIPPED
                    bootlin-riscv64-musl [19/45]: SKIPPED
                 bootlin-s390x-z13-glibc [20/45]: SKIPPED
                      bootlin-sh4-uclibc [21/45]: SKIPPED
                   bootlin-sparc64-glibc [22/45]: SKIPPED
                    bootlin-sparc-uclibc [23/45]: SKIPPED
                    bootlin-x86-64-glibc [24/45]: SKIPPED
                     bootlin-x86-64-musl [25/45]: SKIPPED
                   bootlin-x86-64-uclibc [26/45]: SKIPPED
                   bootlin-xtensa-uclibc [27/45]: SKIPPED
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: SKIPPED
                br-i386-pentium-mmx-musl [32/45]: SKIPPED
                      br-mips64-n64-full [33/45]: SKIPPED
                 br-mips64r6-el-hf-glibc [34/45]: SKIPPED
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: SKIPPED
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: SKIPPED
                           sourcery-mips [44/45]: SKIPPED
                          sourcery-nios2 [45/45]: SKIPPED
    45 builds, 33 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/opencsd/Config.in    | 27 +++++++++++++++++++++++++++
 package/opencsd/opencsd.hash |  3 +++
 package/opencsd/opencsd.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 package/opencsd/Config.in
 create mode 100644 package/opencsd/opencsd.hash
 create mode 100644 package/opencsd/opencsd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 599cfe6886..32524c152a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1696,6 +1696,7 @@ F:	package/highway/
 F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
+F:	package/opencsd/
 F:	package/perftest/
 F:	package/ptm2human/
 F:	package/python-distro/
diff --git a/package/Config.in b/package/Config.in
index 6c5238a9b0..fcbf8e8b6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1708,6 +1708,7 @@ menu "Hardware handling"
 	source "package/mtdev/Config.in"
 	source "package/ne10/Config.in"
 	source "package/neardal/Config.in"
+	source "package/opencsd/Config.in"
 	source "package/opensc/Config.in"
 	source "package/owfs/Config.in"
 	source "package/pcsc-lite/Config.in"
diff --git a/package/opencsd/Config.in b/package/opencsd/Config.in
new file mode 100644
index 0000000000..0e63d99251
--- /dev/null
+++ b/package/opencsd/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_OPENCSD_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+
+config BR2_PACKAGE_OPENCSD
+	bool "OpenCSD"
+	depends on BR2_PACKAGE_OPENCSD_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  This library provides an API suitable for the decode of
+	  ARM(r) CoreSight(tm) trace streams.
+
+	  OpenCSD is for example an optional dependency in the Linux
+	  "perf" tool, starting from kernel version 5.1.
+
+	  https://github.com/Linaro/OpenCSD
+
+comment "OpenCSD needs a toolchain w/ C++11, gcc >= 4.8, dynamic libraries"
+	depends on BR2_PACKAGE_OPENCSD_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
new file mode 100644
index 0000000000..84a762fb36
--- /dev/null
+++ b/package/opencsd/opencsd.hash
@@ -0,0 +1,3 @@
+# Locally Computed:
+sha256  e1bb6d8d09e87974cb5ca6db2a13b0e1ba9e51117ca2ed71879df07ff7af4de2  opencsd-1.4.0.tar.gz
+sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
new file mode 100644
index 0000000000..680364d01d
--- /dev/null
+++ b/package/opencsd/opencsd.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# opencsd
+#
+################################################################################
+
+OPENCSD_VERSION = 1.4.0
+OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
+OPENCSD_LICENSE = BSD-3-Clause
+OPENCSD_LICENSE_FILES = LICENSE
+OPENCSD_INSTALL_STAGING = YES
+
+OPENCSD_MAKE_OPTS = \
+	CROSS_COMPILE="$(TARGET_CROSS)"
+
+define OPENCSD_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/decoder/build/linux \
+		$(OPENCSD_MAKE_OPTS) all
+endef
+
+define OPENCSD_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/decoder/build/linux \
+		$(OPENCSD_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+endef
+
+define OPENCSD_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/decoder/build/linux \
+		$(OPENCSD_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
