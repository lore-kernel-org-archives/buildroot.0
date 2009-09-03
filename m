From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 3 Sep 2009 21:20:18 +0200
Subject: [Buildroot] [git commit master] directfb: update to 1.4.2,
	add option for pxa3xx driver
Message-ID: <20090903192047.21FD677513@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b66a9435b9f4be192f8b448a3a6f083af9da690
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in   |    5 +++++
 package/directfb/directfb.mk |    5 ++++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index bb35530..487faf4 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -50,6 +50,11 @@ config BR2_PACKAGE_DIRECTFB_MATROX
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
index afbd7c0..4212a4a 100644
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
@@ -57,6 +57,9 @@ endif
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
