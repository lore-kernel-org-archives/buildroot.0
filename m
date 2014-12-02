From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  2 Dec 2014 09:13:08 +0200
Subject: [Buildroot] [PATCH] sysklogd: fix redundant newline escape
Message-ID: <85c2022d971aa5071bb3749addae8808cce2763f.1417504388.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Broken since 428f1e7e70c6b (sysklogd: install configuration file
unconditionally). Fixes:

package/sysklogd/sysklogd.mk:21: *** missing 'endef', unterminated 'define'.  Stop.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sysklogd/sysklogd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 1e8652d1a56f..de2edf409e57 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -22,7 +22,7 @@ define SYSKLOGD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0500 $(@D)/syslogd $(TARGET_DIR)/sbin/syslogd
 	$(INSTALL) -D -m 0500 $(@D)/klogd $(TARGET_DIR)/sbin/klogd
 	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
-		$(TARGET_DIR)/etc/syslog.conf; \
+		$(TARGET_DIR)/etc/syslog.conf
 endef
 
 define SYSKLOGD_INSTALL_INIT_SYSV
-- 
2.1.3
