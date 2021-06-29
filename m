Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC0FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:14:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F8060EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40F8060EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18EC86086E;
	Tue,  3 Aug 2021 22:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYJxrxOf-OJw; Tue,  3 Aug 2021 22:14:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5552C60644;
	Tue,  3 Aug 2021 22:14:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A84721BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F0FD606DC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ESrnN8RNTey for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9533B608DF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DAB98860D3; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 22:40:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a5585d5509bf8ff0ab7fefbb5d476cb7aa133fdd
X-Git-Newrev: aa5ac7f166736ba3c161d9440da07f2113a5ca6a
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.DAB98860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/daemon: bump to
 version 0.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=aa5ac7f166736ba3c161d9440da07f2113a5ca6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop upstream patch.

Add another patch to fix build with musl.

Update COPYING hash because of date change.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-daemon-fix-build-with-musl-libc-again.patch | 46 ++++++++++++++++++++++
 package/daemon/0001-fix-musl.patch                 | 18 ---------
 package/daemon/daemon.hash                         |  4 +-
 package/daemon/daemon.mk                           |  2 +-
 4 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch b/package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch
new file mode 100644
index 0000000000..48d95f122f
--- /dev/null
+++ b/package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch
@@ -0,0 +1,46 @@
+From b879e6886498fdd147287bffdf5867378c7f3299 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 24 Jun 2021 14:28:10 +0300
+Subject: [PATCH] daemon: fix build with musl libc (again)
+
+Commit 6b28c54dd95b3 added HAVE_SYS_TTYDEFAULTS_H to guard
+sys/ttydefaults.h include. This breaks musl libc build because
+HAVE_SYS_TTYDEFAULTS_H is not defined until config.h is included.
+
+Move sys/ttydefaults.h include below config.h
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/raforg/daemon/pull/4
+
+ daemon.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/daemon.c b/daemon.c
+index 5c5ef2cb86df..f88a0d49bf84 100644
+--- a/daemon.c
++++ b/daemon.c
+@@ -1011,9 +1011,6 @@ I<elogind(8)>
+ #ifdef _RESTORE_POSIX_SOURCE
+ #define _POSIX_SOURCE
+ #endif
+-#ifdef HAVE_SYS_TTYDEFAULTS_H /* For CEOF in musl libc (Linux only) */
+-#include <sys/ttydefaults.h>
+-#endif
+ #include <dirent.h>
+ #include <sys/wait.h>
+ #include <sys/stat.h>
+@@ -1037,6 +1034,10 @@ I<elogind(8)>
+ #include <systemd/sd-login.h>
+ #endif
+ 
++#ifdef HAVE_SYS_TTYDEFAULTS_H /* For CEOF in musl libc (Linux only) */
++#include <sys/ttydefaults.h>
++#endif
++
+ /* Configuration file entries */
+ 
+ typedef struct Config Config;
+-- 
+2.30.2
+
diff --git a/package/daemon/0001-fix-musl.patch b/package/daemon/0001-fix-musl.patch
deleted file mode 100644
index 5ebb645973..0000000000
--- a/package/daemon/0001-fix-musl.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-daemon: fix build with musl
-
-musl requires the ttydefaults.h to be included explicitly for CEOF.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-diff -Nuar daemon-0.6.4-orig/daemon.c daemon-0.6.4/daemon.c
---- daemon-0.6.4-orig/daemon.c	2010-06-12 16:37:00.000000000 +0300
-+++ daemon-0.6.4/daemon.c	2017-05-01 22:02:17.721413468 +0300
-@@ -864,6 +864,7 @@
- #ifdef _RESTORE_POSIX_SOURCE
- #define _POSIX_SOURCE
- #endif
-+#include <sys/ttydefaults.h>
- #include <dirent.h>
- #include <sys/wait.h>
- #include <sys/stat.h>
diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
index ec7451a81e..c490f71548 100644
--- a/package/daemon/daemon.hash
+++ b/package/daemon/daemon.hash
@@ -1,5 +1,5 @@
 # From http://www.libslack.org/daemon/
-sha256  ba1f6dc87532c852bfb8f436179cd661c3458ff898f67767c414123198626dfd  daemon-0.7.1.tar.gz
+sha256  74f12e6d4b3c85632489bd08431d3d997bc17264bf57b7202384f2e809cff596  daemon-0.8.tar.gz
 # Locally calculated
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
-sha256  cbac6eb0e1f7f95826966c7903939d591092a7f7d7726862946cb49096e8497d  COPYING
+sha256  91329bb9be4ae0b7800081fa054e9bb760c60005b26958c1fb8461bc66bcd998  COPYING
diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
index 91f77dd24a..96a163e597 100644
--- a/package/daemon/daemon.mk
+++ b/package/daemon/daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAEMON_VERSION = 0.7.1
+DAEMON_VERSION = 0.8
 DAEMON_SITE = http://libslack.org/daemon/download
 DAEMON_LICENSE = GPL-2.0+
 DAEMON_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
