From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Jun 2014 15:34:33 +0200
Subject: [Buildroot] [git commit] network-manager: bump version
Message-ID: <20140624133505.87F039D000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=116a8e1b032a85e8c4378cca113110bcb218b158
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-nm-dispatcher-explicitly-add-gio-gio.h.patch |   28 --------------------
 package/network-manager/network-manager.mk         |    2 +-
 2 files changed, 1 insertions(+), 29 deletions(-)

diff --git a/package/network-manager/network-manager-0001-nm-dispatcher-explicitly-add-gio-gio.h.patch b/package/network-manager/network-manager-0001-nm-dispatcher-explicitly-add-gio-gio.h.patch
deleted file mode 100644
index 94ab7c2..0000000
--- a/package/network-manager/network-manager-0001-nm-dispatcher-explicitly-add-gio-gio.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c1bc880ec9708d6de9ae3fc42d77874279ab87b6 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Wed, 11 Jun 2014 12:01:53 +0200
-Subject: [PATCH] nm-dispatcher: explicitly add gio/gio.h
-
-Without this header Buildroot's build complains about unknown
-types like GFile etc.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- src/nm-dispatcher.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/src/nm-dispatcher.c b/src/nm-dispatcher.c
-index 7a0c8de..336b91f 100644
---- a/src/nm-dispatcher.c
-+++ b/src/nm-dispatcher.c
-@@ -20,6 +20,7 @@
-  */
- 
- #include <glib.h>
-+#include <gio/gio.h>
- #include <string.h>
- 
- #include "nm-dispatcher.h"
--- 
-1.7.7
-
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 282e1e5..3555f00 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 0.9
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).9.95
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).9.98
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
