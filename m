From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 08:59:21 +0100
Subject: [Buildroot] [git commit] gdisk: close(2) needs unistd.h
Message-ID: <20121103080054.174F599A70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7053563f5c4d55edac75eaf833f473b7818b6e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c557ee7cd1247e024b5edccf5f824eb4d5212e25

Fixed upstream as well in the (big) 0.8.3 commit:
http://gptfdisk.git.sourceforge.net/git/gitweb.cgi?p=gptfdisk/gptfdisk;a=commit;h=3488294d718a0e8b7f312c80c9e5729671173f6a

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gdisk/gdisk-0.6.14-unistd.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/gdisk/gdisk-0.6.14-unistd.patch b/package/gdisk/gdisk-0.6.14-unistd.patch
new file mode 100644
index 0000000..97627da
--- /dev/null
+++ b/package/gdisk/gdisk-0.6.14-unistd.patch
@@ -0,0 +1,19 @@
+[PATCH] close(2) needs unistd.h
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ diskio-unix.cc |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: gdisk-0.6.14/diskio-unix.cc
+===================================================================
+--- gdisk-0.6.14.orig/diskio-unix.cc
++++ gdisk-0.6.14/diskio-unix.cc
+@@ -22,6 +22,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <sys/stat.h>
++#include <unistd.h>
+ #include <iostream>
+ 
+ #include "diskio.h"
