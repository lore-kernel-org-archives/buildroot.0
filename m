From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 00:01:07 +0200
Subject: [Buildroot] [PATCHv3 06/15] directfb: remove
	BR2_PACKAGE_DIRECTFB_UNIQUE option
In-Reply-To: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1441144876-2628-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option depends on BR2_UNIMPLEMENTED (which does not exist) since
2009. Since BR2_UNIMPLEMENTED does not exist, it was not possible to
enable BR2_PACKAGE_DIRECTFB_UNIQUE, which means that nobody cared
about making it available, and that we don't need to add any
Config.in.legacy handling to remove this option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in   | 4 ----
 package/directfb/directfb.mk | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 98acec5..d71858e 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -45,10 +45,6 @@ config BR2_PACKAGE_DIRECTFB_TRACE
 	help
 	  Enable call tracing for DirectFB applications
 
-config BR2_PACKAGE_DIRECTFB_UNIQUE
-	bool "enable unique window manager"
-	depends on BR2_UNIMPLEMENTED
-
 config BR2_PACKAGE_DIRECTFB_ATI128
 	bool "compile ati128 graphics driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index acb3e3a..d44e658 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -53,12 +53,6 @@ ifeq ($(BR2_PACKAGE_DIRECTFB_TRACE),y)
 DIRECTFB_CONF_OPTS += --enable-trace
 endif
 
-ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
-DIRECTFB_CONF_OPTS += --enable-unique
-else
-DIRECTFB_CONF_OPTS += --disable-unique
-endif
-
 DIRECTFB_GFX = \
 	$(if $(BR2_PACKAGE_DIRECTFB_ATI128),ati128) \
 	$(if $(BR2_PACKAGE_DIRECTFB_CLE266),cle266) \
-- 
2.5.1
