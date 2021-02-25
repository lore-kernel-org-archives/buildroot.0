From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 25 Feb 2021 14:48:00 +0100
Subject: [Buildroot] [PATCH] package/python-aioblescan: Bump to version 0.2.7
Message-ID: <20210225134802.257199-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 ...ption-from-README.rst-instead-of-REA.patch | 39 +++++++++++++++++++
 .../python-aioblescan/python-aioblescan.hash  |  6 +--
 .../python-aioblescan/python-aioblescan.mk    |  4 +-
 3 files changed, 44 insertions(+), 5 deletions(-)
 create mode 100644 package/python-aioblescan/0001-Load-long-description-from-README.rst-instead-of-REA.patch

diff --git a/package/python-aioblescan/0001-Load-long-description-from-README.rst-instead-of-REA.patch b/package/python-aioblescan/0001-Load-long-description-from-README.rst-instead-of-REA.patch
new file mode 100644
index 0000000000..0b1c83032c
--- /dev/null
+++ b/package/python-aioblescan/0001-Load-long-description-from-README.rst-instead-of-REA.patch
@@ -0,0 +1,39 @@
+From cec20ab0494051d7aaf277ec19f36948141f6210 Mon Sep 17 00:00:00 2001
+From: Grzegorz Blach <grzegorz@blach.pl>
+Date: Thu, 25 Feb 2021 14:14:43 +0100
+Subject: [PATCH 1/1] Load long description from README.rst instead of
+ README.md, because README.md is missing in 0.2.7 release.
+
+Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
+---
+ setup.cfg | 2 +-
+ setup.py  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 9f88734..26fc631 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -1,5 +1,5 @@
+ [metadata]
+-description-file = README.md
++description-file = README.rst
+ 
+ [egg_info]
+ tag_build = 
+diff --git a/setup.py b/setup.py
+index 582a994..1f3c251 100644
+--- a/setup.py
++++ b/setup.py
+@@ -4,7 +4,7 @@ import setuptools
+ 
+ version = "0.2.7"
+ 
+-with open("README.md", "r") as fh:
++with open("README.rst", "r") as fh:
+     long_description = fh.read()
+ 
+ setuptools.setup(
+-- 
+2.27.0
+
diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
index 902a7a30f8..99a715dcd0 100644
--- a/package/python-aioblescan/python-aioblescan.hash
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioblescan/json
-md5	9ad3f04ea7ad4c81a53f8e1316985527  aioblescan-0.2.6.tar.gz
-sha256	2e45c325e070a0ee4e952a7d0c56e95ad230643e1057fb5f3e95ea5c99081436  aioblescan-0.2.6.tar.gz
+md5  fbcbf92260269d401a197636412f0c99  aioblescan-0.2.7.tar.gz
+sha256  2987f575c5129a21e42ad59e439feb3c96e0ad7210ef73af8eba1344106e5f5f  aioblescan-0.2.7.tar.gz
 # Locally computed sha256 checksums
-sha256	c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
+sha256  c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index 6350007c70..2ace10503e 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOBLESCAN_VERSION = 0.2.6
+PYTHON_AIOBLESCAN_VERSION = 0.2.7
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/66/b8/888c2eb4323ed498dbc7deeb8aee0cfec9edd8c25184b06a8874bb0cf84f
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/78/2c/c09d8f83ed6c2ca6c4f803f2e5c349698eb78b82c8d5e9302a8eed1a7480
 PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
-- 
2.27.0
