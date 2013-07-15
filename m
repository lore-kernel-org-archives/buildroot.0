From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:48 -0500
Subject: [Buildroot] [PATCH 65/67] gstreamer1: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-66-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/gstreamer1/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gstreamer1/Config.in b/package/multimedia/gstreamer1/Config.in
index 627814c..69a87f3 100644
--- a/package/multimedia/gstreamer1/Config.in
+++ b/package/multimedia/gstreamer1/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GSTREAMER1
 	bool "gstreamer1"
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework. This 1.x version of
@@ -49,5 +49,5 @@ config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
 
 endif
 
-comment "gstreamer1 requires a toolchain with WCHAR and threads support"
+comment "gstreamer1 requires a toolchain with WCHAR and threading support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
