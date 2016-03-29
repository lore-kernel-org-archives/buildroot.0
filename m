From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 11:39:06 -0300
Subject: [Buildroot] [PATCH v3 07/11] weston: handle dbus dependency
In-Reply-To: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459262350-10974-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
