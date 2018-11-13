From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 13 Nov 2018 23:14:24 +0100
Subject: [Buildroot] [PATCH 1/1] wireshark: fix static build with snappy
Message-ID: <20181113221424.6607-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/9089e74c0f8428d28953ae037a84aa8a08db7ded

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 7c7dc784fe..4720960e59 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -138,6 +138,9 @@ endif
 ifeq ($(BR2_PACKAGE_SNAPPY),y)
 WIRESHARK_CONF_OPTS += --with-snappy=$(STAGING_DIR)/usr
 WIRESHARK_DEPENDENCIES += snappy
+ifeq ($(BR2_STATIC_LIBS),y)
+WIRESHARK_CONF_ENV += LIBS=-lstdc++
+endif
 else
 WIRESHARK_CONF_OPTS += --without-snappy
 endif
-- 
2.14.1
