From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Apr 2016 21:31:55 +0200
Subject: [Buildroot] [PATCH v13 21/26] package/freeswitch: add optional
	dependency to xz
In-Reply-To: <1460662320-1437-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460662320-1437-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460662320-1437-22-git-send-email-bernd.kuhls@t-online.de>
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
index 013dccd..384866c 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -245,4 +245,8 @@ else
 FREESWITCH_CONF_OPTS += --disable-core-odbc-support
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+FREESWITCH_DEPENDENCIES += xz
+endif
+
 $(eval $(autotools-package))
-- 
2.8.0.rc3
