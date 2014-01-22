From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 22:06:30 +0100
Subject: [Buildroot] [git commit] connman: use the *_INSTALL_INIT_SYSV infra
	instead of the custom hook
Message-ID: <20140122210913.A22299C59B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04ea76404acdfacc54b0e724c96b190e06501d03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

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
