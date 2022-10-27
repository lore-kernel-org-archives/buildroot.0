Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186DFC38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D6081383;
	Thu, 27 Oct 2022 06:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D6081383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79dl66TC7KMv; Thu, 27 Oct 2022 06:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C947081371;
	Thu, 27 Oct 2022 06:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C947081371
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D949F1BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1F1740920
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1F1740920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilocC28G7kCX for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:55:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 982BE40914
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 982BE40914
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 852B687315; Thu, 27 Oct 2022 06:55:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 08:54:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9376ed7bc46ebed9f97899cface0cd9b386292ba
X-Git-Newrev: 3cf8930508738ccea33448f2e59a15c7eee126b3
X-Patchwork-Hint: ignore
Message-Id: <20221027065529.852B687315@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump to version 6.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cf8930508738ccea33448f2e59a15c7eee126b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-ipstats-Add-param.h-for-musl.patch        | 29 -------------------
 .../0002-ipstats-add-missing-headers.patch         | 33 ----------------------
 ...efine-_GNU_SOURCE-when-checking-for-setns.patch | 29 -------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 5 files changed, 2 insertions(+), 93 deletions(-)

diff --git a/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch b/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
deleted file mode 100644
index db6982ab8b..0000000000
--- a/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cf6b60c504d4be5e1df2b2745e55d677967831d0 Mon Sep 17 00:00:00 2001
-From: Changhyeok Bae <changhyeok.bae@gmail.com>
-Date: Tue, 9 Aug 2022 04:01:05 +0000
-Subject: [PATCH] ipstats: Add param.h for musl
-
-Fix build error for musl
-| /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipstats.c:231: undefined reference to `MIN'
-
-Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
-[ upstream status: cf6b60c504d4be5e1df2b2745e55d677967831d0 ]
----
- ip/ipstats.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ip/ipstats.c b/ip/ipstats.c
-index 5cdd15ae..1ac275bd 100644
---- a/ip/ipstats.c
-+++ b/ip/ipstats.c
-@@ -1,6 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0+
- #include <assert.h>
- #include <errno.h>
-+#include <sys/param.h>
-
- #include "list.h"
- #include "utils.h"
---
-2.37.2
-
diff --git a/package/iproute2/0002-ipstats-add-missing-headers.patch b/package/iproute2/0002-ipstats-add-missing-headers.patch
deleted file mode 100644
index d4b9a5d10d..0000000000
--- a/package/iproute2/0002-ipstats-add-missing-headers.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 28c740473510cd911b97cc5d7d23bd809a0f200b Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Tue, 9 Aug 2022 13:27:33 -0700
-Subject: [PATCH] ipstats: add missing headers
-
-IWYU reports several headers are not explicitly
-included by ipstats.
-
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-[ upstream status: 28c740473510cd911b97cc5d7d23bd809a0f200b]
----
- ip/ipstats.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ip/ipstats.c b/ip/ipstats.c
-index 1ac275bd..dadded14 100644
---- a/ip/ipstats.c
-+++ b/ip/ipstats.c
-@@ -1,7 +1,11 @@
- // SPDX-License-Identifier: GPL-2.0+
-+#include <alloca.h>
- #include <assert.h>
- #include <errno.h>
-+#include <stdio.h>
-+#include <string.h>
- #include <sys/param.h>
-+#include <sys/socket.h>
-
- #include "list.h"
- #include "utils.h"
---
-2.37.2
-
diff --git a/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch b/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
deleted file mode 100644
index a5076d7711..0000000000
--- a/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d5fe96ab70928508f072a47449e9b641e46de323 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 10 Aug 2022 22:34:40 -0700
-Subject: [PATCH] configure: Define _GNU_SOURCE when checking for setns
-
-glibc defines this function only as gnu extention
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-[ upstream status: d5fe96ab70928508f072a47449e9b641e46de323 ]
----
- configure | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure b/configure
-index 440facb7..c02753bb 100755
---- a/configure
-+++ b/configure
-@@ -191,6 +191,7 @@ check_ipt_lib_dir()
- check_setns()
- {
-     cat >$TMPDIR/setnstest.c <<EOF
-+#define _GNU_SOURCE
- #include <sched.h>
- int main(int argc, char **argv)
- {
--- 
-2.37.2
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index a4b0e62c02..45af05a200 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  26b7a34d6a7fd2f7a42e2b39c5a90cb61bac522d1096067ffeb195e5693d7791  iproute2-5.19.0.tar.xz
+sha256  523139e9e72aec996374fa2de74be4c53d2dd05589488934d21ff97bae19580a  iproute2-6.0.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 5c3595d5f4..287c6b14e2 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.19.0
+IPROUTE2_VERSION = 6.0.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
