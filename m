From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:46 +0200
Subject: [Buildroot] [git commit] imx-uxb-loader: use prefix instead of
	DESTDIR for host installation
Message-ID: <20170705141337.73F6C802F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a03760bbe5382e0f64f662dc4d183c416d96381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

prefix defaults to /usr, so setting DESTDIR installs things in
$(HOST_DIR)/usr.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imx-usb-loader/imx-usb-loader.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 1d2c23f..685fa9d 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -15,8 +15,7 @@ define HOST_IMX_USB_LOADER_BUILD_CMDS
 endef
 
 define HOST_IMX_USB_LOADER_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR=$(HOST_DIR) sysconfdir=/etc install
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
 endef
 
 $(eval $(host-generic-package))
