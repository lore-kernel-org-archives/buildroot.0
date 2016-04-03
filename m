From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Apr 2016 16:18:23 +0200
Subject: [Buildroot] [PATCH v11 11/26] package/freeswitch: enable mod_bv
In-Reply-To: <1459693118-19072-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459693118-19072-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459693118-19072-12-git-send-email-bernd.kuhls@t-online.de>
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
index 74ec7ea..a705321 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -156,6 +156,11 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
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
2.8.0.rc3
