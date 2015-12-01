From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 01 Dec 2015 23:21:16 -0000
Subject: [Buildroot] [git commit] trinity: bump to version 1.6
Message-ID: <20151201232114.F3CA7821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae326e335141b7ea9bc85eea07f99d4b900a6259
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump trinity version to 1.6. Remove backported vt.c missing include patch
as it is now included in the upstream release.

Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ssing-include-to-fix-building-with-uClibc.patch | 47 ----------------------
 package/trinity/trinity.mk                         |  2 +-
 2 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/package/trinity/0001-vt.c-add-missing-include-to-fix-building-with-uClibc.patch b/package/trinity/0001-vt.c-add-missing-include-to-fix-building-with-uClibc.patch
deleted file mode 100644
index e1d23cd..0000000
--- a/package/trinity/0001-vt.c-add-missing-include-to-fix-building-with-uClibc.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-vt.c: add missing include to fix building with uClibc
-
-Backporting an upstream patch to fix a building issue with uClibc.
-
-Upstream commit:
-
-  https://github.com/kernelslacker/trinity/commit/fb4a1adc4540f0702b84aa900f2b8ebed004885d
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From fb4a1adc4540f0702b84aa900f2b8ebed004885d Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 18 Mar 2015 09:58:46 +0000
-Subject: [PATCH] vt.c: add missing include to fix building with uClibc
-
-"#include <linux/serial.h>" is needed in order to build trinity
-successfully with uClibc. Otherwise it would fail displaying an error
-message like this one:
-
-ioctls/vt.c:152:8: error: invalid application of 'sizeof' to incomplete
-type 'struct serial_rs485'
-  IOCTL(TIOCGRS485),
-
-ioctls/vt.c:155:8: error: invalid application of 'sizeof' to incomplete
-type 'struct serial_rs485'
-  IOCTL(TIOCSRS485),
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- ioctls/vt.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/ioctls/vt.c b/ioctls/vt.c
-index 5e7e7d7..a4a7e0c 100644
---- a/ioctls/vt.c
-+++ b/ioctls/vt.c
-@@ -1,6 +1,7 @@
- #include <sys/vt.h>
- #include <sys/ioctl.h>
- #include <linux/kd.h>
-+#include <linux/serial.h>
- 
- #include "utils.h"
- #include "ioctls.h"
--- 
-1.7.1
-
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 211f1b6..7596e92 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRINITY_VERSION = v1.5
+TRINITY_VERSION = v1.6
 TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
 TRINITY_LICENSE = GPLv2
 TRINITY_LICENSE_FILES = COPYING
