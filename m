From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:23 +0200
Subject: [Buildroot] [PATCH/next v2 11/23] package/vlc: add optional
 dependency to libdvdread
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-12-bernd.kuhls@t-online.de>
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
index 9e1dc6b92e..928b3fabb8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -206,6 +206,13 @@ else
 VLC_CONF_OPTS += --disable-dvbpsi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
+VLC_CONF_OPTS += --enable-dvdread
+VLC_DEPENDENCIES += libdvdread
+else
+VLC_CONF_OPTS += --disable-dvdread
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 VLC_CONF_OPTS += --enable-libgcrypt
 VLC_DEPENDENCIES += libgcrypt
-- 
2.18.0
