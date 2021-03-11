From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Mar 2021 18:44:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.12
Message-ID: <20210311174401.626348-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsysfs is not needed since
https://github.com/nhorman/rng-tools/commit/46b4e8fd8955e25ef0d5e89d26c8cf1543d2fa8a

https://github.com/nhorman/rng-tools/releases/tag/v6.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rng-tools/Config.in      | 1 -
 package/rng-tools/rng-tools.hash | 2 +-
 package/rng-tools/rng-tools.mk   | 6 +++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 67e3d4185b..0dd269c818 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_RNG_TOOLS
 	# pthread_setaffinity_np
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Daemon to use hardware random number generators.
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index de1f72617c..0ba2dc8329 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  644d8bd4e84cee29debddc7e6db72aff27e628e5a879ce310562edf50f12be41  rng-tools-6.11.tar.gz
+sha256  6fd5b52a700edec85eb1043970e22e8e2ad06a4b43851f35d33d90e09570e9d3  rng-tools-6.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index ae20d96362..2d508413a4 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.11
-RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),V$(RNG_TOOLS_VERSION))
+RNG_TOOLS_VERSION = 6.12
+RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
-RNG_TOOLS_DEPENDENCIES = libsysfs host-pkgconf openssl
+RNG_TOOLS_DEPENDENCIES = host-pkgconf openssl
 # From git
 RNG_TOOLS_AUTORECONF = YES
 
-- 
2.30.0
