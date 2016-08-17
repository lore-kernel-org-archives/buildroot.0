From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 17 Aug 2016 20:40:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel: use
	-O2 build optimisation level
Message-ID: <1471459209-21757-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported by Gustavo:
http://lists.busybox.net/pipermail/buildroot/2016-August/169959.html

The fix was suggested on the Gentoo bugtracker:
https://bugs.gentoo.org/show_bug.cgi?id=582910#c4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 64e9269..bfe0527 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -10,9 +10,11 @@ XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
 
-# this fixes a getline-related compilation error in src/sna/kgem.c
+# -D_GNU_SOURCE fixes a getline-related compile error in src/sna/kgem.c
+# We force -O2 regardless of the optimization level chosen by the user,
+# as compiling this package is known to be broken with -Os.
 XDRIVER_XF86_VIDEO_INTEL_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -O2"
 
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS = \
 	--disable-xvmc \
-- 
2.8.1
