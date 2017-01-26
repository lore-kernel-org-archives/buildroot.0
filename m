From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 26 Jan 2017 15:04:20 +0100
Subject: [Buildroot] [PATCH v5 09/10] python-pyqt: Depend directly on Qt
	rather than its toolchain requirements
In-Reply-To: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1485439461-4797-10-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/python-pyqt/Config.in | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/python-pyqt/Config.in b/package/python-pyqt/Config.in
index a50cb74..6934a4c 100644
--- a/package/python-pyqt/Config.in
+++ b/package/python-pyqt/Config.in
@@ -1,13 +1,9 @@
-comment "python-pyqt needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "python-pyqt needs Qt4"
+	depends on !BR2_PACKAGE_QT
 
 config BR2_PACKAGE_PYTHON_PYQT
 	bool "python-pyqt"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # qt
-	depends on BR2_USE_MMU # qt
-	select BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_QT
 	select BR2_PACKAGE_PYTHON_SIP
 	help
 	  PyQt4 for Qt Embedded 4 bindings.
-- 
1.9.1
