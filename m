From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Jan 2016 22:39:57 +0100
Subject: [Buildroot] [PATCH v6 16/29] package/freeswitch: enable mod_codec2,
	add optional dependency to libcodec2
In-Reply-To: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452807610-15534-17-git-send-email-bernd.kuhls@t-online.de>
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
index 984ca36..2457ab1 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -152,6 +152,11 @@ FREESWITCH_DEPENDENCIES += libbroadvoice
 FREESWITCH_ENABLED_MODULES += codecs/mod_bv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCODEC2),y)
+FREESWITCH_DEPENDENCIES += libcodec2
+FREESWITCH_ENABLED_MODULES += codecs/mod_codec2
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 FREESWITCH_DEPENDENCIES += libedit
 FREESWITCH_CONF_OPTS += --enable-core-libedit-support
-- 
2.6.4
