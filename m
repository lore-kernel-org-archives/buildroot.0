From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 09:15:45 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/libmicrohttpd:
 security bump version to 0.9.71
Message-ID: <20200720071301.DA77286D3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a88f627d49d7c81d6bccb9b20c76c532fd20aa27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Removed patch which was applied upstream, reformatted hashes.

Release notes:
https://lists.gnu.org/archive/html/libmicrohttpd/2020-06/msg00013.html

"This release fixes a potential buffer overflow and is thus considered a
security release. Please upgrade as soon as possible."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7a9a554cfce7a713fc58b52075d1cf3bb7ef4279)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/0001-fix-6135.patch | 46 -------------------------------
 package/libmicrohttpd/libmicrohttpd.hash  |  4 +--
 package/libmicrohttpd/libmicrohttpd.mk    |  2 +-
 3 files changed, 3 insertions(+), 49 deletions(-)

diff --git a/package/libmicrohttpd/0001-fix-6135.patch b/package/libmicrohttpd/0001-fix-6135.patch
deleted file mode 100644
index af410284aa..0000000000
--- a/package/libmicrohttpd/0001-fix-6135.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 6702e6202368720d7a381669c03eedc318f225ca Mon Sep 17 00:00:00 2001
-From: Christian Grothoff <christian@grothoff.org>
-Date: Thu, 26 Mar 2020 19:08:30 +0100
-Subject: [PATCH] fix #6135
-
-Downloaded from upstream commit to fix non-threaded build:
-https://git.gnunet.org/libmicrohttpd.git/commit/?id=6702e6202368720d7a381669c03eedc318f225ca
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/microhttpd/internal.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/microhttpd/internal.h b/src/microhttpd/internal.h
-index 211eed9f..ad16535e 100644
---- a/src/microhttpd/internal.h
-+++ b/src/microhttpd/internal.h
-@@ -1462,12 +1462,6 @@ struct MHD_Daemon
-    */
-   size_t thread_stack_size;
- 
--  /**
--   * Our #MHD_OPTION_SERVER_INSANITY level, bits indicating
--   * which sanity checks are off.
--   */
--  enum MHD_DisableSanityCheck insanity_level;
--
-   /**
-    * Number of worker daemons
-    */
-@@ -1490,6 +1484,12 @@ struct MHD_Daemon
-   MHD_mutex_ cleanup_connection_mutex;
- #endif
- 
-+  /**
-+   * Our #MHD_OPTION_SERVER_INSANITY level, bits indicating
-+   * which sanity checks are off.
-+   */
-+  enum MHD_DisableSanityCheck insanity_level;
-+
-   /**
-    * Listen socket.
-    */
--- 
-2.25.0
-
diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 0fc451fcde..d853f67a76 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 90d0a3d396f96f9bc41eb0f7e8187796049285fabef82604acd4879590977307  libmicrohttpd-0.9.70.tar.gz
-sha256 7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
+sha256  e8f445e85faf727b89e9f9590daea4473ae00ead38b237cf1eda55172b89b182  libmicrohttpd-0.9.71.tar.gz
+sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index ea2de55804..4cb9dbcbfd 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.70
+LIBMICROHTTPD_VERSION = 0.9.71
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
