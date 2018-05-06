From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 May 2018 12:12:51 +0200
Subject: [Buildroot] [PATCH 1/1] libnetfilter_queue: bump to version 1.0.3
Message-ID: <20180506101251.13465-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove both patches (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnetfilter_queue/0001-uclinux.patch      | 26 -------------
 package/libnetfilter_queue/0002-musl.patch         | 45 ----------------------
 package/libnetfilter_queue/libnetfilter_queue.hash |  9 +++--
 package/libnetfilter_queue/libnetfilter_queue.mk   |  2 +-
 4 files changed, 7 insertions(+), 75 deletions(-)
 delete mode 100644 package/libnetfilter_queue/0001-uclinux.patch
 delete mode 100644 package/libnetfilter_queue/0002-musl.patch

diff --git a/package/libnetfilter_queue/0001-uclinux.patch b/package/libnetfilter_queue/0001-uclinux.patch
deleted file mode 100644
index 21895d9b0e..0000000000
--- a/package/libnetfilter_queue/0001-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 311b60655761f6f3c4fe44cf6eff63427283f25e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 16:13:58 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 07747a6..289868f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -21,7 +21,7 @@ AC_PROG_INSTALL
- CHECK_GCC_FVISIBILITY
- 
- case "$host" in
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux only, dude!]);;
- esac
- 
--- 
-1.8.1.5
-
diff --git a/package/libnetfilter_queue/0002-musl.patch b/package/libnetfilter_queue/0002-musl.patch
deleted file mode 100644
index 3765d58af3..0000000000
--- a/package/libnetfilter_queue/0002-musl.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5348da83403383a60831f4c297841afb98692887 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 16 May 2015 14:45:46 +0200
-Subject: [PATCH] extra: Define _GNU_SOURCE to get members of tcphdr&ucphdr
-
-The source uses linux names for members of tcphdr. For example
-"source" instead of "th_sport", ... musl libc's headers need
-_GNU_SOURCE defined in order to expose these.
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-[yann.morin.1998 at free.fr: backported from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- src/extra/tcp.c | 1 +
- src/extra/udp.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/extra/tcp.c b/src/extra/tcp.c
-index bf161aa..d1cd79d 100644
---- a/src/extra/tcp.c
-+++ b/src/extra/tcp.c
-@@ -15,6 +15,7 @@
- #include <arpa/inet.h>
- #include <netinet/ip.h>
- #include <netinet/ip6.h>
-+#define _GNU_SOURCE
- #include <netinet/tcp.h>
- 
- #include <libnetfilter_queue/libnetfilter_queue.h>
-diff --git a/src/extra/udp.c b/src/extra/udp.c
-index 6e6baed..8c44a66 100644
---- a/src/extra/udp.c
-+++ b/src/extra/udp.c
-@@ -14,6 +14,7 @@
- #include <arpa/inet.h>
- #include <netinet/ip.h>
- #include <netinet/ip6.h>
-+#define _GNU_SOURCE
- #include <netinet/udp.h>
- 
- #include <libnetfilter_queue/libnetfilter_queue.h>
--- 
-1.9.1
-
diff --git a/package/libnetfilter_queue/libnetfilter_queue.hash b/package/libnetfilter_queue/libnetfilter_queue.hash
index 4ea37216c7..1425d41b31 100644
--- a/package/libnetfilter_queue/libnetfilter_queue.hash
+++ b/package/libnetfilter_queue/libnetfilter_queue.hash
@@ -1,3 +1,6 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_queue/libnetfilter_queue-1.0.2.tar.bz2.{md5sum,sha1sum}
-md5	df09befac35cb215865b39a36c96a3fa	libnetfilter_queue-1.0.2.tar.bz2
-sha1	8cc0b8ed33162281bc9fa8bcfa8c9dcb08848ff9	libnetfilter_queue-1.0.2.tar.bz2
+# From ftp://ftp.netfilter.org/pub/libnetfilter_queue/libnetfilter_queue-1.0.3.tar.bz2.{md5sum,sha1sum}
+md5	700ce0ae4784257ab5abe6fd1802f366	libnetfilter_queue-1.0.3.tar.bz2
+sha1	3d182e3211b633d0a0f8a2b12ef80dc2621f53cb	libnetfilter_queue-1.0.2.tar.bz2
+
+# Hash for license file:
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/libnetfilter_queue/libnetfilter_queue.mk b/package/libnetfilter_queue/libnetfilter_queue.mk
index 75910c5905..302f9a2575 100644
--- a/package/libnetfilter_queue/libnetfilter_queue.mk
+++ b/package/libnetfilter_queue/libnetfilter_queue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETFILTER_QUEUE_VERSION = 1.0.2
+LIBNETFILTER_QUEUE_VERSION = 1.0.3
 LIBNETFILTER_QUEUE_SOURCE = libnetfilter_queue-$(LIBNETFILTER_QUEUE_VERSION).tar.bz2
 LIBNETFILTER_QUEUE_SITE = http://www.netfilter.org/projects/libnetfilter_queue/files
 LIBNETFILTER_QUEUE_INSTALL_STAGING = YES
-- 
2.14.1
