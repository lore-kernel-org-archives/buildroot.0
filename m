From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 21:04:05 -0700
Subject: [Buildroot] [PATCH 2/2] package/ser2net: bump to version 4.3.0
In-Reply-To: <20201123040405.2196833-1-james.hilliard1@gmail.com>
References: <20201123040405.2196833-1-james.hilliard1@gmail.com>
Message-ID: <20201123040405.2196833-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-port.h-include-sys-time.h.patch      | 39 -------------------
 package/ser2net/ser2net.hash                  |  6 +--
 package/ser2net/ser2net.mk                    |  4 +-
 3 files changed, 5 insertions(+), 44 deletions(-)
 delete mode 100644 package/ser2net/0001-port.h-include-sys-time.h.patch

diff --git a/package/ser2net/0001-port.h-include-sys-time.h.patch b/package/ser2net/0001-port.h-include-sys-time.h.patch
deleted file mode 100644
index daf5372437..0000000000
--- a/package/ser2net/0001-port.h-include-sys-time.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 021543b02b6fdb78c9217757736eabac90a647eb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 26 Sep 2020 12:37:38 +0200
-Subject: [PATCH] port.h: include <sys/time.h>
-
-Include <sys/time.h> to avoid the following build failure on musl:
-
-port.h:361:29: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
-     const char *str, struct timeval *tv,
-                             ^~~~~~~
-portconfig.c: In function 'myconfig':
-portconfig.c:586:9: error: variable 'tv' has initializer but incomplete type
-  struct timeval tv = { 0, 0 };
-         ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/4c0b238186cb2fb2d81807ce006945594f92b2cd
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/cminyard/ser2net/pull/34]
----
- port.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/port.h b/port.h
-index 048c5bd..86c3b1d 100644
---- a/port.h
-+++ b/port.h
-@@ -9,6 +9,7 @@
- #define PORT
- 
- #include <netdb.h>
-+#include <sys/time.h>
- #include "gbuf.h"
- #include "absout.h"
- 
--- 
-2.28.0
-
diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index fd2761075b..2e67a860b1 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  7c0a47bd9b405aedac136c4e290ebfeb  ser2net-4.2.2.tar.gz
-sha1  64e77d3194bbbac6e7e9d5810d06b6ade7bfdcf4  ser2net-4.2.2.tar.gz
+md5  19e9819e8c4e91ea56c455a3f0f7d2d5  ser2net-4.3.0.tar.gz
+sha1  dc84a43c4a96d021a6d4fc64fba1f1ba86732018  ser2net-4.3.0.tar.gz
 # Locally computed:
-sha256  60e2aab04c4a346447a7e58e308a830fb74bac208a021229c113fc8ccc7bdfe6  ser2net-4.2.2.tar.gz
+sha256  5e407d684d0aa0919ddd15af368f890c5940cddd6034b7efc363823f38f6ff0c  ser2net-4.3.0.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 868d7f3a1d..5dd64f5a4f 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.2.2
-SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
+SER2NET_VERSION = 4.3.0
+SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
 SER2NET_DEPENDENCIES = gensio libyaml
-- 
2.25.1
