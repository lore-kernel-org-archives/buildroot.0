From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 22:30:33 +0100
Subject: [Buildroot] [git commit] connman: switch to BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20160310213529.B96448184B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9900571b1d556bda423a113bfae3d1fb8e2078d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to BR2_TOOLCHAIN_HAS_SYNC_4 from BR2_sparc conditional since it's
the correct one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
