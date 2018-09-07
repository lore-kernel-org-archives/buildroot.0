From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:13 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 libsecret
Message-ID: <20180907111514.735D3800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02cc1e770671ab65bc0b2767e4e60355af98e7d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index fab08b950d..f777d86bda 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -74,7 +74,6 @@ VLC_CONF_OPTS += \
 	--disable-notify \
 	--disable-projectm \
 	--disable-schroedinger \
-	--disable-secret \
 	--disable-soxr \
 	--disable-shine \
 	--disable-shout \
@@ -338,6 +337,13 @@ else
 VLC_CONF_OPTS += --disable-samplerate
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSECRET),y)
+VLC_CONF_OPTS += --enable-secret
+VLC_DEPENDENCIES += libsecret
+else
+VLC_CONF_OPTS += --disable-secret
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 VLC_CONF_OPTS += --enable-sftp
 VLC_DEPENDENCIES += libssh2
