From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:31 +0200
Subject: [Buildroot] [PATCH/next v2 19/23] package/vlc: add optional
 dependency to libsoxr
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index f777d86bda..a15bda3204 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -74,7 +74,6 @@ VLC_CONF_OPTS += \
 	--disable-notify \
 	--disable-projectm \
 	--disable-schroedinger \
-	--disable-soxr \
 	--disable-shine \
 	--disable-shout \
 	--disable-skins2 \
@@ -344,6 +343,13 @@ else
 VLC_CONF_OPTS += --disable-secret
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSOXR),y)
+VLC_CONF_OPTS += --enable-soxr
+VLC_DEPENDENCIES += libsoxr
+else
+VLC_CONF_OPTS += --disable-soxr
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 VLC_CONF_OPTS += --enable-sftp
 VLC_DEPENDENCIES += libssh2
-- 
2.18.0
