From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Apr 2016 12:54:55 +0200
Subject: [Buildroot] [PATCH v14 04/27] package/freeswitch: enable mod_enum
In-Reply-To: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460804118-4900-5-git-send-email-bernd.kuhls@t-online.de>
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
index d83835e..9c6b874 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -166,4 +166,9 @@ else
 FREESWITCH_CONF_OPTS += --disable-core-libedit-support
 endif
 
+ifeq ($(BR2_PACKAGE_LIBLDNS),y)
+FREESWITCH_DEPENDENCIES += libldns
+FREESWITCH_ENABLED_MODULES += applications/mod_enum
+endif
+
 $(eval $(autotools-package))
-- 
2.8.0.rc3
