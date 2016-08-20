From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 15:00:41 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-intel:
	use -O2 build optimisation level
Message-ID: <20160820130047.D0D707FBBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebb3e9ba914efa32b73cf9be1ef3e5fd5588d900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Gustavo:
http://lists.busybox.net/pipermail/buildroot/2016-August/169959.html

The fix was suggested on the Gentoo bugtracker:
https://bugs.gentoo.org/show_bug.cgi?id=582910#c4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
