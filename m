From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:16 +0200
Subject: [Buildroot] [PATCH/next v2 04/23] package/vlc: add optional
 dependency to x265
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index bc20e2946e..7e496688b9 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -59,7 +59,6 @@ VLC_CONF_OPTS += \
 	--disable-vpx \
 	--disable-vsxu \
 	--disable-x262 \
-	--disable-x265 \
 	--disable-zvbi \
 	--enable-run-as-root
 
@@ -416,6 +415,13 @@ else
 VLC_CONF_OPTS += --disable-x264
 endif
 
+ifeq ($(BR2_PACKAGE_X265),y)
+VLC_CONF_OPTS += --enable-x265
+VLC_DEPENDENCIES += x265
+else
+VLC_CONF_OPTS += --disable-x265
+endif
+
 ifeq ($(BR2_PACKAGE_XCB_UTIL_KEYSYMS),y)
 VLC_CONF_OPTS += --enable-xcb
 VLC_DEPENDENCIES += xcb-util-keysyms
-- 
2.18.0
