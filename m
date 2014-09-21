From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 20:09:31 +0200
Subject: [Buildroot] [git commit] xinetd: Patch configure script to fix
	rlim_t test
Message-ID: <20140921180959.94D179D6E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cb90f1516b5b0b70fef2ce6eb5ff67d966ac2d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build with musl libc.

[Thomas: use 004 sequence number instead of 005 for the patch.]

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xinetd/xinetd-004-configure-rlim_t.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/xinetd/xinetd-004-configure-rlim_t.patch b/package/xinetd/xinetd-004-configure-rlim_t.patch
new file mode 100644
index 0000000..e1cb48a
--- /dev/null
+++ b/package/xinetd/xinetd-004-configure-rlim_t.patch
@@ -0,0 +1,18 @@
+Have the configure script look for rlim_t in <sys/resource.h>
+
+That's where POSIX says it should be. Some libcs will include its
+definition via <sys/types.h> as well, but musl doesn't.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+
+--- xinetd-2.3.15.orig/configure	2007-09-20 16:58:27.000000000 +0200
++++ xinetd-2.3.15/configure	2014-09-16 17:20:22.787665449 +0200
+@@ -7909,7 +7909,7 @@
+ cat confdefs.h >>conftest.$ac_ext
+ cat >>conftest.$ac_ext <<_ACEOF
+ /* end confdefs.h.  */
+-#include <sys/types.h>
++#include <sys/resource.h>
+ #if STDC_HEADERS
+ #include <stdlib.h>
+ #endif
