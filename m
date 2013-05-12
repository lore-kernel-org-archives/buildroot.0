From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 13 May 2013 00:43:07 +0200
Subject: [Buildroot] [PATCH] gst-plugins-bad: fix build of directfb plugin
Message-ID: <1368398587-21415-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../gst-plugins-bad-0002-fix-dfb-example.patch     | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch

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
-- 
1.8.2.1
