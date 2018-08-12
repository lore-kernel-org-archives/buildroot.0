From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:18 +0200
Subject: [Buildroot] [PATCH/next v2 06/23] package/vlc: add optional
 dependency to samba4
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-7-bernd.kuhls@t-online.de>
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
index ecc5c6cafe..14fe3b7861 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -387,6 +387,13 @@ else
 VLC_CONF_OPTS += --disable-sdl-image
 endif
 
+ifeq ($(BR2_PACKAGE_SAMBA4),y)
+VLC_CONF_OPTS += --enable-smbclient
+VLC_DEPENDENCIES += samba4
+else
+VLC_CONF_OPTS += --disable-smbclient
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 VLC_CONF_OPTS += --enable-speex
 VLC_DEPENDENCIES += speex speexdsp
-- 
2.18.0
