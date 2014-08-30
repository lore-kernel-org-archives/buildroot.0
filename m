From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 23:30:49 +0200
Subject: [Buildroot] [git commit] package/libdaemon: add patch to fix build
	with the musl C library
Message-ID: <20140830213256.E582A9D599@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14193ee8740fc1663ca090ecb0ce9ae195b60be0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds a patch to the package libdaemon which removes an error when building
libdaemon against the musl C library.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...estd-use-unistd-h-instead-of-sys-unistd-h.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/libdaemon/libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch b/package/libdaemon/libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch
new file mode 100644
index 0000000..c8f4270
--- /dev/null
+++ b/package/libdaemon/libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch
@@ -0,0 +1,16 @@
+examples/testd.c: As the C POSIX library recommends include the <unistd.h>
+instead of <sys/unistd.h>. This removes an error when building libdaemon
+against the musl C library.
+
+Signed-off-by: J??rg Krause <jkrause@posteo.de>
+--- libdaemon-0.14.orig/examples/testd.c	2014-08-30 00:27:08.359832977 +0200
++++ libdaemon-0.14/examples/testd.c	2014-08-30 00:27:25.439832670 +0200
+@@ -23,7 +23,7 @@
+ #include <string.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ #include <sys/select.h>
+ 
+ #include <libdaemon/dfork.h>
