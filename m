From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 13:40:43 +0100
Subject: [Buildroot] [git commit] package/bitcoin: fix build with boost 1.72
Message-ID: <20191226123229.B6A448E58F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3563f44dc38e396a20cc70cea650c583e204a93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/6b4d9877aa416b788b94fe44b2673149aae4af43

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-missing-header-bootlegged-by-boost-1-72.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/bitcoin/0001-http-add-missing-header-bootlegged-by-boost-1-72.patch b/package/bitcoin/0001-http-add-missing-header-bootlegged-by-boost-1-72.patch
new file mode 100644
index 0000000000..84e0cf2570
--- /dev/null
+++ b/package/bitcoin/0001-http-add-missing-header-bootlegged-by-boost-1-72.patch
@@ -0,0 +1,28 @@
+From a5929130223973636f3fd25fbfaf2953f2ec96a9 Mon Sep 17 00:00:00 2001
+From: Jan Beich <jbeich@FreeBSD.org>
+Date: Fri, 25 Oct 2019 13:05:17 +0000
+Subject: [PATCH] http: add missing header bootlegged by boost < 1.72
+
+httpserver.cpp:74:10: error: no template named 'deque' in namespace 'std'
+    std::deque<std::unique_ptr<WorkItem>> queue;
+    ~~~~~^
+
+[Retrieved from:
+https://github.com/bitcoin/bitcoin/commit/a5929130223973636f3fd25fbfaf2953f2ec96a9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/httpserver.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/httpserver.cpp b/src/httpserver.cpp
+index 81137771871f..d9c711332358 100644
+--- a/src/httpserver.cpp
++++ b/src/httpserver.cpp
+@@ -15,6 +15,7 @@
+ #include <sync.h>
+ #include <ui_interface.h>
+ 
++#include <deque>
+ #include <memory>
+ #include <stdio.h>
+ #include <stdlib.h>
