From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 23:18:41 +0100
Subject: [Buildroot] [git commit branch/next] dbus: ensure dbus user is
	created
Message-ID: <20140213223017.C8ED89C9AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55d1c953dc17a13e848951da88f45c673eafdda9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since we are changing the default dbus user, make sure this user is
consistently created.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 74e2041..e8b3da7 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -30,6 +30,10 @@ DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
 
+define DBUS_USERS
+	dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus user
+endef
+
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 DBUS_CONF_OPT += LIBS='-lpthread'
 endif
