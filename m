From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Mar 2019 15:55:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/gst1-libav: fix syntax error
Message-ID: <20190329145547.11080-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 8450c34a07..97e069a35f 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -83,7 +83,7 @@ else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-vfp
 endif
 
-ifeq ($(BR2_POWERPC_CPU_HASH_ALTIVEC),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --enable-altivec
 else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-altivec
-- 
2.14.1
