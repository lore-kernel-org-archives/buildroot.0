From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:48:36 +0200
Subject: [Buildroot] [git commit branch/next] package/transmission: bump
 version to 2.9.4
Message-ID: <20180520134755.0C2CF80116@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f451bed9c45c97cf6000e6935ab430102716b63d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patch 0003, a different fix was committed upstream:
https://github.com/transmission/transmission/commit/b21a6140e963491f146293c9b0a2863a9ae99ad3

Renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tp-include.patch => 0003-fix-utp-include.patch} |  0
 package/transmission/0003-miniupnpc-cross.patch    | 31 ----------------------
 ...nce-1.0.18-has-sys-quota.h-synced-with-G.patch} |  0
 ...0006-libsystemd.patch => 0005-libsystemd.patch} |  0
 package/transmission/transmission.hash             |  2 +-
 package/transmission/transmission.mk               |  2 +-
 6 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/transmission/0004-fix-utp-include.patch b/package/transmission/0003-fix-utp-include.patch
similarity index 100%
rename from package/transmission/0004-fix-utp-include.patch
rename to package/transmission/0003-fix-utp-include.patch
diff --git a/package/transmission/0003-miniupnpc-cross.patch b/package/transmission/0003-miniupnpc-cross.patch
deleted file mode 100644
index 5037c2e67a..0000000000
--- a/package/transmission/0003-miniupnpc-cross.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fix libminiupnpc version detection
-
-Problem is known upstream: https://trac.transmissionbt.com/ticket/6140
-
-For buildroot we know the libminiupnpc version so we hard-code 2.0.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr transmission-2.92.org/configure.ac transmission-2.92/configure.ac
---- transmission-2.92.org/configure.ac	2016-03-06 21:23:45.336198393 +0100
-+++ transmission-2.92/configure.ac	2016-07-02 21:48:13.452385686 +0200
-@@ -386,18 +386,7 @@
- dnl MINIUPNPC_API_VERSION and we won't have to figure
- dnl it out on our own
- if test "x$upnp_version" = "xunknown" ; then
--  AC_RUN_IFELSE(
--    [AC_LANG_PROGRAM(
--      [#include <stdlib.h>
--       #include <miniupnpc/miniupnpc.h>],
--      [#ifdef MINIUPNPC_API_VERSION
--       return EXIT_SUCCESS;
--       #else
--       return EXIT_FAILURE;
--       #endif]
--    )],
--    [upnp_version=">= 1.7"]
--  )
-+  upnp_version="2.0"
- fi
- 
- dnl Or maybe it's miniupnp 1.6
diff --git a/package/transmission/0005-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch b/package/transmission/0004-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch
similarity index 100%
rename from package/transmission/0005-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch
rename to package/transmission/0004-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch
diff --git a/package/transmission/0006-libsystemd.patch b/package/transmission/0005-libsystemd.patch
similarity index 100%
rename from package/transmission/0006-libsystemd.patch
rename to package/transmission/0005-libsystemd.patch
diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 4c1c3f9a3a..0d2af32f4f 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8815920e0a4499bcdadbbe89a4115092dab42ce5199f71ff9a926cfd12b9b90b  transmission-2.93.tar.xz
+sha256 35442cc849f91f8df982c3d0d479d650c6ca19310a994eccdaa79a4af3916b7d  transmission-2.94.tar.xz
 sha256 20801783bf59e27d03ed6aab625b32a34e221ae95bf801db87827c8023398495  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 4e78604fdb..640c78c650 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.93
+TRANSMISSION_VERSION = 2.94
 TRANSMISSION_SITE = https://github.com/transmission/transmission-releases/raw/master
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
