From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Oct 2020 13:06:20 +0100
Subject: [Buildroot] [git commit] package/gst-omx: fix gstomx.conf
 installation for raspberry
Message-ID: <20201027115627.EB8648632E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7ee3abf565eaedc70f12f597327ca123445ef21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit 7e6f4e5 introduces a new bug when building the gst-omx package
for the raspberry.

GST_OMX_VARIANT variable in gst-omx.mk was shadowed to 'generic' after being
set well for raspberry. It results having the gstomx.conf not being installed,
and thus having gst-omx installed but none of its features available.

Signed-off-by: Augustin Thiercelin <augustin.thiercelin@outlook.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst-omx/gst-omx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index cdd0e86b04..9e35ff3d04 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -20,6 +20,7 @@ GST_OMX_CONF_OPTS = \
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 GST_OMX_VARIANT = rpi
 GST_OMX_CONF_OPTS += -Dheader_path=$(STAGING_DIR)/usr/include/IL
+else
 GST_OMX_VARIANT = generic
 endif
 
