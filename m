From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:47:09 +0200
Subject: [Buildroot] [git commit] package/systemd: enable nss-resolve when
 resolve is enabled
Message-ID: <20200412133307.8DA438E774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12a808f2547da361c28e0b07642a4243b9c6fce7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 009f599c10..5f6c8a60bb 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -361,10 +361,10 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
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
