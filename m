From: Stephan Hoffmann <sho@relinux.de>
Date: Sun,  2 Dec 2012 13:55:49 +0100
Subject: [Buildroot] [PATCH] qtuio: fix build issue because of missing
	include
Message-ID: <1354452949-13691-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TuioServer.cpp uses usleep but did not include <unistd.h>. This
patch adds the missing #include. This issue has been reported
upstream.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 .../qtuio-TuioServer.cpp-add-missing-include.patch |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/qtuio/qtuio-TuioServer.cpp-add-missing-include.patch

diff --git a/package/qtuio/qtuio-TuioServer.cpp-add-missing-include.patch b/package/qtuio/qtuio-TuioServer.cpp-add-missing-include.patch
new file mode 100644
index 0000000..9933702
--- /dev/null
+++ b/package/qtuio/qtuio-TuioServer.cpp-add-missing-include.patch
@@ -0,0 +1,28 @@
+From 4dd7cad8c95484a882eaa2aeaa74595a3dd93a07 Mon Sep 17 00:00:00 2001
+From: Stephan Hoffmann <sho@relinux.de>
+Date: Sun, 2 Dec 2012 13:36:41 +0100
+Subject: [PATCH] TuioServer.cpp: add missing include
+
+If usleep() is used the header <unistd.h> has to be included
+
+Signed-off-by: Stephan Hoffmann <sho@relinux.de>
+---
+ src/3rdparty/tuio/TuioServer.cpp |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/src/3rdparty/tuio/TuioServer.cpp b/src/3rdparty/tuio/TuioServer.cpp
+index f17bef9..851144c 100644
+--- a/src/3rdparty/tuio/TuioServer.cpp
++++ b/src/3rdparty/tuio/TuioServer.cpp
+@@ -25,6 +25,8 @@ using namespace TUIO;
+ using namespace osc;
+ 
+ #ifndef WIN32
++#include <unistd.h>
++
+ static void* ThreadFunc( void* obj )
+ #else
+ static DWORD WINAPI ThreadFunc( LPVOID obj )
+-- 
+1.7.0.4
+
-- 
1.7.0.4
