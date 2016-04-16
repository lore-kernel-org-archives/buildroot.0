From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Apr 2016 12:54:56 +0200
Subject: [Buildroot] [PATCH v14 05/27] package/freeswitch: add optional
	dependency to libpng
In-Reply-To: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460804118-4900-6-git-send-email-bernd.kuhls@t-online.de>
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
index 9c6b874..b129628 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -171,4 +171,9 @@ FREESWITCH_DEPENDENCIES += libldns
 FREESWITCH_ENABLED_MODULES += applications/mod_enum
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+FREESWITCH_DEPENDENCIES += libpng
+FREESWITCH_ENABLED_MODULES += formats/mod_png
+endif
+
 $(eval $(autotools-package))
-- 
2.8.0.rc3
