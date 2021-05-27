From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 27 May 2021 16:35:03 +0300
Subject: [Buildroot] [PATCH next 1/1] package/weston: enable libseat
 launcher if seatd is enabled
Message-ID: <20210527133503.412330-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable building Weston's libseat launcher, now that the seatd package
is available.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index f59963bf2e..6afc5e269c 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -25,6 +25,13 @@ else
 WESTON_CONF_OPTS += -Dsimple-clients=
 endif
 
+ifeq ($(BR2_PACKAGE_SEATD),y)
+WESTON_CONF_OPTS += -Dlauncher-libseat=true
+WESTON_DEPENDENCIES += seatd
+else
+WESTON_CONF_OPTS += -Dlauncher-libseat=false
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
 WESTON_CONF_OPTS += -Dlauncher-logind=true
 WESTON_DEPENDENCIES += dbus systemd
-- 
2.31.1
