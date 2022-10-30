Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F84BC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 10:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2678D40550;
	Sun, 30 Oct 2022 10:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2678D40550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCe-dtYrn74t; Sun, 30 Oct 2022 10:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2419040527;
	Sun, 30 Oct 2022 10:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2419040527
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C91A1BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5868A606ED
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5868A606ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQfgr9pNYimA for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 10:42:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9339660644
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9339660644
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C3D98745D; Sun, 30 Oct 2022 10:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:41:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8268346d75bf31e8311f451b4548e7547e8e7913
X-Git-Newrev: 06a9dc3528847ec6c12a9b6188d4106e086eabe5
X-Patchwork-Hint: ignore
Message-Id: <20221030104205.7C3D98745D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkcapi: bump version to 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=06a9dc3528847ec6c12a9b6188d4106e086eabe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/smuellerDD/libkcapi/commit/455c4938f5822c017c7ff79dd2dca638b6410923

Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...use-of-__NR_io_getevents-when-not-defined.patch | 42 ----------------------
 package/libkcapi/libkcapi.hash                     |  4 +--
 package/libkcapi/libkcapi.mk                       |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch b/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
deleted file mode 100644
index 20aa75b741..0000000000
--- a/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 455c4938f5822c017c7ff79dd2dca638b6410923 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 18:05:48 -0800
-Subject: [PATCH] Disable use of __NR_io_getevents when not defined
-
-Architectures like riscv32 do not define this syscall, therefore return
-ENOSYS on such architectures
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-[Retrieved from:
-https://github.com/smuellerDD/libkcapi/commit/455c4938f5822c017c7ff79dd2dca638b6410923]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/internal.h | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/lib/internal.h b/lib/internal.h
-index 1237827..f765461 100644
---- a/lib/internal.h
-+++ b/lib/internal.h
-@@ -325,10 +325,17 @@ static inline int io_submit(aio_context_t ctx, long n,  struct iocb **iocb)
-     return syscall(__NR_io_submit, ctx, n, iocb);
- }
- 
--static inline int io_getevents(aio_context_t ctx, long min, long max,
--            struct io_event *events, struct timespec *timeout)
-+static inline int io_getevents(__attribute__((unused)) aio_context_t ctx,
-+            __attribute__((unused)) long min,
-+            __attribute__((unused)) long max,
-+            __attribute__((unused)) struct io_event *events,
-+            __attribute__((unused)) struct timespec *timeout)
- {
-+#ifdef __NR_io_getevents
-     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
-+#else
-+    return -ENOSYS;
-+#endif
- }
- 
- /************************************************************
diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index 49b0880211..d858086408 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8a08dcbb4d05ede4357cdc9d61c7f2a7f2cd96b7ce2eb41b28e45b2e378267ad  libkcapi-1.1.5.tar.xz
-sha256  c6b8402a68999b0f84560ab43cdf60f9ff33c4a9a8ced6a40db9d3b787ba5b4a  COPYING
+sha256  644b47593b3f27f08add7a8808ccdbe569a2f331d70fb8b52551e57379b917fa  libkcapi-1.4.0.tar.xz
+sha256  9765fad61726afb2b253db2c68153672e4178d6809667ae98141f3e90fe8645b  COPYING
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 09c5c028bc..30d500696b 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = 1.1.5
+LIBKCAPI_VERSION = 1.4.0
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
 LIBKCAPI_SITE = http://www.chronox.de/libkcapi
 LIBKCAPI_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
