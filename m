From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  2 Dec 2014 08:58:49 +0200
Subject: [Buildroot] [PATCH] ifplugd: remove spurious newline excape
Message-ID: <fb06c6bb75e7486b104103ed0de58d64fa3f2058.1417503529.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5ad5d55924bcc (ifplugd: install configuration files unconditionally)
removed the conditional configuration file install, but left an redundant
newline escape, causing the following error:

package/ifplugd/ifplugd.mk:23: *** missing 'endef', unterminated 'define'.  Stop.

Fix this.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ifplugd/ifplugd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 03ed8cdf33a2..6b6141e7b8b3 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -24,7 +24,7 @@ define IFPLUGD_INSTALL_FIXUP
 	$(INSTALL) -D -m 0644 $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
-		$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
+		$(TARGET_DIR)/etc/ifplugd/ifplugd.action
 endef
 
 IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
-- 
2.1.3
