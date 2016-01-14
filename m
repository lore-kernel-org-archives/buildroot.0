From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Jan 2016 22:40:07 +0100
Subject: [Buildroot] [PATCH v6 26/29] package/freeswitch: enable mod_xml_rpc
In-Reply-To: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452807610-15534-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 775b63c..fadb9c6 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -132,6 +132,10 @@ endef
 
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+ifeq ($(BR2_USE_WCHAR),y)
+FREESWITCH_ENABLED_MODULES += xml_int/mod_xml_rpc
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 FREESWITCH_DEPENDENCIES += alsa-lib
 FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
-- 
2.6.4
