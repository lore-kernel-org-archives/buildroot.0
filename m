Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9237BCE7B02
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 11:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B204840FA;
	Fri,  6 Sep 2024 11:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tT3q5DcEDLpU; Fri,  6 Sep 2024 11:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DE0084114
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE0084114;
	Fri,  6 Sep 2024 11:59:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D97C51BF980
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 11:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C749B60B5A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 11:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqUfBWi5KkCj for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 11:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA89960708
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA89960708
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 11:58:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3D6786E91; Fri,  6 Sep 2024 11:58:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Sep 2024 13:55:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e36d6abb04b87021c7dac3839258c53a5be3cdb8
X-Git-Newrev: 81ee5b10d8696c0806bb0432fac2f60e8ab756a5
X-Patchwork-Hint: ignore
Message-Id: <20240906115852.A3D6786E91@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/iperf3: security
 bump to version 3.17.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=81ee5b10d8696c0806bb0432fac2f60e8ab756a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Removed patch which is included in this release, autoreconf is not needed
anymore.

Updated license hash due to copyright year bump:
https://github.com/esnet/iperf/commit/7b947051d5192388dfa8a18989692e7af4226c62

Fixes CVE-2024-26306.

Release notes:
https://github.com/esnet/iperf/releases/tag/3.17.1
https://github.com/esnet/iperf/releases/tag/3.17

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9d9a0db3d8b471ccf1721312450337ff53ed4a35)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Check-and-link-libatomic-if-needed.patch  | 42 ----------------------
 package/iperf3/iperf3.hash                         |  6 ++--
 package/iperf3/iperf3.mk                           |  5 +--
 3 files changed, 4 insertions(+), 49 deletions(-)

diff --git a/package/iperf3/0001-Check-and-link-libatomic-if-needed.patch b/package/iperf3/0001-Check-and-link-libatomic-if-needed.patch
deleted file mode 100644
index ddb50c4694..0000000000
--- a/package/iperf3/0001-Check-and-link-libatomic-if-needed.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From bbf710e77e4a0438a2d995fd69b472e5ff054c69 Mon Sep 17 00:00:00 2001
-From: Jan Palus <jpalus@fastmail.com>
-Date: Sun, 3 Dec 2023 12:14:05 +0100
-Subject: [PATCH] Check and link libatomic if needed
-
-Some architectures without native support for 64-bit atomics need
-linking with libatomic.
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
-Upstream: https://github.com/esnet/iperf/commit/1511e9f85b548891ea53d4e378903344df1fd31e
----
- configure.ac | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2594b39..ad7eaf1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -92,7 +92,19 @@ CXX="$PTHREAD_CXX"
- ])
- 
- # Atomics
--AC_CHECK_HEADERS([stdatomic.h])
-+AC_CHECK_HEADERS([stdatomic.h],
-+    [AC_MSG_CHECKING([whether libatomic is required])
-+    AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdatomic.h>]], [[atomic_uint_fast64_t i; i++;]])],
-+        [AC_MSG_RESULT([no])],
-+        [save_LIBS="$LIBS"
-+        LIBS="$LIBS -latomic"
-+        AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdatomic.h>]], [[atomic_uint_fast64_t i; i++;]])],
-+            [AC_MSG_RESULT([yes])],
-+            [AC_MSG_ERROR([failed to find working configuration with atomics])]
-+        )]
-+    )],
-+    []
-+)
- 
- # Check for poll.h (it's in POSIX so everyone should have it?)
- AC_CHECK_HEADERS([poll.h])
--- 
-2.44.0
-
diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index a8634c4a7e..ee0149daed 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.16.tar.gz.sha256
-sha256  cc740c6bbea104398cc3e466befc515a25896ec85e44a662d5f4a767b9cf713e  iperf-3.16.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.17.1.tar.gz.sha256
+sha256  84404ca8431b595e86c473d8f23d8bb102810001f15feaf610effd3b318788aa  iperf-3.17.1.tar.gz
 # Locally computed
-sha256  35aa7c4618b9884d6faa9b43a4e70291b35ea9f89329d5d33becd852e85221b0  LICENSE
+sha256  3dc3e2076dd9cdea2b66d8fe213997ff25fb6171594f055b59fe25321b438f6f  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 3ab68bd13b..1d2b57208a 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.16
+IPERF3_VERSION = 3.17.1
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
 IPERF3_LICENSE_FILES = LICENSE
 IPERF3_CPE_ID_VENDOR = es
 
-# 0001-Check-and-link-libatomic-if-needed.patch
-IPERF3_AUTORECONF = YES
-
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
