From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 11 Feb 2012 02:04:34 +0200
Subject: [Buildroot] [PATCH 1/3] gst-dsp: add dependency to pkg-config
In-Reply-To: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1328918676-19482-2-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's used in the Makefile.

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 package/multimedia/gst-dsp/gst-dsp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index 549c553..b79ccf1 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -13,6 +13,6 @@ define GST_DSP_UNINSTALL_TARGET_CMDS
 	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstdsp.so
 endef
 
-GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries
+GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries host-pkg-config
 
 $(eval $(call GENTARGETS))
-- 
1.7.9.1.g97f7d
