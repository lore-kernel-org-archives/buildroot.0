From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 15 Oct 2015 10:35:06 -0400
Subject: [Buildroot] [PATCH 1/2] connman: fix missing dbus configuration
	files
Message-ID: <1444919707-29869-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without connman.conf in /etc/dbus-1/system.d/, connmand cannot take
its name on the dbus system bus and will fail to start with a
permission denied error.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/connman/connman.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 87d81ce..3b14a80 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -12,6 +12,7 @@ CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPTS += \
+	--with-dbusconfdir=/etc \
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
-- 
2.1.4
