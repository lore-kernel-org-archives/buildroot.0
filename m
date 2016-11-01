From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:20:50 +0100
Subject: [Buildroot] [git commit] gupnp-tools: fix when using latest gupnp-av
Message-ID: <20161101152108.D47A881844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db7b1040dcd0c2a24b65cbe94518d16d00f16ba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include gupnp.h ourselves, gupnp-av.h doesn't drag it in anymore

Backported from: e9ec9634207e4c2eea6d268ee29b57e687c1f178
The patch retrieved from the official gnome URL
(https://git.gnome.org/browse/gupnp-tools/patch/?id=e9ec9634207e4c2eea6d268ee29b57e687c1f178)
can not be applied through GUPNP_TOOLS_PATCH as it does not end with the
'.patch*' pattern

Fixes:
  - http://autobuild.buildroot.org/results/329851daa060f23c55f996c1b0f323d41f85ccb2

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Fix-compiling-when-using-recent-GUPnP-AV.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/gupnp-tools/0001-Fix-compiling-when-using-recent-GUPnP-AV.patch b/package/gupnp-tools/0001-Fix-compiling-when-using-recent-GUPnP-AV.patch
new file mode 100644
index 0000000..6d3769f
--- /dev/null
+++ b/package/gupnp-tools/0001-Fix-compiling-when-using-recent-GUPnP-AV.patch
@@ -0,0 +1,27 @@
+From e9ec9634207e4c2eea6d268ee29b57e687c1f178 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Sun, 16 Oct 2016 21:51:39 +0200
+Subject: av-cp: Fix compiling when using recent GUPnP-AV
+
+Include gupnp.h ourselves, gupnp-av.h doesn't drag it in anymore
+
+Signed-off-by: Jens Georg <mail@jensge.org>
+---
+ src/av-cp/playlist-treeview.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/av-cp/playlist-treeview.h b/src/av-cp/playlist-treeview.h
+index 8637ae8..16b131e 100644
+--- a/src/av-cp/playlist-treeview.h
++++ b/src/av-cp/playlist-treeview.h
+@@ -23,6 +23,8 @@
+ 
+ #include <config.h>
+ #include <gtk/gtk.h>
++
++#include <libgupnp/gupnp.h>
+ #include <libgupnp-av/gupnp-av.h>
+ 
+ typedef void (* MetadataFunc) (const char *metadata,
+-- 
+cgit v0.12
