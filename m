From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:33 +0200
Subject: [Buildroot] [PATCH 17/18] package/mplayer: add optional lame support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-18-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 97e6a5d..da6e468 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -137,6 +137,13 @@ else
 MPLAYER_CONF_OPTS += --disable-faad
 endif
 
+ifeq ($(BR2_PACKAGE_LAME),y)
+MPLAYER_DEPENDENCIES += lame
+MPLAYER_CONF_OPTS += --enable-mp3lame
+else
+MPLAYER_CONF_OPTS += --disable-mp3lame
+endif
+
 ifeq ($(BR2_PACKAGE_LIBASS),y)
 MPLAYER_DEPENDENCIES += libass
 MPLAYER_EXTRA_LIBS += -lass
-- 
1.7.10.4
