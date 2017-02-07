From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2017 17:46:48 +0100
Subject: [Buildroot] [git commit] python-pyqt: use 'depends on' rather than
	'select' for Qt
Message-ID: <20170207164722.F1F1D8215E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac73162553699d0a1f21e4d1a766b0b772d77b08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When pyqt is used it's obvious that qt needs to be selected and
configured by the user, hence we enforce it by making pyqt depending on
qt, rather than selecting it and depending only on the qt requirements.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
