From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 09:01:52 +0100
Subject: [Buildroot] [git commit] opencv: add missing dependency on !MMU for
	gtk support
Message-ID: <20140224083835.70A209B97B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da02c35278206bf3aa9d1a47d28d0e4a5e5ba95f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgtk2 depends on !MMU, so when OpenCV selects Gtk, it should
propagate this dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 96ff6d8..b40e141 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -151,6 +151,7 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # libgtk2 -> glib2
 	select BR2_PACKAGE_LIBGTK2
 
 config BR2_PACKAGE_OPENCV_WITH_JPEG
