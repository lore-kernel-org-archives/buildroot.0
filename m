From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Apr 2021 10:49:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-typepy: bump to version 1.1.5
Message-ID: <20210425084913.2382865-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- python-dateutil and python-pytz are optional since version 0.0.20 and
  https://github.com/thombashi/typepy/commit/a54dc97598d9d69e5f6092cf918d7889b9a31f61
- python 2 and python-six dependency have been dropped in version 1.0.0 and
  https://github.com/thombashi/typepy/commit/764812d01d831d149b19a871a695ae3a9e39485b
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-typepy/Config.in          | 5 +----
 package/python-typepy/python-typepy.hash | 8 ++++----
 package/python-typepy/python-typepy.mk   | 4 ++--
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/python-typepy/Config.in b/package/python-typepy/Config.in
index 0d58efb341..fd3b983186 100644
--- a/package/python-typepy/Config.in
+++ b/package/python-typepy/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_PYTHON_TYPEPY
 	bool "python-typepy"
-	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
-	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  A Python library for variable type
 	  checker/validator/converter at a run time.
diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index 03f7aef2e5..e4d84e9bfc 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/typepy/json
-md5	b9abd4d661dabe512e95ca69ddb65d55  typepy-0.0.20.tar.gz
-# Locally computed
-sha256	a1a5b9438670d4a5d9f882b7499ea85d06dc384577bb7636cb29d903288bca8c  typepy-0.0.20.tar.gz
+# md5, sha256 from https://pypi.org/pypi/typepy/json
+md5  cc9ceef1f04a8ff4b979dc23b96f2e80  typepy-1.1.5.tar.gz
+sha256  1bbe790bb8d1b43b4541b235678974d5aee2357e1948cdf17cb4c14cbe4a2a82  typepy-1.1.5.tar.gz
+# Locally computed sha256 checksums
 sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index 33d8091998..6d8433e136 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 0.0.20
+PYTHON_TYPEPY_VERSION = 1.1.5
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://pypi.python.org/packages/88/98/c79a19ae571d713fa0b10bc7e0fe611e53c542720b5a9dd2691ca15b3dd8
+PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/08/c8/ebfa4381563f1946a7cd2b03fab14df641c3a9acf8e6ca5f5787dd1f735a
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
-- 
2.30.2
