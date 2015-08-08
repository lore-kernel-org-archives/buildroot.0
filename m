From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:41 -0000
Subject: [Buildroot] [git commit branch/next] minidlna: fix systemd service
	activation symlink
Message-ID: <20150808105631.3333A7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dcd309f333ed4334de2f58a173d6c23625fc2b79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minidlna/minidlna.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 7adb832..3a9ad41 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -37,11 +37,11 @@ endef
 
 define MINIDLNA_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0755 package/minidlna/minidlnad.service \
-		$(TARGET_DIR)/lib/systemd/system/minidlnad.service
+		$(TARGET_DIR)/usr/lib/systemd/system/minidlnad.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../minidlnad.service \
+	ln -fs  ../../../../usr/lib/systemd/system/minidlnad.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/minidlnad.service
 endef
 
