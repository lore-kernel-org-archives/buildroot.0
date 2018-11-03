From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 17:27:11 +0100
Subject: [Buildroot] [PATCH 2/6] wireshark: add libxml2 optional dependency
In-Reply-To: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
References: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103162715.15580-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Optional dependency to libxml2 has been added with version 2.4.0 and
https://github.com/wireshark/wireshark/commit/cfab5ef035db7be8502623af203ab3494a9200e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 715afad616..af93bc98e0 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -91,6 +91,13 @@ else
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
