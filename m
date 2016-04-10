From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 11:41:30 +0200
Subject: [Buildroot] [PATCH v12 22/31] package/freeswitch: enable mod_xml_rpc
In-Reply-To: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460281299-2385-23-git-send-email-bernd.kuhls@t-online.de>
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
index ce66c1e..64866e4 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -151,6 +151,10 @@ ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_6
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
2.8.0.rc3
