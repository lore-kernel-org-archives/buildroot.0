Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029CCC369CB
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 07:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2608107F;
	Tue, 29 Apr 2025 07:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8__nN-Hcg4LF; Tue, 29 Apr 2025 07:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90C64810C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90C64810C6;
	Tue, 29 Apr 2025 07:47:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F33FF1E3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 07:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D99A58109F
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 07:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jBnuepe6gha for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 07:47:21 +0000 (UTC)
Received-SPF: Neutral (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=gwenj@trabucayre.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0BB88105C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0BB88105C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0BB88105C
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 07:47:20 +0000 (UTC)
Received: from bricolage.. (unknown
 [IPv6:2a01:e0a:efa:53b0:468a:5bff:fe9a:3c4d])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 85954B00585;
 Tue, 29 Apr 2025 09:47:16 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Tue, 29 Apr 2025 09:46:58 +0200
Message-ID: <20250429074658.1272151-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=trabucayre.com
Subject: [Buildroot] [PATCH] package/soapy-sdr: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Soapy SDR - vendor and platform neutral SDR support library.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/Config.in                             |  1 +
 ...d-use-of-distutils-fix-for-Python-3..patch | 79 +++++++++++++++++++
 package/soapy-sdr/Config.in                   | 27 +++++++
 package/soapy-sdr/soapy-sdr.hash              |  3 +
 package/soapy-sdr/soapy-sdr.mk                | 44 +++++++++++
 5 files changed, 154 insertions(+)
 create mode 100644 package/soapy-sdr/0001-Remove-deprecated-use-of-distutils-fix-for-Python-3..patch
 create mode 100644 package/soapy-sdr/Config.in
 create mode 100644 package/soapy-sdr/soapy-sdr.hash
 create mode 100644 package/soapy-sdr/soapy-sdr.mk

diff --git a/package/Config.in b/package/Config.in
index 0d31faf354..6550230f5f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1792,6 +1792,7 @@ menu "Hardware handling"
 	source "package/owfs/Config.in"
 	source "package/pcsc-lite/Config.in"
 	source "package/rpi-rgb-led-matrix/Config.in"
+	source "package/soapy-sdr/Config.in"
 	source "package/tslib/Config.in"
 	source "package/uhd/Config.in"
 	source "package/urg/Config.in"
diff --git a/package/soapy-sdr/0001-Remove-deprecated-use-of-distutils-fix-for-Python-3..patch b/package/soapy-sdr/0001-Remove-deprecated-use-of-distutils-fix-for-Python-3..patch
new file mode 100644
index 0000000000..0df2c8f8e0
--- /dev/null
+++ b/package/soapy-sdr/0001-Remove-deprecated-use-of-distutils-fix-for-Python-3..patch
@@ -0,0 +1,79 @@
+From 1ee5670803f89b21d84a6a84acbb578da051c119 Mon Sep 17 00:00:00 2001
+From: Ryan Volz <ryan.volz@gmail.com>
+Date: Tue, 26 Sep 2023 14:56:59 -0400
+Subject: [PATCH] Remove deprecated use of distutils, fix for Python 3.12+
+
+Remove deprecated use of distutils, fix for Python 3.12+
+
+This switches to using sysconfig from distutils, which is necessary for
+Python 3.12+ since distutils is deprecated and has been removed.
+
+It is necessary to specify the install scheme when a prefix other than
+the Python default is used so that changes to the default scheme made by
+distributions (e.g. Debian, Fedora) do not produce an incorrect Python
+installation directory. For example, Debian patches the default scheme
+to prepend the path with '/local', but if a user specifies a prefix of
+'/usr/local', then the path using the default scheme would be
+'/usr/local/local/...' with a duplicated 'local' directory. Specifying
+an unmodified install scheme fixes that.
+
+Signed-off-by: Ryan Volz <ryan.volz@gmail.com>
+
+Upstream: https://github.com/pothosware/SoapySDR/commit/1ee5670803f89b21d84a6a84acbb578da051c119
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ swig/python/get_python_lib.py | 36 ++++++++++++++++++++++++-----------
+ 1 file changed, 25 insertions(+), 11 deletions(-)
+
+diff --git a/python/get_python_lib.py b/python/get_python_lib.py
+index 0c71652..574f0b6 100644
+--- a/python/get_python_lib.py
++++ b/python/get_python_lib.py
+@@ -1,19 +1,33 @@
+ import os
++import pathlib
+ import sys
+-import site
+-from distutils.sysconfig import get_python_lib
++import sysconfig
+ 
+ if __name__ == '__main__':
+-    prefix = sys.argv[1]
++    prefix = pathlib.Path(sys.argv[1]).resolve()
+ 
+-    #ask distutils where to install the python module
+-    install_dir = get_python_lib(plat_specific=True, prefix=prefix)
++    # default install dir for the running Python interpreter
++    default_install_dir = pathlib.Path(sysconfig.get_path('platlib')).resolve()
+ 
+-    #use sites when the prefix is already recognized
++    # if default falls under the desired prefix, we're done
+     try:
+-        paths = [p for p in site.getsitepackages() if p.startswith(prefix)]
+-        if len(paths) == 1: install_dir = paths[0]
+-    except AttributeError: pass
++        relative_install_dir = default_install_dir.relative_to(prefix)
++    except ValueError:
++        # get install dir for the specified prefix
++        # can't use the default scheme because distributions modify it
++        # newer Python versions have 'venv' scheme, use for all OSs.
++        if 'venv' in sysconfig.get_scheme_names():
++            scheme = 'venv'
++        elif os.name == 'nt':
++            scheme = 'nt'
++        else:
++            scheme = 'posix_prefix'
++        prefix_install_dir = pathlib.Path(sysconfig.get_path(
++            'platlib',
++            scheme=scheme,
++            vars={'base': prefix, 'platbase': prefix},
++        )).resolve()
++        relative_install_dir = prefix_install_dir.relative_to(prefix)
+ 
+-    #strip the prefix to return a relative path
+-    print(os.path.relpath(install_dir, prefix))
++    # want a relative path for use in the build system
++    print(relative_install_dir)
+-- 
+2.49.0
+
diff --git a/package/soapy-sdr/Config.in b/package/soapy-sdr/Config.in
new file mode 100644
index 0000000000..43ff191dca
--- /dev/null
+++ b/package/soapy-sdr/Config.in
@@ -0,0 +1,27 @@
+comment "SoapySDR needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+
+config BR2_PACKAGE_SOAPY_SDR
+	bool "SoapySDR"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Soapy SDR - vendor and platform neutral SDR support library.
+
+	  https://github.com/pothosware/SoapySDR/wiki
+
+if BR2_PACKAGE_SOAPY_SDR
+
+config BR2_PACKAGE_SOAPY_SDR_APPS
+	bool "apps support"
+	help
+	  Enable apps
+
+config BR2_PACKAGE_SOAPY_SDR_PYTHON
+	bool "python support"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Enable python binding
+endif
diff --git a/package/soapy-sdr/soapy-sdr.hash b/package/soapy-sdr/soapy-sdr.hash
new file mode 100644
index 0000000000..3804660140
--- /dev/null
+++ b/package/soapy-sdr/soapy-sdr.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  a508083875ed75d1090c24f88abef9895ad65f0f1b54e96d74094478f0c400e6  soapy-sdr-0.8.1.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/soapy-sdr/soapy-sdr.mk b/package/soapy-sdr/soapy-sdr.mk
new file mode 100644
index 0000000000..fae6b80bb3
--- /dev/null
+++ b/package/soapy-sdr/soapy-sdr.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# SoapySDR
+#
+################################################################################
+
+SOAPY_SDR_VERSION = 0.8.1
+SOAPY_SDR_SITE = https://github.com/pothosware/SoapySDR/archive/refs/tags
+SOAPY_SDR_LICENSE = BSL-1.0
+SOAPY_SDR_LICENSE_FILES = LICENSE_1_0.txt
+
+SOAPY_SDR_SUPPORTS_IN_SOURCE_BUILD = NO
+
+#SOAPY_SDR_DEPENDENCIES = boost gnuradio gr-osmosdr libsndfile qt5base qt5svg
+
+SOAPY_SDR_CONF_OPTS = \
+	-DENABLE_TESTS=OFF \
+	-DENABLE_DOCS=OFF \
+	-DENABLE_LIBRARY=ON
+
+# For third-party modules, the SoapySDR libraries are mandatory at
+# compile time.
+SOAPY_SDR_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_SOAPY_SDR_APPS),y)
+SOAPY_SDR_CONF_OPTS += -DENABLE_APPS=ON
+else
+SOAPY_SDR_CONF_OPTS += -DENABLE_APPS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SOAPY_SDR_PYTHON),y)
+SOAPY_SDR_DEPENDENCIES += python3
+SOAPY_SDR_CONF_OPTS += -DENABLE_PYTHON=ON \
+	-DENABLE_PYTHON3=ON \
+	-DBUILD_PYTHON3=ON \
+	-DUSE_PYTHON_CONFIG=ON
+else
+SOAPY_SDR_CONF_OPTS += -DENABLE_PYTHON=OFF \
+	-DENABLE_PYTHON3=OFF \
+	-DBUILD_PYTHON3=OFF \
+	-DUSE_PYTHON_CONFIG=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
