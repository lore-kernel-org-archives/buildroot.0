From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 16:40:11 +0200
Subject: [Buildroot] [git commit] dbus: disable bundled initscript
Message-ID: <20160716144016.42F7E7FC6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab173610fc51be27edca90337ef91b39c0c754db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it will install $(TARGET_DIR)/etc/rc.d/init.d/messagebus when
building on a redhat/fedora host.
Regardless of that we provide our own initscript.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
