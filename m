From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 10:39:02 +0100
Subject: [Buildroot] [git commit] linknx: bump to version 0.0.1.32
Message-ID: <20131208094255.202629BF60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c90d971c393793ea4ddaad958176f065cc9a35e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linknx/linknx-missing-unistd.patch |   22 ----------------------
 package/linknx/linknx.mk                   |    2 +-
 2 files changed, 1 insertions(+), 23 deletions(-)

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
