From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 16:27:06 +0100
Subject: [Buildroot] [PATCH/next v9 16/28] package/freeswitch: add optional
	dependency to libg7221
In-Reply-To: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456586838-21197-17-git-send-email-bernd.kuhls@t-online.de>
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
index a0940b3..880a848 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -182,6 +182,10 @@ else
 FREESWITCH_CONF_OPTS += --disable-core-libedit-support
 endif
 
+ifeq ($(BR2_PACKAGE_LIBG7221),y)
+FREESWITCH_DEPENDENCIES += libg7221
+endif
+
 ifeq ($(BR2_PACKAGE_LIBLDNS),y)
 FREESWITCH_DEPENDENCIES += libldns
 FREESWITCH_ENABLED_MODULES += applications/mod_enum
-- 
2.7.0
