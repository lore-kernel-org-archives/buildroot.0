From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 09:42:13 +0100
Subject: [Buildroot] [git commit] proftpd: remove redundant newline escape
Message-ID: <20141202084355.8DC3D7FA71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f534ca30aa6d8e461ab5e69e8d7033b65949eef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Broken since 0e18b0a4e12e7 (proftpd: install configuration file
unconditionally). Fixes the following make error:

package/proftpd/proftpd.mk:49: *** missing 'endef', unterminated 'define'.  Stop.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 0fd8cc8..b79abe4 100644
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
