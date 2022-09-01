Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D414BECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 21:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48C3C8254A;
	Thu,  1 Sep 2022 21:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48C3C8254A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWoVsG9sRIW0; Thu,  1 Sep 2022 21:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F6C0824CB;
	Thu,  1 Sep 2022 21:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F6C0824CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D0D01BF3C9
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 21:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 083A360B9C
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 21:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083A360B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FCSVwUdEJk1a for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 21:34:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EAAB60B9B
Received: from mxd1.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EAAB60B9B
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 21:34:11 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc11a.ng.seznam.cz (email-smtpc11a.ng.seznam.cz [10.23.11.75])
 id 3a2c45b68c0cfaed3a2bfbc1; Thu, 01 Sep 2022 23:34:09 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by email-relay2.ko.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
 Thu, 01 Sep 2022 23:34:07 +0200 (CEST)  
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Thu,  1 Sep 2022 23:33:56 +0200
Message-Id: <20220901213356.967671-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=beta; 
 t=1662068049; bh=qdQ+tsPPO+TltoLO90TNCs/YnXCmVaJCthrcUOMt86o=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=Wtlaj55GX9S7MfH5c8MvXW9La6XNb+wKP2gwjn1n/2sQ+dLTp/kZqHbrmgyiwj+UU
 uAA240wzz01VqQ6BrMibvqFusWjakDMOcEw/bOpH8xn7vCz5M2Q+Tx12ZE50VSvaTc
 jsinqhe6F5SaPF2ne9oe+Md/lPkNBItcfTubQHCs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=beta header.b=Wtlaj55G
Subject: [Buildroot] [PATCH v2 1/1] package/iproute2: bump version to 5.19.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Adjust CFLAGS to be able to compile on uclibc-ng < 1.0.42.

Remove patch from this release, backport 3 patches fixing build from
upstream.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Add -Dstatic_assert=_Static_assert to CFLAGS to be able to compile on
* uclibc-ng < 1.0.42 (thanks Arnout!)

I was thinking about sending patch that does
s/static_assert/_Static_assert/ (thanks Nicolas!) to upstream, but I
suppose unlike me people which use uclibc-ng in other distros / custom
setup know this or will be able to find this fix in Buildroot sources.

Kind regards,
Petr

 .../0001-bpf_glue-include-errno.h.patch       | 32 ------------------
 .../0001-ipstats-Add-param.h-for-musl.patch   | 29 ++++++++++++++++
 .../0002-ipstats-add-missing-headers.patch    | 33 +++++++++++++++++++
 ...-_GNU_SOURCE-when-checking-for-setns.patch | 29 ++++++++++++++++
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  7 ++--
 6 files changed, 97 insertions(+), 35 deletions(-)
 delete mode 100644 package/iproute2/0001-bpf_glue-include-errno.h.patch
 create mode 100644 package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
 create mode 100644 package/iproute2/0002-ipstats-add-missing-headers.patch
 create mode 100644 package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch

diff --git a/package/iproute2/0001-bpf_glue-include-errno.h.patch b/package/iproute2/0001-bpf_glue-include-errno.h.patch
deleted file mode 100644
index 9371344d00..0000000000
--- a/package/iproute2/0001-bpf_glue-include-errno.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f8decf82af07591833f89004e9b72cc39c1b5c52 Mon Sep 17 00:00:00 2001
-From: Juhee Kang <claudiajkang@gmail.com>
-Date: Tue, 19 Jul 2022 00:58:27 +0900
-Subject: [PATCH] bpf_glue: include errno.h
-
-If __NR_bpf is not enabled, bpf() function set errno and return -1. Thus,
-this patch includes the header.
-
-Fixes: ac4e0913beb1 ("bpf: Export bpf syscall wrapper")
-Signed-off-by: Juhee Kang <claudiajkang@gmail.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-[ upstream status: f8decf82af07591833f89004e9b72cc39c1b5c52 ]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- lib/bpf_glue.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/bpf_glue.c b/lib/bpf_glue.c
-index c1cf351b..88a24751 100644
---- a/lib/bpf_glue.c
-+++ b/lib/bpf_glue.c
-@@ -7,6 +7,7 @@
- #include <sys/syscall.h>
- #include <limits.h>
- #include <unistd.h>
-+#include <errno.h>
- 
- #include "bpf_util.h"
- #ifdef HAVE_LIBBPF
--- 
-2.37.1
-
diff --git a/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch b/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
new file mode 100644
index 0000000000..db6982ab8b
--- /dev/null
+++ b/package/iproute2/0001-ipstats-Add-param.h-for-musl.patch
@@ -0,0 +1,29 @@
+From cf6b60c504d4be5e1df2b2745e55d677967831d0 Mon Sep 17 00:00:00 2001
+From: Changhyeok Bae <changhyeok.bae@gmail.com>
+Date: Tue, 9 Aug 2022 04:01:05 +0000
+Subject: [PATCH] ipstats: Add param.h for musl
+
+Fix build error for musl
+| /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipstats.c:231: undefined reference to `MIN'
+
+Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
+[ upstream status: cf6b60c504d4be5e1df2b2745e55d677967831d0 ]
+---
+ ip/ipstats.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ip/ipstats.c b/ip/ipstats.c
+index 5cdd15ae..1ac275bd 100644
+--- a/ip/ipstats.c
++++ b/ip/ipstats.c
+@@ -1,6 +1,7 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ #include <assert.h>
+ #include <errno.h>
++#include <sys/param.h>
+
+ #include "list.h"
+ #include "utils.h"
+--
+2.37.2
+
diff --git a/package/iproute2/0002-ipstats-add-missing-headers.patch b/package/iproute2/0002-ipstats-add-missing-headers.patch
new file mode 100644
index 0000000000..d4b9a5d10d
--- /dev/null
+++ b/package/iproute2/0002-ipstats-add-missing-headers.patch
@@ -0,0 +1,33 @@
+From 28c740473510cd911b97cc5d7d23bd809a0f200b Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <stephen@networkplumber.org>
+Date: Tue, 9 Aug 2022 13:27:33 -0700
+Subject: [PATCH] ipstats: add missing headers
+
+IWYU reports several headers are not explicitly
+included by ipstats.
+
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+[ upstream status: 28c740473510cd911b97cc5d7d23bd809a0f200b]
+---
+ ip/ipstats.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ip/ipstats.c b/ip/ipstats.c
+index 1ac275bd..dadded14 100644
+--- a/ip/ipstats.c
++++ b/ip/ipstats.c
+@@ -1,7 +1,11 @@
+ // SPDX-License-Identifier: GPL-2.0+
++#include <alloca.h>
+ #include <assert.h>
+ #include <errno.h>
++#include <stdio.h>
++#include <string.h>
+ #include <sys/param.h>
++#include <sys/socket.h>
+
+ #include "list.h"
+ #include "utils.h"
+--
+2.37.2
+
diff --git a/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch b/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
new file mode 100644
index 0000000000..a5076d7711
--- /dev/null
+++ b/package/iproute2/0003-configure-Define-_GNU_SOURCE-when-checking-for-setns.patch
@@ -0,0 +1,29 @@
+From d5fe96ab70928508f072a47449e9b641e46de323 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 22:34:40 -0700
+Subject: [PATCH] configure: Define _GNU_SOURCE when checking for setns
+
+glibc defines this function only as gnu extention
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+[ upstream status: d5fe96ab70928508f072a47449e9b641e46de323 ]
+---
+ configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure b/configure
+index 440facb7..c02753bb 100755
+--- a/configure
++++ b/configure
+@@ -191,6 +191,7 @@ check_ipt_lib_dir()
+ check_setns()
+ {
+     cat >$TMPDIR/setnstest.c <<EOF
++#define _GNU_SOURCE
+ #include <sched.h>
+ int main(int argc, char **argv)
+ {
+-- 
+2.37.2
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 2bb1ddbc72..a4b0e62c02 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  5ba3d464d51c8c283550d507ffac3d10f7aec587b7c66b0ccb6950643646389e  iproute2-5.18.0.tar.xz
+sha256  26b7a34d6a7fd2f7a42e2b39c5a90cb61bac522d1096067ffeb195e5693d7791  iproute2-5.19.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index b9347ed367..5c3595d5f4 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.18.0
+IPROUTE2_VERSION = 5.19.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
@@ -43,9 +43,12 @@ define IPROUTE2_CONFIGURE_CMDS
 	$(IPROUTE2_DISABLE_IPTABLES)
 endef
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+IPROUTE2_CFLAGS = $(TARGET_CFLAGS) -Dstatic_assert=_Static_assert
+
 define IPROUTE2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) LDFLAGS="$(TARGET_LDFLAGS)" \
-		CFLAGS="$(TARGET_CFLAGS) -DXT_LIB_DIR=\\\"/usr/lib/xtables\\\"" \
+		CFLAGS="$(IPROUTE2_CFLAGS) -DXT_LIB_DIR=\\\"/usr/lib/xtables\\\"" \
 		CBUILD_CFLAGS="$(HOST_CFLAGS)" $(MAKE) V=1 LIBDB_LIBS=-lpthread \
 		DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
 		SHARED_LIBS="$(if $(BR2_STATIC_LIBS),n,y)" -C $(@D)
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
