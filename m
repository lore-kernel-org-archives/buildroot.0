From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:04:12 +0200
Subject: [Buildroot] [git commit] package/powertop: bump to version 2.11
Message-ID: <20191002185903.C7A427FA13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6a248ea512a840002e5a5a08ed80784668296cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (not needed since
https://github.com/fenrus75/powertop/commit/ac576038b25a82cf8729b738e004ea2b306da3cc)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-wakeup_xxx.h-include-limits.h.patch       | 54 ----------------------
 package/powertop/powertop.hash                     |  2 +-
 package/powertop/powertop.mk                       |  4 +-
 3 files changed, 3 insertions(+), 57 deletions(-)

diff --git a/package/powertop/0002-wakeup_xxx.h-include-limits.h.patch b/package/powertop/0002-wakeup_xxx.h-include-limits.h.patch
deleted file mode 100644
index 821de8b948..0000000000
--- a/package/powertop/0002-wakeup_xxx.h-include-limits.h.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4c24fdd8e0a42359df7308155b2d43c28a5e02fd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 20 May 2019 20:25:00 +0200
-Subject: [PATCH] wakeup_xxx.h: include limits.h
-
-limits.h must be included to define PATH_MAX otherwise build will fail
-on:
-
-In file included from wakeup/wakeup_ethernet.cpp:45:0:
-wakeup/wakeup_ethernet.h:35:16: error: 'PATH_MAX' was not declared in this scope
-  char eth_path[PATH_MAX];
-
-In file included from wakeup/wakeup_usb.cpp:45:0:
-wakeup/wakeup_usb.h:35:16: error: 'PATH_MAX' was not declared in this scope
-  char usb_path[PATH_MAX];
-
-Fixes:
- - http://autobuild.buildroot.org/results/a0b3337cf4a827e6566f8b15b6bb180f0dcef7a3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://lists.01.org/pipermail/powertop/2019-May/002052.html]
----
- src/wakeup/wakeup_ethernet.h | 1 +
- src/wakeup/wakeup_usb.h      | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/wakeup/wakeup_ethernet.h b/src/wakeup/wakeup_ethernet.h
-index 682bf95..e0fa628 100644
---- a/src/wakeup/wakeup_ethernet.h
-+++ b/src/wakeup/wakeup_ethernet.h
-@@ -25,6 +25,7 @@
- #ifndef _INCLUDE_GUARD_ETHERNET_WAKEUP_H
- #define _INCLUDE_GUARD_ETHERNET_WAKEUP_H
- 
-+#include <limits.h>
- #include <vector>
- 
- #include "wakeup.h"
-diff --git a/src/wakeup/wakeup_usb.h b/src/wakeup/wakeup_usb.h
-index f7a1f7e..15898e3 100644
---- a/src/wakeup/wakeup_usb.h
-+++ b/src/wakeup/wakeup_usb.h
-@@ -25,6 +25,7 @@
- #ifndef _INCLUDE_GUARD_USB_WAKEUP_H
- #define _INCLUDE_GUARD_USB_WAKEUP_H
- 
-+#include <limits.h>
- #include <vector>
- 
- #include "wakeup.h"
--- 
-2.20.1
-
diff --git a/package/powertop/powertop.hash b/package/powertop/powertop.hash
index 13e938d505..a3261789d2 100644
--- a/package/powertop/powertop.hash
+++ b/package/powertop/powertop.hash
@@ -1,3 +1,3 @@
 # Locally-generated hash
-sha256	d3b7459eaba7d01c8841dd33a3b4d369416c01e9bd8951b0d88234cf18fe4a75	powertop-v2.10.tar.gz
+sha256	ae68c913784f78b497076e0b1d588f59854a66c074690d545dae7956e4f5d64f	powertop-v2.11-1-g7ef7f79.tar.gz
 sha256	b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259	COPYING
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index e4472080e8..3dbc015cef 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-POWERTOP_VERSION = 2.10
+POWERTOP_VERSION = 2.11
 POWERTOP_SITE = https://01.org/sites/default/files/downloads
-POWERTOP_SOURCE = powertop-v$(POWERTOP_VERSION).tar.gz
+POWERTOP_SOURCE = powertop-v$(POWERTOP_VERSION)-1-g7ef7f79.tar.gz
 POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES)
 POWERTOP_LICENSE = GPL-2.0
