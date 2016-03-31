From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:23:03 +0200
Subject: [Buildroot] [git commit] gst1-libav: add license info
Message-ID: <20160331014351.2638A801F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3025e84409f16407e50fd5f41e7cfd6c22066cee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we use unbundled ffmpeg the licensing becomes much easier.
Relevant code is under ext/*, which according to COPYING and comments is
GPLv2+, except for ext/libswscale/gstffmpegscale.c which is LGPLv2+ -
however that's not built/used when using system ffmpeg.

The code under gst-libs/ is the bundled ffmpeg itself.

Tests are under LGPLv2+ as well but we don't build them since we
disabled gst-check support in the gstreamer1 package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
