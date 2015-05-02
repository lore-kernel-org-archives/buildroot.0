From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 09:32:38 +0200
Subject: [Buildroot] [git commit] libcap-ng: add patch to fix musl build
Message-ID: <20150502073312.849A3807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=741bc4d232dc8d6187eaa12ea69316cabe4ef6af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/98c/98c296d8bd717f4419fc6010dc9c92df3027a9f0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap-ng/0001-add-missing-include.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/libcap-ng/0001-add-missing-include.patch b/package/libcap-ng/0001-add-missing-include.patch
new file mode 100644
index 0000000..c30c40d
--- /dev/null
+++ b/package/libcap-ng/0001-add-missing-include.patch
@@ -0,0 +1,22 @@
+Add missing include <sys/types.h>
+
+This include is needed to get the pid_t definition, at least with the
+musl C library.
+
+Patch inspired from Alpine Linux patch
+http://git.alpinelinux.org/cgit/aports/tree/main/libcap-ng/fix-includes.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/utils/proc-llist.h
+===================================================================
+--- a/utils/proc-llist.h
++++ b/utils/proc-llist.h
+@@ -26,6 +26,7 @@
+ 
+ #include "config.h"
+ 
++#include <sys/types.h>
+ 
+ /* This is the node of the linked list. Any data elements that are per
+  *  record goes here. */
