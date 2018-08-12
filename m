From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:20 +0200
Subject: [Buildroot] [PATCH/next v2 08/23] package/vlc: add optional
 dependency to libvpx
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-9-bernd.kuhls@t-online.de>
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
index b90fd602d3..b8c47582dc 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -56,7 +56,6 @@ VLC_CONF_OPTS += \
 	--disable-shout \
 	--disable-twolame \
 	--disable-vdpau \
-	--disable-vpx \
 	--disable-vsxu \
 	--disable-x262 \
 	--disable-zvbi \
@@ -308,6 +307,13 @@ else
 VLC_CONF_OPTS += --disable-v4l2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+VLC_CONF_OPTS += --enable-vpx
+VLC_DEPENDENCIES += libvpx
+else
+VLC_CONF_OPTS += --disable-vpx
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 VLC_CONF_OPTS += --enable-xcb
 VLC_DEPENDENCIES += libxcb
-- 
2.18.0
