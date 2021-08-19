Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E064C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:28:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1111C60FE8
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1111C60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD9E480F4C;
	Thu, 19 Aug 2021 21:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQGszFGRvr90; Thu, 19 Aug 2021 21:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41388818D0;
	Thu, 19 Aug 2021 21:28:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB86F1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB5FF60629
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mL4fS5rXSITY for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:27:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61997605CC
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0DF768D688; Thu, 19 Aug 2021 21:27:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 23:24:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a2e9f3fbdd55d93b0f2770c8d016829bc36e2fba
X-Git-Newrev: 68933bf19560c180379c34906281d49187a4e6ea
X-Patchwork-Hint: ignore
Message-Id: <20210819212701.0DF768D688@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-autobahn: bump
 to version 21.3.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=68933bf19560c180379c34906281d49187a4e6ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Strip xbr contracts which are used only for the xbr feature which is
entirely unsupported by buildroot.

Add patch to fix some xbr assets getting accidentially included.

Enable the optimized nvx cffi extension module when available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...te-xbr-packages-and-xbr-templates-package.patch | 54 +++++++++++++++++++
 ...nvx-by-default-and-don-t-publish-universa.patch | 60 ++++++++++++++++++++++
 package/python-autobahn/Config.in                  |  2 +
 package/python-autobahn/python-autobahn.hash       |  4 +-
 package/python-autobahn/python-autobahn.mk         |  6 ++-
 5 files changed, 122 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch b/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
new file mode 100644
index 0000000000..f239345dc7
--- /dev/null
+++ b/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
@@ -0,0 +1,54 @@
+From b13b7e38b38e2c79c0a13be32e05f0451483cd01 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 12 Jun 2021 15:32:37 -0600
+Subject: [PATCH] Fix duplicate xbr packages and xbr templates package_data.
+ (#1492)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+a370f9e7154e59b313cb675bfcaf8cad6011bd52]
+---
+ MANIFEST.in |  1 -
+ setup.py    | 10 ++++++++--
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/MANIFEST.in b/MANIFEST.in
+index f4cb6da1..1dd32f0e 100644
+--- a/MANIFEST.in
++++ b/MANIFEST.in
+@@ -1,4 +1,3 @@
+ include LICENSE
+ include autobahn/nvx/_utf8validator.c
+ recursive-include autobahn/wamp/gen/schema *
+-recursive-include autobahn/xbr/templates *
+diff --git a/setup.py b/setup.py
+index cf4e29ba..f27006da 100644
+--- a/setup.py
++++ b/setup.py
+@@ -166,6 +166,12 @@ packages = [
+     'twisted.plugins',
+ ]
+ 
++xbr_packages = [
++    'autobahn.xbr',
++    'autobahn.asyncio.xbr',
++    'autobahn.twisted.xbr',
++]
++
+ package_data = {'autobahn.asyncio': ['./test/*']}
+ 
+ entry_points = {
+@@ -179,8 +185,8 @@ if 'AUTOBAHN_STRIP_XBR' in os.environ:
+     shutil.rmtree('autobahn.egg-info', ignore_errors=True)
+ else:
+     extras_require_all += extras_require_xbr
+-    packages += ['autobahn.xbr', 'autobahn.asyncio.xbr', 'autobahn.twisted.xbr']
+-    package_data['xbr'] = ['./xbr/contracts/*.json']
++    packages += xbr_packages
++    package_data['xbr'] = ['./xbr/templates/*.py.jinja2']
+     entry_points['console_scripts'] += ["xbrnetwork = autobahn.xbr._cli:_main"]
+ 
+ # development dependencies
+-- 
+2.25.1
+
diff --git a/package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch b/package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch
new file mode 100644
index 0000000000..c2c2cf5777
--- /dev/null
+++ b/package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch
@@ -0,0 +1,60 @@
+From 1e3162bab59cbc2f7cf8b9ef6cadf55ee273c1d8 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 22 Jul 2021 06:56:51 -0600
+Subject: [PATCH] Build with nvx by default and don't publish universal wheel.
+ (#1493)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+a35f22eeaafca7568f1deb35c4a1b82ae78f77d4]
+---
+ Makefile                       | 8 ++++----
+ autobahn/nvx/_utf8validator.py | 7 ++++++-
+ setup.py                       | 7 +------
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/autobahn/nvx/_utf8validator.py b/autobahn/nvx/_utf8validator.py
+index e72fc872..34393356 100644
+--- a/autobahn/nvx/_utf8validator.py
++++ b/autobahn/nvx/_utf8validator.py
+@@ -44,13 +44,18 @@ ffi.cdef("""
+     int nvx_utf8vld_get_impl(void* utf8vld);
+ """)
+ 
++optional = True
++if 'AUTOBAHN_USE_NVX' in os.environ and os.environ['AUTOBAHN_USE_NVX'] in ['1', 'true']:
++    optional = False
++
+ with open(os.path.join(os.path.dirname(__file__), '_utf8validator.c')) as fd:
+     c_source = fd.read()
+     ffi.set_source(
+         "_nvx_utf8validator",
+         c_source,
+         libraries=[],
+-        extra_compile_args=['-std=c99', '-Wall', '-Wno-strict-prototypes', '-O3', '-march=native']
++        extra_compile_args=['-std=c99', '-Wall', '-Wno-strict-prototypes', '-O3', '-march=native'],
++        optional=optional
+     )
+ 
+ 
+diff --git a/setup.py b/setup.py
+index f27006da..4889a39e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -110,12 +110,7 @@ extras_require_nvx = [
+ 
+ # cffi based extension modules to build, currently only NVX
+ cffi_modules = []
+-if 'AUTOBAHN_USE_NVX' in os.environ:
+-    # FIXME: building this extension will make the wheel
+-    # produced no longer universal (as in "autobahn-18.4.1-py2.py3-none-any.whl").
+-    # on the other hand, I don't know how to selectively include this
+-    # based on the install flavor the user has chosen (eg pip install autobahn[nvx]
+-    # should make the following be included)
++if 'AUTOBAHN_USE_NVX' not in os.environ or os.environ['AUTOBAHN_USE_NVX'] not in ['0', 'false']:
+     cffi_modules.append('autobahn/nvx/_utf8validator.py:ffi')
+ 
+ extras_require_xbr = [
+-- 
+2.25.1
+
diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index 78b16897bc..f719dcc8f1 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
 	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography -> python-pyasn
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
 	help
 	  WebSocket client and server library, WAMP real-time
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index a5aa2a5a7d..7de1e7e673 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  dcae3cf26203aa4bbd9912137e5c9512  autobahn-20.4.3.tar.gz
-sha256  c6fe745d52ba9f9eecf791cd31f558df42aebfc4f9ee558a8f1d18c707e1ae1f  autobahn-20.4.3.tar.gz
+md5  dcba839ee61be33d05042a09c008c6bc  autobahn-21.3.1.tar.gz
+sha256  e126c1f583e872fb59e79d36977cfa1f2d0a8a79f90ae31f406faae7664b8e03  autobahn-21.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 81e2b7a4ca..4ec47f54ce 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 20.4.3
+PYTHON_AUTOBAHN_VERSION = 21.3.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/cb/16/38d27874ef827974f44acb6dd64a92a9248b624734c0e84b91083c2d9350
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/4c/9e/f5bdfb55d1eab67c4b6d24d1397f95feec792071ff1b2f5a893d6d5247f3
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
 PYTHON_AUTOBAHN_CPE_ID_PRODUCT = autobahn
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
+PYTHON_AUTOBAHN_DEPENDENCIES = host-python-cffi
+PYTHON_AUTOBAHN_ENV = AUTOBAHN_STRIP_XBR=1
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
