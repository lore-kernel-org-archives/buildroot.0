From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 Feb 2012 15:42:35 +0100
Subject: [Buildroot] [git commit] gst-dsp: add dependency to pkg-config
Message-ID: <20120211170149.C732190A67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6a3b7bff287442038465882c6b7798879eb2bc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's used in the Makefile.

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
