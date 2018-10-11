From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:21:40 +0200
Subject: [Buildroot] [git commit] package/proftpd: add ftpasswd
Message-ID: <20181011152038.883EB82AB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4aaf61c4c1e8e20b4ab810e66a27e4f22f14010b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Copies over ftpasswd if perl is enabled

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proftpd/proftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 93ee687fab..8f3ff5088e 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -93,12 +93,16 @@ define PROFTPD_INSTALL_FTPQUOTA
 	$(INSTALL) -D -m 0755 $(@D)/contrib/ftpquota $(TARGET_DIR)/usr/sbin/ftpquota
 endef
 endif
+define PROFTPD_INSTALL_FTPASSWD
+	$(INSTALL) -D -m 0755 $(@D)/contrib/ftpasswd $(TARGET_DIR)/usr/sbin/ftpasswd
+endef
 endif
 
 define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
 	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf
 	$(PROFTPD_INSTALL_FTPQUOTA)
+	$(PROFTPD_INSTALL_FTPASSWD)
 endef
 
 define PROFTPD_USERS
