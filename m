Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AD8C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 16:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6DA840243;
	Tue,  8 Feb 2022 16:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZFlORaiDFU4; Tue,  8 Feb 2022 16:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2E9E40239;
	Tue,  8 Feb 2022 16:24:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8105D1BF5E9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 16:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA5B813B0
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 16:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrECz102FgIx for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 16:24:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E7C5813AC
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 16:24:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.252.129.8])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 55E29780344;
 Tue,  8 Feb 2022 17:24:29 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 17:24:08 +0100
Message-Id: <20220208162409.496110-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/volk: new package
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

VOLK is the Vector-Optimized Library of Kernels

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/volk/Config.in | 31 +++++++++++++++++++++++++++++++
 package/volk/volk.hash |  3 +++
 package/volk/volk.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 package/volk/Config.in
 create mode 100644 package/volk/volk.hash
 create mode 100644 package/volk/volk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d1cf99898..c8a9b87c47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1181,6 +1181,7 @@ F:	package/python-markdown/
 F:	package/python-remi/
 F:	package/python-sip/
 F:	package/uhd/
+F:	package/volk/
 
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	board/kontron/pitx-imx8m/
diff --git a/package/Config.in b/package/Config.in
index d631ed784a..c0353829a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2062,6 +2062,7 @@ endif
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
 	source "package/uvw/Config.in"
+	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
 endmenu
 
diff --git a/package/volk/Config.in b/package/volk/Config.in
new file mode 100644
index 0000000000..4539cd2153
--- /dev/null
+++ b/package/volk/Config.in
@@ -0,0 +1,31 @@
+comment "volk needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_VOLK
+	bool "volk"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU # use fork()
+	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SYSTEM
+	help
+	  VOLK is the Vector-Optimized Library of Kernels. It is a
+	  library that contains kernels of hand-written SIMD code
+	  for different mathematical operations. Since each SIMD
+	  architecture can be very different and no compiler has yet
+	  come along to handle vectorization properly or highly
+	  efficiently, VOLK approaches the problem differently.
+
+	  For each architecture or platform that a developer wishes
+	  to vectorize for, a new proto-kernel is added to VOLK. At
+	  runtime, VOLK will select the correct proto-kernel. In this
+	  way, the users of VOLK call a kernel for performing the
+	  operation that is platform/architecture agnostic. This
+	  allows us to write portable SIMD code.
+
+	  https://www.libvolk.org/
diff --git a/package/volk/volk.hash b/package/volk/volk.hash
new file mode 100644
index 0000000000..9fca6c1b33
--- /dev/null
+++ b/package/volk/volk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  d9183b9f86a32cdbb8698cbbeb15de574962c05200ccf445c1058629073521f8  volk-2.5.0.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
new file mode 100644
index 0000000000..cdb0ea9a77
--- /dev/null
+++ b/package/volk/volk.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# volk
+#
+################################################################################
+
+VOLK_VERSION = 2.5.0
+VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
+VOLK_LICENSE = GPL-3.0+
+VOLK_LICENSE_FILES = COPYING
+
+VOLK_SUPPORTS_IN_SOURCE_BUILD = NO
+
+# host-python-mako are needed for volk to compile
+VOLK_DEPENDENCIES = host-python3 host-python-mako boost
+
+VOLK_CONF_OPTS = \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
+	-DENABLE_MODTOOL=OFF \
+	-DENABLE_TESTING=OFF \
+	-DENABLE_PROFILING=OFF \
+	-DVOLK_PYTHON_DIR=lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+
+# For third-party blocks, the volk library is mandatory at
+# compile time.
+VOLK_INSTALL_STAGING = YES
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+VOLK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+VOLK_DEPENDENCIES += orc
+VOLK_CONF_OPTS += -DENABLE_ORC=ON
+else
+VOLK_CONF_OPTS += -DENABLE_ORC=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
