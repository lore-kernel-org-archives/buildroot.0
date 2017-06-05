From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 21:45:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyicu: bump version to 1.9.7
Message-ID: <20170605194556.15335-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build with ICU 59.1, updated broken URL in Config.in.

Fixes
http://autobuild.buildroot.net/results/d32/d32b7c98323e2a25a378143795583716bd5b74a9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pyicu/Config.in         | 2 +-
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index 48ade99dc..efab0853e 100644
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
index 69edba83b..b0d75fd0b 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/PyICU/json, sha256 locally computed
-md5	30f85b7272f15b26c110c9f3e3a9e7a0  PyICU-1.9.5.tar.gz
-sha256	73b052b800861fae3281dbaf9c92d12a81cabf3d31912d94c51862e093ef359b  PyICU-1.9.5.tar.gz
+md5 7656f5cc53a7c18b40e653d6eefdee14   PyICU-1.9.7.tar.gz
+sha256 db27cd1cc150b879c5465872bec7fdaf340eca140aa922be03891d5b9f855b61  PyICU-1.9.7.tar.gz
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 5c0142137..c6587c399 100644
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
-- 
2.11.0
