From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:30 +0200
Subject: [Buildroot] [PATCH 14/18] package/mplayer: add optional libiconv
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-15-git-send-email-bernd.kuhls@t-online.de>
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
index 631e2fe..6d9c4f4 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -68,6 +68,14 @@ else
 MPLAYER_CONF_OPTS += --disable-enca
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MPLAYER_CONF_OPTS += --enable-iconv
+MPLAYER_DEPENDENCIES += libiconv
+MPLAYER_EXTRA_LIBS += -liconv
+else
+MPLAYER_CONF_OPTS += --disable-iconv
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 MPLAYER_CONF_OPTS += --enable-termcap
 MPLAYER_DEPENDENCIES += ncurses
-- 
1.7.10.4
