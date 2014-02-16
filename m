From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 23:00:04 +0100
Subject: [Buildroot] [PATCH 11/11] vlc: add opencv support
In-Reply-To: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1392588004-13317-12-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opencv support for video filter in vlc requires a couple of opencv
features to be enabled.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ad7d9ff..14d6538 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -108,6 +108,13 @@ else
 VLC_CONF_OPT += --disable-glx
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_LIB_LEGACY)$(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),yy)
+VCL_CONF_OPT += --with-opencv
+VLC_DEPENDENCIES += opencv
+else
+VLC_CONF_OPT += --without-opencv
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 VLC_CONF_OPT += --enable-opus
 VLC_DEPENDENCIES += opus
-- 
1.8.5.4
