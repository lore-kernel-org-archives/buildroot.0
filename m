From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri, 28 Dec 2018 17:39:09 -0800
Subject: [Buildroot] [PATCH 1/1] apache: enable support for nghttp2
Message-ID: <20181229013909.2439-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/apache/apache.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 283c3cbd50..a95ac69f31 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -63,6 +63,15 @@ else
 APACHE_CONF_OPTS += --disable-lua
 endif
 
+ifeq ($(BR2_PACKAGE_NGHTTP2),y)
+APACHE_CONF_OPTS += \
+	--enable-http2 \
+	--with-nghttp2=$(STAGING_DIR)/usr
+APACHE_DEPENDENCIES += nghttp2
+else
+APACHE_CONF_OPTS += --disable-http2
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 APACHE_DEPENDENCIES += openssl
 APACHE_CONF_OPTS += \
-- 
2.20.1
