From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 22:10:54 +0200
Subject: [Buildroot] [git commit] package/libdrm: Fix musl build error due
	to missing include of limits.h
Message-ID: <20150928201323.2FA47819EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cea5997837097876fb390206680cd66feb6ef0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/abb/abb935e7fe71369c593ae92b3acf4a2a674a0300/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...nclude-limits.h-to-fix-build-error-on-Sol.patch |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/libdrm/0002-xf86drm.c-Include-limits.h-to-fix-build-error-on-Sol.patch b/package/libdrm/0002-xf86drm.c-Include-limits.h-to-fix-build-error-on-Sol.patch
new file mode 100644
index 0000000..03b4524
--- /dev/null
+++ b/package/libdrm/0002-xf86drm.c-Include-limits.h-to-fix-build-error-on-Sol.patch
@@ -0,0 +1,31 @@
+From 3fed80daf1dcb0b5d20e623d27228726c735e138 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 27 Sep 2015 19:09:47 +0200
+Subject: [PATCH 1/1] xf86drm.c: Include limits.h to fix build error on Solaris
+ and with musl
+
+musl's strict implementation requires #include <limits.h> for PATH_MAX.
+
+Patch suggested by evgeny for Solaris:
+https://bugs.freedesktop.org/show_bug.cgi?id=92082
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xf86drm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xf86drm.c b/xf86drm.c
+index a9f5c29..ec985eb 100644
+--- a/xf86drm.c
++++ b/xf86drm.c
+@@ -53,6 +53,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/time.h>
+ #include <stdarg.h>
++#include <limits.h>
+ #ifdef HAVE_SYS_MKDEV_H
+ # include <sys/mkdev.h> /* defines major(), minor(), and makedev() on Solaris */
+ #endif
+-- 
+2.5.3
+
