From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 22:06:51 -0300
Subject: [Buildroot] [PATCH] connman: switch to BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1457572011-2749-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to BR2_TOOLCHAIN_HAS_SYNC_4 from BR2_sparc conditional since it's
the correct one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/connman/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 270938e..f723a31 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # needs dlopen()
-	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
@@ -68,5 +68,5 @@ endif # BR2_PACKAGE_CONNMAN
 
 comment "connman needs a toolchain w/ wchar, threads, resolver, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_sparc
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.4.10
