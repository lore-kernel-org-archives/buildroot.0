From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Apr 2015 23:23:28 +0200
Subject: [Buildroot] [PATCH 1/2] package/vlc: use only glesv2, not glesv1
Message-ID: <1429737809-17368-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/0be/0bee8646c2dd7dd2c201ee2986f3e802277314a5/
http://autobuild.buildroot.net/results/64a/64a1a6d39b72b9dec4231b9f28ca14b38989d7df/
http://autobuild.buildroot.net/results/b6b/b6b66e0b24d985462ca8dbefedd740453ca42293/
http://autobuild.buildroot.net/results/497/4976f5e9dc53e6f9f29d9d45f0fb9bd42c7ab1ea/

and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e77d4fa..b937b79 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -24,6 +24,7 @@ endef
 VLC_POST_PATCH_HOOKS += VLC_OVERRIDE_PKG_M4
 
 VLC_CONF_OPTS += \
+	--disable-gles1 \
 	--disable-a52 \
 	--disable-shout \
 	--disable-twolame \
@@ -137,10 +138,10 @@ VLC_DEPENDENCIES += libgl
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-VLC_CONF_OPTS += --enable-gles1 --enable-gles2
+VLC_CONF_OPTS += --enable-gles2
 VLC_DEPENDENCIES += libgles
 else
-VLC_CONF_OPTS += --disable-gles1 --disable-gles2
+VLC_CONF_OPTS += --disable-gles2
 endif
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
-- 
1.7.10.4
