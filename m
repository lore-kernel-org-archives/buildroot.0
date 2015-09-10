From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 13:53:47 +0200
Subject: [Buildroot] [git commit] directfb: remove
	BR2_PACKAGE_DIRECTFB_UNIQUE option
Message-ID: <20150910122136.9C23F807B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26e6da5958d42ff4201c756c4483ef883b176740
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option depends on BR2_UNIMPLEMENTED (which does not exist) since
2009. Since BR2_UNIMPLEMENTED does not exist, it was not possible to
enable BR2_PACKAGE_DIRECTFB_UNIQUE, which means that nobody cared
about making it available, and that we don't need to add any
Config.in.legacy handling to remove this option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in   |    4 ----
 package/directfb/directfb.mk |    6 ------
 2 files changed, 0 insertions(+), 10 deletions(-)

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
