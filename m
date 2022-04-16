Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44858C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 19:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE9F841C14;
	Sat, 16 Apr 2022 19:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VrF1NHKtTNJU; Sat, 16 Apr 2022 19:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74DF541BD4;
	Sat, 16 Apr 2022 19:56:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E17B1BF484
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C11B84217
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHMrPS37U1AW for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 19:56:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF40584213
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 19:56:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E6DB383C6E; Sat, 16 Apr 2022 19:46:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 21:54:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e87e6fd085b8a4965b9dc84635fd36e380da4dde
X-Git-Newrev: 0263b3eb534827506b311e64cea62490cbf7825c
X-Patchwork-Hint: ignore
Message-Id: <20220416194619.E6DB383C6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump version to 5.17.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0263b3eb534827506b311e64cea62490cbf7825c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-lib-fix-ax25-h-include-for-musl.patch     | 37 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch b/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
deleted file mode 100644
index 1f8860c5d8..0000000000
--- a/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Thu, 13 Jan 2022 08:14:13 +0000
-Subject: [PATCH] lib: fix ax25.h include for musl
-
-ax25.h isn't guaranteed to be avilable in netax25/*;
-it's dependent on our choice of libc (it's not available
-on musl at least) [0].
-
-Let's use the version from linux-headers.
-
-[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
-Bug: https://bugs.gentoo.org/831102
-
-Signed-off-by: Sam James <sam@gentoo.org>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-
-[Retrieved from:
-https://github.com/shemminger/iproute2/commit/8bced38a941a181f1468fa39541e872e51b6022f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/ax25_ntop.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
-index cfd0e04b0..3a72a43e9 100644
---- a/lib/ax25_ntop.c
-+++ b/lib/ax25_ntop.c
-@@ -2,7 +2,7 @@
- 
- #include <errno.h>
- #include <sys/socket.h>
--#include <netax25/ax25.h>
-+#include <linux/ax25.h>
- 
- #include "utils.h"
- 
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index f7e7f682a9..eafe7a6c9a 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  c064b66f6b001c2a35aa5224b5b1ac8aa4bee104d7dce30d6f10a84cb8b01e2f  iproute2-5.16.0.tar.xz
+sha256  6e384f1b42c75e1a9daac57866da37dcff909090ba86eb25a6e764da7893660e  iproute2-5.17.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a51b5b2996..8ecde069f5 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.16.0
+IPROUTE2_VERSION = 5.17.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
