From: Steve Kenton <skenton@ou.edu>
Date: Mon,  2 Feb 2015 22:35:06 +0000
Subject: [Buildroot] [PATCH 1/1] The mjpegtools programs are a set of tools
	that can do recording of videos and playback,
	simple cut-and-paste editing and the MPEG compression of audio and
	video under Linux.
Message-ID: <1422916506-3200-1-git-send-email-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://mjpeg.sourceforge.net
Signed-off-by: Steve Kenton <skenton@ou.edu>
---
 package/Config.in                  |  1 +
 package/mjpegtools/Config.in       | 15 +++++++++++++++
 package/mjpegtools/mjpegtools.hash |  3 +++
 package/mjpegtools/mjpegtools.mk   | 13 +++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/mjpegtools/Config.in
 create mode 100644 package/mjpegtools/mjpegtools.hash
 create mode 100644 package/mjpegtools/mjpegtools.mk

diff --git a/package/Config.in b/package/Config.in
index 0f5836b..8e586c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -19,6 +19,7 @@ menu "Audio and video applications"
 	source "package/lame/Config.in"
 	source "package/libvpx/Config.in"
 	source "package/madplay/Config.in"
+	source "package/mjpegtools/Config.in"
 	source "package/modplugtools/Config.in"
 	source "package/mpd/Config.in"
 	source "package/mpd-mpc/Config.in"
diff --git a/package/mjpegtools/Config.in b/package/mjpegtools/Config.in
new file mode 100644
index 0000000..f5d2208
--- /dev/null
+++ b/package/mjpegtools/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MJPEGTOOLS
+	bool "mjpegtools"
+	select BR2_PACKAGE_JPEG
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The mjpegtools programs are a set of tools
+	  that can do recording of videos and playback,
+	  simple cut-and-paste editing and the MPEG
+	  compression of audio and video under Linux.
+
+	  http://mjpeg.sourceforge.net
+
+comment "mjpegtools needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mjpegtools/mjpegtools.hash b/package/mjpegtools/mjpegtools.hash
new file mode 100644
index 0000000..db184f7
--- /dev/null
+++ b/package/mjpegtools/mjpegtools.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/mjpeg/files/mjpegtools/2.1.0/
+md5	57bf5dd78976ca9bac972a6511b236f3	mjpegtools-2.1.0.tar.gz
+sha1	b9effa86280e23d67369e842e5cb645948583097	mjpegtools-2.1.0.tar.gz
diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
new file mode 100644
index 0000000..34959265
--- /dev/null
+++ b/package/mjpegtools/mjpegtools.mk
@@ -0,0 +1,13 @@
+###############################################################################
+#
+# mjpegtools
+#
+###############################################################################
+
+MJPEGTOOLS_VERSION = 2.1.0
+MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
+MJPEGTOOLS_DEPENDENCIES = jpeg
+MJPEGTOOLS_LICENSE = GPLv2
+MJPEGTOOLS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.9.1
