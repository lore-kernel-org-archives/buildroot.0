From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 13 Dec 2017 21:41:42 -0800
Subject: [Buildroot] [PATCH] systemd-bootchart: bump to version 233
Message-ID: <20171214054142.30141-1-yurovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version includes minor fixes and improvements but is otherwise
compatible.

It does not rely on xlocale.h so we drop that patch (it was merged).

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
---
 .../0001-parse-util-Don-t-use-xlocale.h-35.patch   | 32 ----------------------
 package/systemd-bootchart/systemd-bootchart.hash   |  2 +-
 package/systemd-bootchart/systemd-bootchart.mk     |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch

diff --git a/package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch b/package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch
deleted file mode 100644
index 4eae7e65e4..0000000000
--- a/package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 15062a4501a1dffccd7cb6374b415693fa4435bf Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 18 Jul 2017 22:55:50 +0300
-Subject: [PATCH] parse-util: Don't use xlocale.h (#35)
-
-glibc 2.26 no longer contains the non-standard xlocale.h
-(http://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27xlocale.h.27)
-
-This change shouldn't break anything as xlocale.h was a subset of
-locale.h.
-
-[yann.morin.1998 at free.fr: backported from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- src/parse-util.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/parse-util.c b/src/parse-util.c
-index 5635a68..1b2169c 100644
---- a/src/parse-util.c
-+++ b/src/parse-util.c
-@@ -21,7 +21,6 @@
- #include <locale.h>
- #include <stdlib.h>
- #include <string.h>
--#include <xlocale.h>
- 
- #include "macro.h"
- #include "parse-util.h"
--- 
-2.11.0
-
diff --git a/package/systemd-bootchart/systemd-bootchart.hash b/package/systemd-bootchart/systemd-bootchart.hash
index 2d2175a0b4..40643dbca0 100644
--- a/package/systemd-bootchart/systemd-bootchart.hash
+++ b/package/systemd-bootchart/systemd-bootchart.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 1ef7b4f440bf53aced26979cf8153482840699c556700671eb5dadb4222c70bd systemd-bootchart-231.tar.xz
+sha256 f4cb17b21928e36ec27de5c5294dea6ec1de4acd7ee6c56d6ecc75319cbcaefa systemd-bootchart-233.tar.xz
diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
index 3be39183e6..bcc3dbe22a 100644
--- a/package/systemd-bootchart/systemd-bootchart.mk
+++ b/package/systemd-bootchart/systemd-bootchart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_BOOTCHART_VERSION = 231
+SYSTEMD_BOOTCHART_VERSION = 233
 SYSTEMD_BOOTCHART_SOURCE = systemd-bootchart-$(SYSTEMD_BOOTCHART_VERSION).tar.xz
 # Do not use the github helper here: the uploaded release tarball already
 # contains the generated autotools scripts. It also slightly differs with
-- 
2.14.3
