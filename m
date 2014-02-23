From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 23:58:08 +0100
Subject: [Buildroot] [PATCH 4/7] opencv: add missing dependency on !MMU for
	gtk support
In-Reply-To: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393196291-12636-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgtk2 depends on !MMU, so when OpenCV selects Gtk, it should
propagate this dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 9e952ca..94688cb 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -151,6 +151,7 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # libgtk2 -> glib2
 	select BR2_PACKAGE_LIBGTK2
 
 config BR2_PACKAGE_OPENCV_WITH_JPEG
-- 
1.8.3.2
