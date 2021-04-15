From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Apr 2021 23:07:01 +0200
Subject: [Buildroot] [git commit] package/modem-manager: add support for
 introspection
Message-ID: <20210415204220.A54EA814DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c45accd2956c491a7f8a26f6087ad99203899842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable introspection when GObject Introspection is enabled.

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Acked-by: Aleksander Morgado <aleksander@aleksander.es>
[yann.morin.1998 at free.fr: drop config option, rely on GOI package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/modem-manager/modem-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 2cc45d266b..792a37b8db 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -34,6 +34,13 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-mbim
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+MODEM_MANAGER_DEPENDENCIES += gobject-introspection
+MODEM_MANAGER_CONF_OPTS += --enable-introspection
+else
+MODEM_MANAGER_CONF_OPTS += --disable-introspection
+endif
+
 define MODEM_MANAGER_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager \
 		$(TARGET_DIR)/etc/init.d/S44modem-manager
