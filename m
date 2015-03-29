From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:21 +0200
Subject: [Buildroot] [PATCH 05/18] package/mplayer: add optional libbluray
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-6-git-send-email-bernd.kuhls@t-online.de>
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
index 1dbad7d..7992c4c 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -60,6 +60,13 @@ else
 MPLAYER_CONF_OPTS += --disable-smb
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
+MPLAYER_CONF_OPTS += --enable-bluray
+MPLAYER_DEPENDENCIES += libbluray
+else
+MPLAYER_CONF_OPTS += --disable-bluray
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
 	--enable-dvdread \
-- 
1.7.10.4
