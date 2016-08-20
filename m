From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 Aug 2016 21:09:54 +0200
Subject: [Buildroot] [PATCH v1] qt5base: remove libudev dependency from kms
Message-ID: <1471720194-22686-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use upstream patch [1]

Fixes [2]:

  KMS auto-detection... ()
  Project ERROR: libudev development package not found
  KMS disabled.
   KMS support cannot be enabled due to functionality tests!
   Turn on verbose messaging (-v) to ./configure to see the final report.
   If you believe this message is in error you may use the continue
   switch (-continue) to ./configure to continue.

[1] https://code.qt.io/cgit/qt/qtbase.git/patch/?id=72492735b7b7770808fcc9fe067e8f03fab827fc
[2] http://autobuild.buildroot.net/results/063/063859ad460552dd7c101115500b7845045a134f

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...07-Remove-libudev-dependency-from-kms.pro.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/qt5/qt5base/0007-Remove-libudev-dependency-from-kms.pro.patch

diff --git a/package/qt5/qt5base/0007-Remove-libudev-dependency-from-kms.pro.patch b/package/qt5/qt5base/0007-Remove-libudev-dependency-from-kms.pro.patch
new file mode 100644
index 0000000..7ecbcd0
--- /dev/null
+++ b/package/qt5/qt5base/0007-Remove-libudev-dependency-from-kms.pro.patch
@@ -0,0 +1,33 @@
+From 0f1b4bb65abe0e36e9e4b9813e45192223509de8 Mon Sep 17 00:00:00 2001
+From: Ralf Nolden <nolden@kde.org>
+Date: Tue, 17 May 2016 12:57:17 +0200
+Subject: [PATCH] Remove libudev dependency from kms.pro
+
+To compile the kms qpa plugin, only libdrm is needed.
+Remove the libudev dependency for the compile check to enable
+building of the qpa plugin on platforms where libudev is not present
+such as BSD systems (but where KMS works)
+
+Change-Id: Icd0be70a8949578a6158d523428706890a9674eb
+Reviewed-by: Laszlo Agocs <laszlo.agocs@theqtcompany.com>
+Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
+
+Upstream: https://code.qt.io/cgit/qt/qtbase.git/patch/?id=72492735b7b7770808fcc9fe067e8f03fab827fc
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ config.tests/qpa/kms/kms.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config.tests/qpa/kms/kms.pro b/config.tests/qpa/kms/kms.pro
+index 1fb7367..5147bc8 100644
+--- a/config.tests/qpa/kms/kms.pro
++++ b/config.tests/qpa/kms/kms.pro
+@@ -1,4 +1,4 @@
+ SOURCES = kms.cpp
+ CONFIG += link_pkgconfig
+-PKGCONFIG += libdrm libudev
++PKGCONFIG += libdrm
+ CONFIG -= qt
+-- 
+2.8.1
+
-- 
2.8.1
