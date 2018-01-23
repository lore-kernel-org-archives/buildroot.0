From: Chris Lesiak <chris.lesiak@licor.com>
Date: Tue, 23 Jan 2018 17:17:23 -0600
Subject: [Buildroot] [PATCH] package/avahi: Set the path to D-Bus system.d
 directory
Message-ID: <20180123231723.5923-1-chris.lesiak@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --with-dbus-sys=/usr/share/dbus-1/system.d to configure
the path to D-Bus system.d directory.  Without this option,
distribution provided configuration files were unnecessarily
stored in /etc.

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
---
 package/avahi/avahi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index c8f1af9a9d..ef621620f0 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -125,6 +125,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 AVAHI_DEPENDENCIES += dbus
+AVAHI_CONF_OPTS += --with-dbus-sys=/usr/share/dbus-1/system.d
 else
 AVAHI_CONF_OPTS += --disable-dbus
 endif
-- 
2.13.6
