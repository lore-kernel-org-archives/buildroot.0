From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Nov 2018 19:06:49 +0100
Subject: [Buildroot] [PATCH/next 2/3] keepalive: add optional json-c
 dependency
In-Reply-To: <20181119180650.30516-1-fontaine.fabrice@gmail.com>
References: <20181119180650.30516-1-fontaine.fabrice@gmail.com>
Message-ID: <20181119180650.30516-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/keepalived.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 8756811e04..fa8b2e4112 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -13,6 +13,13 @@ KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_AUTORECONF = YES
 KEEPALIVED_CONF_OPTS += --disable-dbus
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+KEEPALIVED_DEPENDENCIES += json-c
+KEEPALIVED_CONF_OPTS += --enable-json
+else
+KEEPALIVED_CONF_OPTS += --disable-json
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_PACKAGE_LIBNFNETLINK),yy)
 KEEPALIVED_DEPENDENCIES += libnl libnfnetlink
 KEEPALIVED_CONF_OPTS += --enable-libnl
-- 
2.17.1
