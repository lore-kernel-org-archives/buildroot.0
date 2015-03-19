From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 13:56:37 -0400
Subject: [Buildroot] [PATCH 05/15] dbus: move systemd service files to
	/usr/lib
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426787807-29510-6-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 200084f..c810800 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -54,7 +54,7 @@ endif
 ifeq ($(BR2_INIT_SYSTEMD),y)
 DBUS_CONF_OPTS += \
 	--enable-systemd \
-	--with-systemdsystemunitdir=/lib/systemd/system
+	--with-systemdsystemunitdir=/usr/lib/systemd/system
 DBUS_DEPENDENCIES += systemd
 else
 DBUS_CONF_OPTS += --disable-systemd
-- 
2.1.0
