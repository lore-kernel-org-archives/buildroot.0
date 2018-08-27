From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 27 Aug 2018 23:43:23 +0200
Subject: [Buildroot] [PATCH 1/1] libkcapi: bump to version 1.1.3
Message-ID: <20180827214323.17876-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-getrandom-call-in-kcapi-rng.c.patch   | 31 ----------------------
 package/libkcapi/libkcapi.hash                     |  2 +-
 package/libkcapi/libkcapi.mk                       |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch

diff --git a/package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch b/package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch
deleted file mode 100644
index d83edd9261..0000000000
--- a/package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 581717cfb0e35c041246da0c0c591a6e9f7a40e5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 2 May 2018 21:03:45 +0200
-Subject: [PATCH] Fix getrandom call in kcapi-rng.c
-
-_GNU_SOURCE must be defined and unistd.h must be included to be able to
-use getrandom
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-[Upstream status: https://github.com/smuellerDD/libkcapi/pull/56]
----
- lib/kcapi-rng.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/kcapi-rng.c b/lib/kcapi-rng.c
-index 45f4d18..9ceabd4 100644
---- a/lib/kcapi-rng.c
-+++ b/lib/kcapi-rng.c
-@@ -18,6 +18,8 @@
-  * DAMAGE.
-  */
- 
-+#define _GNU_SOURCE
-+#include <unistd.h>
- #include <linux/random.h>
- #ifdef HAVE_GETRANDOM
- #include <sys/random.h>
--- 
-2.14.1
-
diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index 9cb1e80ccb..b340ea84b6 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 ac80211317750f6a545b1e5547cfb6ae450b37c11acb6d24982a581705eb5250	libkcapi-1.1.0.tar.xz
+sha256 19c044310eda0bf5403fae8df2eeffcfef33b67cb5b01def5f440d41ff16b55f	libkcapi-1.1.3.tar.xz
 sha256 b0336f8f07a6abf8b0a59d961f53601d7c4a7c09a8137805b730a34a976039f8	COPYING
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING.gplv2
 sha256 13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239	COPYING.bsd
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 1a45f4f996..1557d2017a 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = 1.1.0
+LIBKCAPI_VERSION = 1.1.3
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
 LIBKCAPI_SITE = http://www.chronox.de/libkcapi
 LIBKCAPI_AUTORECONF = YES
-- 
2.14.1
