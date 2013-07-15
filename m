From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 10:04:02 -0500
Subject: [Buildroot] [PATCH 1/1] libglib2: needs threads
Message-ID: <1373900642-9049-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See autobuild failures

http://autobuild.buildroot.net/results/d1fb882fe4d22a17bdd438360da515011dda2b30/build-end.log
http://autobuild.buildroot.net/results/b66e807769ead5caa3e3b6312e9f7c35c14eafe7/build-end.log
http://autobuild.buildroot.net/results/9c3fa0c5003a6369e70bfe6d611f7d745742a8c7/build-end.log

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libglib2/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 5282885..0ee53b7 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -5,10 +5,12 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
 	  http://www.gtk.org/
 
-comment "libglib2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libglib2 requires a toolchain with WCHAR support and threading
+support"
+	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.2
