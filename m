From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:28 +0200
Subject: [Buildroot] [PATCH 12/18] package/mplayer: add optional rtmpdump
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 442f82b..5f9a8d1 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -163,6 +163,14 @@ MPLAYER_DEPENDENCIES += giflib
 MPLAYER_EXTRA_LIBS += -lgif
 endif
 
+ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
+MPLAYER_DEPENDENCIES += rtmpdump
+MPLAYER_CONF_OPTS += --enable-librtmp
+MPLAYER_EXTRA_LIBS += -lrtmp
+else
+MPLAYER_CONF_OPTS += --disable-librtmp
+endif
+
 ifeq ($(BR2_PACKAGE_LZO),y)
 MPLAYER_DEPENDENCIES += lzo
 MPLAYER_CONF_OPTS += --enable-liblzo
-- 
1.7.10.4
