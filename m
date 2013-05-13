From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 May 2013 13:23:50 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: fix build of directfb
	plugin
Message-ID: <20130513112616.5453E9A1A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e384dcb8fa13fc9ba7eed3417c1371392e3bec0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst-plugins-bad-0002-fix-dfb-example.patch     |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch b/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
new file mode 100644
index 0000000..b205748
--- /dev/null
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
@@ -0,0 +1,22 @@
+Fix dfb-example
+
+Order of inclusion gives a strange effect on the definition of
+gst_debug_log. Swapping the include statements solve it.
+
+Not upstreamed since there will be no more updates to this version
+of gst-plugins-bad.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+diff -rup gst-plugins-bad-0.10.23/ext/directfb/dfb-example.c gst-plugins-bad-0.10.23.fixed/ext/directfb/dfb-example.c
+--- gst-plugins-bad-0.10.23/ext/directfb/dfb-example.c	2011-12-11 19:49:11.000000000 +0100
++++ gst-plugins-bad-0.10.23.fixed/ext/directfb/dfb-example.c	2013-05-13 00:32:00.507469138 +0200
+@@ -1,7 +1,7 @@
+ 
+-#include <directfb.h>
+ #include <stdio.h>
+ #include <gst/gst.h>
++#include <directfb.h>
+ 
+ static IDirectFB *dfb = NULL;
+ static IDirectFBSurface *primary = NULL;
