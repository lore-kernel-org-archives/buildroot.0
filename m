From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:55:42 +0200
Subject: [Buildroot] [git commit] bluez_utils: add patch to fix musl build
	issue
Message-ID: <20150406215608.44A828197A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4b8e7a413e20fcfbbf603e75b40467f94496d1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/e87/e87b45035077c26b786ebd111050d3ec278910bb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-tools-hciconfig-include-fcntl.h.patch     |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/bluez_utils/0002-tools-hciconfig-include-fcntl.h.patch b/package/bluez_utils/0002-tools-hciconfig-include-fcntl.h.patch
new file mode 100644
index 0000000..7d0763f
--- /dev/null
+++ b/package/bluez_utils/0002-tools-hciconfig-include-fcntl.h.patch
@@ -0,0 +1,27 @@
+From ae607756a5f2a09bce1fc3a52e74b5f471245e33 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 6 Apr 2015 23:54:19 +0200
+Subject: [PATCH] tools/hciconfig: include <fcntl.h>
+
+Needed to get the definition of mode_t in musl.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tools/hciconfig.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/hciconfig.c b/tools/hciconfig.c
+index f1458b9..6776d62 100644
+--- a/tools/hciconfig.c
++++ b/tools/hciconfig.c
+@@ -34,6 +34,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <getopt.h>
++#include <fcntl.h>
+ #include <sys/param.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+-- 
+2.1.0
+
