From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:53:35 +0100
Subject: [Buildroot] [PATCH 055/120] xdriver_xf86-video-glint: bump revision
	to X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-56-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 ...iver_xf86-video-glint-1.2.1-cross-compile.patch |   29 --------------------
 .../xdriver_xf86-video-glint.mk                    |    2 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch

diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
deleted file mode 100644
index 8c420d3..0000000
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- a/configure.ac	2008-06-23 11:17:07.000000000 -0400
-+++ b/configure.ac	2008-06-23 11:16:31.000000000 -0400
-@@ -75,12 +75,20 @@ CPPFLAGS="$SAVE_CPPFLAGS"
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--        AC_CHECK_FILE([${sdkdir}/dri.h],
--                      [have_dri_h="yes"], [have_dri_h="no"])
--        AC_CHECK_FILE([${sdkdir}/sarea.h],
--                      [have_sarea_h="yes"], [have_sarea_h="no"])
--        AC_CHECK_FILE([${sdkdir}/dristruct.h],
--                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+  	if test "$cross_compiling" = "no" ; then
-+ 		AC_CHECK_FILE([${sdkdir}/dri.h],
-+                        [have_dri_h="yes"], [have_dri_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/sarea.h],
-+                        [have_sarea_h="yes"], [have_sarea_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+                        [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/damage.h],
-+                        [have_damage_h="yes"], [have_damage_h="no"])
-+  	else
-+  		have_dri_h="yes"
-+  		have_sarea_h="yes"
-+  		have_dristruct_h="yes"
-+  	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index cd294a5..40a0716 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GLINT_VERSION = 1.2.5
+XDRIVER_XF86_VIDEO_GLINT_VERSION = 1.2.7
 XDRIVER_XF86_VIDEO_GLINT_SOURCE = xf86-video-glint-$(XDRIVER_XF86_VIDEO_GLINT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
-- 
1.7.10.4
