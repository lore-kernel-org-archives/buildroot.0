From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 29 Jan 2020 19:55:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add bcg729 optional
 dependency
Message-ID: <20200129185553.129751-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpjsip/libpjsip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 84919fdc10..b89249a6e5 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -49,6 +49,13 @@ LIBPJSIP_CONF_OPTS = \
 # so we want to use it.
 LIBPJSIP_CONF_OPTS += --enable-epoll
 
+ifeq ($(BR2_PACKAGE_BCG729),y)
+LIBPJSIP_DEPENDENCIES += bcg729
+LIBPJSIP_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-bcg729
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGSM),y)
 LIBPJSIP_CONF_OPTS += \
 	--enable-gsm-codec \
-- 
2.24.1
