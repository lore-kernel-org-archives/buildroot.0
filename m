From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Feb 2019 22:43:29 +0100
Subject: [Buildroot] [git commit] package/s6-linux-utils: bump to 2.5.0.0
Message-ID: <20190202214451.45C14821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8ce0e6b4ebd93aca1b0e56bce73341df8f4bcfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 2.4.0.2, compilation under glibc 2.28 is fixed (and our local patch can
thus be removed).
While at it, bump to the latest released version 2.5.0.0.

Note: change in COPYING file is only the copyright year.

From the NEWS file:
"""
In 2.5.0.0
----------
 - Optional nsss support.
 - s6-devd, s6-uevent-listener, s6-uevent-spawner removed.

In 2.4.0.2
----------
 - s6-logwatch rewrite.
 - Better portability with old glibc versions.
 - s6-uevent-listener and s6-uevent-spawner are marked as deprecated. (The
   mdevd package obsoletes them.)
"""

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...de-sys-sysmacros.h-because-glibc-is-glibc.patch | 27 ----------------------
 package/s6-linux-utils/s6-linux-utils.hash         |  4 ++--
 package/s6-linux-utils/s6-linux-utils.mk           |  2 +-
 3 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/package/s6-linux-utils/0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch b/package/s6-linux-utils/0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch
deleted file mode 100644
index ac31394f2b..0000000000
--- a/package/s6-linux-utils/0001-Include-sys-sysmacros.h-because-glibc-is-glibc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bec661b6f037209c67fc7c9f022ee157c342ade6 Mon Sep 17 00:00:00 2001
-From: Laurent Bercot <ska-skaware@skarnet.org>
-Date: Thu, 5 Oct 2017 18:05:00 +0000
-Subject: [PATCH]  Include sys/sysmacros.h because glibc is glibc
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit bec661b6f037
-
- src/minutils/s6ps_ttycache.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/minutils/s6ps_ttycache.c b/src/minutils/s6ps_ttycache.c
-index 7fa4bc09e624..319356044da9 100644
---- a/src/minutils/s6ps_ttycache.c
-+++ b/src/minutils/s6ps_ttycache.c
-@@ -7,6 +7,7 @@
- #include <string.h>
- #include <stdint.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <errno.h>
- #include <skalibs/types.h>
- #include <skalibs/allreadwrite.h>
--- 
-2.18.0
-
diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 34fc5ea9b1..20af7328d7 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 9562ef293c916c4448d16fcbbc065eb28fd995ac34cd3538179cbc3ee056ab93  s6-linux-utils-2.4.0.1.tar.gz
-sha256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
+sha256 78571574464c76fc623ef50dc14800138b4fd98c5fa877af6850fdd9c2f90213  s6-linux-utils-2.5.0.0.tar.gz
+sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index 3f1745708d..619f4c3732 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.4.0.1
+S6_LINUX_UTILS_VERSION = 2.5.0.0
 S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
