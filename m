From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 10:00:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/gmrender-resurrect: bump to version
 0.0.8
Message-ID: <20191226090054.2198511-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libupnp18 is supported since
https://github.com/hzeller/gmrender-resurrect/commit/cc96edeb70fa2938a4d963524261142132ece540

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gmrender-resurrect/Config.in               | 2 +-
 package/gmrender-resurrect/gmrender-resurrect.hash | 2 +-
 package/gmrender-resurrect/gmrender-resurrect.mk   | 8 +++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
index db655ad7f4..e7424e3b22 100644
--- a/package/gmrender-resurrect/Config.in
+++ b/package/gmrender-resurrect/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GMRENDER_RESURRECT
 	depends on BR2_USE_MMU # gstreamer1
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE # run-time only
-	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP
 	help
 	  UPnP (DLNA) media renderer based on gstreamer
 
diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
index 85d6ad4629..dc474be612 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.hash
+++ b/package/gmrender-resurrect/gmrender-resurrect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 79dba7cbd275098026a16829597b7013ab71a9cca4c9762af6f210637099c39a  gmrender-resurrect-a7b0b1b9ca482d2d34ac62c2f2dc0cf0dfbb702b.tar.gz
+sha256 1f0cef76e4543879c9cd31cad73d6c4f778b965884c586405efcf63f2bdbb06f  gmrender-resurrect-0.0.8.tar.gz
 sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index 432ed8424e..e0251967dc 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-GMRENDER_RESURRECT_VERSION = a7b0b1b9ca482d2d34ac62c2f2dc0cf0dfbb702b
-GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,$(GMRENDER_RESURRECT_VERSION))
+GMRENDER_RESURRECT_VERSION = 0.0.8
+GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,v$(GMRENDER_RESURRECT_VERSION))
 # Original distribution does not have default configure,
 # so we need to autoreconf:
 GMRENDER_RESURRECT_AUTORECONF = YES
 GMRENDER_RESURRECT_LICENSE = GPL-2.0+
 GMRENDER_RESURRECT_LICENSE_FILES = COPYING
-GMRENDER_RESURRECT_DEPENDENCIES = gstreamer1 libupnp
+GMRENDER_RESURRECT_DEPENDENCIES = \
+	gstreamer1 \
+	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18) 
 
 $(eval $(autotools-package))
-- 
2.24.0
