From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 30 Jul 2015 18:01:37 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/eudev: add libselinux dependency
Message-ID: <1438272098-28557-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
v2: Don't disable selinux support for musl toolchains (Thomas)
---
 package/eudev/eudev.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 87bce3e..f587acd 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -44,6 +44,13 @@ else
 EUDEV_CONF_OPTS += --disable-gudev
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+EUDEV_CONF_OPTS += --enable-selinux
+EUDEV_DEPENDENCIES += libselinux
+else
+EUDEV_CONF_OPTS += --disable-selinux
+endif
+
 define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
-- 
2.4.3
