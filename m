From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 13:14:21 +0100
Subject: [Buildroot] [git commit] cifs-utils: bump to version 6.5
Message-ID: <20160309121502.9FB8D7FE19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d191c0d096322397c6efe42a9370824c5f1cdbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is upstream so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch | 31 ----------------------
 package/cifs-utils/cifs-utils.hash                 |  2 +-
 package/cifs-utils/cifs-utils.mk                   |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/cifs-utils/0001-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch b/package/cifs-utils/0001-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch
deleted file mode 100644
index 8fbec11..0000000
--- a/package/cifs-utils/0001-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6603cef0f06c450196a1bca06bb143d8fcda5651 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Fri, 5 Dec 2014 23:19:29 +0100
-Subject: [PATCH 1/1] mtab.c: include <paths.h> for _PATH_MOUNTED
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Backported from: 6603cef0f06c450196a1bca06bb143d8fcda5651
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- mtab.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mtab.c b/mtab.c
-index 7b365b3..a662a3c 100644
---- a/mtab.c
-+++ b/mtab.c
-@@ -38,6 +38,7 @@
- #include <mntent.h>
- #include <stdlib.h>
- #include <signal.h>
-+#include <paths.h>
- #include "mount.h"
- #include "config.h"
- 
--- 
-2.5.0
-
diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index 9255179..c49ced4 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	38fc63926af435dae4ebcf4406275580a692d9fb9ee3e32170317cf2ba68e6e3	cifs-utils-6.4.tar.bz2
+sha256	e2776578b8267c6dc0862897f5e10f87f10f8337fca9ca6a9118f5eb30cf49f7	cifs-utils-6.5.tar.bz2
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 89358b1..9d4e223 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.4
+CIFS_UTILS_VERSION = 6.5
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
