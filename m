From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Aug 2018 23:05:17 +0200
Subject: [Buildroot] [PATCH/next 07/12] package/vlc: add optional dependency
 to pulseaudio
In-Reply-To: <20180811210522.15600-1-bernd.kuhls@t-online.de>
References: <20180811210522.15600-1-bernd.kuhls@t-online.de>
Message-ID: <20180811210522.15600-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 14fe3b7861..b90fd602d3 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -362,6 +362,13 @@ else
 VLC_CONF_OPTS += --disable-ncurses
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+VLC_CONF_OPTS += --enable-pulse
+VLC_DEPENDENCIES += pulseaudio
+else
+VLC_CONF_OPTS += --disable-pulse
+endif
+
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
 VLC_CONF_ENV += \
-- 
2.18.0
