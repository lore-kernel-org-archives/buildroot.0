Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356B9C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB5DF408EC;
	Tue, 26 Jul 2022 20:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB5DF408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wolhajtknodb; Tue, 26 Jul 2022 20:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D51408EB;
	Tue, 26 Jul 2022 20:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D51408EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B10B1BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E552401A6
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E552401A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DopnOI-EDISE for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:59:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AD08408D2
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AD08408D2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CFC9C85FA4; Tue, 26 Jul 2022 19:45:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:59:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b07210b272c6e8810b038190cf5c1fd1f7b48397
X-Git-Newrev: 10990c576b2ddd7636f094f510a2ad1a5a80e50d
X-Patchwork-Hint: ignore
Message-Id: <20220726194534.CFC9C85FA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump version to 5.18.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10990c576b2ddd7636f094f510a2ad1a5a80e50d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../iproute2/0001-bpf_glue-include-errno.h.patch   | 32 ++++++++++++++++++++++
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/0001-bpf_glue-include-errno.h.patch b/package/iproute2/0001-bpf_glue-include-errno.h.patch
new file mode 100644
index 0000000000..9371344d00
--- /dev/null
+++ b/package/iproute2/0001-bpf_glue-include-errno.h.patch
@@ -0,0 +1,32 @@
+From f8decf82af07591833f89004e9b72cc39c1b5c52 Mon Sep 17 00:00:00 2001
+From: Juhee Kang <claudiajkang@gmail.com>
+Date: Tue, 19 Jul 2022 00:58:27 +0900
+Subject: [PATCH] bpf_glue: include errno.h
+
+If __NR_bpf is not enabled, bpf() function set errno and return -1. Thus,
+this patch includes the header.
+
+Fixes: ac4e0913beb1 ("bpf: Export bpf syscall wrapper")
+Signed-off-by: Juhee Kang <claudiajkang@gmail.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+[ upstream status: f8decf82af07591833f89004e9b72cc39c1b5c52 ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ lib/bpf_glue.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/bpf_glue.c b/lib/bpf_glue.c
+index c1cf351b..88a24751 100644
+--- a/lib/bpf_glue.c
++++ b/lib/bpf_glue.c
+@@ -7,6 +7,7 @@
+ #include <sys/syscall.h>
+ #include <limits.h>
+ #include <unistd.h>
++#include <errno.h>
+ 
+ #include "bpf_util.h"
+ #ifdef HAVE_LIBBPF
+-- 
+2.37.1
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index eafe7a6c9a..2bb1ddbc72 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  6e384f1b42c75e1a9daac57866da37dcff909090ba86eb25a6e764da7893660e  iproute2-5.17.0.tar.xz
+sha256  5ba3d464d51c8c283550d507ffac3d10f7aec587b7c66b0ccb6950643646389e  iproute2-5.18.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 8ecde069f5..b9347ed367 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.17.0
+IPROUTE2_VERSION = 5.18.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
