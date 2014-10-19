From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:40 +0200
Subject: [Buildroot] [PATCH 06/31] gst-ffmpeg: allow usage of ARMv6
	optimizations on ARMv7 platforms
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contrary to the ffmpeg package, the gst-ffmpeg package was only
allowing ARMv6 optimizations on ARMv6 platforms. This commit also
allows ARMv6 optimizations on ARMv7 platforms, like the ffmpeg package
does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index df10c33..9234497 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -54,7 +54,7 @@ endif
 ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV4T),y)
 GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv5te
 endif
-ifeq ($(BR2_ARM_CPU_ARMV6J)$(BR2_ARM_CPU_ARMV6ZK),y)
+ifeq ($(BR2_ARM_CPU_ARMV6J)$(BR2_ARM_CPU_ARMV6ZK)$(BR2_ARM_CPU_ARMV7A),y)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-armv6
 else
 GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
-- 
2.0.0
