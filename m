From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 26 Jan 2017 15:04:19 +0100
Subject: [Buildroot] [PATCH v5 08/10] python-pyqt5: Depend directly on Qt5
	rather than its toolchain requirements
In-Reply-To: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1485439461-4797-9-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
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
1.9.1
