From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Nov 2018 11:10:26 +0100
Subject: [Buildroot] [PATCH v2,
 2/6] wireshark: add libxml2 optional dependency
In-Reply-To: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
References: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
Message-ID: <20181104101030.14402-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Optional dependency to libxml2 has been added with version 2.4.0 and
https://github.com/wireshark/wireshark/commit/cfab5ef035db7be8502623af203ab3494a9200e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop all new dependencies in the first patch of the serie

 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 714191761e..330ce59580 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -17,7 +17,6 @@ WIRESHARK_CONF_ENV = \
 WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
 	--without-bcg729 \
-	--without-libxml2 \
 	--without-lz4 \
 	--without-nghttp2 \
 	--without-snappy \
@@ -96,6 +95,13 @@ else
 WIRESHARK_CONF_OPTS += --without-libssh
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+WIRESHARK_CONF_OPTS += --with-libxml2
+WIRESHARK_DEPENDENCIES += libxml2
+else
+WIRESHARK_CONF_OPTS += --without-libxml2
+endif
+
 # no support for lua53 yet
 ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_2),y)
 WIRESHARK_CONF_OPTS += --with-lua
-- 
2.17.1
