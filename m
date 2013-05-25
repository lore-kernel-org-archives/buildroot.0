From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 May 2013 13:26:09 +0200
Subject: [Buildroot] [git commit] urg: Add urg-select-h.patch.
Message-ID: <20130525113009.013279A536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ef3a7a7c7ba52bb6819715da8e5967c7997823e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes a build failure on AArch64 (and potentially others).
Make sure sys/select.h is included before using select(2).

Signed-off-by: Will Newton <will.newton@linaro.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/urg/urg-select-h.patch |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/urg/urg-select-h.patch b/package/urg/urg-select-h.patch
new file mode 100644
index 0000000..09d1530
--- /dev/null
+++ b/package/urg/urg-select-h.patch
@@ -0,0 +1,11 @@
+--- urg-0.8.18/src/c/connection/serial_ctrl_lin.c	2010-11-22 01:48:01.000000000 +0000
++++ urg-0.8.18.mod/src/c/connection/serial_ctrl_lin.c	2013-05-21 20:56:35.822025969 +0100
+@@ -17,7 +17,7 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <string.h>
+-
++#include <sys/select.h>
+ //#include <ctype.h>
+ 
+ enum {
