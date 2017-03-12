From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 10:58:15 +0100
Subject: [Buildroot] [PATCH 1/4] package/nbd: rename options
In-Reply-To: <cover.1489312674.git.yann.morin.1998@free.fr>
References: <cover.1489312674.git.yann.morin.1998@free.fr>
Message-ID: <bc49af9c81ce2fd25971e836d27674e89724b054.1489312674.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and add myself to the DEVELOPERS for nbd.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - fix typoes
---
 Config.in.legacy      | 14 ++++++++++++++
 DEVELOPERS            |  1 +
 package/nbd/Config.in |  4 ++--
 package/nbd/nbd.mk    |  4 ++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index be4c953..67a9a23 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,20 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_NBD_CLIENT
+	bool "nbd client option was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_NBD_CLIENT
+	help
+	  The nbd client option has been renamed to BR2_PACKAGE_NBD_CLIENT.
+
+config BR2_NBD_SERVER
+	bool "nbd server option was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_NBD_SERVER
+	help
+	  The nbd server option has been renamed to BR2_PACKAGE_NBD_SERVER.
+
 config BR2_PACKAGE_GMOCK
 	bool "gmock merged into gtest package"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8daf670..268c2fb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1652,6 +1652,7 @@ F:	package/libseccomp/
 F:	package/linux-tools/
 F:	package/mesa3d-headers/
 F:	package/mke2img/
+F:	package/nbd/
 F:	package/nut/
 F:	package/nvidia-driver/
 F:	package/omxplayer/
diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index a5ded29..b00bc40 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -12,13 +12,13 @@ config BR2_PACKAGE_NBD
 
 if BR2_PACKAGE_NBD
 
-config BR2_NBD_CLIENT
+config BR2_PACKAGE_NBD_CLIENT
 	bool "nbd client"
 	default y
 	help
 	  the client part of NBD.
 
-config BR2_NBD_SERVER
+config BR2_PACKAGE_NBD_SERVER
 	bool "nbd server"
 	help
 	  the server part of NBD.
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index d91c2d7..c7c327e 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -18,10 +18,10 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NBD_CONF_ENV = ac_cv_header_linux_falloc_h=no
 endif
 
-ifneq ($(BR2_NBD_CLIENT),y)
+ifneq ($(BR2_PACKAGE_NBD_CLIENT),y)
 NBD_TOREMOVE += nbd-client
 endif
-ifneq ($(BR2_NBD_SERVER),y)
+ifneq ($(BR2_PACKAGE_NBD_SERVER),y)
 NBD_TOREMOVE += nbd-server
 endif
 
-- 
2.7.4
