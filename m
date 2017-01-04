From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jan 2017 21:52:06 +0100
Subject: [Buildroot] [git commit] package/mpd: bump version to 0.20
Message-ID: <20170104205237.E0FEE81E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd8dc719259bba67427720ea943696455dded35e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch #0002 which was already fixed upstream long time ago in
commit 276a0d9500b8efc879e4f0c23e9d0e361849e295 using a slightly
different approach.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ad-Name-include-stdio.h-for-prctl-as-well.patch | 28 ----------------------
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 |  4 ++--
 3 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/package/mpd/0002-thread-Name-include-stdio.h-for-prctl-as-well.patch b/package/mpd/0002-thread-Name-include-stdio.h-for-prctl-as-well.patch
deleted file mode 100644
index 1943623..0000000
--- a/package/mpd/0002-thread-Name-include-stdio.h-for-prctl-as-well.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a0a9fed68126eb24e04af924c0d46351ff5eeb0f Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 26 Jan 2015 09:55:04 -0300
-Subject: [PATCH] thread/Name: include stdio.h for prctl as well
-
-We're still using snprintf so we need it, otherwise it leads to build
-failure.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/thread/Name.hxx | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/thread/Name.hxx b/src/thread/Name.hxx
-index a99208d..8f9d7d3 100644
---- a/src/thread/Name.hxx
-+++ b/src/thread/Name.hxx
-@@ -25,6 +25,7 @@
- #  include <pthread.h>
- #elif defined(HAVE_PRCTL)
- #  include <sys/prctl.h>
-+#  include <stdio.h>
- #  ifdef PR_SET_NAME
- #    define HAVE_THREAD_NAME
- #  endif
--- 
-2.6.4
-
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index daa185e..258f87b 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730  mpd-0.19.21.tar.xz
+sha256  48e9dde0f5c22dc26ff36e8d13e3dc575a1ee7558b5537a064f78a3b9dee1619  mpd-0.20.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index eb74f4f..10e6b90 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).21
+MPD_VERSION_MAJOR = 0.20
+MPD_VERSION = $(MPD_VERSION_MAJOR)
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
