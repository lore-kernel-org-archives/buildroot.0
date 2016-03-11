From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 11:32:23 -0300
Subject: [Buildroot] [PATCH 6/7] xf86-input-void: remove deprecated
In-Reply-To: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1457706744-23401-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's been deprecated for a year now so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                                           |  7 +++++++
 package/x11r7/Config.in                                    |  1 -
 package/x11r7/xdriver_xf86-input-void/Config.in            | 11 -----------
 .../xdriver_xf86-input-void/xdriver_xf86-input-void.hash   |  2 --
 .../xdriver_xf86-input-void/xdriver_xf86-input-void.mk     | 14 --------------
 5 files changed, 7 insertions(+), 28 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-input-void/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.hash
 delete mode 100644 package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 807d701..8a067dd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
+	bool "xf86-input-void removed"
+	select BR2_LEGACY
+	help
+	  The xf86-input-void package has been removed, there's no need
+	  for it in any modern (post-2007) xorg server.
+
 config BR2_KERNEL_HEADERS_3_17
 	bool "kernel headers version 3.17.x are no longer supported"
 	select BR2_KERNEL_HEADERS_3_18
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 381157f..019e376 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -155,7 +155,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-input-synaptics/Config.in
 		source package/x11r7/xdriver_xf86-input-tslib/Config.in
 		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
-		source package/x11r7/xdriver_xf86-input-void/Config.in
 		source package/x11r7/xdriver_xf86-video-ark/Config.in
 		source package/x11r7/xdriver_xf86-video-ast/Config.in
 		source package/x11r7/xdriver_xf86-video-ati/Config.in
diff --git a/package/x11r7/xdriver_xf86-input-void/Config.in b/package/x11r7/xdriver_xf86-input-void/Config.in
deleted file mode 100644
index fd3a600..0000000
--- a/package/x11r7/xdriver_xf86-input-void/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
-	bool "xf86-input-void"
-	# http://lists.x.org/archives/xorg-announce/2015-April/002585.html
-	# "It is just dead weight for any server released after 2007 or so.
-	#  Don't use it."
-	depends on BR2_DEPRECATED_SINCE_2015_05
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  null input driver
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.hash b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.hash
deleted file mode 100644
index a1b88c5..0000000
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002585.html
-sha256	f96e4f0a622821bf43a74bd419f2a18423343996c9d243c7e1430ba2d142339c	xf86-input-void-1.4.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
deleted file mode 100644
index 5baa528..0000000
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-void
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_VOID_VERSION = 1.4.1
-XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_VOID_LICENSE = MIT
-XDRIVER_XF86_INPUT_VOID_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
2.4.10
