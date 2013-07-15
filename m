From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:17 -0500
Subject: [Buildroot] [PATCH 34/67] midori: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-35-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/midori/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 41f4515..207e3ca 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
+	depends on BR2_TOOLCHAIN_HAS_THREADS # webkit -> enchant -> libglib2
 	depends on BR2_USE_WCHAR	 # webkit
 	help
 	  Midori is a lightweight web browser based on WebKit
-- 
1.8.1.2
