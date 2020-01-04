From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Jan 2020 19:45:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/bustle: select dbus instead of
 depending on it
Message-ID: <20200104184513.2369600-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bustle/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/bustle/Config.in b/package/bustle/Config.in
index 109ebdeed8..b3d321e14b 100644
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_BUSTLE
 	bool "bustle"
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
-	depends on BR2_PACKAGE_DBUS # runtime
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
+	depends on BR2_USE_MMU # dbus, libglib2
+	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -22,5 +22,4 @@ config BR2_PACKAGE_BUSTLE
 
 comment "bustle needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_DBUS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.24.0
