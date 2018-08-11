From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Aug 2018 23:05:20 +0200
Subject: [Buildroot] [PATCH/next 10/12] package/vlc: add optional dependency
 to libsamplerate
In-Reply-To: <20180811210522.15600-1-bernd.kuhls@t-online.de>
References: <20180811210522.15600-1-bernd.kuhls@t-online.de>
Message-ID: <20180811210522.15600-11-bernd.kuhls@t-online.de>
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
index edd0c36372..9e1dc6b92e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -51,7 +51,6 @@ VLC_CONF_OPTS += \
 	--disable-mmal-vout \
 	--disable-mtp \
 	--disable-projectm \
-	--disable-samplerate \
 	--disable-schroedinger \
 	--disable-shout \
 	--disable-twolame \
@@ -262,6 +261,13 @@ else
 VLC_CONF_OPTS += --disable-svg --disable-svgdec
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+VLC_CONF_OPTS += --enable-samplerate
+VLC_DEPENDENCIES += libsamplerate
+else
+VLC_CONF_OPTS += --disable-samplerate
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 VLC_CONF_OPTS += --enable-sftp
 VLC_DEPENDENCIES += libssh2
-- 
2.18.0
