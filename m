From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Jun 2020 15:58:49 +0200
Subject: [Buildroot] [PATCH] package/netsurf: bump to version 3.10
Message-ID: <20200606135849.4158368-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/netsurf/0003-do-not-cross-compile-nsgenbind.patch | 2 +-
 package/netsurf/netsurf.hash                              | 4 ++--
 package/netsurf/netsurf.mk                                | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch b/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
index 01e77e977..2d4637511 100644
--- a/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
+++ b/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile b/Makefile
 index f279f01..5698c87 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -109,7 +109,7 @@ endef
+@@ -110,7 +110,7 @@ endef
  
  # prefixed install macro for each host sub target
  define do_build_prefix_install
diff --git a/package/netsurf/netsurf.hash b/package/netsurf/netsurf.hash
index 0f38ea208..77de5c6de 100644
--- a/package/netsurf/netsurf.hash
+++ b/package/netsurf/netsurf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 11e384eaf47e65c186da5001f1055a02f2d72ff17b50f403b8392546a2cf65ff  netsurf-all-3.9.tar.gz
-sha256 55c4a7ae3953d720a462e69d1f128a20004933d12538be5314a33f8821675378  netsurf/COPYING
+sha256  495adf6b6614ce36fca6c605f7c321f9cb4a3df838043158122678ce2b3325b7  netsurf-all-3.10.tar.gz
+sha256  55c4a7ae3953d720a462e69d1f128a20004933d12538be5314a33f8821675378  netsurf/COPYING
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 0077adde2..5677b6946 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSURF_VERSION = 3.9
+NETSURF_VERSION = 3.10
 NETSURF_SOURCE = netsurf-all-$(NETSURF_VERSION).tar.gz
 NETSURF_SITE = http://download.netsurf-browser.org/netsurf/releases/source-full
 NETSURF_LICENSE = GPL-2.0
@@ -15,7 +15,7 @@ NETSURF_DEPENDENCIES = expat jpeg libpng \
 
 ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
 NETSURF_DEPENDENCIES += libgtk2
-NETSURF_FRONTEND = gtk
+NETSURF_FRONTEND = gtk2
 endif
 
 ifeq ($(BR2_PACKAGE_NETSURF_GTK3),y)
-- 
2.25.1
