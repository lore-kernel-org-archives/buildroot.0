From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Aug 2018 09:53:28 -0700
Subject: [Buildroot] [PATCH/next 2/2] python-setuptools: bump to 40.1.0
Message-ID: <20180820165329.10083-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

With the introduction of Python 3.7.0, setuptools also needs to be updated.
Without the update, several packages will fail to build or install with a

ValueError: bad marshal data (unknown type code).
Updating setuptools to the latest version fixes this issue.

Fixes:
ded8c3a72e97c6e7481062ff601f1f03adab6976
5f659130a6a32a4c43d6ed2c3b559df77ae18249

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 package/python-setuptools/python-setuptools.hash | 2 +-
 package/python-setuptools/python-setuptools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index f116a69..0e4c9ed 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2599b4c452e77824bbd6da28d16b1fe8159c7a4c203d8d419d8b348fde7b9549  python-setuptools-v38.4.0.tar.gz
+sha256  a5ba2da485eb41ce83093452e29a6f7d2beaf03bca9c6fc69a901bffd0c34c4e  python-setuptools-v40.1.0.tar.gz
 sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 004fc0d..590e982 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = v38.4.0
+PYTHON_SETUPTOOLS_VERSION = v40.1.0
 PYTHON_SETUPTOOLS_SITE = $(call github,pypa,setuptools,$(PYTHON_SETUPTOOLS_VERSION))
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
-- 
1.8.3.1
