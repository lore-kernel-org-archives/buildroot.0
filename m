From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:52 +0100
Subject: [Buildroot] [PATCH 20/51] olsr: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-21-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/olsr.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 1051d18..539386d 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -31,9 +31,12 @@ define OLSR_INSTALL_TARGET_CMDS
 			LDCONFIG=/bin/true DESTDIR=$(TARGET_DIR) \
 			prefix="/usr" install ; \
 	done
-	$(INSTALL) -D -m 0755 package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/S50olsr
 	test -r $(TARGET_DIR)/etc/olsrd.conf || \
 		$(INSTALL) -D -m 0644 $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
 endef
 
+define OLSR_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/S50olsr
+endef
+
 $(eval $(generic-package))
-- 
2.1.0
