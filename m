From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:31 +0200
Subject: [Buildroot] [PATCH 15/18] package/mplayer: disable optional libcdio
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 6d9c4f4..76c53d7 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -98,6 +98,11 @@ else
 MPLAYER_CONF_OPTS += --disable-bluray
 endif
 
+# cdio support is broken in buildroot atm due to missing libcdio-paranoia
+# package and this patch
+# https://github.com/pld-linux/mplayer/blob/master/mplayer-libcdio.patch
+MPLAYER_CONF_OPTS += --disable-libcdio
+
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
 	--enable-dvdread \
-- 
1.7.10.4
