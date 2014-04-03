From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:36:17 +0200
Subject: [Buildroot] [git commit] Revert "gst1-libav: fix build for xtensa"
Message-ID: <20140403193845.377809A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a2ff09b8c094f723e68ac2d72a1fd85acc9a08f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ae3298d7d489f5ee465ff4ce83494de527d0ac73.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index fb272e6..50dd1df 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -83,12 +83,4 @@ endif
 GST1_LIBAV_CONF_OPT = \
 	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPT)"
 
-GST1_LIBAV_CFLAGS = $(TARGET_CFLAGS)
-
-ifeq ($(BR2_xtensa),y)
-GST1_LIBAV_CFLAGS += -mtext-section-literals
-endif
-
-GST1_LIBAV_CONF_ENV += CFLAGS="$(GST1_LIBAV_CFLAGS)"
-
 $(eval $(autotools-package))
