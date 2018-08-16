From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 12:00:51 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: add optional
 dependency to libsamplerate
Message-ID: <20180816113141.706B78D23D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70858702a7aabd8a6162c5e15be214a0bce2aecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
