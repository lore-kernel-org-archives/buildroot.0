From: Anssi Hannula <anssi.hannula@bitwise.fi>
Date: Fri, 13 Apr 2018 15:18:30 +0300
Subject: [Buildroot] [PATCH] systemd: add compatibility symlink for
 'shutdown'
Message-ID: <20180413121830.31570-1-anssi.hannula@bitwise.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition to the 'halt', 'poweroff', 'reboot' symlinks pointing to
systemctl, add 'shutdown'.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3bc322c..9600fe9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -329,6 +329,7 @@ define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
+	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/shutdown
 	ln -fs ../../../lib/systemd/system/multi-user.target \
 		$(TARGET_DIR)/etc/systemd/system/default.target
 endef
-- 
2.8.3
