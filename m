From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  9 Feb 2014 13:47:11 +0100
Subject: [Buildroot] [PATCH 3/4] vlc: fix glx support
In-Reply-To: <1391950032-5312-1-git-send-email-s.martin49@gmail.com>
References: <1391950032-5312-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391950032-5312-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glx support is provided by the mesa3d package; so, enable it only when
mesa3d is part of the package selection.

Fixes:
  http://autobuild.buildroot.org/results/9b4/9b46021ea0064850ce8f1adcb5455d6da5bff459/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 2730f07..fd49040 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -101,6 +101,13 @@ else
 VLC_CONF_OPT += --disable-flac
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+VLC_CONF_OPT += --enable-glx
+VLC_DEPENDENCIES += mesa3d
+else
+VLC_CONF_OPT += --disable-glx
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 VLC_CONF_OPT += --enable-opus
 VLC_DEPENDENCIES += opus
-- 
1.8.5.4
