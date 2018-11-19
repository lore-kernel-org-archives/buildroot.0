From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Nov 2018 19:06:50 +0100
Subject: [Buildroot] [PATCH/next 3/3] keepalived: add libglib2 optional
 dependency
In-Reply-To: <20181119180650.30516-1-fontaine.fabrice@gmail.com>
References: <20181119180650.30516-1-fontaine.fabrice@gmail.com>
Message-ID: <20181119180650.30516-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gio from libglib2 is used for dbus support

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/keepalived.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index fa8b2e4112..ed80a79f8a 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -11,7 +11,6 @@ KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 # 0001-configure.ac-do-not-force-PIE.patch
 KEEPALIVED_AUTORECONF = YES
-KEEPALIVED_CONF_OPTS += --disable-dbus
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
@@ -20,6 +19,13 @@ else
 KEEPALIVED_CONF_OPTS += --disable-json
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+KEEPALIVED_DEPENDENCIES += libglib2
+KEEPALIVED_CONF_OPTS += --enable-dbus
+else
+KEEPALIVED_CONF_OPTS += --disable-dbus
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_PACKAGE_LIBNFNETLINK),yy)
 KEEPALIVED_DEPENDENCIES += libnl libnfnetlink
 KEEPALIVED_CONF_OPTS += --enable-libnl
-- 
2.17.1
