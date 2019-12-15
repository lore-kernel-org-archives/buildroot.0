From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Dec 2019 11:29:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/jimtcl: bump to version 0.79
Message-ID: <20191215102925.3490766-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site from debian to github official mirror
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jimtcl/jimtcl.hash | 5 +++--
 package/jimtcl/jimtcl.mk   | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jimtcl/jimtcl.hash b/package/jimtcl/jimtcl.hash
index 223dbcf57e..21d75c4f42 100644
--- a/package/jimtcl/jimtcl.hash
+++ b/package/jimtcl/jimtcl.hash
@@ -1,2 +1,3 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/jimtcl/jimtcl_0.75-1.dsc
-sha256	432ad29b98f33efd018d9e1d49a5d07a5efc523c5660983733f7e30d9b2b76cb	jimtcl_0.75.orig.tar.xz
+# Locally computed
+sha256	ab8204cd03b946f5149e1273af9c86d8e73b146084a0fbeb1d4f41a75b0b3411	jimtcl-0.79.tar.gz
+sha256	419f1146334e57fb258d6c957d1f94d43455ec0d24b1b54c4447e5f61a353950	LICENSE
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 389a72ab83..643a87d5c4 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-JIMTCL_VERSION = 0.75
-JIMTCL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/jimtcl
-JIMTCL_SOURCE = jimtcl_$(JIMTCL_VERSION).orig.tar.xz
+JIMTCL_VERSION = 0.79
+JIMTCL_SITE = $(call github,msteveb,jimtcl,$(JIMTCL_VERSION))
 JIMTCL_INSTALL_STAGING = YES
 JIMTCL_LICENSE = BSD-2-Clause
 JIMTCL_LICENSE_FILES = LICENSE
-- 
2.24.0
