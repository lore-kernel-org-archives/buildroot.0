From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 23:07:56 +0200
Subject: [Buildroot] [git commit] xapp_xmodmap: Fix build problems due to
	missing asprintf definition
Message-ID: <20130605211328.714129A962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96f522ee7bc94b1440c5d53d44d26a491ca8f9ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=48696

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch |   69 ++++++++++++++++++++
 1 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch b/package/x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch
new file mode 100644
index 0000000..8eb2b9c
--- /dev/null
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch
@@ -0,0 +1,69 @@
+Fixes build problems due to missing asprintf() definition
+
+Upstream bug: https://bugs.freedesktop.org/show_bug.cgi?id=48696
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+From dab3ce5b4b9d7078cd55515441b2ba244a32516a Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Mon, 23 Apr 2012 07:28:39 -0700
+Subject: [PATCH:xmodmap] include config.h before stdio.h & other system
+ headers
+
+Ensures definitions like _GNU_SOURCE are visible when needed.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+ exec.c    |    4 ++++
+ pf.c      |    4 ++++
+ xmodmap.c |    4 ++++
+ 3 files changed, 12 insertions(+)
+
+diff --git a/exec.c b/exec.c
+index dbcb669..419b10e 100644
+--- a/exec.c
++++ b/exec.c
+@@ -54,6 +54,10 @@ from The Open Group.
+  * original xmodmap, written by David Rosenthal, of Sun Microsystems.
+  */
+ 
++#ifdef HAVE_CONFIG_H
++# include "config.h"
++#endif
++
+ #include <X11/Xos.h>
+ #include <X11/Xlib.h>
+ #include <stdio.h>
+diff --git a/pf.c b/pf.c
+index 0eb0f55..3f0c3f4 100644
+--- a/pf.c
++++ b/pf.c
+@@ -26,6 +26,10 @@ from The Open Group.
+ 
+ */
+ 
++#ifdef HAVE_CONFIG_H
++# include "config.h"
++#endif
++
+ #include <X11/Xos.h>
+ #include <X11/Xlib.h>
+ #include <stdio.h>
+diff --git a/xmodmap.c b/xmodmap.c
+index 58a8e70..0f89629 100644
+--- a/xmodmap.c
++++ b/xmodmap.c
+@@ -26,6 +26,10 @@ from The Open Group.
+ 
+ */
+ 
++#ifdef HAVE_CONFIG_H
++# include "config.h"
++#endif
++
+ #include <X11/Xos.h>
+ #include <X11/Xlib.h>
+ #include <stdio.h>
+-- 
+1.7.9.2
+
