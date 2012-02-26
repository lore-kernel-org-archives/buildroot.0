From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 10:13:32 -0200
Subject: [Buildroot] [PATCH 3/3] qt: Patch to disable some tools that give
	link-time issues
In-Reply-To: <1330258412-28426-1-git-send-email-ismael.luceno@gmail.com>
References: <1330258412-28426-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <1330258412-28426-3-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt/qt-tools-qml-only.patch |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/qt/qt-tools-qml-only.patch

diff --git a/package/qt/qt-tools-qml-only.patch b/package/qt/qt-tools-qml-only.patch
new file mode 100644
index 0000000..c61db55
--- /dev/null
+++ b/package/qt/qt-tools-qml-only.patch
@@ -0,0 +1,20 @@
+--- a/tools/tools.pro	2012-02-20 23:18:32.978137903 -0200
++++ b/tools/tools.pro	2012-02-20 23:18:08.283955958 -0200
+@@ -8,6 +8,6 @@
+             SUBDIRS = designer
+         } else:wince* {
+             SUBDIRS = qtestlib designer
+-        } else {
++        } else:!embedded {
+             SUBDIRS = assistant \
+                       pixeltool \
+@@ -29,8 +29,8 @@
+     }
+ }
+ 
+-!wince*:!symbian:SUBDIRS += linguist
++!embedded:!wince*:!symbian:SUBDIRS += linguist
+ 
+ mac {
+     SUBDIRS += macdeployqt
+ }
-- 
1.7.9.1
