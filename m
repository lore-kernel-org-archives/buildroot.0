From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Mar 2016 22:58:34 +0100
Subject: [Buildroot] [PATCH/next v10 06/28] package/freeswitch: add optional
	dependency to libpng
In-Reply-To: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456869536-18324-7-git-send-email-bernd.kuhls@t-online.de>
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
index 1e78419..37949a3 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -163,6 +163,11 @@ FREESWITCH_DEPENDENCIES += libldns
 FREESWITCH_ENABLED_MODULES += applications/mod_enum
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+FREESWITCH_DEPENDENCIES += libpng
+FREESWITCH_ENABLED_MODULES += formats/mod_png
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 FREESWITCH_DEPENDENCIES += util-linux
 endif
-- 
2.7.0
