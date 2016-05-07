From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 14:29:13 +0200
Subject: [Buildroot] [git commit] bluez5_utils: start systemd service on boot
Message-ID: <20160507122957.E3E517F935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d732fa48d15c40ab4ffc17cddbb2a9a7378b8ce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/bluez5_utils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 0a76738..659f05d 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -79,4 +79,10 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
 endif
 
+define BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+	ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/bluetooth.service
+endef
+
 $(eval $(autotools-package))
