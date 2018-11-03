From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 17:27:12 +0100
Subject: [Buildroot] [PATCH 3/6] wireshark: add nghttp2 optional dependency
In-Reply-To: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
References: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103162715.15580-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Embedded nghttp2 code has been removed and an optional dependency to
  nghttp2 has been added with version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/b1cc056b12702435f6ebdc6ba0a8e17a41e159a0
- Specify the path to found nghttp2 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index af93bc98e0..e6a5def028 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -106,6 +106,13 @@ else
 WIRESHARK_CONF_OPTS += --without-lua
 endif
 
+ifeq ($(BR2_PACKAGE_NGHTTP2),y)
+WIRESHARK_CONF_OPTS += --with-nghttp2=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += nghttp2
+else
+WIRESHARK_CONF_OPTS += --without-nghttp2
+endif
+
 ifeq ($(BR2_PACKAGE_SBC),y)
 WIRESHARK_CONF_OPTS += --with-sbc=yes
 WIRESHARK_DEPENDENCIES += sbc
-- 
2.17.1
