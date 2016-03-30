From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:00:51 +0200
Subject: [Buildroot] [git commit] weston: handle dbus dependency
Message-ID: <20160330150133.811F17FCDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4582f907387edca62d7edf26472c8fe79649f4da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 363a2bf..72190a8 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -26,6 +26,13 @@ WESTON_CONF_OPTS = \
 WESTON_MAKE_OPTS = \
 	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+WESTON_CONF_OPTS += --enable-dbus
+WESTON_DEPENDENCIES += dbus
+else
+WESTON_CONF_OPTS += --disable-dbus
+endif
+
 # weston-launch must be u+s root in order to work properly
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define WESTON_PERMISSIONS
