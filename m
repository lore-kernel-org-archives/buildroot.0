From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  3 Sep 2009 21:11:04 +0200
Subject: [Buildroot] [PATCH] directfb: update to 1.4.2,
	add option for pxa3xx driver
Message-ID: <1252005064-22070-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/directfb/Config.in   |    5 +++++
 package/directfb/directfb.mk |    5 ++++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index fce9ed4..4642ee0 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -39,6 +39,11 @@ config BR2_PACKAGE_DIRECTFB_MATROX
 	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
+config BR2_PACKAGE_DIRECTFB_PXA3XX
+	bool "compile pxa3xx graphics driver"
+	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_arm
+
 config BR2_PACKAGE_DIRECTFB_UNICHROME
 	bool "compile unichrome graphics driver"
 	default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 93b4593..8456798 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR:=1.4
-DIRECTFB_VERSION:=1.4.1
+DIRECTFB_VERSION:=1.4.2
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = NO
@@ -44,6 +44,9 @@ endif
 ifeq ($(BR2_PACKAGE_DIRECTFB_MATROX),y)
 DIRECTFB_GFX+= matrox
 endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_PXA3XX),y)
+DIRECTFB_GFX+= pxa3xx
+endif
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNICHROME),y)
 DIRECTFB_GFX+= unichrome
 endif
-- 
1.6.3.3
