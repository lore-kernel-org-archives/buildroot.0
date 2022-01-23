Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F428C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 13:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5D284000B;
	Sun, 23 Jan 2022 13:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NyaTulczMfPH; Sun, 23 Jan 2022 13:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5061240545;
	Sun, 23 Jan 2022 13:48:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 538821BF422
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 13:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41FEF8198A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 13:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hB4CPcJ2wL8A for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 13:48:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C878681A0D
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 13:48:16 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.161.123])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 596BD19F59E;
 Sun, 23 Jan 2022 14:48:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642945693;
 bh=9l88Pf6o34WQ11LyTp6EETUpjlGh3BT0TpSqLlyem8Q=;
 h=From:To:Cc:Subject:Date:From;
 b=BpNkfqJtRel0NNp/gUIXxt9ckC2GzhhCIAHpQ92jprfpM5SoOVwsL4robFtpERJni
 ByMfgliDqNUvpu9f4gpCFizcBeqcfPNLpzwEmxdV3FxN3fH9tXw9iLlgMxK0t9AtPk
 YGNErHt4QuAcu1ssLDy691x7t/AmkI2mwyKolZKxFGssGKsojFiSnME8fIcmiPwEp0
 HrNXUUXpg8bkwbmZz08eKdmbOJCcrg9V8Ns+2Dl+HnCsUde3dTGQm0rqiAEuXgvQok
 IkeBTJ90Jvpcxko9YYSCe7OtPMPOBTX4aeOSnZeCp1yx8hN5n/MO6bw3gMynvaqcUM
 4hFbKSnQgF/0A==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 14:48:03 +0100
Message-Id: <20220123134803.2269814-1-ju.o@free.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zynaddsubfx: new package
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ZynAddSubFX is a fully featured open source software synthesizer
capable of making a countless number of instruments, from some
common heard from expensive hardware to interesting sounds that
you'll boost to an amazing universe of sounds.

https://zynaddsubfx.sourceforge.io/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Checked with:

make check-package
[...]
0 warnings generated

./utils/test-pkg --all --package zynaddsubfx
                             andes-nds32 [ 1/45]: SKIPPED
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
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
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
                     sourcery-arm-armv4t [40/45]: SKIPPED
                            sourcery-arm [41/45]: SKIPPED
                     sourcery-arm-thumb2 [42/45]: SKIPPED
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 6 skipped, 0 build failed, 0 legal-info failed
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/zynaddsubfx/Config.in        | 31 ++++++++++++++++++++++++++++
 package/zynaddsubfx/zynaddsubfx.hash |  3 +++
 package/zynaddsubfx/zynaddsubfx.mk   | 28 +++++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/zynaddsubfx/Config.in
 create mode 100644 package/zynaddsubfx/zynaddsubfx.hash
 create mode 100644 package/zynaddsubfx/zynaddsubfx.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dc810b6fe1..df9e6ec73b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1611,6 +1611,7 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
+F:	package/zynaddsubfx/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index 85188ff873..e4ca195beb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -62,6 +62,7 @@ menu "Audio and video applications"
 	source "package/wavpack/Config.in"
 	source "package/yavta/Config.in"
 	source "package/ympd/Config.in"
+	source "package/zynaddsubfx/Config.in"
 endmenu
 
 menu "Compressors and decompressors"
diff --git a/package/zynaddsubfx/Config.in b/package/zynaddsubfx/Config.in
new file mode 100644
index 0000000000..837a469e7c
--- /dev/null
+++ b/package/zynaddsubfx/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_ZYNADDSUBFX
+	bool "zynaddsubfx"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, liblo
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_SINGLE
+	select BR2_PACKAGE_LIBLO
+	select BR2_PACKAGE_MXML
+	select BR2_PACKAGE_ZLIB
+	help
+	  ZynAddSubFX is a fully featured open source software
+	  synthesizer capable of making a countless number of
+	  instruments, from some common heard from expensive hardware
+	  to interesting sounds that you'll boost to an amazing
+	  universe of sounds.
+
+	  Note: this Buildroot package does not include the graphical
+	  user interface. It is meant to be executed as a headless
+	  daemon to be controlled with MIDI events or network OSC
+	  (Open Sound Control) events. OSC events can be generated
+	  from an external system with the ZynAddSubFX external GUI
+	  program zynaddsubfx-ext-gui.
+
+	  https://zynaddsubfx.sourceforge.io/
+
+comment "zynaddsubfx needs a toolchain w/ C++11 and threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/zynaddsubfx/zynaddsubfx.hash b/package/zynaddsubfx/zynaddsubfx.hash
new file mode 100644
index 0000000000..2465d0b864
--- /dev/null
+++ b/package/zynaddsubfx/zynaddsubfx.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  cbd160778f6cf147f9b0487719edc5197a1404f46d7c7bfd89e153f0d8ce71ae  zynaddsubfx-3.0.6.tar.bz2
+sha256  c9bf7643726da4f149e9669cf6f00257e4b3a173e4ab307461b8bd42717dd9a4  COPYING
diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
new file mode 100644
index 0000000000..68aa5ce278
--- /dev/null
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# zynaddsubfx
+#
+################################################################################
+
+ZYNADDSUBFX_VERSION = 3.0.6
+ZYNADDSUBFX_SOURCE = zynaddsubfx-$(ZYNADDSUBFX_VERSION).tar.bz2
+ZYNADDSUBFX_SITE = http://downloads.sourceforge.net/zynaddsubfx
+
+ZYNADDSUBFX_LICENSE = GPLv2+
+ZYNADDSUBFX_LICENSE_FILES = COPYING
+
+# There is no package in buildroot using LV2 plugins: disabling
+ZYNADDSUBFX_CONF_OPTS = -DPluginEnable=False
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ZYNADDSUBFX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
+ZYNADDSUBFX_DEPENDENCIES = \
+	alsa-lib \
+	fftw-single \
+	liblo \
+	mxml \
+	zlib
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
