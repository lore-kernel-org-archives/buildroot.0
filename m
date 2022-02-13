Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34970C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8302401F8;
	Sun, 13 Feb 2022 11:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CInaWTzqP6W; Sun, 13 Feb 2022 11:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 773E04044D;
	Sun, 13 Feb 2022 11:14:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B91601BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A74F360B8A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LITlrc8mnmQq for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B8D060B5D
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5F6037F8A8; Sun, 13 Feb 2022 11:06:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:11:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 968908b93ad6528dc7458442dabaceefd53ad4eb
X-Git-Newrev: 594b2e9d3c427abac3efcbdf98359d2abe3d6888
X-Patchwork-Hint: ignore
Message-Id: <20220213110615.5F6037F8A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: drop <pkg>_NEEDS_HOST_PYTHON
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

commit: https://git.buildroot.net/buildroot/commit/?id=594b2e9d3c427abac3efcbdf98359d2abe3d6888
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone and the corresponding logic in pkg-python.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/meson/meson.mk                                                  | 1 -
 package/python-charset-normalizer/python-charset-normalizer.mk          | 1 -
 package/python-decorator/python-decorator.mk                            | 1 -
 package/python-idna/python-idna.mk                                      | 1 -
 package/python-inflection/python-inflection.mk                          | 1 -
 package/python-installer/python-installer.mk                            | 1 -
 package/python-jinja2/python-jinja2.mk                                  | 2 --
 package/python-mako/python-mako.mk                                      | 2 --
 package/python-markupsafe/python-markupsafe.mk                          | 2 --
 package/python-networkx/python-networkx.mk                              | 1 -
 package/python-packaging/python-packaging.mk                            | 1 -
 package/python-pep517/python-pep517.mk                                  | 1 -
 package/python-pypa-build/python-pypa-build.mk                          | 1 -
 package/python-pyparsing/python-pyparsing.mk                            | 1 -
 package/python-pyyaml/python-pyyaml.mk                                  | 1 -
 package/python-requests/python-requests.mk                              | 1 -
 package/python-setuptools-rust/python-setuptools-rust.mk                | 1 -
 .../python-setuptools-scm-git-archive.mk                                | 1 -
 package/python-setuptools-scm/python-setuptools-scm.mk                  | 1 -
 package/python-tomli/python-tomli.mk                                    | 1 -
 package/python-typing-extensions/python-typing-extensions.mk            | 1 -
 package/python-urllib3/python-urllib3.mk                                | 1 -
 package/scons/scons.mk                                                  | 2 --
 package/setools/setools.mk                                              | 1 -
 24 files changed, 28 deletions(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index ad15e3f91e..125488dd46 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -11,7 +11,6 @@ MESON_LICENSE_FILES = COPYING
 MESON_SETUP_TYPE = setuptools
 
 HOST_MESON_DEPENDENCIES = host-ninja
-HOST_MESON_NEEDS_HOST_PYTHON = python3
 
 # Avoid interpreter shebang longer than 128 chars
 define HOST_MESON_SET_INTERPRETER
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 0a96a6b078..c37b068b36 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -10,7 +10,6 @@ PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/e8/e8/b
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-HOST_PYTHON_CHARSET_NORMALIZER_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index a7e338bdc0..a61f045e2a 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -12,7 +12,6 @@ PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
 PYTHON_DECORATOR_CPE_ID_PRODUCT = decorator
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
-HOST_PYTHON_DECORATOR_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 2a1ec8314b..6f416156d0 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -10,7 +10,6 @@ PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/62/08/e3fc7c8161090f7
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = setuptools
-HOST_PYTHON_IDNA_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-inflection/python-inflection.mk b/package/python-inflection/python-inflection.mk
index 59f35aa135..7c030e99b9 100644
--- a/package/python-inflection/python-inflection.mk
+++ b/package/python-inflection/python-inflection.mk
@@ -10,7 +10,6 @@ PYTHON_INFLECTION_SITE = https://files.pythonhosted.org/packages/e1/7e/691d061b7
 PYTHON_INFLECTION_SETUP_TYPE = setuptools
 PYTHON_INFLECTION_LICENSE = MIT
 PYTHON_INFLECTION_LICENSE_FILES = LICENSE
-HOST_PYTHON_INFLECTION_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 2c1d371dab..82739a8003 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -10,6 +10,5 @@ PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/71/9a/8d7c724b0d
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = distutils
-HOST_PYTHON_INSTALLER_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 752daf653c..0503984bef 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -17,7 +17,5 @@ PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
 PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 
-HOST_PYTHON_JINJA2_NEEDS_HOST_PYTHON = python3
-
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 26fe95c606..553c4a5339 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -11,8 +11,6 @@ PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
 
-HOST_PYTHON_MAKO_NEEDS_HOST_PYTHON = python3
-
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_MAKO_DEPENDENCIES = host-python-markupsafe
 
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 14a8d06dfe..e0e689f5a1 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -11,7 +11,5 @@ PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
 
-HOST_PYTHON_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
-
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 3b05011eb9..1908ed8f93 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -13,7 +13,6 @@ PYTHON_NETWORKX_CPE_ID_VENDOR = python
 PYTHON_NETWORKX_CPE_ID_PRODUCT = networkx
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
 HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python-decorator
-HOST_PYTHON_NETWORKX_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 569dc0bf58..74b5803525 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -10,7 +10,6 @@ PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/9e/d1a7217f69
 PYTHON_PACKAGING_SETUP_TYPE = setuptools
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-HOST_PYTHON_PACKAGING_NEEDS_HOST_PYTHON = python3
 HOST_PYTHON_PACKAGING_DEPENDENCIES = host-python-pyparsing
 
 $(eval $(python-package))
diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
index da0431a637..99aa62d51d 100644
--- a/package/python-pep517/python-pep517.mk
+++ b/package/python-pep517/python-pep517.mk
@@ -10,7 +10,6 @@ PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c6791
 PYTHON_PEP517_LICENSE = MIT
 PYTHON_PEP517_LICENSE_FILES = LICENSE
 PYTHON_PEP517_SETUP_TYPE = distutils
-HOST_PYTHON_PEP517_NEEDS_HOST_PYTHON = python3
 HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
 
 $(eval $(host-python-package))
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index 6babade672..dc8363f59e 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -10,7 +10,6 @@ PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/f0/62/c73b77521
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
-HOST_PYTHON_PYPA_BUILD_NEEDS_HOST_PYTHON = python3
 HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
 	host-python-packaging \
 	host-python-pep517 \
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index e33541bdb7..2fb705bc7a 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -10,7 +10,6 @@ PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/d6/60/9bed18f432
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = setuptools
-HOST_PYTHON_PYPARSING_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 8f5a2d269e..067af8ea7d 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -15,7 +15,6 @@ PYTHON_PYYAML_CPE_ID_PRODUCT = pyyaml
 PYTHON_PYYAML_DEPENDENCIES = host-python-cython libyaml
 PYTHON_PYYAML_ENV = PYYAML_FORCE_CYTHON=1
 HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
-HOST_PYTHON_PYYAML_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 962646516e..9613a2c47c 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -12,7 +12,6 @@ PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
 PYTHON_REQUESTS_CPE_ID_VENDOR = python
 PYTHON_REQUESTS_CPE_ID_PRODUCT = requests
-HOST_PYTHON_REQUESTS_NEEDS_HOST_PYTHON = python3
 HOST_PYTHON_REQUESTS_DEPENDENCIES = \
 	host-python-certifi \
 	host-python-charset-normalizer \
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index c87a0da3c7..394789b056 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -11,6 +11,5 @@ PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
 HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-setuptools-scm host-python-toml host-python-semantic-version host-python-typing-extensions
-HOST_PYTHON_SETUPTOOLS_RUST_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
index 48ca9c89ae..032e2d3fc9 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
@@ -11,6 +11,5 @@ PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
 HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_DEPENDENCIES = host-python-setuptools-scm
-HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 8c5229e1a6..132eb398aa 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -11,6 +11,5 @@ PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
 HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli
-HOST_PYTHON_SETUPTOOLS_SCM_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index 4e6b023ef7..b8c20ca736 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -10,7 +10,6 @@ PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61ae
 PYTHON_TOMLI_SETUP_TYPE = distutils
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
-HOST_PYTHON_TOMLI_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 407fe99b54..668071e025 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -10,7 +10,6 @@ PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/ed/12/c5
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = setuptools
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
-HOST_PYTHON_TYPING_EXTENSIONS_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index c9c8a912d1..d94c97b4ed 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -12,7 +12,6 @@ PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
 PYTHON_URLLIB3_CPE_ID_PRODUCT = urllib3
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
-HOST_PYTHON_URLLIB3_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index bc5d2a1ef9..6b75d3ddca 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -10,8 +10,6 @@ SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
 SCONS_SETUP_TYPE = distutils
 
-HOST_SCONS_NEEDS_HOST_PYTHON = python3
-
 HOST_SCONS_INSTALL_OPTS = \
 	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
 
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 5b4b4e30d8..ea355f10c8 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -13,7 +13,6 @@ SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 SETOOLS_CPE_ID_VENDOR = selinuxproject
 SETOOLS_SETUP_TYPE = setuptools
 HOST_SETOOLS_DEPENDENCIES = host-python-cython host-libselinux host-libsepol host-python-networkx
-HOST_SETOOLS_NEEDS_HOST_PYTHON = python3
 
 define SETOOLS_FIX_SETUP
 	# By default, setup.py will look for libsepol.a in the host machines
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
