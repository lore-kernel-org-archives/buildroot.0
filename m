From: Ormund Williams <ormundw@panix.com>
Date: Wed, 23 Sep 2009 21:13:52 -0400
Subject: [Buildroot] [PATCH] Add i830 graphics driver to DirectFB
Message-ID: <1253754832.451.92.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 package/directfb/Config.in   |    6 ++++++
 package/directfb/directfb.mk |    3 +++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 487faf4..8f4beb8 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -61,6 +61,12 @@ config BR2_PACKAGE_DIRECTFB_UNICHROME
 	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
+config BR2_PACKAGE_DIRECTFB_I830
+	bool "compile i830 graphics driver"
+	default n
+	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_DIRECTFB_LINUXINPUT
 	bool "compile /dev/input/eventX input driver"
 	default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 4212a4a..409f791 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -63,6 +63,9 @@ endif
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNICHROME),y)
 DIRECTFB_GFX+= unichrome
 endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_I830),y)
+DIRECTFB_GFX+= i830
+endif
 ifeq ($(DIRECTFB_GFX),)
 DIRECTFB_GFX:=none
 else
-- 
1.5.6.5

_____________________________________________________
Does this look right?
-- 
Ormund Williams
OrmLab LLC
