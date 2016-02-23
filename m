From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Feb 2016 13:48:09 -0300
Subject: [Buildroot] [PATCH] qt: depends on BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1456246089-19346-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses __sync_add_and_fetch_4() and other 32-bit atomics, fixes:
http://autobuild.buildroot.net/results/7ac/7acdbc54e26ad2ba4756512614192be0a086f563/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/opencv/Config.in      | 1 +
 package/pinentry/Config.in    | 1 +
 package/python-pyqt/Config.in | 2 ++
 package/python-sip/Config.in  | 2 ++
 package/qt/Config.in          | 2 ++
 5 files changed, 8 insertions(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 8bc6c34..8ebca21 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -210,6 +210,7 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # qt
 	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index f5a8159..8f6bdb9 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -40,6 +40,7 @@ config BR2_PACKAGE_PINENTRY_QT4
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
diff --git a/package/python-pyqt/Config.in b/package/python-pyqt/Config.in
index a50cb74..f2d06c4 100644
--- a/package/python-pyqt/Config.in
+++ b/package/python-pyqt/Config.in
@@ -1,5 +1,6 @@
 comment "python-pyqt needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PYTHON_PYQT
@@ -7,6 +8,7 @@ config BR2_PACKAGE_PYTHON_PYQT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
 	depends on BR2_USE_MMU # qt
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_PYTHON_SIP
 	help
diff --git a/package/python-sip/Config.in b/package/python-sip/Config.in
index 45e48ad..9a4296a 100644
--- a/package/python-sip/Config.in
+++ b/package/python-sip/Config.in
@@ -1,5 +1,6 @@
 comment "python-sip needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PYTHON_SIP
@@ -7,6 +8,7 @@ config BR2_PACKAGE_PYTHON_SIP
 	depends on BR2_INSTALL_LIBSTDCPP # qt
 	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
 	depends on BR2_USE_MMU # qt
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # qt
 	select BR2_PACKAGE_QT
 	help
 	  SIP is a tool that makes it very easy to create Python
diff --git a/package/qt/Config.in b/package/qt/Config.in
index bf14724..06444ed 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -1,5 +1,6 @@
 comment "qt needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_QT
@@ -7,6 +8,7 @@ menuconfig BR2_PACKAGE_QT
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.4.10
