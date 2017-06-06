From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 17:21:50 +0200
Subject: [Buildroot] [git commit] package/python-pyicu: bump version to 1.9.7
Message-ID: <20170606152303.4D2A882849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b83d984131a376fa74db904effbbc3519b8f958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build with ICU 59.1, updated broken URL in Config.in.

Fixes
http://autobuild.buildroot.net/results/d32/d32b7c98323e2a25a378143795583716bd5b74a9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyicu/Config.in         | 2 +-
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index 48ade99..efab085 100644
--- a/package/python-pyicu/Config.in
+++ b/package/python-pyicu/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_PYTHON_PYICU
 	help
 	  Python extension wrapping the ICU C++ API.
 
-	  http://pyicu.osafoundation.org/
+	  https://github.com/ovalhub/pyicu
 
 comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index 69edba8..b0d75fd 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/PyICU/json, sha256 locally computed
-md5	30f85b7272f15b26c110c9f3e3a9e7a0  PyICU-1.9.5.tar.gz
-sha256	73b052b800861fae3281dbaf9c92d12a81cabf3d31912d94c51862e093ef359b  PyICU-1.9.5.tar.gz
+md5 7656f5cc53a7c18b40e653d6eefdee14   PyICU-1.9.7.tar.gz
+sha256 db27cd1cc150b879c5465872bec7fdaf340eca140aa922be03891d5b9f855b61  PyICU-1.9.7.tar.gz
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 5c01421..c6587c3 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 1.9.5
+PYTHON_PYICU_VERSION = 1.9.7
 PYTHON_PYICU_SOURCE = PyICU-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://pypi.python.org/packages/a2/9f/1947f288143191b903e58633ee597cb98bc284de28dafb1231b6f8b67b99
+PYTHON_PYICU_SITE = https://pypi.python.org/packages/6e/88/f42a1297909ca6d9113ba37b37067011ae29432fe592fdd98cf52ad23b77
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
