From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:14 +0100
Subject: [Buildroot] [PATCH 16/21] opencv: add missing indirect dependency
	on atomics for gtk support
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-17-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opencv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index d648e5e..c444d65 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -160,6 +160,7 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libgtk2 -> glib2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
 	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_LIBGTK2
 
-- 
2.1.4
