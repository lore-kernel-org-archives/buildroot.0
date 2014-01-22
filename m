From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 22 Jan 2014 21:59:39 +0100
Subject: [Buildroot] [PATCH v2 3/5] connman: use the *_INSTALL_INIT_SYSV
	infra instead of the custom hook
In-Reply-To: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
References: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390424381-6889-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- split patch: one for using _INIT_SYSV infra, the other for init systemd
  support (Yann)
---
 package/connman/connman.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 64c1f0e..1979454 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -24,11 +24,10 @@ CONNMAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),neard) \
 	$(if $(BR2_PACKAGE_CONNMAN_OFONO),ofono)
 
-define CONNMAN_INSTALL_INITSCRIPT
+define CONNMAN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
 
-CONNMAN_POST_INSTALL_TARGET_HOOKS = CONNMAN_INSTALL_INITSCRIPT
 
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
 CONNMAN_CONF_OPT += --enable-client
-- 
1.8.5.3
