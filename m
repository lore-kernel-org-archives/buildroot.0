Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE13DC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 18:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68B0361124;
	Tue, 26 Jul 2022 18:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68B0361124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3xhb7LH4h_K; Tue, 26 Jul 2022 18:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BED6610B0;
	Tue, 26 Jul 2022 18:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BED6610B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96A2F1BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EAA94018A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EAA94018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AoIY_mXbRUCP for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 18:40:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE0D400FB
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 18:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE0D400FB
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1BE3185F33; Tue, 26 Jul 2022 18:26:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 20:40:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 736c4c1655d93652a9a7e79235bbe726b3d46176
X-Git-Newrev: 5f54ccb46f7f35c4b73418d10f51ad4525a1e6ca
X-Patchwork-Hint: ignore
Message-Id: <20220726182638.1BE3185F33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/volk: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f54ccb46f7f35c4b73418d10f51ad4525a1e6ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

VOLK is the Vector-Optimized Library of Kernels

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/volk/Config.in | 33 +++++++++++++++++++++++++++++++++
 package/volk/volk.hash |  4 ++++
 package/volk/volk.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 81 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 90319c3837..4869df8bb8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1205,6 +1205,7 @@ F:	package/python-markdown/
 F:	package/python-remi/
 F:	package/python-sip/
 F:	package/uhd/
+F:	package/volk/
 
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	board/kontron/bl-imx8mm/
diff --git a/package/Config.in b/package/Config.in
index c9dcc4d37a..d78c24fd9e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2071,6 +2071,7 @@ endif
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
 	source "package/uvw/Config.in"
+	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
 endmenu
 
diff --git a/package/volk/Config.in b/package/volk/Config.in
new file mode 100644
index 0000000000..95b4a8bdb5
--- /dev/null
+++ b/package/volk/Config.in
@@ -0,0 +1,33 @@
+comment "volk needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
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
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
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
index 0000000000..0ec96d22ff
--- /dev/null
+++ b/package/volk/volk.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  3f092737006ad2b7d24852833cf040e725c6f47d68ec2f4197895f84c6400bd8  volk-2.5.1.tar.xz
+sha256  6dcdafa9e750545f5f65c2e6f53820184822db728ac2b8bfe1d4a47da09ec0d6  COPYING
+sha256  258f450f060a161fb9f9e2e7c07c6b1ee73e5142297e6792dc1ee76b028cf0ca  COPYING-LGPL
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
new file mode 100644
index 0000000000..e7b004b87f
--- /dev/null
+++ b/package/volk/volk.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# volk
+#
+################################################################################
+
+VOLK_VERSION = 2.5.1
+VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
+VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
+# See https://github.com/gnuradio/volk/tree/v2.5.1#license for some
+# details on the licensing.
+VOLK_LICENSE = GPL-3.0+
+VOLK_LICENSE_FILES = COPYING COPYING-LGPL
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
