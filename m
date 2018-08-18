From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Aug 2018 20:22:57 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/vlc: use pkgconf to find
 live555 libraries
In-Reply-To: <20180818182258.2936-1-bernd.kuhls@t-online.de>
References: <20180818182258.2936-1-bernd.kuhls@t-online.de>
Message-ID: <20180818182258.2936-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some live555 libraries were missing in LIVE555_LIBS.
Instead of maintaining the list of live555 library files we use pkgconf
instead.

Fixes
http://autobuild.buildroot.net/results/744/7445bdc2fdcb28aa7f58c0249653329414e447df/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ed682e60b3..d4be8b0bf1 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -427,14 +427,6 @@ endif
 ifeq ($(BR2_PACKAGE_LIVE555),y)
 VLC_CONF_OPTS += --enable-live555
 VLC_DEPENDENCIES += live555
-VLC_CONF_ENV += \
-	LIVE555_CFLAGS="\
-		-I$(STAGING_DIR)/usr/include/BasicUsageEnvironment \
-		-I$(STAGING_DIR)/usr/include/groupsock \
-		-I$(STAGING_DIR)/usr/include/liveMedia \
-		-I$(STAGING_DIR)/usr/include/UsageEnvironment \
-		" \
-	LIVE555_LIBS="-L$(STAGING_DIR)/usr/lib -lliveMedia"
 else
 VLC_CONF_OPTS += --disable-live555
 endif
-- 
2.18.0
