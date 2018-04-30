From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 22:41:01 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] systemd: add
 compatibility symlink for 'shutdown'
Message-ID: <20180501073415.3F30B7FE9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=178e4f27aec523fc7f6f3ad370cc1c4dc7194feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

In addition to the 'halt', 'poweroff', 'reboot' symlinks pointing to
systemctl, add 'shutdown'.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 36ed046623129bb879ef50cd40dcc65b27c9da0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3bc322cd51..9600fe9eb0 100644
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
