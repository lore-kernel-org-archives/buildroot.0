From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Aug 2018 23:05:15 +0200
Subject: [Buildroot] [PATCH/next 05/12] package/vlc: add optional dependency
 to ncurses
In-Reply-To: <20180811210522.15600-1-bernd.kuhls@t-online.de>
References: <20180811210522.15600-1-bernd.kuhls@t-online.de>
Message-ID: <20180811210522.15600-6-bernd.kuhls@t-online.de>
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
index 7e496688b9..ecc5c6cafe 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -355,6 +355,13 @@ else
 VLC_CONF_OPTS += --disable-mpc
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+VLC_CONF_OPTS += --enable-ncurses
+VLC_DEPENDENCIES += ncurses
+else
+VLC_CONF_OPTS += --disable-ncurses
+endif
+
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
 VLC_CONF_ENV += \
-- 
2.18.0
