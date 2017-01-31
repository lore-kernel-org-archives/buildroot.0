From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 31 Jan 2017 08:59:10 +0100
Subject: [Buildroot] [PATCH v6 8/9] python-pyqt5: Depend directly on Qt5
	rather than its toolchain requirements
In-Reply-To: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1485849551-20469-9-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Naumann Andreas <ANaumann@ultratronik.de>

 When pyqt5 is used it's obvious that qt5 needs to be selected and configured
by the user, hence we enforce it by making pyqt5 depending on qt5, rather than
selecting it and depending only on the qt5 requirements.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/python-pyqt5/Config.in | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
index 4eca68a..20ac988 100644
--- a/package/python-pyqt5/Config.in
+++ b/package/python-pyqt5/Config.in
@@ -1,16 +1,9 @@
-comment "python-pyqt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
-	depends on !BR2_PACKAGE_QT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "python-pyqt5 needs Qt5"
+	depends on !BR2_PACKAGE_QT5
 
 config BR2_PACKAGE_PYTHON_PYQT5
 	bool "python-pyqt5"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # qt5
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
-	depends on !BR2_STATIC_LIBS # qt5
-	depends on !BR2_PACKAGE_QT # qt5
-	select BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_PYTHON_SIP
 	help
 	  Python bindings for Qt 5
-- 
2.7.4
