From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 29 Mar 2016 13:45:25 +0200
Subject: [Buildroot] [PATCH v1] qt5tools: disable qdoc (needs qtdeclarative)
Message-ID: <1459251925-31678-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  Project ERROR: Unknown module(s) in QT: qmldevtools-private
  Makefile:63: recipe for target 'sub-qdoc-qmake_all' failed

[1] http://autobuild.buildroot.net/results/b0a/b0a5641beae14ff79a9d5a628bb41957826eb623

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0001-Disable-qdoc-needs-qtdeclarative.patch    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/qt5/qt5tools/0001-Disable-qdoc-needs-qtdeclarative.patch

diff --git a/package/qt5/qt5tools/0001-Disable-qdoc-needs-qtdeclarative.patch b/package/qt5/qt5tools/0001-Disable-qdoc-needs-qtdeclarative.patch
new file mode 100644
index 0000000..61cbdfe
--- /dev/null
+++ b/package/qt5/qt5tools/0001-Disable-qdoc-needs-qtdeclarative.patch
@@ -0,0 +1,30 @@
+From acdb24783322bb6e69df61cf04df2b2e47a06ad2 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 29 Mar 2016 13:37:09 +0200
+Subject: [PATCH] Disable qdoc (needs qtdeclarative).
+
+Fixes:
+
+  Project ERROR: Unknown module(s) in QT: qmldevtools-private
+  Makefile:63: recipe for target 'sub-qdoc-qmake_all' failed
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/src.pro | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/src.pro b/src/src.pro
+index 387d54f..494898f 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -14,7 +14,6 @@ qtHaveModule(widgets) {
+ }
+ 
+ SUBDIRS += linguist \
+-    qdoc \
+     qtplugininfo
+ if(!android|android_app):!ios: SUBDIRS += qtpaths
+ 
+-- 
+2.1.4
+
-- 
2.1.4
