From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 17:27:15 +0100
Subject: [Buildroot] [PATCH 6/6] wireshark: add snappy optional dependency
In-Reply-To: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
References: <20181103162715.15580-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103162715.15580-6-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Optional dependency to snappy has been added with version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/47649d1c7fb6ba48b805e19268a711404eb6908b
- Specify the path to found libssh as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c67fa3a697..3632b25646 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -134,6 +134,13 @@ else
 WIRESHARK_CONF_OPTS += --with-sbc=no
 endif
 
+ifeq ($(BR2_PACKAGE_SNAPPY),y)
+WIRESHARK_CONF_OPTS += --with-snappy=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += snappy
+else
+WIRESHARK_CONF_OPTS += --without-snappy
+endif
+
 define WIRESHARK_REMOVE_DOCS
 	find $(TARGET_DIR)/usr/share/wireshark -name '*.txt' -print0 \
 		-o -name '*.html' -print0 | xargs -0 rm -f
-- 
2.17.1
