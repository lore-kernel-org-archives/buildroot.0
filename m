From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 21 Jan 2018 21:57:02 -0800
Subject: [Buildroot] [PATCH 1/1] gconf: add dependency on toolchain w/
 dynamic lib
Message-ID: <20180122055702.6740-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

This patch fixes some recent build issues caused by BR2_STATIC_LIBS=y.

 package/gconf/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gconf/Config.in b/package/gconf/Config.in
index a68287525b..a967d61644 100644
--- a/package/gconf/Config.in
+++ b/package/gconf/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GCONF
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBGLIB2
@@ -14,6 +15,7 @@ config BR2_PACKAGE_GCONF
 
 	  https://projects.gnome.org/gconf/
 
-comment "gconf needs a toolchain w/ threads, wchar"
+comment "gconf needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS
-- 
2.16.0
