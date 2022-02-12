Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DC4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 10:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 539BE830C0;
	Sat, 12 Feb 2022 10:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KV90jWPaG4YL; Sat, 12 Feb 2022 10:25:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E880B83123;
	Sat, 12 Feb 2022 10:25:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2E61BF853
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 10:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0923A4155F
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 10:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 865wzUFzqmJ3 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 10:25:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C11114091E
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 10:25:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 115D882435; Sat, 12 Feb 2022 10:17:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 11:15:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0baf647329010270ccdd91dfe65a819886a4a21f
X-Git-Newrev: 697acda00d9f6fc601e6724da36f0e0b96aeee09
X-Patchwork-Hint: ignore
Message-Id: <20220212101743.115D882435@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: drop python2
 host/setuptools support
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
Content-Type: multipart/mixed; boundary="===============8163061413497125667=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8163061413497125667==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=697acda00d9f6fc601e6724da36f0e0b96aeee09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop conditonal python version handling now that python2 has been
removed.

Remove python3-setuptools and replace usage with python3 only
python-setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libapparmor/libapparmor.mk                 |  2 +-
 package/libiio/libiio.mk                           |  2 +-
 package/lirc-tools/lirc-tools.mk                   |  2 +-
 package/pkg-python.mk                              | 66 +-------------------
 .../{60.7.0 => }/0001-add-executable.patch         |  0
 .../44.0.0/0001-add-executable.patch               | 72 ----------------------
 .../44.0.0/python-setuptools.hash                  |  4 --
 .../{60.7.0 => }/python-setuptools.hash            |  0
 package/python-setuptools/python-setuptools.mk     | 17 +----
 .../python3-setuptools/0001-add-executable.patch   |  1 -
 package/python3-setuptools/python3-setuptools.hash |  1 -
 package/python3-setuptools/python3-setuptools.mk   | 20 ------
 12 files changed, 6 insertions(+), 181 deletions(-)

diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index f3d744e3e7..7bb849ab94 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -28,7 +28,7 @@ LIBAPPARMOR_CONF_OPTS = \
 	--disable-man-pages
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBAPPARMOR_DEPENDENCIES += host-python3 host-python3-setuptools host-swig python3
+LIBAPPARMOR_DEPENDENCIES += host-python3 host-python-setuptools host-swig python3
 LIBAPPARMOR_CONF_OPTS += \
 	--with-python \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index e15d276b44..cfae34b2b7 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -73,7 +73,7 @@ LIBIIO_CONF_OPTS += -DHAVE_DNS_SD=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
-LIBIIO_DEPENDENCIES += host-python3-setuptools python3
+LIBIIO_DEPENDENCIES += host-python-setuptools python3
 LIBIIO_CONF_OPTS += \
 	-DPYTHON_BINDINGS=ON \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 27aa5b97cc..05f20f5726 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -47,7 +47,7 @@ LIRC_TOOLS_DEPENDENCIES += libftdi1
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIRC_TOOLS_DEPENDENCIES += python3 host-python3-setuptools
+LIRC_TOOLS_DEPENDENCIES += python3 host-python-setuptools
 LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV='$(PKG_PYTHON_SETUPTOOLS_ENV)'
 endif
 
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 00bdb9150a..bf0649fc9c 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -150,86 +150,24 @@ endif
 # Target packages need both the python interpreter on the target (for
 # runtime) and the python interpreter on the host (for
 # compilation). However, host packages only need the python
-# interpreter on the host, whose version may be enforced by setting
-# the *_NEEDS_HOST_PYTHON variable.
-#
-# So:
-# - for target packages, we always depend on the default python interpreter
-#   (the one selected by the config);
-# - for host packages:
-#   - if *_NEEDS_HOST_PYTHON is not set, then we use the default
-#     interpreter;
-#   - otherwise, we depend on the one requested by *_NEEDS_HOST_PYTHON.
+# interpreter on the host.
 #
 ifeq ($(4),target)
-$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
-else
-ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
-$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+$(2)_DEPENDENCIES += host-python3 python3
 else
-ifeq ($$($(2)_NEEDS_HOST_PYTHON),python2)
-$(2)_DEPENDENCIES += host-python
-else ifeq ($$($(2)_NEEDS_HOST_PYTHON),python3)
 $(2)_DEPENDENCIES += host-python3
-else
-$$(error Incorrect value '$$($(2)_NEEDS_HOST_PYTHON)' for $(2)_NEEDS_HOST_PYTHON)
-endif
-endif # ($$($(2)_NEEDS_HOST_PYTHON),)
 endif # ($(4),target)
 
 # Setuptools based packages will need setuptools for the host Python
 # interpreter (both host and target).
 #
-# If we have a host package that says "I need Python 3", we install
-# setuptools for python3.
-#
-# If we have a host packge that says "I need Python 2", we install
-# setuptools for python2.
-#
-# If we have a target package, or a host package that doesn't have any
-# <pkg>_NEEDS_HOST_PYTHON, and BR2_PACKAGE_PYTHON3 is used, then
-# Python 3.x is the default Python interpreter, so we install
-# setuptools for python3.
-#
-# In all other cases, we install setuptools for python2. Those other
-# cases are: a target package or host package with
-# BR2_PACKAGE_PYTHON=y, or a host-package with neither
-# BR2_PACKAGE_PYTHON3=y or BR2_PACKAGE_PYTHON=y.
 ifeq ($$($(2)_SETUP_TYPE),setuptools)
-ifeq ($(4):$$($(2)_NEEDS_HOST_PYTHON),host:python3)
-$(2)_DEPENDENCIES += $$(if $$(filter host-python3-setuptools,$(1)),,host-python3-setuptools)
-else ifeq ($(4):$$($(2)_NEEDS_HOST_PYTHON),host:python2)
-$(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
-else ifeq ($$(BR2_PACKAGE_PYTHON3),y)
-$(2)_DEPENDENCIES += $$(if $$(filter host-python3-setuptools,$(1)),,host-python3-setuptools)
-else
 $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
-endif
 endif # SETUP_TYPE
 
 # Python interpreter to use for building the package.
 #
-# We may want to specify the python interpreter to be used for building a
-# package, especially for host-packages (target packages must be built using
-# the same version of the interpreter as the one installed on the target).
-#
-# So:
-# - for target packages, we always use the default python interpreter (which
-#   is the same version as the one built and installed on the target);
-# - for host packages:
-#   - if *_NEEDS_HOST_PYTHON is not set, then we use the default
-#     interpreter;
-#   - otherwise, we use the one requested by *_NEEDS_HOST_PYTHON.
-#
-ifeq ($(4),target)
 $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
-else
-ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
-else
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
-endif
-endif
 
 #
 # Build step. Only define it if not already defined by the package .mk
diff --git a/package/python-setuptools/60.7.0/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
similarity index 100%
rename from package/python-setuptools/60.7.0/0001-add-executable.patch
rename to package/python-setuptools/0001-add-executable.patch
diff --git a/package/python-setuptools/44.0.0/0001-add-executable.patch b/package/python-setuptools/44.0.0/0001-add-executable.patch
deleted file mode 100644
index 8a59f5a4d8..0000000000
--- a/package/python-setuptools/44.0.0/0001-add-executable.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 9b3d307f8f6a1af88f3f810f5a6cf0835830e1e8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 7 Dec 2015 01:14:33 +0100
-Subject: [PATCH] add executable
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Add a new --executable option to distribute so that we can
-force the shebang line in installed python scripts.
-
-[Thomas: refresh for setuptools 5.8.]
-[Jörg: refresh for setuptools 18.7.1]
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
----
- setuptools/command/install.py         | 2 ++
- setuptools/command/install_scripts.py | 9 +++++++++
- 2 files changed, 11 insertions(+)
-
-diff --git a/setuptools/command/install.py b/setuptools/command/install.py
-index d2bca2e..b60ef19 100644
---- a/setuptools/command/install.py
-+++ b/setuptools/command/install.py
-@@ -16,6 +16,7 @@ class install(orig.install):
-     """Use easy_install to install the package, w/dependencies"""
- 
-     user_options = orig.install.user_options + [
-+        ('executable=', 'e', "specify final destination interpreter path"),
-         ('old-and-unmanageable', None, "Try not to use this!"),
-         ('single-version-externally-managed', None,
-          "used by system package builders to create 'flat' eggs"),
-@@ -31,6 +32,7 @@ class install(orig.install):
- 
-     def initialize_options(self):
-         orig.install.initialize_options(self)
-+        self.executable = None
-         self.old_and_unmanageable = None
-         self.single_version_externally_managed = None
- 
-diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
-index be66cb2..07afaf8 100755
---- a/setuptools/command/install_scripts.py
-+++ b/setuptools/command/install_scripts.py
-@@ -11,6 +11,13 @@ class install_scripts(orig.install_scripts):
-     def initialize_options(self):
-         orig.install_scripts.initialize_options(self)
-         self.no_ep = False
-+        self.executable = None
-+
-+    def finalize_options(self):
-+        orig.install_scripts.finalize_options(self)
-+        self.set_undefined_options('install',
-+                ('executable','executable')
-+        )
- 
-     def run(self):
-         import setuptools.command.easy_install as ei
-@@ -31,6 +38,8 @@ class install_scripts(orig.install_scripts):
-         )
-         bs_cmd = self.get_finalized_command('build_scripts')
-         exec_param = getattr(bs_cmd, 'executable', None)
-+        if self.executable is not None:
-+            exec_param = self.executable
-         bw_cmd = self.get_finalized_command("bdist_wininst")
-         is_wininst = getattr(bw_cmd, '_is_running', False)
-         writer = ei.ScriptWriter
--- 
-2.6.3
-
diff --git a/package/python-setuptools/44.0.0/python-setuptools.hash b/package/python-setuptools/44.0.0/python-setuptools.hash
deleted file mode 100644
index 769b68c35d..0000000000
--- a/package/python-setuptools/44.0.0/python-setuptools.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://pypi.org/pypi/setuptools/json
-md5  32b6cdce670ce462086d246bea181e9d  setuptools-44.0.0.zip
-sha256  e5baf7723e5bb8382fc146e33032b241efc63314211a3a120aaa55d62d2bb008  setuptools-44.0.0.zip
-sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/60.7.0/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
similarity index 100%
rename from package/python-setuptools/60.7.0/python-setuptools.hash
rename to package/python-setuptools/python-setuptools.hash
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 04b872fb79..584f83f7a0 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,29 +4,14 @@
 #
 ################################################################################
 
-# Please keep in sync with
-# package/python3-setuptools/python3-setuptools.mk
 PYTHON_SETUPTOOLS_VERSION = 60.7.0
-PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
 PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/29/dd/48d662bb93e5e51e72265ef612f869947d4ae4126328d7156824cd50d440
-
-# The host variant is only for Python 2.x, so we need to use 44.0.0.
-HOST_PYTHON_SETUPTOOLS_VERSION = 44.0.0
-HOST_PYTHON_SETUPTOOLS_SOURCE = setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION).zip
-HOST_PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
-HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2
-
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
 PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 
-define HOST_PYTHON_SETUPTOOLS_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(HOST_PYTHON_SETUPTOOLS_DL_DIR)/$(HOST_PYTHON_SETUPTOOLS_SOURCE)
-	mv $(@D)/setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION)/* $(@D)
-	$(RM) -r $(@D)/setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION)
-endef
-
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
deleted file mode 120000
index 46b5935d33..0000000000
--- a/package/python3-setuptools/0001-add-executable.patch
+++ /dev/null
@@ -1 +0,0 @@
-../python-setuptools/60.7.0/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
deleted file mode 120000
index 2c9d3614d5..0000000000
--- a/package/python3-setuptools/python3-setuptools.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-setuptools/60.7.0/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
deleted file mode 100644
index d5aaa01918..0000000000
--- a/package/python3-setuptools/python3-setuptools.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# python3-setuptools
-#
-################################################################################
-
-# Please keep in sync with
-# package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 60.7.0
-PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/29/dd/48d662bb93e5e51e72265ef612f869947d4ae4126328d7156824cd50d440
-PYTHON3_SETUPTOOLS_LICENSE = MIT
-PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
-PYTHON3_SETUPTOOLS_CPE_ID_VENDOR = python
-PYTHON3_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
-PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
-HOST_PYTHON3_SETUPTOOLS_DL_SUBDIR = python-setuptools
-HOST_PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))

--===============8163061413497125667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8163061413497125667==--
