From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 26 May 2019 20:27:27 +0200
Subject: [Buildroot] [git commit] package/qt5webkit-examples: fix build with
 qt5webkit
Message-ID: <20190526182330.4ACA18D206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=497af2beb1250af93c17412d636dc2fe48a59f8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/68dd6f1ffed49f8e2570f7364e5e635573807d3e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-Fix-QWebView-path.patch                   | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/package/qt5/qt5webkit-examples/0002-Fix-QWebView-path.patch b/package/qt5/qt5webkit-examples/0002-Fix-QWebView-path.patch
new file mode 100644
index 0000000000..30aab30167
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/0002-Fix-QWebView-path.patch
@@ -0,0 +1,73 @@
+From 9fa73707216bd55dff380031a33aca701a7d9c8b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 May 2019 23:29:05 +0200
+Subject: [PATCH] Fix QWebView path
+
+QWebView is installed under QtWebKitWidgets
+
+Fixes:
+ - http://autobuild.buildroot.org/results/68dd6f1ffed49f8e2570f7364e5e635573807d3e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ examples/webkitwidgets/formextractor/formextractor.ui           | 2 +-
+ examples/webkitwidgets/previewer/previewer.ui                   | 2 +-
+ examples/webkitwidgets/simpleselector/window.ui                 | 2 +-
+ .../xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui             | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/examples/webkitwidgets/formextractor/formextractor.ui b/examples/webkitwidgets/formextractor/formextractor.ui
+index 5c4afec..a38bdd5 100644
+--- a/examples/webkitwidgets/formextractor/formextractor.ui
++++ b/examples/webkitwidgets/formextractor/formextractor.ui
+@@ -151,7 +151,7 @@
+   <customwidget>
+    <class>QWebView</class>
+    <extends>QWidget</extends>
+-   <header>QtWebKit/QWebView</header>
++   <header>QtWebKitWidgets/QWebView</header>
+   </customwidget>
+  </customwidgets>
+  <resources/>
+diff --git a/examples/webkitwidgets/previewer/previewer.ui b/examples/webkitwidgets/previewer/previewer.ui
+index d4c9992..69adb2e 100644
+--- a/examples/webkitwidgets/previewer/previewer.ui
++++ b/examples/webkitwidgets/previewer/previewer.ui
+@@ -74,7 +74,7 @@
+   <customwidget>
+    <class>QWebView</class>
+    <extends>QWidget</extends>
+-   <header>QtWebKit/QWebView</header>
++   <header>QtWebKitWidgets/QWebView</header>
+   </customwidget>
+  </customwidgets>
+  <resources/>
+diff --git a/examples/webkitwidgets/simpleselector/window.ui b/examples/webkitwidgets/simpleselector/window.ui
+index aa824df..7906186 100644
+--- a/examples/webkitwidgets/simpleselector/window.ui
++++ b/examples/webkitwidgets/simpleselector/window.ui
+@@ -64,7 +64,7 @@
+   <customwidget>
+    <class>QWebView</class>
+    <extends>QWidget</extends>
+-   <header>QtWebKit/QWebView</header>
++   <header>QtWebKitWidgets/QWebView</header>
+   </customwidget>
+  </customwidgets>
+  <resources/>
+diff --git a/examples/webkitwidgets/xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui b/examples/webkitwidgets/xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui
+index ad43284..000cae7 100644
+--- a/examples/webkitwidgets/xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui
++++ b/examples/webkitwidgets/xmlpatterns/qobjectxmlmodel/forms/mainwindow.ui
+@@ -188,7 +188,7 @@ p, li { white-space: pre-wrap; }
+   <customwidget>
+    <class>QWebView</class>
+    <extends>QWidget</extends>
+-   <header>QtWebKit/QWebView</header>
++   <header>QtWebKitWidgets/QWebView</header>
+   </customwidget>
+  </customwidgets>
+  <resources/>
+-- 
+2.20.1
+
