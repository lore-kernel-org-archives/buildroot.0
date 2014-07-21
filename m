From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 21 Jul 2014 16:12:15 +0200
Subject: [Buildroot] [RFC 1/3] Rename package mpc to libmpc
In-Reply-To: <1405951937-21226-1-git-send-email-jkrause@posteo.de>
References: <1405951937-21226-1-git-send-email-jkrause@posteo.de>
Message-ID: <1405951937-21226-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/Config.in                        |  2 +-
 package/{mpc => libmpc}/Config.in        |  4 ++--
 package/{mpc/mpc.mk => libmpc/libmpc.mk} | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename package/{mpc => libmpc}/Config.in (87%)
 rename package/{mpc/mpc.mk => libmpc/libmpc.mk} (53%)

diff --git a/package/Config.in b/package/Config.in
index 703fd3d..9370d7c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -838,6 +838,7 @@ menu "Other"
 	source "package/libgc/Config.in"
 	source "package/libglib2/Config.in"
 	source "package/libical/Config.in"
+	source "package/libmpc/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplist/Config.in"
@@ -855,7 +856,6 @@ menu "Other"
 	source "package/libuv/Config.in"
 	source "package/linux-pam/Config.in"
 	source "package/lttng-libust/Config.in"
-	source "package/mpc/Config.in"
 	source "package/mpfr/Config.in"
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
diff --git a/package/mpc/Config.in b/package/libmpc/Config.in
similarity index 87%
rename from package/mpc/Config.in
rename to package/libmpc/Config.in
index 8377013..e4b5e01 100644
--- a/package/mpc/Config.in
+++ b/package/libmpc/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_MPC
-	bool "mpc"
+config BR2_PACKAGE_LIBMPC
+	bool "libmpc"
 	select BR2_PACKAGE_MPFR
 	select BR2_PACKAGE_GMP
 	help
diff --git a/package/mpc/mpc.mk b/package/libmpc/libmpc.mk
similarity index 53%
rename from package/mpc/mpc.mk
rename to package/libmpc/libmpc.mk
index 81ee5f0..766e113 100644
--- a/package/mpc/mpc.mk
+++ b/package/libmpc/libmpc.mk
@@ -1,15 +1,15 @@
 ################################################################################
 #
-# mpc
+# libmpc
 #
 ################################################################################
 
-MPC_VERSION = 1.0.2
-MPC_SITE = $(BR2_GNU_MIRROR)/mpc
-MPC_LICENSE = LGPLv3+
-MPC_LICENSE_FILES = COPYING.LESSER
-MPC_INSTALL_STAGING = YES
-MPC_DEPENDENCIES = gmp mpfr
+LIBMPC_VERSION = 1.0.2
+LIBMPC_SITE = $(BR2_GNU_MIRROR)/mpc
+LIBMPC_LICENSE = LGPLv3+
+LIBMPC_LICENSE_FILES = COPYING.LESSER
+LIBMPC_INSTALL_STAGING = YES
+LIBMPC_DEPENDENCIES = libgmp libmpfr
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.0.2
