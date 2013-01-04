From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 11:28:54 +0100
Subject: [Buildroot] [git commit] enlightenment: needs C++ support because
	of libevas-generic-loaders-svg
Message-ID: <20130104102951.8941A9A600@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09556938df5d46d08f0dc22d7c8c15b84183b9f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Which pulls in pango.

Fixes http://autobuild.buildroot.net/results/d6c9ea1c293d1784e35ddecc0b02d108756c5cfd/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/enlightenment/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 4978367..c2944b9 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -16,8 +16,9 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
-	# libevas-generic-loaders-svg -> librsvg -> glib2
+	# libevas-generic-loaders-svg -> librsvg -> glib2 / pango
 	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
 	# libedbus -> dbus
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libedbus -> dbus
@@ -32,6 +33,6 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment requires WCHAR and thread support in toolchain"
+comment "enlightenment requires WCHAR, C++ and thread support in toolchain"
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
