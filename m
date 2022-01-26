Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87078C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25B03403A4;
	Wed, 26 Jan 2022 21:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aHlJAX2VBF0T; Wed, 26 Jan 2022 21:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8F1A409F5;
	Wed, 26 Jan 2022 21:17:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C37821BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1C1941722
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFHg6rvpz1fm for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:17:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9BB341718
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:17:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 693108197C; Wed, 26 Jan 2022 21:10:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:17:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c99d84fb9694000a91fa04abc820f3e63a14e7e9
X-Git-Newrev: 18a863063735e2c658fa6947a4e540e9dda6c431
X-Patchwork-Hint: ignore
Message-Id: <20220126211029.693108197C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zynaddsubfx: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=18a863063735e2c658fa6947a4e540e9dda6c431
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ZynAddSubFX is a fully featured open source software synthesizer
capable of making a countless number of instruments, from some
common heard from expensive hardware to interesting sounds that
you'll boost to an amazing universe of sounds.

https://zynaddsubfx.sourceforge.io/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/zynaddsubfx/Config.in        | 31 +++++++++++++++++++++++++++++++
 package/zynaddsubfx/zynaddsubfx.hash |  3 +++
 package/zynaddsubfx/zynaddsubfx.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d729e5ce4..fe8de1916e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1611,6 +1611,7 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
+F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/test_python_gnupg.py
 
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
index 0000000000..158b5b4ede
--- /dev/null
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# zynaddsubfx
+#
+################################################################################
+
+ZYNADDSUBFX_VERSION = 3.0.6
+ZYNADDSUBFX_SOURCE = zynaddsubfx-$(ZYNADDSUBFX_VERSION).tar.bz2
+ZYNADDSUBFX_SITE = http://downloads.sourceforge.net/zynaddsubfx
+ZYNADDSUBFX_LICENSE = GPL-2.0+
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
