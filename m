From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 15:09:47 +0100
Subject: [Buildroot] [git commit] connman: bump version to 1.19
Message-ID: <20131201201520.3F4529BE44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed69ce1daf9cce524ec604b1ab46dcb5f119d5c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump connman to version 1.19; remove a local patch that is no longer
required, the code change having now been made upstream.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../connman-001-fix-for-latest-headers-3.8+.patch  |   19 -------------------
 package/connman/connman.mk                         |    2 +-
 2 files changed, 1 insertions(+), 20 deletions(-)

diff --git a/package/connman/connman-001-fix-for-latest-headers-3.8+.patch b/package/connman/connman-001-fix-for-latest-headers-3.8+.patch
deleted file mode 100644
index ef1fabc..0000000
--- a/package/connman/connman-001-fix-for-latest-headers-3.8+.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-tethering: fix build with kernel headers 3.8+
-
-Highly inspired by:
-    package/bridge-utils/bridge-utils-001-fix-for-kernel-headers-3.8+.patch
-    http://www.redhat.com/archives/libvir-list/2013-January/msg01253.html
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN connman-1.11.orig/src/tethering.c connman-1.11/src/tethering.c
---- connman-1.11.orig/src/tethering.c	2012-12-22 22:52:47.000000000 +0100
-+++ connman-1.11/src/tethering.c	2013-03-21 19:39:17.036029270 +0100
-@@ -35,6 +35,7 @@
- #include <string.h>
- #include <fcntl.h>
- #include <linux/if_tun.h>
-+#include <netinet/in.h>
- #include <linux/if_bridge.h>
- 
- #include "connman.h"
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 4a6bb78..db74c03 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.12
+CONNMAN_VERSION = 1.19
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
