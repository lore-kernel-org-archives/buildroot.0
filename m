From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  2 Dec 2014 09:10:38 +0200
Subject: [Buildroot] [PATCH] proftpd: remove redundant newline escape
Message-ID: <6760a4decd5ac702345eb2dde6d3ac410ef72993.1417504238.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Broken since 0e18b0a4e12e7 (proftpd: install configuration file
unconditionally). Fixes the following make error:

package/proftpd/proftpd.mk:49: *** missing 'endef', unterminated 'define'.  Stop.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/proftpd/proftpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 0fd8cc866222..b79abe45e8b5 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -49,7 +49,7 @@ PROFTPD_MAKE = $(MAKE1)
 define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
 	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
-	$(if $(BR2_INET_IPV6),,$(SED) 's/^UseIPv6/# UseIPv6/' $(TARGET_DIR)/etc/proftpd.conf;) \
+	$(if $(BR2_INET_IPV6),,$(SED) 's/^UseIPv6/# UseIPv6/' $(TARGET_DIR)/etc/proftpd.conf;)
 endef
 
 define PROFTPD_INSTALL_INIT_SYSV
-- 
2.1.3
