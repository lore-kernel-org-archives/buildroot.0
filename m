From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:59 -0500
Subject: [Buildroot] [PATCH 16/67] glib-networking: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-17-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/glib-networking/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index dab35ea..8d106f5 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Network-related GIO modules for glib.
 
-comment "glib-networking requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "glib-networking requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
