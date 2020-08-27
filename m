From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 27 Aug 2020 13:05:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: bump version to 3.0
Message-ID: <20200827110539.30185-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove patch that is in new version
- update indentation in hash file (two spaces)

Run tests:

             br-arm-full [1/6]: OK
  br-arm-cortex-a9-glibc [2/6]: OK
   br-arm-cortex-m4-full [3/6]: OK
          br-x86-64-musl [4/6]: OK
      br-arm-full-static [5/6]: OK
            sourcery-arm [6/6]: OK

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...fix-building-with-new-kernel-headers.patch | 55 -------------------
 package/linuxptp/linuxptp.hash                | 10 ++--
 package/linuxptp/linuxptp.mk                  |  2 +-
 3 files changed, 6 insertions(+), 61 deletions(-)
 delete mode 100644 package/linuxptp/0002-fix-building-with-new-kernel-headers.patch

diff --git a/package/linuxptp/0002-fix-building-with-new-kernel-headers.patch b/package/linuxptp/0002-fix-building-with-new-kernel-headers.patch
deleted file mode 100644
index 332e5491ff..0000000000
--- a/package/linuxptp/0002-fix-building-with-new-kernel-headers.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From d663a483c40939bad58301c256d86da1f3da6cc0 Mon Sep 17 00:00:00 2001
-From: Miroslav Lichvar <mlichvar@redhat.com>
-Date: Tue, 13 Nov 2018 13:16:08 +0100
-Subject: [PATCH] Fix building with new kernel headers.
-
-net_tstamp.h in recent kernel versions requires time.h for clockid_t.
-
-Signed-off-by: Miroslav Lichvar <mlichvar@redhat.com>
----
- clock.c      | 2 +-
- sk.c         | 1 +
- timemaster.c | 1 +
- 3 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/clock.c b/clock.c
-index 9c493c3..8533b39 100644
---- a/clock.c
-+++ b/clock.c
-@@ -17,11 +17,11 @@
-  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-  */
- #include <errno.h>
-+#include <time.h>
- #include <linux/net_tstamp.h>
- #include <poll.h>
- #include <stdlib.h>
- #include <string.h>
--#include <time.h>
- #include <sys/queue.h>
- 
- #include "address.h"
-diff --git a/sk.c b/sk.c
-index e2b1f28..30162eb 100644
---- a/sk.c
-+++ b/sk.c
-@@ -18,6 +18,7 @@
-  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-  */
- #include <errno.h>
-+#include <time.h>
- #include <linux/net_tstamp.h>
- #include <linux/sockios.h>
- #include <linux/ethtool.h>
-diff --git a/timemaster.c b/timemaster.c
-index 058678f..00db59f 100644
---- a/timemaster.c
-+++ b/timemaster.c
-@@ -22,6 +22,7 @@
- #include <errno.h>
- #include <libgen.h>
- #include <limits.h>
-+#include <time.h>
- #include <linux/net_tstamp.h>
- #include <net/if.h>
- #include <signal.h>
diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index 5e6c7741cd..de82ff2b84 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/linuxptp/files/v2.0/
-sha1 592ca42c6146a79c1fcabed7c19fa7af4803d4f6  linuxptp-2.0.tgz
-md5 d8bb7374943bb747db7786ac26f17f11  linuxptp-2.0.tgz
+# From https://sourceforge.net/projects/linuxptp/files/v3.0/
+sha1  cf56f1ab6c622a569be8c14d2cb121f0183affc9  linuxptp-3.0.tgz
+md5  1318805702eb6d59f9f247e1dd5ce12a  linuxptp-3.0.tgz
 
 # Locally computed:
-sha256 0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d  linuxptp-2.0.tgz
+sha256  d74ceca722c75bfff53c633425f926dd48eb04f4a089451b855155c016d15785  linuxptp-3.0.tgz
 
 # Hash for license file:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 921c55ad59..3d018a4657 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 2.0
+LINUXPTP_VERSION = 3.0
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
-- 
2.20.1
