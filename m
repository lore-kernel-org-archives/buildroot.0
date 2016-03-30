From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 16:36:40 -0300
Subject: [Buildroot] [PATCH 2/2] gst1-libav: add license info
In-Reply-To: <1459366600-21925-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459366600-21925-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459366600-21925-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we use unbundled ffmpeg the licensing becomes much easier.
Relevant code is under ext/*, which according to COPYING and comments is
GPLv2+, except for ext/libswscale/gstffmpegscale.c which is LGPLv2+ -
however that's not built/used when using system ffmpeg.

The code under gst-libs/ is the bundled ffmpeg itself.

Tests are under LGPLv2+ as well but we don't build them since we
disabled gst-check support in the gstreamer1 package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 02ac394..d878ec8 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -12,5 +12,7 @@ GST1_LIBAV_DEPENDENCIES = \
 	host-pkgconf ffmpeg gstreamer1 gst1-plugins-base \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
 	$(if $(BR2_PACKAGE_XZ),xz)
+GST1_LIBAV_LICENSE = GPLv2+
+GST1_LIBAV_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
2.7.3
