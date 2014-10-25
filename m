From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:35:38 +0200
Subject: [Buildroot] [git commit] gst-ffmpeg: allow usage of ARMv6
	optimizations on ARMv7 platforms
Message-ID: <20141025103545.6C117AA3C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad937c7194341d2ac9ac62791e7a38832abec054
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contrary to the ffmpeg package, the gst-ffmpeg package was only
allowing ARMv6 optimizations on ARMv6 platforms. This commit also
allows ARMv6 optimizations on ARMv7 platforms, like the ffmpeg package
does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 5e55363..59b9323 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -54,7 +54,7 @@ endif
 ifeq ($(BR2_ARM_CPU_ARMV4),y)
 GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv5te
 endif
-ifeq ($(BR2_ARM_CPU_ARMV6),y)
+ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-armv6
 else
 GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
