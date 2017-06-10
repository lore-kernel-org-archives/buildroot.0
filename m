From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 11:15:12 +0200
Subject: [Buildroot] [PATCH 3/4] package/qt5/qt5base: needs host gcc >= 4.8
	for icu support
Message-ID: <20170610091513.29031-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt5/qt5base/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 3e6e89505..2610f6bd2 100644
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
-- 
2.11.0
