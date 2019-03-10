From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Mar 2019 12:31:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: add optional spandsp
 dependency
Message-ID: <20190310113153.782-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 5f04af1f29..a917efb5f6 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -145,6 +145,13 @@ else
 WIRESHARK_CONF_OPTS += --without-snappy
 endif
 
+ifeq ($(BR2_PACKAGE_SPANDSP),y)
+WIRESHARK_CONF_OPTS += --with-spandsp
+WIRESHARK_DEPENDENCIES += spandsp
+else
+WIRESHARK_CONF_OPTS += --without-spandsp
+endif
+
 define WIRESHARK_REMOVE_DOCS
 	find $(TARGET_DIR)/usr/share/wireshark -name '*.txt' -print0 \
 		-o -name '*.html' -print0 | xargs -0 rm -f
-- 
2.20.1
