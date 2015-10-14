From: Alan Ott <alan@softiron.co.uk>
Date: Wed, 14 Oct 2015 17:51:20 -0400
Subject: [Buildroot] [PATCH 2/5] gst-dsp: Move download link away from
	Google Code
In-Reply-To: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
Message-ID: <1444859483-2268-3-git-send-email-alan@softiron.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is being shut down. The google code site which hosts the
source .tar.gz references github/felipec, which has a gst-dsp repository
with the same code as the tar.gz previously referenced.

Change the GST_DSP_SITE to this github repo.

Signed-off-by: Alan Ott <alan@softiron.co.uk>
---
 package/gstreamer/gst-dsp/gst-dsp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-dsp/gst-dsp.mk b/package/gstreamer/gst-dsp/gst-dsp.mk
index d9e202d..dedffb9 100644
--- a/package/gstreamer/gst-dsp/gst-dsp.mk
+++ b/package/gstreamer/gst-dsp/gst-dsp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GST_DSP_VERSION = 0.10.2
-GST_DSP_SITE = http://gst-dsp.googlecode.com/files
+GST_DSP_VERSION = v0.10.2
+GST_DSP_SITE = $(call github,felipec,gst-dsp,$(GST_DSP_VERSION))
 
 define GST_DSP_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
-- 
2.1.4
