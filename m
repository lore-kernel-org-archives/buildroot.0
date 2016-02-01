From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 14:11:33 +0100
Subject: [Buildroot] [git commit] package/libseccomp: fix musl build
Message-ID: <20160201224703.41EFF7F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e143c2f4d6d95d630e89e45408fdbd6b535b59ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/0cd/0cd47d7e6a49c268b57981ae8bb9abe4c4a183c7/
http://autobuild.buildroot.net/results/34b/34b0bea52bd7e65a927142dc0e1f28f85629c634/

[Thomas: adjust patch format.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libseccomp/0002-musl.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/libseccomp/0002-musl.patch b/package/libseccomp/0002-musl.patch
new file mode 100644
index 0000000..9858d76
--- /dev/null
+++ b/package/libseccomp/0002-musl.patch
@@ -0,0 +1,28 @@
+From eb5382287cd25235e760b5da4939510b11bbf2a1 Mon Sep 17 00:00:00 2001
+From: Kylie McClain <somasis@exherbo.org>
+Date: Fri, 1 Jan 2016 13:12:59 -0500
+Subject: [PATCH] system.h: Remove conflicting kernel header include
+
+This fixes building on musl libc, since musl does not include kernel
+headers. I've tested this as working on both glibc and musl.
+
+Signed-off-by: Kylie McClain <somasis@exherbo.org>
+[Bernd: downloaded from upstream PR:
+ https://github.com/seccomp/libseccomp/pull/23]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/system.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/system.h b/src/system.h
+index 4660679..e84b0a0 100644
+--- a/src/system.h
++++ b/src/system.h
+@@ -23,7 +23,6 @@
+ #define _SYSTEM_H
+ 
+ #include <linux/filter.h>
+-#include <linux/prctl.h>
+ 
+ #include "configure.h"
+ 
