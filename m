From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 17 Jun 2020 15:21:59 -0700
Subject: [Buildroot] [PATCH 2/2] package/open-plc-utils: install packages to
 /usr/bin
In-Reply-To: <20200617222159.176141-1-aduskett@gmail.com>
References: <20200617222159.176141-1-aduskett@gmail.com>
Message-ID: <20200617222159.176141-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

By default, open-plc-utils installs all of the compiled binaries to
/usr/local/bin which is not in the default path provided by Buildroot.

Passing BIN="$(TARGET_DIR)/usr/bin" to make install forces open-plc-utils to
install the compiled binaries to /usr/bin.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/open-plc-utils/open-plc-utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index bb40432697..d2ac39aca4 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -26,7 +26,8 @@ define OPEN_PLC_UTILS_BUILD_CMDS
 endef
 
 define OPEN_PLC_UTILS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) ROOTFS=$(TARGET_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) ROOTFS=$(TARGET_DIR) \
+		BIN="$(TARGET_DIR)/usr/bin" -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.26.2
