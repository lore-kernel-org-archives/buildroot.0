From: Ryan Coe <bluemrp9@gmail.com>
Date: Tue,  2 Dec 2014 15:21:02 -0800
Subject: [Buildroot] [PATCH 1/2] rp-pppoe: install default conf file
Message-ID: <1417562463-26561-1-git-send-email-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/rp-pppoe/rp-pppoe.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 4e17f2d..70b4437 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -18,6 +18,8 @@ RP_PPPOE_CONF_ENV = \
 	PPPD_H=$(PPPD_DIR)/pppd/pppd.h
 
 define RP_PPPOE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/configs/pppoe.conf \
+		$(TARGET_DIR)/etc/ppp/pppoe.conf
 	for ff in $(RP_PPPOE_TARGET_FILES); do \
 		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
 	done
-- 
2.2.0
