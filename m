From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 7 Nov 2010 10:42:45 +0100
Subject: [Buildroot] [git commit master 1/1] libglib2: fix compilation when
	compiler has no builtin atomic
Message-ID: <20101107094405.AEAE68DBFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6c01ef20ee96f770bf7fc0fede90b3861d529015
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported here: https://bugzilla.gnome.org/show_bug.cgi?id=631353

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....0-fix-compilation-with-no-builtin-atomic.patch |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/libglib2/libglib-2.26.0-fix-compilation-with-no-builtin-atomic.patch

diff --git a/package/libglib2/libglib-2.26.0-fix-compilation-with-no-builtin-atomic.patch b/package/libglib2/libglib-2.26.0-fix-compilation-with-no-builtin-atomic.patch
new file mode 100644
index 0000000..39c0510
--- /dev/null
+++ b/package/libglib2/libglib-2.26.0-fix-compilation-with-no-builtin-atomic.patch
@@ -0,0 +1,25 @@
+From 58096320ea0888c4fbbff318839017a4d2e82703 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <llandwerlin@gmail.com>
+Date: Sat, 6 Nov 2010 14:56:15 +0100
+Subject: [PATCH] glib: fix compilation with no builtin atomic operations compilers
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ glib/gatomic.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/glib/gatomic.c b/glib/gatomic.c
+index 845c866..01468ce 100644
+--- a/glib/gatomic.c
++++ b/glib/gatomic.c
+@@ -881,6 +881,7 @@ g_atomic_pointer_compare_and_exchange (volatile gpointer G_GNUC_MAY_ALIAS *atomi
+ #endif /* DEFINE_WITH_WIN32_INTERLOCKED */
+ 
+ #ifdef DEFINE_WITH_MUTEXES
++# include "gthread.h"
+ /* We have to use the slow, but safe locking method */
+ static GMutex *g_atomic_mutex; 
+ 
+-- 
+1.7.2.3
+
-- 
1.7.1
