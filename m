From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:06 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 libsoxr
Message-ID: <20180907111514.8B68A7FB4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1291938c6c5128001bd906c6d5694674840fb471
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
