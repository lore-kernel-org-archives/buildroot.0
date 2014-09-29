From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Sep 2014 16:52:35 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: bump version
Message-ID: <20140929153251.AFC789D535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99f85b80d74234e1776a06972a21e8e2d9dc7fc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add tarball hash from release announcement. Also drop v4l2 patch as it
is now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...v4l2allocator-O_CLOEXEC-needs-_GNU_SOURCE.patch |   34 --------------------
 .../gst1-plugins-good/gst1-plugins-good.hash       |    2 +
 .../gst1-plugins-good/gst1-plugins-good.mk         |    2 +-
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-01-gstv4l2allocator-O_CLOEXEC-needs-_GNU_SOURCE.patch b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-01-gstv4l2allocator-O_CLOEXEC-needs-_GNU_SOURCE.patch
deleted file mode 100644
index cf133e0..0000000
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-01-gstv4l2allocator-O_CLOEXEC-needs-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c1ccd15d95f4a649dc192c96005409693eb31d2c Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 15 Sep 2014 14:51:24 +0200
-Subject: [PATCH] gstv4l2allocator: O_CLOEXEC needs _GNU_SOURCE
-
-Similar to 94f3d6fc / bz 709423
-
-On some systems (E.G. uClibc and older Glibc versions), O_CLOEXEC is only
-defined when _GNU_SOURCE is specified, so do so.
-
-Upstream bugzilla: https://bugzilla.gnome.org/show_bug.cgi?id=736670
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- sys/v4l2/gstv4l2allocator.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/sys/v4l2/gstv4l2allocator.c b/sys/v4l2/gstv4l2allocator.c
-index 2bc51c4..a5c9626 100644
---- a/sys/v4l2/gstv4l2allocator.c
-+++ b/sys/v4l2/gstv4l2allocator.c
-@@ -21,6 +21,10 @@
- 
- #include "config.h"
- 
-+#ifndef _GNU_SOURCE
-+# define _GNU_SOURCE            /* O_CLOEXEC */
-+#endif
-+
- #include "ext/videodev2.h"
- #include "gstv4l2allocator.h"
- #include "v4l2_calls.h"
--- 
-2.1.0
-
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
new file mode 100644
index 0000000..27d6c44
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
+sha256	5876a74402f2a24d1d3ae9163c32466bdc7a565696dddeef65e6a9a93efc5537	gst-plugins-good-1.4.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 23d3876..d2bde80 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.4.1
+GST1_PLUGINS_GOOD_VERSION = 1.4.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
