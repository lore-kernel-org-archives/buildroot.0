From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:14:01 +0200
Subject: [Buildroot] [git commit] package/mcelog: install init systemd
Message-ID: <20200919120604.CFB918B49C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9123b9027739de54276d2bd7c4369b5b2f9f6e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mcelog/mcelog.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index dcabc2c96f..9fbbbfb4d9 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -17,4 +17,9 @@ define MCELOG_INSTALL_TARGET_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
+define MCELOG_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/mcelog.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mcelog.service
+endef
+
 $(eval $(generic-package))
