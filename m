From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 11:02:29 +0200
Subject: [Buildroot] [git commit branch/next] iproute2: bump to version 5.0.0
Message-ID: <20190510085807.3B84088F6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8af35b92cc44441404f5d7c02389b3a192775163
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop upstream patch.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-f_flower-fix-build-with-musl-libc.patch   | 31 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/iproute2/0002-f_flower-fix-build-with-musl-libc.patch b/package/iproute2/0002-f_flower-fix-build-with-musl-libc.patch
deleted file mode 100644
index 71b652d9d4..0000000000
--- a/package/iproute2/0002-f_flower-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 28747146622a49c3e7b5c5b36dc02c6a64124770 Mon Sep 17 00:00:00 2001
-From: Hans Dedecker <dedeckeh@gmail.com>
-Date: Wed, 23 Jan 2019 22:02:31 +0100
-Subject: [PATCH] f_flower: fix build with musl libc
-
-XATTR_SIZE_MAX requires the usage of linux/limits.h; let's include it
-
-Signed-off-by: Hans Dedecker <dedeckeh@gmail.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 2874714662
-
- tc/f_flower.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tc/f_flower.c b/tc/f_flower.c
-index c563666702b5..9659e894dd1f 100644
---- a/tc/f_flower.c
-+++ b/tc/f_flower.c
-@@ -14,6 +14,7 @@
- #include <unistd.h>
- #include <string.h>
- #include <net/if.h>
-+#include <linux/limits.h>
- #include <linux/if_arp.h>
- #include <linux/if_ether.h>
- #include <linux/ip.h>
--- 
-2.20.1
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 28862ce19c..b7e3e701c5 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	c8adaa6a40f888476b23acb283cfa30c0dd55f07b5aa20663ed5ba2ef1f6fda8  iproute2-4.20.0.tar.xz
+sha256	df047302a39650ef832c07e8dab5df7a23218cd398bd310c8628e386161d20ba  iproute2-5.0.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 13b1f90f37..539db5e015 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.20.0
+IPROUTE2_VERSION = 5.0.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
