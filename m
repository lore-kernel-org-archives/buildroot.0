From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 31 Jan 2017 08:59:11 +0100
Subject: [Buildroot] [PATCH v6 9/9] package/python-pyqt5: add patch to fix
	build with Qt 5.8.0
In-Reply-To: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1485849551-20469-10-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 ...owOkButtonHint-and-WindowCancelButtonHint.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch

diff --git a/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch b/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
new file mode 100644
index 0000000..146cce0
--- /dev/null
+++ b/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
@@ -0,0 +1,27 @@
+From bb7cbdede46f72468bbb1b9bbefd43a1dbad21c0 Mon Sep 17 00:00:00 2001
+From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+Date: Mon, 30 Jan 2017 18:28:15 +0100
+Subject: [PATCH] remove WindowOkButtonHint and WindowCancelButtonHint from
+ qnamespace.sip as they are removed from qt5.8
+
+Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+---
+ sip/QtCore/qnamespace.sip | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/sip/QtCore/qnamespace.sip b/sip/QtCore/qnamespace.sip
+index 2db83b7..559f410 100644
+--- a/sip/QtCore/qnamespace.sip
++++ b/sip/QtCore/qnamespace.sip
+@@ -209,8 +209,6 @@ namespace Qt
+         WindowContextHelpButtonHint,
+         WindowShadeButtonHint,
+         WindowStaysOnTopHint,
+-        WindowOkButtonHint,
+-        WindowCancelButtonHint,
+         WindowStaysOnBottomHint,
+         WindowCloseButtonHint,
+         MacWindowToolBarButtonHint,
+-- 
+2.7.4
+
-- 
2.7.4
