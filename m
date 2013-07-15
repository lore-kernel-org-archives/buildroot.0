From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:37 -0500
Subject: [Buildroot] [PATCH 54/67] vala: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-55-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/vala/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/vala/Config.in b/package/vala/Config.in
index 805c770..35c0257 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_VALA
 	# We no longer support a toolchain on the target
 	depends on BR2_DEPRECATED
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -11,5 +12,5 @@ config BR2_PACKAGE_VALA
 
 	  http://live.gnome.org/Vala
 
-comment "vala requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "vala requires a toolchain with WCHAR and threading support"
+	depends on BR2_DEPRECATED && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.2
