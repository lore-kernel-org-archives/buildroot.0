From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Sat, 16 Jul 2016 11:32:12 -0300
Subject: [Buildroot] [PATCH] dbus: disable bundled initscript
Message-ID: <1468679532-8102-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Otherwise it will install $(TARGET_DIR)/etc/rc.d/init.d/messagebus when
building on a redhat/fedora host.
Regardless of that we provide our own initscript.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/dbus/dbus.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 11c3d4e..6064501 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -32,7 +32,8 @@ DBUS_CONF_OPTS = \
 	--disable-dnotify \
 	--with-xml=expat \
 	--with-system-socket=/var/run/dbus/system_bus_socket \
-	--with-system-pid-file=/var/run/messagebus.pid
+	--with-system-pid-file=/var/run/messagebus.pid \
+	--with-init-scripts=none
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DBUS_CONF_OPTS += LIBS='-pthread'
-- 
2.7.3
