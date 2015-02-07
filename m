From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:22:19 +0100
Subject: [Buildroot] [git commit] opencv: add missing indirect dependency on
	atomics for gtk support
Message-ID: <20150207202910.8C9658046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a91527b657458534b3b781bfb03b326d1725f7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
