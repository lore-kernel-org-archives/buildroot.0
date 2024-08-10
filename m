Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8230FC3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 15:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02455413FC;
	Sat, 10 Aug 2024 15:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEPB-VxYuuBg; Sat, 10 Aug 2024 15:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ACC4413BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ACC4413BA;
	Sat, 10 Aug 2024 15:51:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6271B1BF27E
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 15:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DCC5413BA
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 15:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwaN1H3XioqY for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 15:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DD3C413B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD3C413B6
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DD3C413B6
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 15:51:15 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 54E10353D100; Sat, 10 Aug 2024 17:51:12 +0200 (CEST)
Date: Sat, 10 Aug 2024 17:51:12 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZreMcIb1cZbWA5ww@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723305072; bh=PNeWluUsNmmPxFCxIzE2K6bb+MHN8pbRA/rkCsIsdEo=;
 h=Date:From:To:Subject:From;
 b=hIL2rs1T9WywNrTyqaYt8D7yi4+dDLp/qnmwrso0ALTU6maLtCH2W5CqF+6F6HOqD
 pE2zOcIHYzKDG5gvrhi/Dhmoe8+fI1I02zcorn/0dsQYxzl/sGy/2JAfmxumc0Zq6F
 9SBKWuyhXutE0SkNUj4uMqDIDbXvVttlQTuCs+Rxuyx0Il2larwe65ZG2Rc5LaKpwz
 HwRsFdV6MMJ5ZGvd26MVNT843gDkI5LDQetjGgm/ynJ+xcgkspmN9xzwStfXtebijE
 WQHABWZ629HmD7NRx8qC7dz4VLvx78PQjzqT1MxLIOk+uK3on6kTzaXuJOxISYpYhY
 CV54D2hD/nsIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=hIL2rs1T
Subject: [Buildroot] [PATCH] package/stress-ng: update to 0.18.02
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patches 0001/0002 are upstream.
Stress-ng requires Thread support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...sock.c-fix-build-without-SO_ZEROCOPY.patch | 56 -------------------
 ...002-core-sched.c-fix-uclibc-ng-build.patch | 40 -------------
 package/stress-ng/Config.in                   |  5 +-
 package/stress-ng/stress-ng.hash              |  2 +-
 package/stress-ng/stress-ng.mk                |  2 +-
 5 files changed, 5 insertions(+), 100 deletions(-)
 delete mode 100644 package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
 delete mode 100644 package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch

diff --git a/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch b/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
deleted file mode 100644
index f1f4ab5636..0000000000
--- a/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 142c3b2414f0adfb13b59dea993054a0daa6cd52 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 4 May 2024 10:04:20 +0200
-Subject: [PATCH] stress-sock.c: fix build without SO_ZEROCOPY
-
-uclibc-ng defines MSG_ZEROCOPY but not SO_ZEROCOPY resulting in the
-following build failure since version 0.17.04 and
-https://github.com/ColinIanKing/stress-ng/commit/2ad8aff9bc1ab822cf615c72712c6031a8f60bbd:
-
-stress-sock.c: In function 'stress_sock_client':
-stress-sock.c:656:35: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
-  656 |    if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
-      |                                   ^~~~~~~~~~~
-      |                                   MSG_ZEROCOPY
-stress-sock.c:656:35: note: each undeclared identifier is reported only once for each function it appears in
-CC stress-sockfd.c
-stress-sock.c: In function 'stress_sock_server':
-stress-sock.c:1060:34: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
- 1060 |   if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
-      |                                  ^~~~~~~~~~~
-      |                                  MSG_ZEROCOPY
-
-Fixes:
- - http://autobuild.buildroot.org/results/bcff31bd9820cf0b95f8d8c6de44fd4ab8e2f065
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/ColinIanKing/stress-ng/commit/142c3b2414f0adfb13b59dea993054a0daa6cd52
----
- stress-sock.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/stress-sock.c b/stress-sock.c
-index 253730168..880530d04 100644
---- a/stress-sock.c
-+++ b/stress-sock.c
-@@ -649,7 +649,7 @@ retry:
- 				args->name, errno, strerror(errno));
- 			goto free_controls;
- 		}
--#if defined(MSG_ZEROCOPY)
-+#if defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
- 		if (sock_zerocopy) {
- 			int so_zerocopy = 1;
-
-@@ -1053,7 +1053,7 @@ static int OPTIMIZE3 stress_sock_server(
- 		goto die;
- 	}
-
--#if defined(MSG_ZEROCOPY)
-+#if defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
- 	if (sock_zerocopy) {
- 		int so_zerocopy = 1;
-
---
-2.43.0
-
diff --git a/package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch b/package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch
deleted file mode 100644
index c9c4e22603..0000000000
--- a/package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f8dc9f790251562c3a4635edd29d7674298cd5f7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 4 May 2024 17:52:32 +0200
-Subject: [PATCH] core-sched.c: fix uclibc-ng build
-
-Since version 0.17.02 and commit
-e75ecbc8994e94b9e151b1191c1888bd2821fe72, sched.h is not included before
-including core-shim.h. The issue is that core-shim.h defines its own
-sched_priority parameter in shim_sched_attr. When sched.h is included
-after core-shim.h, the build will fail because __sched_priority will not
-be found:
-
-In file included from core-sched.c:25:
-core-sched.c: In function 'stress_set_sched':
-core-sched.c:170:22: error: 'struct shim_sched_attr' has no member named '__sched_priority'; did you mean 'sched_priority'?
-  170 |                 attr.sched_priority = (unsigned int)sched_priority;
-      |                      ^~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/d7d38dbb10f7f188da8dccc44a84a3c46a720bed
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/ColinIanKing/stress-ng/commit/f8dc9f790251562c3a4635edd29d7674298cd5f7
----
- core-shim.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/core-shim.h b/core-shim.h
-index bed4cf2f6..475aac512 100644
---- a/core-shim.h
-+++ b/core-shim.h
-@@ -23,6 +23,8 @@
- #include <sys/uio.h>
- #endif
- 
-+#include <sched.h>
-+
- /*
-  *  BeagleBoneBlack with 4.1.15 kernel does not
-  *  define the following, these should be defined
diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index 918c3db194..faed3cedd1 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_STRESS_NG
 	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2 and ARC
 	depends on !BR2_nios2
 	depends on !BR2_arc
@@ -15,8 +16,8 @@ config BR2_PACKAGE_STRESS_NG
 
 	  https://github.com/ColinIanKing/stress-ng
 
-comment "stress-ng needs a toolchain w/ headers >= 3.3"
+comment "stress-ng needs a toolchain w/ threads, headers >= 3.3"
 	depends on !BR2_nios2 && !BR2_arc
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+	depends on (!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3 || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 1f704809de..bd4f3c8ba8 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b0bc1495adce6c7a1f82d53f363682b243d6d7e93a06be7f94c9559c0a311a6f  stress-ng-0.17.07.tar.gz
+sha256  45eac8d354df5be26c9675ec7fc24910f846e47eb6b151e9955d6eae30cfe060  stress-ng-0.18.02.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 04427f70ec..659904a9dd 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.17.07
+STRESS_NG_VERSION = 0.18.02
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
