Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719DAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 138D2813B5;
	Tue, 25 Jan 2022 18:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lE0kmhpV_IIV; Tue, 25 Jan 2022 18:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 069D6813A9;
	Tue, 25 Jan 2022 18:38:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BED781BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EF4C60706
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUx9D76yOy0L for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6D2360A7E
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 06126827E1; Tue, 25 Jan 2022 18:27:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:21:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea135ccb7a2e00e3e0572430a2ecf5cd6a879370
X-Git-Newrev: 67db399099a7c9832766680a3fdecb4050a3d6b6
X-Patchwork-Hint: ignore
Message-Id: <20220125182727.06126827E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 21.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=67db399099a7c9832766680a3fdecb4050a3d6b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches that are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: don't duplicate _SETUP_TYPE]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...te-xbr-packages-and-xbr-templates-package.patch | 54 -------------------
 ...nvx-by-default-and-don-t-publish-universa.patch | 60 ----------------------
 package/python-autobahn/python-autobahn.hash       |  4 +-
 package/python-autobahn/python-autobahn.mk         |  4 +-
 4 files changed, 4 insertions(+), 118 deletions(-)

diff --git a/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch b/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
deleted file mode 100644
index f239345dc7..0000000000
--- a/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From b13b7e38b38e2c79c0a13be32e05f0451483cd01 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 12 Jun 2021 15:32:37 -0600
-Subject: [PATCH] Fix duplicate xbr packages and xbr templates package_data.
- (#1492)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-a370f9e7154e59b313cb675bfcaf8cad6011bd52]
----
- MANIFEST.in |  1 -
- setup.py    | 10 ++++++++--
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/MANIFEST.in b/MANIFEST.in
-index f4cb6da1..1dd32f0e 100644
---- a/MANIFEST.in
-+++ b/MANIFEST.in
-@@ -1,4 +1,3 @@
- include LICENSE
- include autobahn/nvx/_utf8validator.c
- recursive-include autobahn/wamp/gen/schema *
--recursive-include autobahn/xbr/templates *
-diff --git a/setup.py b/setup.py
-index cf4e29ba..f27006da 100644
---- a/setup.py
-+++ b/setup.py
-@@ -166,6 +166,12 @@ packages = [
-     'twisted.plugins',
- ]
- 
-+xbr_packages = [
-+    'autobahn.xbr',
-+    'autobahn.asyncio.xbr',
-+    'autobahn.twisted.xbr',
-+]
-+
- package_data = {'autobahn.asyncio': ['./test/*']}
- 
- entry_points = {
-@@ -179,8 +185,8 @@ if 'AUTOBAHN_STRIP_XBR' in os.environ:
-     shutil.rmtree('autobahn.egg-info', ignore_errors=True)
- else:
-     extras_require_all += extras_require_xbr
--    packages += ['autobahn.xbr', 'autobahn.asyncio.xbr', 'autobahn.twisted.xbr']
--    package_data['xbr'] = ['./xbr/contracts/*.json']
-+    packages += xbr_packages
-+    package_data['xbr'] = ['./xbr/templates/*.py.jinja2']
-     entry_points['console_scripts'] += ["xbrnetwork = autobahn.xbr._cli:_main"]
- 
- # development dependencies
--- 
-2.25.1
-
diff --git a/package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch b/package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch
deleted file mode 100644
index c2c2cf5777..0000000000
--- a/package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 1e3162bab59cbc2f7cf8b9ef6cadf55ee273c1d8 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Thu, 22 Jul 2021 06:56:51 -0600
-Subject: [PATCH] Build with nvx by default and don't publish universal wheel.
- (#1493)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-a35f22eeaafca7568f1deb35c4a1b82ae78f77d4]
----
- Makefile                       | 8 ++++----
- autobahn/nvx/_utf8validator.py | 7 ++++++-
- setup.py                       | 7 +------
- 3 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/autobahn/nvx/_utf8validator.py b/autobahn/nvx/_utf8validator.py
-index e72fc872..34393356 100644
---- a/autobahn/nvx/_utf8validator.py
-+++ b/autobahn/nvx/_utf8validator.py
-@@ -44,13 +44,18 @@ ffi.cdef("""
-     int nvx_utf8vld_get_impl(void* utf8vld);
- """)
- 
-+optional = True
-+if 'AUTOBAHN_USE_NVX' in os.environ and os.environ['AUTOBAHN_USE_NVX'] in ['1', 'true']:
-+    optional = False
-+
- with open(os.path.join(os.path.dirname(__file__), '_utf8validator.c')) as fd:
-     c_source = fd.read()
-     ffi.set_source(
-         "_nvx_utf8validator",
-         c_source,
-         libraries=[],
--        extra_compile_args=['-std=c99', '-Wall', '-Wno-strict-prototypes', '-O3', '-march=native']
-+        extra_compile_args=['-std=c99', '-Wall', '-Wno-strict-prototypes', '-O3', '-march=native'],
-+        optional=optional
-     )
- 
- 
-diff --git a/setup.py b/setup.py
-index f27006da..4889a39e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -110,12 +110,7 @@ extras_require_nvx = [
- 
- # cffi based extension modules to build, currently only NVX
- cffi_modules = []
--if 'AUTOBAHN_USE_NVX' in os.environ:
--    # FIXME: building this extension will make the wheel
--    # produced no longer universal (as in "autobahn-18.4.1-py2.py3-none-any.whl").
--    # on the other hand, I don't know how to selectively include this
--    # based on the install flavor the user has chosen (eg pip install autobahn[nvx]
--    # should make the following be included)
-+if 'AUTOBAHN_USE_NVX' not in os.environ or os.environ['AUTOBAHN_USE_NVX'] not in ['0', 'false']:
-     cffi_modules.append('autobahn/nvx/_utf8validator.py:ffi')
- 
- extras_require_xbr = [
--- 
-2.25.1
-
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 7de1e7e673..0bbb9112d0 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  dcba839ee61be33d05042a09c008c6bc  autobahn-21.3.1.tar.gz
-sha256  e126c1f583e872fb59e79d36977cfa1f2d0a8a79f90ae31f406faae7664b8e03  autobahn-21.3.1.tar.gz
+md5  1ccd46d938d8b9fed435e9781e54e887  autobahn-21.11.1.tar.gz
+sha256  bd6f46315419ca0a5be4109f737410208ad5f19718f67ca6a4a674cc66ca9b18  autobahn-21.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 4ec47f54ce..db9e5083d1 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 21.3.1
+PYTHON_AUTOBAHN_VERSION = 21.11.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/4c/9e/f5bdfb55d1eab67c4b6d24d1397f95feec792071ff1b2f5a893d6d5247f3
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/f1/d3/23fdf1ab0104b1b65d2f7884e923f0526750a59f96334d752afc79cf44ed
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
