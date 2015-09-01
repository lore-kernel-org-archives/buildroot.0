From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2015 22:05:28 +0200
Subject: [Buildroot] [git commit] package/dmraid: fix compilation under musl
Message-ID: <20150901200659.5E26081E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1ff456745bd4e8dfb99ef3db253d03add21c40a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/feb/feb731da1d865b82781366798ffa8aaf40cf2ec4/
http://autobuild.buildroot.net/results/fcf/fcf1ea738da90016900c04313cdcb3a02658e953/
http://autobuild.buildroot.net/results/385/385e07e9097d877cd1babdd4133fbe14a8f217d9/

.. and others.

Note, upstream package appears dormant.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dmraid/0001-fix-compilation-under-musl.patch   |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/dmraid/0001-fix-compilation-under-musl.patch b/package/dmraid/0001-fix-compilation-under-musl.patch
new file mode 100644
index 0000000..7cf8792
--- /dev/null
+++ b/package/dmraid/0001-fix-compilation-under-musl.patch
@@ -0,0 +1,47 @@
+From 89c7fc15e064dd407e6d5ccefe78985b86b8a036 Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Tue, 1 Sep 2015 12:26:36 +0100
+Subject: [PATCH 1/1] fix compilation under musl
+
+Patch borrowed from Void Linux :
+
+https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dmraid/patches/25_musl-libc.patch
+
+Upstream package appears dormant, no mailing list and no
+maintainence releases since Nov 2010.
+
+Upstream-Status: dormant
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+
+---
+ 1.0.0.rc16-3/dmraid/include/dmraid/misc.h | 1 +
+ 1.0.0.rc16-3/dmraid/lib/device/scan.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/1.0.0.rc16-3/dmraid/include/dmraid/misc.h b/1.0.0.rc16-3/dmraid/include/dmraid/misc.h
+index 247a68e..1b1dfdf 100644
+--- a/1.0.0.rc16-3/dmraid/include/dmraid/misc.h
++++ b/1.0.0.rc16-3/dmraid/include/dmraid/misc.h
+@@ -10,6 +10,7 @@
+ 
+ #ifndef _MISC_H_
+ #define _MISC_H_
++#include <fcntl.h>
+ 
+ #define DM_ASSERT(__cond) do { if (!(__cond)) { printf("ASSERT file:%s line:%d fuction:%s cond: %s\n", __FILE__, __LINE__, __FUNCTION__, #__cond); } } while(0);
+ 
+diff --git a/1.0.0.rc16-3/dmraid/lib/device/scan.c b/1.0.0.rc16-3/dmraid/lib/device/scan.c
+index a040d53..6897146 100644
+--- a/1.0.0.rc16-3/dmraid/lib/device/scan.c
++++ b/1.0.0.rc16-3/dmraid/lib/device/scan.c
+@@ -10,6 +10,7 @@
+ # include <dirent.h>
+ # include <paths.h>
+ #else
++# include <paths.h>
+ # include <dirent.h>
+ # include <mntent.h>
+ #endif
+-- 
+2.4.3
+
