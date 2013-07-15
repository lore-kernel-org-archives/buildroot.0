From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:11 -0500
Subject: [Buildroot] [PATCH 28/67] libplayer: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-29-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libplayer/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index df32901..e1b7f75 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -21,9 +21,10 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
 	bool "gstreamer backend"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_GSTREAMER
 
-comment "gstreamer backend requires a toolchain with WCHAR support"
+comment "gstreamer backend requires a toolchain with WCHAR and threading support"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_LIBPLAYER_PYTHON
-- 
1.8.1.2
