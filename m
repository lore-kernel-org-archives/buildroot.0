From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:26 -0500
Subject: [Buildroot] [PATCH 43/67] pcmanfm: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-44-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/pcmanfm/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 484192b..5c80c10 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -12,5 +13,6 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 
-comment "pcmanfm requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
+comment "pcmanfm requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_XORG7 && \
+	(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.2
