From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 17:55:52 +0200
Subject: [Buildroot] [git commit branch/next] conntrack-tools: bump to
	version 1.4.4
Message-ID: <20160823155856.4428481E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b5fc8ab0f689caadb86b4260c0ace29a9b947b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop usptream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-src-fix-build-with-musl-libc.patch        | 37 ----------------------
 package/conntrack-tools/conntrack-tools.hash       |  6 ++--
 package/conntrack-tools/conntrack-tools.mk         |  2 +-
 3 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/package/conntrack-tools/0001-src-fix-build-with-musl-libc.patch b/package/conntrack-tools/0001-src-fix-build-with-musl-libc.patch
deleted file mode 100644
index 5881f98..0000000
--- a/package/conntrack-tools/0001-src-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d7b20d9bbed23a7a7e40af2f5e78f37ff67e8d93 Mon Sep 17 00:00:00 2001
-From: Rodrigo Rebello <rprebello@gmail.com>
-Date: Mon, 23 Nov 2015 02:12:48 -0200
-Subject: [PATCH] src: fix build with musl libc
-
-The GNU version of 'struct tcphdr' is not exposed by musl libc headers
-unless _GNU_SOURCE is defined. Without this definition, the build fails
-with:
-
-  rpc.c: In function 'rpc_helper_cb':
-  rpc.c:351:15: error: 'struct tcphdr' has no member named 'doff'
-     offset += th->doff * 4;
-                 ^
-
-Upstream status: sent
-http://patchwork.ozlabs.org/patch/547376/
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- src/helpers/rpc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/helpers/rpc.c b/src/helpers/rpc.c
-index 82493c2..3a7b337 100644
---- a/src/helpers/rpc.c
-+++ b/src/helpers/rpc.c
-@@ -28,6 +28,7 @@
- 
- #include <rpc/rpc_msg.h>
- #include <rpc/pmap_prot.h>
-+#define _GNU_SOURCE
- #include <netinet/tcp.h>
- #include <netinet/udp.h>
- 
--- 
-2.1.4
-
diff --git a/package/conntrack-tools/conntrack-tools.hash b/package/conntrack-tools/conntrack-tools.hash
index 7ff1cf7..9d68177 100644
--- a/package/conntrack-tools/conntrack-tools.hash
+++ b/package/conntrack-tools/conntrack-tools.hash
@@ -1,3 +1,3 @@
-# From ftp://ftp.netfilter.org/pub/conntrack-tools/conntrack-tools-1.4.3.tar.bz2.{md5sum,sha1sum}
-md5	966a5d8f846ddf5304bcd12685c0707f	conntrack-tools-1.4.3.tar.bz2
-sha1	509db30f34b283f4a74a7e638ba0ca713d3fe98c	conntrack-tools-1.4.3.tar.bz2
+# From ftp://ftp.netfilter.org/pub/conntrack-tools/conntrack-tools-1.4.4.tar.bz2.{md5sum,sha1sum}
+md5	acd9e0b27cf16ae3092ba900e4d7560e	conntrack-tools-1.4.4.tar.bz2
+sha1	25b36fb6832373ef899bade3b82adf5382b9a05b	conntrack-tools-1.4.4.tar.bz2
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 7287587..b73aa7f 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNTRACK_TOOLS_VERSION = 1.4.3
+CONNTRACK_TOOLS_VERSION = 1.4.4
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
