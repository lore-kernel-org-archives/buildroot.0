From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Sep 2020 13:11:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/mcelog: install init systemd
Message-ID: <20200919111138.367874-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mcelog/mcelog.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index dcabc2c96..9fbbbfb4d 100644
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
-- 
2.25.1
