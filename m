Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4366FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 22:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A2C240355;
	Wed,  6 Jul 2022 22:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A2C240355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkYGXe13hQy8; Wed,  6 Jul 2022 22:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E744402B1;
	Wed,  6 Jul 2022 22:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E744402B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D059C1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 22:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB51383147
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 22:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB51383147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcPfYs2ZB2ww for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 22:00:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB32183123
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 22:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB32183123
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C2700832DB; Wed,  6 Jul 2022 21:47:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:49:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d566b8cc7146ad57dfdf7ef13aceb80b85acd9e
X-Git-Newrev: d594c1612381da528f8121758962e52ab231f3dc
X-Patchwork-Hint: ignore
Message-Id: <20220706214741.C2700832DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.80
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

commit: https://git.buildroot.net/buildroot/commit/?id=d594c1612381da528f8121758962e52ab231f3dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's drop local patch that has been upstreamed:
https://hg.mozilla.org/projects/nss/rev/190801f7f1fb25490098487abacb1fd2ca5ef1e8

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1771036-Fix-build-failure-on-Aarch64-host.patch | 37 ----------------------
 package/libnss/libnss.hash                         |  4 +--
 package/libnss/libnss.mk                           |  2 +-
 3 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
deleted file mode 100644
index 12b376744e..0000000000
--- a/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9d5900c1ee9000906a90923e861b0fd7f1061cde Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 24 May 2022 23:40:45 +0200
-Subject: [PATCH] Bug 1771036 - Fix build failure on Aarch64 host
-
-If trying to build on Aarch64 host for powerpc64 target we can't override
-the LDFLAGS leading to this build failure:
-gcc: error: unrecognized command-line option '-m64'
-
-So let's add NATIVE_LDFLAGS check and use it to link nsinstall. This way
-any build environment can pass LDFLAGS that fits better for host
-architecture.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=1771036]
----
- coreconf/nsinstall/Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
-index 08dfbc2fe..5061789ff 100644
---- a/nss/coreconf/nsinstall/Makefile
-+++ b/nss/coreconf/nsinstall/Makefile
-@@ -34,6 +34,10 @@ ifdef NATIVE_FLAGS
- OS_CFLAGS=$(NATIVE_FLAGS)
- endif
- 
-+ifdef NATIVE_LDFLAGS
-+LDFLAGS=$(NATIVE_LDFLAGS)
-+endif
-+
- include $(DEPTH)/coreconf/rules.mk
- 
- # Redefine MAKE_OBJDIR for just this directory
--- 
-2.34.1
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index f7da9ccfdc..0f4c3cabe6 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_79_RTM/src/SHA256SUMS
-sha256  ebdf2d6a96613b6fe70ad579e9f983e0e94e0110171cfb2999db633d3394a514  nss-3.79.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_80_RTM/src/SHA256SUMS
+sha256  c0bf1fd2c7e29a6b02b309622baafc443eec90c8934bb155da4bb98988784b6a  nss-3.80.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 70f53a9140..e7aa730435 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.79
+LIBNSS_VERSION = 3.80
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
