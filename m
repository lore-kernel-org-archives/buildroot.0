From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:31:24 +0200
Subject: [Buildroot] [git commit] package/umtprd: bump to version 1.3.10
Message-ID: <20201024202823.5D420842D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ea234b15d9f7a1371e83144ec12bae6c5ab412b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump package to the latest version 1.3.10, and remove the two patches
which are not needed anymore.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ons-build-errors-warnings-on-some-systems.patch | 38 -----------
 ...ng-definition-build-error-on-some-systems.patch | 78 ----------------------
 package/umtprd/umtprd.hash                         |  2 +-
 package/umtprd/umtprd.mk                           |  2 +-
 4 files changed, 2 insertions(+), 118 deletions(-)

diff --git a/package/umtprd/0001-Fix-the-missing-definitions-build-errors-warnings-on-some-systems.patch b/package/umtprd/0001-Fix-the-missing-definitions-build-errors-warnings-on-some-systems.patch
deleted file mode 100644
index 78dfb3657f..0000000000
--- a/package/umtprd/0001-Fix-the-missing-definitions-build-errors-warnings-on-some-systems.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b6eccf2160fd16405542249c62a87aff2fbfcd33 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jean-Fran=C3=A7ois=20DEL=20NERO?=
- <jeanfrancoisdelnero@free.fr>
-Date: Sat, 16 May 2020 09:37:40 +0200
-Subject: [PATCH] Fix the missing definitions build errors/warnings on some
- systems.
-
-[Retrieved from:
-https://github.com/viveris/uMTP-Responder/commit/b6eccf2160fd16405542249c62a87aff2fbfcd33]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/usb_gadget.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/usb_gadget.c b/src/usb_gadget.c
-index 856bb53..9f3896f 100644
---- a/src/usb_gadget.c
-+++ b/src/usb_gadget.c
-@@ -27,7 +27,10 @@
- 
- #include "buildconf.h"
- 
-+#include <endian.h>
- #include <inttypes.h>
-+#include <pthread.h>
-+#include <sys/time.h>
- 
- #include <sys/ioctl.h>
- 
-@@ -38,7 +41,7 @@
- #include <unistd.h>
- #include <string.h>
- #include <stdio.h>
--#include <pthread.h>
-+
- #include <signal.h>
- 
- #include <errno.h>
diff --git a/package/umtprd/0002-Fix-the-pthread-missing-definition-build-error-on-some-systems.patch b/package/umtprd/0002-Fix-the-pthread-missing-definition-build-error-on-some-systems.patch
deleted file mode 100644
index b7d211c6eb..0000000000
--- a/package/umtprd/0002-Fix-the-pthread-missing-definition-build-error-on-some-systems.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 2e7aaf0c373a0e3a271f4b374bd98de8a80aefb0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jean-Fran=C3=A7ois=20DEL=20NERO?=
- <jeanfrancoisdelnero@free.fr>
-Date: Sat, 16 May 2020 09:20:01 +0200
-Subject: [PATCH] Fix the pthread missing definition build error on some
- systems.
-
-[Retrieved from:
-https://github.com/viveris/uMTP-Responder/commit/2e7aaf0c373a0e3a271f4b374bd98de8a80aefb0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/fs_handles_db.c                    | 1 +
- src/mtp_cfg.c                          | 1 +
- src/mtp_datasets.c                     | 1 +
- src/mtp_operations/mtp_op_sendobject.c | 1 +
- src/mtp_properties.c                   | 1 +
- 5 files changed, 5 insertions(+)
-
-diff --git a/src/fs_handles_db.c b/src/fs_handles_db.c
-index a91268a..178bd90 100644
---- a/src/fs_handles_db.c
-+++ b/src/fs_handles_db.c
-@@ -26,6 +26,7 @@
- #include "buildconf.h"
- 
- #include <inttypes.h>
-+#include <pthread.h>
- #include <unistd.h>
- #include <fcntl.h>
- #include <string.h>
-diff --git a/src/mtp_cfg.c b/src/mtp_cfg.c
-index 30f473a..1f2302d 100644
---- a/src/mtp_cfg.c
-+++ b/src/mtp_cfg.c
-@@ -26,6 +26,7 @@
- #include "buildconf.h"
- 
- #include <inttypes.h>
-+#include <pthread.h>
- #include <stdlib.h>
- #include <stdio.h>
- #include <string.h>
-diff --git a/src/mtp_datasets.c b/src/mtp_datasets.c
-index 95cec68..fbd67e2 100644
---- a/src/mtp_datasets.c
-+++ b/src/mtp_datasets.c
-@@ -26,6 +26,7 @@
- #include "buildconf.h"
- 
- #include <inttypes.h>
-+#include <pthread.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/statvfs.h>
-diff --git a/src/mtp_operations/mtp_op_sendobject.c b/src/mtp_operations/mtp_op_sendobject.c
-index 8af2c6b..8e1498c 100644
---- a/src/mtp_operations/mtp_op_sendobject.c
-+++ b/src/mtp_operations/mtp_op_sendobject.c
-@@ -26,6 +26,7 @@
- #include "buildconf.h"
- 
- #include <inttypes.h>
-+#include <pthread.h>
- #include <unistd.h>
- #include <fcntl.h>
- #include <pthread.h>
-diff --git a/src/mtp_properties.c b/src/mtp_properties.c
-index 4500cd4..5cf6e2d 100644
---- a/src/mtp_properties.c
-+++ b/src/mtp_properties.c
-@@ -26,6 +26,7 @@
- #include "buildconf.h"
- 
- #include <inttypes.h>
-+#include <pthread.h>
- #include <string.h>
- #include <stdio.h>
- #include <sys/types.h>
diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
index b6520c04e7..170837d84b 100644
--- a/package/umtprd/umtprd.hash
+++ b/package/umtprd/umtprd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	5f6f9f2882597cd3767b12b0814fdfa27c0cb18ce32e3082176f9658be167a27	umtprd-1.3.6.tar.gz
+sha256	cce45c7d3df0022fc013c79de21b1f11b1027d090aeb628669f08b0c20d2afdd	umtprd-1.3.10.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE
diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
index 944d1a621b..f1a4e66cff 100644
--- a/package/umtprd/umtprd.mk
+++ b/package/umtprd/umtprd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UMTPRD_VERSION = 1.3.6
+UMTPRD_VERSION = 1.3.10
 UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
 UMTPRD_LICENSE = GPL-3.0+
 UMTPRD_LICENSE_FILES = LICENSE
