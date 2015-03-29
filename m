From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:20 +0200
Subject: [Buildroot] [PATCH 04/18] package/mplayer: add optional samba
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-5-git-send-email-bernd.kuhls@t-online.de>
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
index 5ecd25a..1dbad7d 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -53,6 +53,13 @@ else
 MPLAYER_CONF_OPTS += --disable-termcap
 endif
 
+ifeq ($(BR2_PACKAGE_SAMBA_SMBCLIENT),y)
+MPLAYER_CONF_OPTS += --enable-smb
+MPLAYER_DEPENDENCIES += samba
+else
+MPLAYER_CONF_OPTS += --disable-smb
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
 	--enable-dvdread \
-- 
1.7.10.4
