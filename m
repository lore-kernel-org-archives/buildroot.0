From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  7 Apr 2020 19:55:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: add gobject-introspection
 optional dependency
Message-ID: <20200407175535.409309-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avahi/avahi.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 73db37545f..3546979d83 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -82,6 +82,13 @@ else
 AVAHI_CONF_OPTS += --disable-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+AVAHI_CONF_OPTS += --enable-introspection
+AVAHI_DEPENDENCIES += gobject-introspection
+else
+AVAHI_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 AVAHI_DEPENDENCIES += libevent
 else
-- 
2.25.1
