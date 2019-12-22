From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:27:41 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/sysrepo: fix a
 typo when installing with systemd
Message-ID: <20191222204328.1077E8D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f3fb5bcc946c4f9a769c727737ba971617e57cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Acked-by: Heiko Thiery <heiko.thiery at kontron.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 22a0151179abd7ac36f60b9ac802c5b902f470f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysrepo/sysrepo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 8676158a19..49c908d62d 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -42,7 +42,7 @@ define SYSREPO_INSTALL_INIT_SYSV
 endef
 
 define SYSREPO_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/systemd/multi-user.target.wants
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/sysrepod.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/sysrepo-plugind.service \
