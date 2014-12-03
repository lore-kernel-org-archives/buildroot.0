From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 23:26:21 +0100
Subject: [Buildroot] [git commit] rp-pppoe: install default conf file
Message-ID: <20141203222707.0284880096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5f0e93d2cc6107cce249e1f11158aeccb4a3449
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Acked-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rp-pppoe/rp-pppoe.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
