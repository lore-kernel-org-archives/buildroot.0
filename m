Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E614C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AED94FD11;
	Fri, 28 Feb 2025 17:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T27TzVM4psoV; Fri, 28 Feb 2025 17:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B7D64FCF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7D64FCF1;
	Fri, 28 Feb 2025 17:02:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 181B668
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 019D849B64
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRxccR6o2o_M for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D644263E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56D644263E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51E82818ED; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 21:12:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 16adbd4df05e5692c92ad015c1ec54d64d91dfa5
X-Git-Newrev: 739acecd1312025d543e0694314142004b962d6d
X-Patchwork-Hint: ignore
Message-Id: <20250228163016.51E82818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iproute2: bump to
 version 6.13.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=739acecd1312025d543e0694314142004b962d6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog - https://github.com/iproute2/iproute2/compare/v6.12.0...v6.13.0

Drop 0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=c8b3ecc22ed0edaf0259eaf7d1a5c04f300ad6e4

Drop 0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=fa3949b792e275f75d7d6200dc2036ef7fff8816

Note: Since commit [1] "package/iproute2: bump to version 6.12.0",
iproute2 can fail to build with musl libc with error:

    iplink.c: In function 'iplink_parse':
    iplink.c:663:43: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
      663 |                                 char path[PATH_MAX];
          |                                           ^~~~~~~~

This is fixed with iproute2 commit [2] included in this 6.13.0 version.

Fixes:
- https://autobuild.buildroot.org/results/029493e02f5c2858fc987ba7a4c8fe53deb27017/
- and many others...

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/4d40998db891e9967f85fc1e6dd3c2c740ea7b08
[2] https://github.com/iproute2/iproute2/commit/7e23da91fca6e5dedeb32a7d308cf20982e897c3

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien: add a commit log comment about the fixed build failures]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t-declaration-of-function-htobe64-in-gcc-.patch | 43 ----------------------
 ...t-declaration-of-function-basename-in-gcc.patch | 33 -----------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 4 files changed, 2 insertions(+), 78 deletions(-)

diff --git a/package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch b/package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
deleted file mode 100644
index 318701e725..0000000000
--- a/package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ea78477cba25b50e7f63f02635e6870d72dcf68e Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 14 Aug 2024 19:10:09 +0200
-Subject: [PATCH] Fix implicit declaration of function 'htobe64' in gcc 14 on
- musl systems
-
-On musl systems with GCC 14 and above, the htobe64 function cannot be
-found by default. From the man page[0], the function is from endian.h
-header file. If the file is not included in, then we get the following
-error message. The issue however cannot be reproduced on glibc systems.
-
-In file included from ../include/libgenl.h:5,
-                 from libgenl.c:12:
-../include/libnetlink.h: In function 'rta_getattr_be64':
-../include/libnetlink.h:281:16: error: implicit declaration of function 'htobe64' [-Wimplicit-function-declaration]
-  281 |         return htobe64(rta_getattr_u64(rta));
-      |                ^~~~~~~
-make[1]: *** [../config.include:24: libgenl.o] Error 1
-
-[0]: https://linux.die.net/man/3/htobe64
-
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://lore.kernel.org/netdev/20240514084335.19f5b280@hermes.local/T/
----
- include/libnetlink.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/libnetlink.h b/include/libnetlink.h
-index 30f0c2d2..77e81815 100644
---- a/include/libnetlink.h
-+++ b/include/libnetlink.h
-@@ -12,6 +12,7 @@
- #include <linux/neighbour.h>
- #include <linux/netconf.h>
- #include <arpa/inet.h>
-+#include <endian.h>
- 
- struct rtnl_handle {
- 	int			fd;
--- 
-2.39.2
-
diff --git a/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch b/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
deleted file mode 100644
index 3bce4b15bb..0000000000
--- a/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 482b7362dedc57d0c9783bd83084919ccaa79e77 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 14 Aug 2024 19:43:44 +0200
-Subject: [PATCH] Fix implicit declaration of function basename in gcc-14.x
-
-From Alpine Linux.
-https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/iproute2/basename.patch?ref_type=heads
-
-But also reported Upstream via netdev mailinglist by Gentoo people.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://marc.info/?l=linux-netdev&m=172278781323421&w=2
----
- rdma/rdma.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/rdma/rdma.c b/rdma/rdma.c
-index 131c6b2a..1e7db382 100644
---- a/rdma/rdma.c
-+++ b/rdma/rdma.c
-@@ -8,6 +8,9 @@
- #include "version.h"
- #include "color.h"
- 
-+/* For basename(3) prototype */
-+#include <libgen.h>
-+
- /* Global utils flags */
- int json;
- 
--- 
-2.39.2
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 97be9bb765..fad4debeab 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  bbd141ef7b5d0127cc2152843ba61f274dc32814fa3e0f13e7d07a080bef53d9  iproute2-6.12.0.tar.xz
+sha256  a43aa43338d882b44d01e549f3f105a92ae9feea32a82fae45a88e7a49302819  iproute2-6.13.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index d609a28c0c..016b235469 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.12.0
+IPROUTE2_VERSION = 6.13.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
