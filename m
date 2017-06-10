From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:06:24 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5base: needs host gcc >= 4.8
	for icu support
Message-ID: <20170610210720.1719F817B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03f7e6d1be15f0e7e7d4e200dbe8daa7e5a372e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 3e6e895..2610f6b 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -258,6 +258,7 @@ config BR2_PACKAGE_QT5BASE_DBUS
 
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	select BR2_PACKAGE_ICU
@@ -265,9 +266,10 @@ config BR2_PACKAGE_QT5BASE_ICU
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
-comment "icu support needs a toolchain w/ gcc >= 4.8"
+comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
