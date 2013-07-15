From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:22 -0500
Subject: [Buildroot] [PATCH 39/67] ofono: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-40-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/ofono/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 6248544..f1b6a53 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OFONO
 	bool "ofono"
-	depends on BR2_USE_WCHAR # gettext/libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_WCHAR # gettext, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
@@ -14,6 +14,5 @@ config BR2_PACKAGE_OFONO
 
 	  http://ofono.org/
 
-comment "ofono requires a toolchain with WCHAR and thread support"
-	depends on !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+comment "ofono requires an MMU and toolchain with WCHAR and thread support"
+	depends on !BR2_USE_MMU || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
