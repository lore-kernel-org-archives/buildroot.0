From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:51:35 +0200
Subject: [Buildroot] [git commit] ser2net: bump to version 2.10.1
Message-ID: <20160603075313.208B281F33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=946249ff02f2d67c1625267c18806bd6f32ac82b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-TIOCSRS485-undeclared-error.patch     | 65 ----------------------
 package/ser2net/ser2net.hash                       |  2 +-
 package/ser2net/ser2net.mk                         |  2 +-
 3 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/package/ser2net/0001-Fix-TIOCSRS485-undeclared-error.patch b/package/ser2net/0001-Fix-TIOCSRS485-undeclared-error.patch
deleted file mode 100644
index 9c6d168..0000000
--- a/package/ser2net/0001-Fix-TIOCSRS485-undeclared-error.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-ser2net: Fix compilation failures due to missing TIOCSRS485 macro
-
-Patch sent upstream:
-	https://sourceforge.net/p/ser2net/mailman/message/32905302/
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From: Yegor Yefremov <yegorslists@googlemail.com>
-
-include <asm-generic/ioctls.h> fixes compilations for systems,
-where <asm-generic/ioctls.h> won't be included automatically.
-
-Move special Linux includes to dataxfer.h.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- dataxfer.h | 5 +++--
- devcfg.c   | 2 --
- 2 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/dataxfer.h b/dataxfer.h
-index bd2665e..c3d7431 100644
---- a/dataxfer.h
-+++ b/dataxfer.h
-@@ -20,8 +20,6 @@
- #ifndef DATAXFER
- #define DATAXFER
- 
--#include <linux/serial.h>
--
- #include "controller.h"
- 
- #ifdef USE_UUCP_LOCKING
-@@ -30,6 +28,9 @@ extern int uucp_locking_enabled;
- 
- #ifdef linux
- 
-+#include <linux/serial.h>
-+#include <asm-generic/ioctls.h>
-+
- #define USE_RS485_FEATURE
- 
- /* Check, if the toolchain provides serial_rs485 structure and macros */
-diff --git a/devcfg.c b/devcfg.c
-index ab819a6..1f84714 100644
---- a/devcfg.c
-+++ b/devcfg.c
-@@ -18,7 +18,6 @@
-  */
- 
- /* This code handles generating the configuration for the serial port. */
--
- #include <unistd.h>
- #include <termios.h>
- #include <sys/ioctl.h>
-@@ -31,7 +30,6 @@
- #include <signal.h>
- #include <errno.h>
- #include <syslog.h>
--#include <linux/serial.h>
- 
- #include "ser2net.h"
- #include "selector.h"
--- 
-1.9.1
diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 4675164..a02a981 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  98f6193225338e25f35302fef5e1f16688693ed43e7b3c3e9e09187eb54547ac  ser2net-2.10.0.tar.gz
+sha256  cee4ad8fb3531281e8761751694dfab39d681022b2363b1edeba764d397c3c99  ser2net-2.10.1.tar.gz
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 414f1ed..ac64c3d 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 2.10.0
+SER2NET_VERSION = 2.10.1
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
