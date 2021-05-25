From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed, 26 May 2021 00:17:40 +0200
Subject: [Buildroot] [PATCH] package/python-aioblescan: Bump to version 0.2.8
Message-ID: <20210525221741.3884-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0001-Move-README-to-reStructured-text.patch
since it has been merged upstream.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 ...001-Move-README-to-reStructured-text.patch | 35 -------------------
 .../python-aioblescan/python-aioblescan.hash  |  4 +--
 .../python-aioblescan/python-aioblescan.mk    |  4 +--
 3 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 package/python-aioblescan/0001-Move-README-to-reStructured-text.patch

diff --git a/package/python-aioblescan/0001-Move-README-to-reStructured-text.patch b/package/python-aioblescan/0001-Move-README-to-reStructured-text.patch
deleted file mode 100644
index 3db03bd835..0000000000
--- a/package/python-aioblescan/0001-Move-README-to-reStructured-text.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 62260e0a42dd6c1c10660f68a531c49bd6cade2e Mon Sep 17 00:00:00 2001
-From: Francois Wautier <francois@wautier.eu>
-Date: Thu, 25 Feb 2021 20:07:08 +0700
-Subject: [PATCH] Move README to reStructured text
-
-Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 582a994..315b3bb 100644
---- a/setup.py
-+++ b/setup.py
-@@ -4,7 +4,7 @@ import setuptools
- 
- version = "0.2.7"
- 
--with open("README.md", "r") as fh:
-+with open("README.rst", "r") as fh:
-     long_description = fh.read()
- 
- setuptools.setup(
-@@ -16,7 +16,7 @@ setuptools.setup(
-     author_email="francois at wautier.eu",
-     description="Scanning Bluetooth for advertised info with asyncio.",
-     long_description=long_description,
--    long_description_content_type="text/markdown",
-+    long_description_content_type="text/x-rst",
-     url="http://github.com/frawau/aioblescan",
-     keywords=["bluetooth", "advertising", "hci", "ble"],
-     license="MIT",
--- 
-2.27.0
-
diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
index 99a715dcd0..2592aace33 100644
--- a/package/python-aioblescan/python-aioblescan.hash
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioblescan/json
-md5  fbcbf92260269d401a197636412f0c99  aioblescan-0.2.7.tar.gz
-sha256  2987f575c5129a21e42ad59e439feb3c96e0ad7210ef73af8eba1344106e5f5f  aioblescan-0.2.7.tar.gz
+md5  f59934c040a817192fcd3e713633cf20  aioblescan-0.2.8.tar.gz
+sha256  2b048f5fe6e85b18fe306bdb63307705f3d1139563d3187d751b8657065a5bd9  aioblescan-0.2.8.tar.gz
 # Locally computed sha256 checksums
 sha256  c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index 2ace10503e..8a9db927ac 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOBLESCAN_VERSION = 0.2.7
+PYTHON_AIOBLESCAN_VERSION = 0.2.8
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/78/2c/c09d8f83ed6c2ca6c4f803f2e5c349698eb78b82c8d5e9302a8eed1a7480
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/d2/10/b8b496903f33935c99f3602200d44ccc0b0a57b87e5fa65b89466c1b1f31
 PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
-- 
2.27.0
