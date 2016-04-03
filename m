From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Apr 2016 16:18:25 +0200
Subject: [Buildroot] [PATCH v11 13/26] package/freeswitch: add optional
	dependency to libg7221
In-Reply-To: <1459693118-19072-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459693118-19072-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459693118-19072-14-git-send-email-bernd.kuhls@t-online.de>
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
index e42bfd2..cd723e0 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -173,6 +173,10 @@ else
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
2.8.0.rc3
