From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Apr 2021 18:41:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/ell: use official tarball
Message-ID: <20210406164146.1245330-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ell/ell.hash |  4 ++--
 package/ell/ell.mk   | 12 ++----------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index a795b1aa0d..5f1cc7ddcb 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  deacff70541b2b0aa61758d7e4eafbabd8c603eeea0207a8a2f5f42118c2f49d  ell-0.39-br1.tar.gz
+# From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
+sha256  653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08  ell-0.39.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index c83063feda..bd291c60db 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -5,19 +5,11 @@
 ################################################################################
 
 ELL_VERSION = 0.39
-ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
-ELL_SITE_METHOD = git
+ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
+ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
 ELL_LICENSE_FILES = COPYING
 ELL_INSTALL_STAGING = YES
-# sources from git, no configure script provided
-ELL_AUTORECONF = YES
-
-# autoreconf requires an existing build-aux directory
-define ELL_MKDIR_BUILD_AUX
-	mkdir -p $(@D)/build-aux
-endef
-ELL_POST_PATCH_HOOKS += ELL_MKDIR_BUILD_AUX
 
 ELL_DEPENDENCIES = host-pkgconf
 
-- 
2.30.2
