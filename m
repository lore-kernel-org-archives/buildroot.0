From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:38:14 +0100
Subject: [Buildroot] [git commit branch/next] gst-omapfb: Move download link
	away from Google Code
Message-ID: <20160225213837.A5D907F95B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c71d31a84ca74e6a1707d744456dbeefb6018b71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Google Code is being shut down. The google code site which hosts the
source .tar.gz references github/felipec, which has a gst-omapfb
repository with the same code as the tar.gz previously referenced.

Change the GST_OMAPFB_SITE to this github repo.

Signed-off-by: Alan Ott <alan@softiron.co.uk>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-omapfb/gst-omapfb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.mk b/package/gstreamer/gst-omapfb/gst-omapfb.mk
index bd545f9..c0bf690 100644
--- a/package/gstreamer/gst-omapfb/gst-omapfb.mk
+++ b/package/gstreamer/gst-omapfb/gst-omapfb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GST_OMAPFB_VERSION = 1.0
-GST_OMAPFB_SITE = http://gst-dsp.googlecode.com/files
+GST_OMAPFB_VERSION = v1.0
+GST_OMAPFB_SITE = $(call github,felipec,gst-omapfb,$(GST_OMAPFB_VERSION))
 
 define GST_OMAPFB_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
