From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:21:30 +0100
Subject: [Buildroot] [git commit] package/mjpg-streamer: Fix musl build
Message-ID: <20160201224659.663037FAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f88a49064df9993efe2ecbc2d89e3e1301b983b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/74c/74c6006c4d7a97fa69c6feee204631861daffea9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mjpg-streamer/0001-musl-pthread.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/mjpg-streamer/0001-musl-pthread.patch b/package/mjpg-streamer/0001-musl-pthread.patch
new file mode 100644
index 0000000..9e76e76
--- /dev/null
+++ b/package/mjpg-streamer/0001-musl-pthread.patch
@@ -0,0 +1,18 @@
+Fix musl build
+
+Patch written by Thomas Petazzoni:
+http://patchwork.ozlabs.org/patch/572309/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b.org/plugins/input.h mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b/plugins/input.h
+--- mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b.org/plugins/input.h	2015-11-09 15:56:47.000000000 +0100
++++ mjpg-streamer-bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b/plugins/input.h	2016-01-26 20:19:05.884349502 +0100
+@@ -20,6 +20,7 @@
+ #                                                                              #
+ *******************************************************************************/
+ 
++#include <pthread.h>
+ #include <syslog.h>
+ #include "../mjpg_streamer.h"
+ #define INPUT_PLUGIN_PREFIX " i: "
