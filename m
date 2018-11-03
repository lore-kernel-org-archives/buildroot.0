From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 17:27:13 +0100
Subject: [Buildroot] [PATCH 4/6] wireshark: add bcg729 optional dependency
In-Reply-To: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
References: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103162715.15580-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Optional dependency to bcg729 has been added with version 2.5.0 and
  https://github.com/wireshark/wireshark/commit/3e54cabf8193e6a8cd607b1671defb8b6800b53d
- Specify the path to found bcg729 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e6a5def028..c92725957c 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -49,6 +49,13 @@ ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),)
 WIRESHARK_CONF_OPTS += --disable-wireshark
 endif
 
+ifeq ($(BR2_PACKAGE_BCG729),y)
+WIRESHARK_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += bcg729
+else
+WIRESHARK_CONF_OPTS += --without-bcg729
+endif
+
 ifeq ($(BR2_PACKAGE_C_ARES),y)
 WIRESHARK_CONF_OPTS += --with-c-ares=$(STAGING_DIR)/usr
 WIRESHARK_DEPENDENCIES += c-ares
-- 
2.17.1
