From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:23 +0200
Subject: [Buildroot] [PATCH 07/18] package/mplayer: add optional libfribidi
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-8-git-send-email-bernd.kuhls@t-online.de>
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
index db6bbd9..900a6ce 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -53,6 +53,14 @@ else
 MPLAYER_CONF_OPTS += --disable-fontconfig
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+MPLAYER_CONF_OPTS += --enable-fribidi
+MPLAYER_DEPENDENCIES += libfribidi
+MPLAYER_EXTRA_LIBS += -lfribidi
+else
+MPLAYER_CONF_OPTS += --disable-fribidi
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 MPLAYER_CONF_OPTS += --enable-termcap
 MPLAYER_DEPENDENCIES += ncurses
-- 
1.7.10.4
