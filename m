From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:37:57 +0100
Subject: [Buildroot] [git commit] gst-dsp: Move download link away from
	Google Code
Message-ID: <20160302202758.3495F7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac5a2f5e36ba487d184bef8a12d754121023a26a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google Code is being shut down. The google code site which hosts the
source .tar.gz references github/felipec, which has a gst-dsp repository
with the same code as the tar.gz previously referenced.

Change the GST_DSP_SITE to this github repo.

Signed-off-by: Alan Ott <alan@softiron.co.uk>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
