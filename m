From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:04 -0500
Subject: [Buildroot] [PATCH 21/67] json-glib: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-22-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/json-glib/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
index 3ebc76d..db25386 100644
--- a/package/json-glib/Config.in
+++ b/package/json-glib/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_JSON_GLIB
 	bool "json-glib"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_JSON_GLIB
 
 	  https://live.gnome.org/JsonGlib/
 
-comment "json-glib requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "json-glib requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
