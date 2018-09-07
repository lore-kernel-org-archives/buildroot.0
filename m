From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:25 -0000
Subject: [Buildroot] [git commit] package/shellinabox: bump version to 2.20
Message-ID: <20180907111525.851E57FD98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6210596b761511b62e132df79e0a6bf8ec61276e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0002, applied upstream, which also added --disable-utmp
for musl:
https://github.com/shellinabox/shellinabox/commit/05b2d3630c48dc9bca678d8158fce486c583c26b

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0002-launcher.c-include-sys-ttydefaults.h.patch | 27 ----------------------
 package/shellinabox/shellinabox.hash               |  6 +++--
 package/shellinabox/shellinabox.mk                 |  4 ++--
 3 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/package/shellinabox/0002-launcher.c-include-sys-ttydefaults.h.patch b/package/shellinabox/0002-launcher.c-include-sys-ttydefaults.h.patch
deleted file mode 100644
index caa5456609..0000000000
--- a/package/shellinabox/0002-launcher.c-include-sys-ttydefaults.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From c8d9df500b1ca83ad6da9b6055549adaba6ee0d3 Mon Sep 17 00:00:00 2001
-From: Olivier Singla <olivier.singla@gmail.com>
-Date: Thu, 4 Aug 2016 22:05:08 +0200
-Subject: [PATCH] launcher.c: include <sys/ttydefaults.h>
-
-This include is needed to get the definition of TTYDEF_*.
-
-Signed-off-by: Olivier Singla <olivier.singla@gmail.com>
----
- shellinabox/launcher.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/shellinabox/launcher.c b/shellinabox/launcher.c
-index 2bac171..c8ba6cb 100644
---- a/shellinabox/launcher.c
-+++ b/shellinabox/launcher.c
-@@ -66,6 +66,7 @@
- #include <sys/types.h>
- #include <sys/wait.h>
- #include <sys/utsname.h>
-+#include <sys/ttydefaults.h>
- #include <termios.h>
- #include <unistd.h>
- 
--- 
-2.7.4
-
diff --git a/package/shellinabox/shellinabox.hash b/package/shellinabox/shellinabox.hash
index 4bc110385a..6e19207066 100644
--- a/package/shellinabox/shellinabox.hash
+++ b/package/shellinabox/shellinabox.hash
@@ -1,2 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256	d25ba9f72f04471fc1a8a564c65ef466c4553280ff3eeb365ed9c897d05ed2da	shellinabox-v2.19.tar.gz
+# Locally calculated
+sha256 27a5ec6c3439f87aee238c47cc56e7357a6249e5ca9ed0f044f0057ef389d81e  shellinabox-v2.20.tar.gz
+sha256 04ef60ab9b83cde6f0862ea18474454477efb34c52ebce1f8d8260a398a39362  COPYING
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL-2
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index 1db62e609a..70db551e3c 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHELLINABOX_VERSION = v2.19
+SHELLINABOX_VERSION = v2.20
 SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,$(SHELLINABOX_VERSION))
 SHELLINABOX_LICENSE = GPL-2.0 with OpenSSL exception
 SHELLINABOX_LICENSE_FILES = COPYING GPL-2
@@ -23,7 +23,7 @@ SHELLINABOX_CONF_OPTS = \
 # musl's implementation of utmpx is a dummy one, and some aspects of
 # it cause build failures in shellinabox
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-SHELLINABOX_CONF_ENV += ac_cv_header_utmpx_h=no
+SHELLINABOX_CONF_OPTS += --disable-utmp
 endif
 
 $(eval $(autotools-package))
