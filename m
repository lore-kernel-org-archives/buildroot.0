From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 16 Jan 2018 09:23:12 +0100
Subject: [Buildroot] [PATCH] libostree: bump to version 2018.1
Message-ID: <20180116082312.8841-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch since it is in mainline.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 ...llways-include-ostree-repo-pull-private.h.patch | 37 ----------------------
 package/libostree/libostree.hash                   |  2 +-
 package/libostree/libostree.mk                     |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/libostree/0001-lib-pull-allways-include-ostree-repo-pull-private.h.patch

diff --git a/package/libostree/0001-lib-pull-allways-include-ostree-repo-pull-private.h.patch b/package/libostree/0001-lib-pull-allways-include-ostree-repo-pull-private.h.patch
deleted file mode 100644
index 3bd36d042b..0000000000
--- a/package/libostree/0001-lib-pull-allways-include-ostree-repo-pull-private.h.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From af58eb62038202eb1082a66af1be7d405c8a2de1 Mon Sep 17 00:00:00 2001
-From: Marcus Folkesson <marcus.folkesson@gmail.com>
-Date: Thu, 21 Dec 2017 10:20:48 +0100
-Subject: [PATCH] lib/pull: always include ostree-repo-pull-private.h
-
-Always include ostree-repo-pull-private.h to get rid of the following
-build error when HAVE_LIBCURL_OR_LIBSOUP is not defined:
-
-src/libostree/ostree-repo-pull.c:1493:1: error: no previous prototype
-for '_ostree_repo_verify_bindings' [-Werror=missing-prototypes]
-
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
----
- src/libostree/ostree-repo-pull.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libostree/ostree-repo-pull.c b/src/libostree/ostree-repo-pull.c
-index 2e6e308c..b2a00ea2 100644
---- a/src/libostree/ostree-repo-pull.c
-+++ b/src/libostree/ostree-repo-pull.c
-@@ -27,12 +27,12 @@
- #include "libglnx.h"
- #include "ostree.h"
- #include "otutil.h"
-+#include "ostree-repo-pull-private.h"
- 
- #ifdef HAVE_LIBCURL_OR_LIBSOUP
- 
- #include "ostree-core-private.h"
- #include "ostree-repo-private.h"
--#include "ostree-repo-pull-private.h"
- #include "ostree-repo-static-delta-private.h"
- #include "ostree-metalink.h"
- #include "ostree-fetcher-util.h"
--- 
-2.15.1
-
diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 522c9f4d24..54bc263f06 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 564b46c83373ea35f44eb39e62c6f6c876c8f2649aa30124b3f87282d2175138  libostree-2017.15.tar.xz
+sha256 8b5e3b80425b91c93aeb916bb047ee194aa138a9cf00ce173dcc0ebc0dd11f4b  libostree-2018.1.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 26f173c1ba..336d11a978 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2017.15
+LIBOSTREE_VERSION = 2018.1
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.15.1
