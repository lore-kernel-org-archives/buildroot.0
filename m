From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 22:37:53 +0100
Subject: [Buildroot] [git commit] package/gst1-imx: make it a waf-package
Message-ID: <20161202225223.38427800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bf46c647ba6f77c7394423fa77dde4c719d146f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-imx/gst1-imx.mk | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 71b4e1e..b1d01bb 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -14,7 +14,6 @@ GST1_IMX_INSTALL_STAGING = YES
 
 GST1_IMX_DEPENDENCIES += \
 	host-pkgconf \
-	host-python \
 	gstreamer1 \
 	gst1-plugins-base
 
@@ -53,21 +52,4 @@ endif
 endif
 endif
 
-define GST1_IMX_CONFIGURE_CMDS
-	cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(HOST_DIR)/usr/bin/python2 ./waf configure $(GST1_IMX_CONF_OPTS)
-endef
-
-define GST1_IMX_BUILD_CMDS
-	cd $(@D); \
-		$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
-endef
-
-define GST1_IMX_INSTALL_TARGET_CMDS
-	cd $(@D); \
-		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
-		install
-endef
-
-$(eval $(generic-package))
+$(eval $(waf-package))
