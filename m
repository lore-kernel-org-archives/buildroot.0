From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Feb 2014 12:46:19 +0100
Subject: [Buildroot] [PATCH 2/2] dbus: ensure dbus user is created
In-Reply-To: <1391514379-7431-1-git-send-email-s.martin49@gmail.com>
References: <1391514379-7431-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391514379-7431-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we are changing the default dbus user, make sure this user is
consistently created.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/dbus/dbus.mk | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.8.5.3
