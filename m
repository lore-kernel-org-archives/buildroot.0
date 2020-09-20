From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:43:58 +0200
Subject: [Buildroot] [git commit] package/dbus: drop unrecognized option
Message-ID: <20200920133616.689AF8028C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=649f4e8c77c5ddbbcf1f3dd63156b269f76b57f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--with-xml option has been dropped seven years ago in version 1.7.4 and
https://github.com/freedesktop/dbus/commit/46602768c537bfa51af80ba2c67857f3a30c0e67

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus/dbus.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 70f2c6fef4..b58f1ddda3 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -28,7 +28,6 @@ DBUS_CONF_OPTS = \
 	--disable-asserts \
 	--disable-xml-docs \
 	--disable-doxygen-docs \
-	--with-xml=expat \
 	--with-system-socket=/run/dbus/system_bus_socket \
 	--with-system-pid-file=/run/messagebus.pid
 
@@ -110,8 +109,7 @@ HOST_DBUS_CONF_OPTS = \
 	--disable-xml-docs \
 	--disable-doxygen-docs \
 	--disable-systemd \
-	--without-x \
-	--with-xml=expat
+	--without-x
 
 # dbus for the host
 DBUS_HOST_INTROSPECT = $(HOST_DBUS_DIR)/introspect.xml
