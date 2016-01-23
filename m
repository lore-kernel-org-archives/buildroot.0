From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 10:44:57 +0100
Subject: [Buildroot] [PATCH 3/3] package/tvheadend: enable optional support
	for libhdhomerun
In-Reply-To: <1453542297-12086-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453542297-12086-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453542297-12086-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 43ff979..11f882a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -39,6 +39,13 @@ else
 TVHEADEND_CONF_OPTS += --disable-dvbcsa
 endif
 
+ifeq ($(BR2_PACKAGE_LIBHDHOMERUN),y)
+TVHEADEND_DEPENDENCIES += libhdhomerun
+TVHEADEND_CONF_OPTS += --enable-hdhomerun_client
+else
+TVHEADEND_CONF_OPTS += --disable-hdhomerun_client
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TVHEADEND_DEPENDENCIES += libiconv
 endif
-- 
2.7.0.rc3
