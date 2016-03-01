From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Mar 2016 22:58:42 +0100
Subject: [Buildroot] [PATCH/next v10 14/28] package/freeswitch: enable mod_bv
In-Reply-To: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456869536-18324-15-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 43be9e6..f731aba 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -159,6 +159,11 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBROADVOICE),y)
+FREESWITCH_DEPENDENCIES += libbroadvoice
+FREESWITCH_ENABLED_MODULES += codecs/mod_bv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 FREESWITCH_DEPENDENCIES += libedit
 FREESWITCH_CONF_OPTS += --enable-core-libedit-support
-- 
2.7.0
