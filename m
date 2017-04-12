From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:20 +0200
Subject: [Buildroot] [PATCH 46/53] imx-uxb-loader: use prefix instead of
	DESTDIR for host installation
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-47-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

prefix defaults to /usr, so setting DESTDIR installs things in
$(HOST_DIR)/usr.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/imx-usb-loader/imx-usb-loader.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 1d2c23f825..685fa9d24a 100644
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
-- 
2.11.0
