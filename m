From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:02:03 +0200
Subject: [Buildroot] [git commit] package/mesa3d: fix musl build error
Message-ID: <20180617115947.204328871C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5ff91f36e3b0c4aa475b9e30a9ccdff6178e9ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/ccd/ccd07150e459b2b2caba6e561ecc6eae60c83ef5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/0003-musl-time-h.patch | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/mesa3d/0003-musl-time-h.patch b/package/mesa3d/0003-musl-time-h.patch
new file mode 100644
index 0000000000..811d135622
--- /dev/null
+++ b/package/mesa3d/0003-musl-time-h.patch
@@ -0,0 +1,33 @@
+From 3c288da5eec81ee58b85927df18d9194ead8f5c2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 12 Jun 2018 11:59:01 +0100
+Subject: drivers/dri/i965: add missing #include
+
+brw_bufmgr.h uses time_t without include time.h, so the build fails under musl.
+
+Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
+
+Downloaded from upstream commit
+https://cgit.freedesktop.org/mesa/mesa/commit/src/mesa/drivers/dri/i965/brw_bufmgr.h?id=3c288da5eec81ee58b85927df18d9194ead8f5c2
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/mesa/drivers/dri/i965/brw_bufmgr.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/mesa/drivers/dri/i965/brw_bufmgr.h b/src/mesa/drivers/dri/i965/brw_bufmgr.h
+index 8cdf944..32fc7a5 100644
+--- a/src/mesa/drivers/dri/i965/brw_bufmgr.h
++++ b/src/mesa/drivers/dri/i965/brw_bufmgr.h
+@@ -37,6 +37,8 @@
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
++#include <time.h>
++
+ #include "util/u_atomic.h"
+ #include "util/list.h"
+ 
+-- 
+cgit v1.1
+
