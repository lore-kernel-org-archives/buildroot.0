From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 10:08:22 +0100
Subject: [Buildroot] [git commit] dbus: Remove DBUS_USERS duplicate
Message-ID: <20141103100523.A1767B3054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d230e7dbb4eb3058f15be7d78285fa1845388d28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 0fa1a0f..197f052 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -15,9 +15,10 @@ define DBUS_PERMISSIONS
 endef
 
 define DBUS_USERS
-dbus -1 dbus -1 * - - - D-Bus
+	dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus user
 endef
 
+
 DBUS_DEPENDENCIES = host-pkgconf expat
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
@@ -33,10 +34,6 @@ DBUS_CONF_OPTS = --with-dbus-user=dbus \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
 
-define DBUS_USERS
-	dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus user
-endef
-
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 DBUS_CONF_OPTS += LIBS='-pthread'
 endif
