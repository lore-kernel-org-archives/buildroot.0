From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jun 2020 21:39:48 +0200
Subject: [Buildroot] [git commit] package/open-plc-utils: install packages
 to /usr/bin
Message-ID: <20200618194015.2AA4B847A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35bbcde75c2cb0b0d4a823b67f7fb82f305762ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, open-plc-utils installs all of the compiled binaries to
/usr/local/bin which is not in the default path provided by Buildroot.

Passing BIN="$(TARGET_DIR)/usr/bin" to make install forces open-plc-utils to
install the compiled binaries to /usr/bin.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/open-plc-utils/open-plc-utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index e1e66bf7e0..3030301f7d 100644
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
