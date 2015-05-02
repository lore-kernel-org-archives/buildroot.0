From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 09:42:19 +0200
Subject: [Buildroot] [git commit] boa: add patch to fix musl build issue
Message-ID: <20150502074224.40740807EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3526c15194eab9b3ef8d7ce3dc032a1290658fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/76a/76a8d5750c30321825acaa2fc3ce9d73a1c87bc7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boa/0001-use-name-max.patch |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/boa/0001-use-name-max.patch b/package/boa/0001-use-name-max.patch
new file mode 100644
index 0000000..055e56c
--- /dev/null
+++ b/package/boa/0001-use-name-max.patch
@@ -0,0 +1,21 @@
+Use NAME_MAX instead of MAXNAMLEN
+
+NAME_MAX is POSIX, and available in all C libraries, generally in
+<limits.h>, while MAXNAMLEN is BSD-specific, and only available in
+musl in <sys/param.h>. So let's use NAME_MAX instead of MAXNAMLEN.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/index_dir.c
+===================================================================
+--- a/src/index_dir.c
++++ b/src/index_dir.c
+@@ -29,7 +29,7 @@
+ #include <fcntl.h>
+ #include "compat.h"
+ 
+-#define MAX_FILE_LENGTH                         MAXNAMLEN
++#define MAX_FILE_LENGTH                         NAME_MAX
+ #define MAX_PATH_LENGTH                         PATH_MAX
+ 
+ #define INT_TO_HEX(x) \
