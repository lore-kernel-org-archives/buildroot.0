From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 08 Dec 2013 11:30:47 +0800
Subject: [Buildroot] [PATCH] linknx: bump to version 0.0.1.32
Message-ID: <1386473447.15837.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/linknx/linknx-missing-unistd.patch | 22 ----------------------
 package/linknx/linknx.mk                   |  2 +-
 2 files changed, 1 insertion(+), 23 deletions(-)
 delete mode 100644 package/linknx/linknx-missing-unistd.patch

diff --git a/package/linknx/linknx-missing-unistd.patch b/package/linknx/linknx-missing-unistd.patch
deleted file mode 100644
index 04b088f..0000000
--- a/package/linknx/linknx-missing-unistd.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH]: ioport.cpp: close(2) needs unistd.h
-
-Fixed in upstream CVS:
-http://linknx.cvs.sourceforge.net/viewvc/linknx/linknx/linknx/src/ioport.cpp?revision=1.20&view=markup
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/ioport.cpp |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: linknx-0.0.1.30/src/ioport.cpp
-===================================================================
---- linknx-0.0.1.30.orig/src/ioport.cpp
-+++ linknx-0.0.1.30/src/ioport.cpp
-@@ -21,6 +21,7 @@
- #include <iomanip>
- #include "ioport.h"
- #include <fcntl.h>
-+#include <unistd.h>
- 
- Logger& IOPort::logger_m(Logger::getInstance("IOPort"));
- Logger& RxThread::logger_m(Logger::getInstance("RxThread"));
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 6892004..b838854 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKNX_VERSION = 0.0.1.30
+LINKNX_VERSION = 0.0.1.32
 LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LINKNX_VERSION)
 LINKNX_LICENSE = GPLv2+
 LINKNX_INSTALL_STAGING = YES
-- 
1.8.1.2
