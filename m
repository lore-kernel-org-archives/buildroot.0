From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:23:25 +0100
Subject: [Buildroot] [PATCH v8 25/28] package/freeswitch: enable mod_xml_rpc
In-Reply-To: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456007008-5200-26-git-send-email-bernd.kuhls@t-online.de>
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
index d58b891..134dbec 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -166,6 +166,10 @@ ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_6
 FREESWITCH_ENABLED_MODULES += codecs/mod_isac
 endif
 
+ifeq ($(BR2_USE_WCHAR),y)
+FREESWITCH_ENABLED_MODULES += xml_int/mod_xml_rpc
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 FREESWITCH_DEPENDENCIES += alsa-lib
 FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
-- 
2.7.0
