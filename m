From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 16:20:01 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: enable nss-resolve when
 resolve is enabled
Message-ID: <20200308222001.110480-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 22165de2c1..2c1c469044 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -356,10 +356,10 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
 endef
-SYSTEMD_CONF_OPTS += -Dresolve=true
+SYSTEMD_CONF_OPTS += -Dnss-resolve=true -Dresolve=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
 else
-SYSTEMD_CONF_OPTS += -Dresolve=false
+SYSTEMD_CONF_OPTS += -Dnss-resolve=false -Dresolve=false
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.20.1
