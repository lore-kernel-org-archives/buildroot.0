From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:25 +0200
Subject: [Buildroot] [PATCH 09/18] package/mplayer: add optional libenca
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-10-git-send-email-bernd.kuhls@t-online.de>
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
index 245ed91..6fbdd72 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -61,6 +61,13 @@ else
 MPLAYER_CONF_OPTS += --disable-fribidi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBENCA),y)
+MPLAYER_CONF_OPTS += --enable-enca
+MPLAYER_DEPENDENCIES += libenca
+else
+MPLAYER_CONF_OPTS += --disable-enca
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 MPLAYER_CONF_OPTS += --enable-termcap
 MPLAYER_DEPENDENCIES += ncurses
-- 
1.7.10.4
