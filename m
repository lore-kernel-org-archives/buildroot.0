From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:15:38 +0100
Subject: [Buildroot] [git commit] xapp_xmodmap: Bump version to 1.0.8
Message-ID: <20140329222158.EDA109C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cff76d37ab1c09926e096785a019dc5f9266433
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed xapp_xmodmap-asprintf.patch, patch was applied upstream

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch |   69 --------------------
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |    4 +-
 2 files changed, 2 insertions(+), 71 deletions(-)

diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch b/package/x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch
deleted file mode 100644
index 8eb2b9c..0000000
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Fixes build problems due to missing asprintf() definition
-
-Upstream bug: https://bugs.freedesktop.org/show_bug.cgi?id=48696
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-
-From dab3ce5b4b9d7078cd55515441b2ba244a32516a Mon Sep 17 00:00:00 2001
-From: Alan Coopersmith <alan.coopersmith@oracle.com>
-Date: Mon, 23 Apr 2012 07:28:39 -0700
-Subject: [PATCH:xmodmap] include config.h before stdio.h & other system
- headers
-
-Ensures definitions like _GNU_SOURCE are visible when needed.
-
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
----
- exec.c    |    4 ++++
- pf.c      |    4 ++++
- xmodmap.c |    4 ++++
- 3 files changed, 12 insertions(+)
-
-diff --git a/exec.c b/exec.c
-index dbcb669..419b10e 100644
---- a/exec.c
-+++ b/exec.c
-@@ -54,6 +54,10 @@ from The Open Group.
-  * original xmodmap, written by David Rosenthal, of Sun Microsystems.
-  */
- 
-+#ifdef HAVE_CONFIG_H
-+# include "config.h"
-+#endif
-+
- #include <X11/Xos.h>
- #include <X11/Xlib.h>
- #include <stdio.h>
-diff --git a/pf.c b/pf.c
-index 0eb0f55..3f0c3f4 100644
---- a/pf.c
-+++ b/pf.c
-@@ -26,6 +26,10 @@ from The Open Group.
- 
- */
- 
-+#ifdef HAVE_CONFIG_H
-+# include "config.h"
-+#endif
-+
- #include <X11/Xos.h>
- #include <X11/Xlib.h>
- #include <stdio.h>
-diff --git a/xmodmap.c b/xmodmap.c
-index 58a8e70..0f89629 100644
---- a/xmodmap.c
-+++ b/xmodmap.c
-@@ -26,6 +26,10 @@ from The Open Group.
- 
- */
- 
-+#ifdef HAVE_CONFIG_H
-+# include "config.h"
-+#endif
-+
- #include <X11/Xos.h>
- #include <X11/Xlib.h>
- #include <stdio.h>
--- 
-1.7.9.2
-
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index c5bce07..50ec278 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -1,10 +1,10 @@
-################################################################################
+1################################################################################
 #
 # xapp_xmodmap
 #
 ################################################################################
 
-XAPP_XMODMAP_VERSION = 1.0.7
+XAPP_XMODMAP_VERSION = 1.0.8
 XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
 XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMODMAP_LICENSE = MIT
