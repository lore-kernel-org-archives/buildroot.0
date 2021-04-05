From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:22:55 +0200
Subject: [Buildroot] [git commit] package/python-jedi: bump to version 0.18.0
Message-ID: <20210405160039.B2ED38D3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f268154a00666685a1d91273100bddc640e4a6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python 2 support has been dropped since version 0.18.0 and
https://github.com/davidhalter/jedi/commit/d67dfba7f5a65d5ee064d37e1fb894a25b39bdab

Add django-stubs license file (MIT)

https://github.com/davidhalter/jedi/blob/v0.18.0/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jedi/Config.in        | 2 +-
 package/python-jedi/python-jedi.hash | 5 +++--
 package/python-jedi/python-jedi.mk   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-jedi/Config.in b/package/python-jedi/Config.in
index 7445589029..e14fa54ffb 100644
--- a/package/python-jedi/Config.in
+++ b/package/python-jedi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_JEDI
 	bool "python-jedi"
-	depends on BR2_PACKAGE_PYTHON3 # python-parso
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PARSO # runtime
 	help
 	  An autocompletion tool for Python that can be used for text
diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index ac5f82e1de..018429bdfe 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  d6a8e5832939c51dceda474b720696f6  jedi-0.17.0.tar.gz
-sha256  df40c97641cb943661d2db4c33c2e1ff75d491189423249e989bcea4464f3030  jedi-0.17.0.tar.gz
+md5  72707c00e8d6d0b190a5e5664be1cac5  jedi-0.18.0.tar.gz
+sha256  92550a404bad8afed881a137ec9a461fed49eca661414be45059329614ed0707  jedi-0.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
+sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
 sha256  b41b78f562a2e65b75cab44354335f6f435d4ef73065509600ac910cf4e22fe0  jedi/third_party/typeshed/LICENSE
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 245ba99a3c..bfe56b7c36 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.17.0
+PYTHON_JEDI_VERSION = 0.18.0
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/e3/5b/65ff9c102d92bf719dfaeff57bc8074d68f26ea480005704a956da995799
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/ac/11/5c542bf206efbae974294a61febc61e09d74cb5d90d8488793909db92537
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
-PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/typeshed/LICENSE
+PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
 
 $(eval $(python-package))
