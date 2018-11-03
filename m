From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 17:27:14 +0100
Subject: [Buildroot] [PATCH 5/6] wireshark: add lz4 optional dependency
In-Reply-To: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
References: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103162715.15580-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Optional dependency to lz4 has been added with version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/47649d1c7fb6ba48b805e19268a711404eb6908b
- Specify the path to found lz4 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c92725957c..c67fa3a697 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -113,6 +113,13 @@ else
 WIRESHARK_CONF_OPTS += --without-lua
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+WIRESHARK_CONF_OPTS += --with-lz4=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += lz4
+else
+WIRESHARK_CONF_OPTS += --without-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_NGHTTP2),y)
 WIRESHARK_CONF_OPTS += --with-nghttp2=$(STAGING_DIR)/usr
 WIRESHARK_DEPENDENCIES += nghttp2
-- 
2.17.1
