From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jul 2010 16:27:09 +0200
Subject: [Buildroot] [git commit master 1/1] libgtk2: mark DirectFB backend
	as deprecated
Message-ID: <20100728152234.5FC0C83664@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ad520824a2d9070e379851079a3ad8f7b20bcccd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgtk2 on DirectFB is deprecated because it is no longer supported in
recent versions of Gtk. We will remove support for Gtk over DirectFB
in the next Buildroot version unless support for DirectFB in mainline
Gtk is improved in the mean time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 5eec77a..3d15f4c 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -6,7 +6,12 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_CAIRO_PDF
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
-	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
+	# libgtk2 on DirectFB is deprecated because it is no longer
+	# supported in recent versions of Gtk. We will remove support
+	# for Gtk over DirectFB in the next Buildroot version unless
+	# support for DirectFB in mainline Gtk is improved in the mean
+	# time.
+	depends on BR2_PACKAGE_XORG7||(BR2_PACKAGE_DIRECTFB && BR2_DEPRECATED)
 	depends on BR2_USE_WCHAR # glib2
 	help
 	  The GTK+ version 2 graphical user interface library
-- 
1.7.1
