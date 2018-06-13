From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Jun 2018 19:08:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/connman: bump version to 1.36
Message-ID: <20180613170833.7808-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added licence hash, removed patch applied upstream
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=bdfb3526466f8fb8f13d9259037d8f42c782ce24

Renumbered remaining patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ure.patch => 0001-nat-build-failure.patch} |  0
 ...01-tethering-Reorder-header-includes.patch | 37 -------------------
 package/connman/connman.hash                  |  4 +-
 package/connman/connman.mk                    |  2 +-
 4 files changed, 4 insertions(+), 39 deletions(-)
 rename package/connman/{0002-nat-build-failure.patch => 0001-nat-build-failure.patch} (100%)
 delete mode 100644 package/connman/0001-tethering-Reorder-header-includes.patch

diff --git a/package/connman/0002-nat-build-failure.patch b/package/connman/0001-nat-build-failure.patch
similarity index 100%
rename from package/connman/0002-nat-build-failure.patch
rename to package/connman/0001-nat-build-failure.patch
diff --git a/package/connman/0001-tethering-Reorder-header-includes.patch b/package/connman/0001-tethering-Reorder-header-includes.patch
deleted file mode 100644
index 4955df1cdd..0000000000
--- a/package/connman/0001-tethering-Reorder-header-includes.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From bdfb3526466f8fb8f13d9259037d8f42c782ce24 Mon Sep 17 00:00:00 2001
-From: Daniel Wagner <wagi@monom.org>
-Date: Wed, 17 Jan 2018 23:42:50 +0100
-Subject: [PATCH] tethering: Reorder header includes
-
-Avoid compile errors due to unsupported header include order with
-newer kernels (>=4.15). We should import the libc header files first
-and then the Linux header files in user space applications.
-
-Reported by Neil MacLeod <neil@nmacleod.com>. Fix probosal by Jonas
-Bonn <jonas@southpole.se> and Hauke Mehrtens <hauke@hauke-m.de>.
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- src/tethering.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tethering.c b/src/tethering.c
-index c929ba7..4b20236 100644
---- a/src/tethering.c
-+++ b/src/tethering.c
-@@ -31,11 +31,11 @@
- #include <stdio.h>
- #include <sys/ioctl.h>
- #include <net/if.h>
--#include <linux/sockios.h>
- #include <string.h>
- #include <fcntl.h>
--#include <linux/if_tun.h>
- #include <netinet/in.h>
-+#include <linux/sockios.h>
-+#include <linux/if_tun.h>
- #include <linux/if_bridge.h>
-
- #include "connman.h"
---
-2.7.4
diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index c822bb1fe4..fad1c55d2d 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256	66d7deb98371545c6e417239a9b3b3e3201c1529d08eedf40afbc859842cf2aa	connman-1.35.tar.xz
+sha256 c789db41cc443fa41e661217ea321492ad59a004bebcd1aa013f3bc10a6e0074  connman-1.36.tar.xz
+# Locally computed
+sha256 b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 52c45451d9..b67d1c4b86 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.35
+CONNMAN_VERSION = 1.36
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
-- 
2.17.1
