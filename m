From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:14 -0500
Subject: [Buildroot] [PATCH 31/67] libsoup: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-32-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minor cleanup as well

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libsoup/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 2ed08d9..b80cb63 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
 	depends on BR2_USE_WCHAR # glib2 and gnutls
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
@@ -12,13 +13,16 @@ config BR2_PACKAGE_LIBSOUP
 
 	  http://live.gnome.org/LibSoup
 
+if BR2_PACKAGE_LIBSOUP
+
 config BR2_PACKAGE_LIBSOUP_SSL
 	bool "https support"
 	select BR2_PACKAGE_GLIB_NETWORKING
 	select BR2_PACKAGE_GNUTLS
-	depends on BR2_PACKAGE_LIBSOUP
 	help
 	  Enable HTTPS (SSL) support.
 
-comment "libsoup requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+endif
+
+comment "libsoup requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
