From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Jun 2020 21:41:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/udpcast: bump to version 20200328
Message-ID: <20200621194136.1647222-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (not needed anymore) as console.h has been updated with:
 #if HAVE_SYS_SELECT_H
 #include <sys/select.h>
 #endif

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/udpcast/0001-select-h.patch | 11 -----------
 package/udpcast/udpcast.hash        |  2 +-
 package/udpcast/udpcast.mk          |  2 +-
 3 files changed, 2 insertions(+), 13 deletions(-)
 delete mode 100644 package/udpcast/0001-select-h.patch

diff --git a/package/udpcast/0001-select-h.patch b/package/udpcast/0001-select-h.patch
deleted file mode 100644
index 9a8cfc9d5e..0000000000
--- a/package/udpcast/0001-select-h.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- udpcast-20120424/console.h	2005-12-22 22:59:18.000000000 +0000
-+++ udpcast-20120424.mod/console.h	2013-05-22 22:22:19.835474140 +0100
-@@ -6,6 +6,8 @@
- #include <winbase.h>
- #endif /* __MINGW32__ */
- 
-+#include <sys/select.h>
-+
- #define prepareConsole udpc_prepareConsole
- #define getConsoleFd udpc_getConsoleFd
- #define restoreConsole udpc_restoreConsole
diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
index a70aa71981..9cdce0a286 100644
--- a/package/udpcast/udpcast.hash
+++ b/package/udpcast/udpcast.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  ce9090ef80b6035a744a9b5ac335e61c99baa92c39ff53277266fbfcb836445a  udpcast-20120424.tar.gz
+sha256  9c19eebaa6e2f78127f0d59e95d0ce003b687d61e283b5963a1da6b8ac41f21a  udpcast-20200328.tar.gz
 sha256  422befd3503b1f39a6027017f639874c1f274e37ec60ba3174894646b584ccbc  COPYING
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index e9116d2de0..34ebddd2d5 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDPCAST_VERSION = 20120424
+UDPCAST_VERSION = 20200328
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
 UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
-- 
2.26.2
