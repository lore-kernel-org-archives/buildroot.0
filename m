From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:29 +0200
Subject: [Buildroot] [PATCH 13/18] package/mplayer: add optional speex
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-14-git-send-email-bernd.kuhls@t-online.de>
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
index 5f9a8d1..631e2fe 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -171,6 +171,13 @@ else
 MPLAYER_CONF_OPTS += --disable-librtmp
 endif
 
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+MPLAYER_DEPENDENCIES += speex
+MPLAYER_CONF_OPTS += --enable-speex
+else
+MPLAYER_CONF_OPTS += --disable-speex
+endif
+
 ifeq ($(BR2_PACKAGE_LZO),y)
 MPLAYER_DEPENDENCIES += lzo
 MPLAYER_CONF_OPTS += --enable-liblzo
-- 
1.7.10.4
