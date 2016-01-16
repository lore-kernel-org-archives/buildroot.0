From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Jan 2016 21:44:34 +0100
Subject: [Buildroot] [PATCH v7 14/28] package/freeswitch: enable mod_bv,
	add optional dependency to libbroadvoice
In-Reply-To: <1452977088-17867-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452977088-17867-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452977088-17867-15-git-send-email-bernd.kuhls@t-online.de>
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
index 6191fad..55ac8f9 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -169,6 +169,11 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
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
2.7.0.rc3
