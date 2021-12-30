Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBB1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 21:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A7560BDE;
	Thu, 30 Dec 2021 21:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhnPUP6znw5x; Thu, 30 Dec 2021 21:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 290DE60A94;
	Thu, 30 Dec 2021 21:46:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3FB01BF3C4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0D9D80C00
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrrWMUOu7JMt for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 21:46:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6B0380BED
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 21:46:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1017182D9E; Thu, 30 Dec 2021 21:40:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 22:35:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da4cb17aa165a5c4b41efc09a6e7c606186d038f
X-Git-Newrev: 4d2ca2be49fecb68a988662a27d31278408614d2
X-Patchwork-Hint: ignore
Message-Id: <20211230214038.1017182D9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
 59.8.0 and split python2 version
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
Content-Type: multipart/mixed; boundary="===============0310189961315662753=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0310189961315662753==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4d2ca2be49fecb68a988662a27d31278408614d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python setuptools 44.0 is not compatible with python 3.10. Unfortunately,
python-setuptools 59.8.0 is not compatible with python2. As Buildroot is not
ready to end python2 support, the python-setuptools package must accommodate
both the old version for python2 and the new version for python3.10.

Changes include:
 - Add two new directories: package/python-setuptools/44.0.0 and
   package/python-setuptools/59.8.0
 - Add the appropriate patch and hash files to each directory.
 - Modify python-setuptools.mk to support both setuptools 44.0 and 59.8.0
   (setuptools 59.8.0 does not have a .zip on pypi anymore, only a tar.gz)
 - Point the symlinks in package/python3-setuptools to the files in
   package/python-setuptools/59.8.0/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../{ => 44.0.0}/0001-add-executable.patch         |  0
 .../{ => 44.0.0}/python-setuptools.hash            |  0
 .../{ => 59.8.0}/0001-add-executable.patch         | 20 +++++++++----------
 .../59.8.0/python-setuptools.hash                  |  4 ++++
 package/python-setuptools/python-setuptools.mk     | 23 +++++++++++++++++++---
 .../python3-setuptools/0001-add-executable.patch   |  2 +-
 package/python3-setuptools/python3-setuptools.hash |  2 +-
 package/python3-setuptools/python3-setuptools.mk   | 12 +++--------
 8 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/44.0.0/0001-add-executable.patch
similarity index 100%
copy from package/python-setuptools/0001-add-executable.patch
copy to package/python-setuptools/44.0.0/0001-add-executable.patch
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/44.0.0/python-setuptools.hash
similarity index 100%
rename from package/python-setuptools/python-setuptools.hash
rename to package/python-setuptools/44.0.0/python-setuptools.hash
diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/59.8.0/0001-add-executable.patch
similarity index 84%
rename from package/python-setuptools/0001-add-executable.patch
rename to package/python-setuptools/59.8.0/0001-add-executable.patch
index 8a59f5a4d8..b688745ce4 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/59.8.0/0001-add-executable.patch
@@ -21,7 +21,7 @@ Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
  2 files changed, 11 insertions(+)
 
 diff --git a/setuptools/command/install.py b/setuptools/command/install.py
-index d2bca2e..b60ef19 100644
+index 72b9a3e..6781d2b 100644
 --- a/setuptools/command/install.py
 +++ b/setuptools/command/install.py
 @@ -16,6 +16,7 @@ class install(orig.install):
@@ -32,19 +32,19 @@ index d2bca2e..b60ef19 100644
          ('old-and-unmanageable', None, "Try not to use this!"),
          ('single-version-externally-managed', None,
           "used by system package builders to create 'flat' eggs"),
-@@ -31,6 +32,7 @@ class install(orig.install):
+@@ -38,6 +39,7 @@ class install(orig.install):
+         )
  
-     def initialize_options(self):
          orig.install.initialize_options(self)
 +        self.executable = None
          self.old_and_unmanageable = None
          self.single_version_externally_managed = None
  
 diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
-index be66cb2..07afaf8 100755
+index 9cd8eb0..7786150 100644
 --- a/setuptools/command/install_scripts.py
 +++ b/setuptools/command/install_scripts.py
-@@ -11,6 +11,13 @@ class install_scripts(orig.install_scripts):
+@@ -13,6 +13,13 @@ class install_scripts(orig.install_scripts):
      def initialize_options(self):
          orig.install_scripts.initialize_options(self)
          self.no_ep = False
@@ -58,15 +58,15 @@ index be66cb2..07afaf8 100755
  
      def run(self):
          import setuptools.command.easy_install as ei
-@@ -31,6 +38,8 @@ class install_scripts(orig.install_scripts):
+@@ -33,6 +40,8 @@ class install_scripts(orig.install_scripts):
          )
          bs_cmd = self.get_finalized_command('build_scripts')
          exec_param = getattr(bs_cmd, 'executable', None)
 +        if self.executable is not None:
 +            exec_param = self.executable
-         bw_cmd = self.get_finalized_command("bdist_wininst")
-         is_wininst = getattr(bw_cmd, '_is_running', False)
-         writer = ei.ScriptWriter
+         try:
+             bw_cmd = self.get_finalized_command("bdist_wininst")
+             is_wininst = getattr(bw_cmd, '_is_running', False)
 -- 
-2.6.3
+2.30.2
 
diff --git a/package/python-setuptools/59.8.0/python-setuptools.hash b/package/python-setuptools/59.8.0/python-setuptools.hash
new file mode 100644
index 0000000000..285919639d
--- /dev/null
+++ b/package/python-setuptools/59.8.0/python-setuptools.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/setuptools/json
+md5  675f2089d970bf0bbfc3f49c80e4c7c3  setuptools-59.8.0.tar.gz
+sha256  09980778aa734c3037a47997f28d6db5ab18bdf2af0e49f719bfc53967fd2e82  setuptools-59.8.0.tar.gz
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 08a180ce0c..30f0f255ed 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,11 +4,26 @@
 #
 ################################################################################
 
+# For the target variant, we adapt the version depending on whether
+# Python 3.x or 2.x is selected for the target.
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 # Please keep in sync with
 # package/python3-setuptools/python3-setuptools.mk
+PYTHON_SETUPTOOLS_VERSION = 59.8.0
+PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
+else # Python
 PYTHON_SETUPTOOLS_VERSION = 44.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
 PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
+endif
+
+# The host variant is only for Python 2.x, so we need to use 44.0.0.
+HOST_PYTHON_SETUPTOOLS_VERSION = 44.0.0
+HOST_PYTHON_SETUPTOOLS_SOURCE = setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION).zip
+HOST_PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
+HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2
+
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
@@ -16,16 +31,18 @@ PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 define PYTHON_SETUPTOOLS_EXTRACT_CMDS
 	$(UNZIP) -d $(@D) $(PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
 	mv $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)/* $(@D)
 	$(RM) -r $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)
 endef
+endif
 
 define HOST_PYTHON_SETUPTOOLS_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(HOST_PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
-	mv $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)/* $(@D)
-	$(RM) -r $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)
+	$(UNZIP) -d $(@D) $(HOST_PYTHON_SETUPTOOLS_DL_DIR)/$(HOST_PYTHON_SETUPTOOLS_SOURCE)
+	mv $(@D)/setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/setuptools-$(HOST_PYTHON_SETUPTOOLS_VERSION)
 endef
 
 $(eval $(python-package))
diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
index 5bab3d96a1..6fc7595a8d 120000
--- a/package/python3-setuptools/0001-add-executable.patch
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -1 +1 @@
-../python-setuptools/0001-add-executable.patch
\ No newline at end of file
+../python-setuptools/59.8.0/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
index a3af7f0fb1..91d8bc0887 120000
--- a/package/python3-setuptools/python3-setuptools.hash
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -1 +1 @@
-../python-setuptools/python-setuptools.hash
\ No newline at end of file
+../python-setuptools/59.8.0/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index 34d5993120..f4dae2d15d 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 44.0.0
-PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
+PYTHON3_SETUPTOOLS_VERSION = 59.8.0
+PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_CPE_ID_VENDOR = python
@@ -17,10 +17,4 @@ PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
 HOST_PYTHON3_SETUPTOOLS_DL_SUBDIR = python-setuptools
 HOST_PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3
 
-define HOST_PYTHON3_SETUPTOOLS_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(HOST_PYTHON3_SETUPTOOLS_DL_DIR)/$(PYTHON3_SETUPTOOLS_SOURCE)
-	mv $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)/* $(@D)
-	$(RM) -r $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)
-endef
-
 $(eval $(host-python-package))

--===============0310189961315662753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0310189961315662753==--
