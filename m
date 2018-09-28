From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri, 28 Sep 2018 12:57:39 -0500
Subject: [Buildroot] [PATCH v2 2/2] package/proftpd: add ftpasswd
In-Reply-To: <1538157459-10690-1-git-send-email-jared.bents@rockwellcollins.com>
References: <1538157459-10690-1-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <1538157459-10690-2-git-send-email-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Copies over ftpasswd if perl is enabled

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
Changes
v1 -> v2
 - ftpasswd moved to separate patch as it is not related to the added
   mod_{sql, quotatab} support
---
 package/proftpd/proftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 78be759..12886a2 100644
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
-- 
1.9.1
