From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:02 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 x265
Message-ID: <20180907111510.488997FB4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=641d8ad05b6bb4ff074038ee50d6742c462934f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
