From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 21:12:31 +0200
Subject: [Buildroot] [git commit] systemd: add compatibility symlink for
 'shutdown'
Message-ID: <20180415191234.C121188625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36ed046623129bb879ef50cd40dcc65b27c9da0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition to the 'halt', 'poweroff', 'reboot' symlinks pointing to
systemctl, add 'shutdown'.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 76b7e8382f..db7fb43636 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -340,6 +340,7 @@ define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
+	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/shutdown
 	ln -fs ../../../lib/systemd/system/multi-user.target \
 		$(TARGET_DIR)/etc/systemd/system/default.target
 endef
