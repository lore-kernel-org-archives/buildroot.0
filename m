From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Jul 2020 22:28:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/zstd: bump to version 1.4.5
Message-ID: <20200714202850.1441606-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Get official tarball and its hash
- Update indentation in hash file (two spaces)

This is a fairly important release which includes performance
improvements and new major CLI features. It also fixes a few corner
cases, making it a recommended upgrade.

https://github.com/facebook/zstd/releases/tag/v1.4.5
https://github.com/facebook/zstd/releases/tag/v1.4.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zstd/zstd.hash | 8 ++++----
 package/zstd/zstd.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 8a69261314..b764917c8f 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,6 +1,6 @@
-# Locally computed
-sha256 5eda3502ecc285c3c92ee0cc8cd002234dee39d539b3f692997a0e80de1d33de zstd-1.4.3.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.4.5/zstd-1.4.5.tar.gz.sha256
+sha256  98e91c7c6bf162bf90e4e70fdbc41a8188b9fa8de5ad840c401198014406ce9e  zstd-1.4.5.tar.gz
 
 # License files (locally computed as well)
-sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
-sha256 f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505 COPYING
+sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
+sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 765fa6dd56..e2ba12b058 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.4.3
-ZSTD_SITE = $(call github,facebook,zstd,v$(ZSTD_VERSION))
+ZSTD_VERSION = 1.4.5
+ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
-- 
2.27.0
