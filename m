From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Mar 2016 22:58:53 +0100
Subject: [Buildroot] [PATCH/next v10 25/28] package/freeswitch: enable
	mod_xml_rpc
In-Reply-To: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456869536-18324-26-git-send-email-bernd.kuhls@t-online.de>
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
index 65e8ee0..d610875 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -156,6 +156,10 @@ ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_6
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
