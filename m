Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF87C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 10:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE2C78401A;
	Fri, 28 Apr 2023 10:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE2C78401A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ti3sj0q-NQ6A; Fri, 28 Apr 2023 10:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCDD58401B;
	Fri, 28 Apr 2023 10:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCDD58401B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E75B1BF28A
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 10:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 118B861697
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 10:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 118B861697
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-stBb8v3U8L for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 10:44:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A2A761671
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A2A761671
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 10:44:27 +0000 (UTC)
Received: from pwmachine.numericable.fr
 (166.red-83-59-184.dynamicip.rima-tde.net [83.59.184.166])
 by linux.microsoft.com (Postfix) with ESMTPSA id D311221C2024;
 Fri, 28 Apr 2023 03:44:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D311221C2024
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 11:44:03 +0100
Message-Id: <20230428104403.10889-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1682678664;
 bh=OmvGdTiKGIL7bDZgYFd1q5wMHKoRszzWzNznuxneZgg=;
 h=From:To:Cc:Subject:Date:From;
 b=PRilaSRgWtJFRLpxLV5igjDI9MH/CGxQ8KkLirQneBNrphmCRD2XEjPIz26uagEoU
 7d430CW7klHqj4jMZBq5QAGZCzAeXEstOW+IpK0ZDCUwxnExF30Lj0AuhPeMBc/R9e
 Gjnm5eskTX0UC0+8TrQ046Wtbh56ksWQZNip976E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=PRilaSRg
Subject: [Buildroot] [PATCH 1/1] package/tbb: bump to version 2021.8.0.
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Remove upstream patches as they are no more needed.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 ...Musl-linux-can-not-use-RTLD_DEEPBIND.patch | 33 ---------------
 ...is-only-defined-on-glibc-and-android.patch | 42 -------------------
 ...-Define-ITT_ARCH_IA64-when-undefiend.patch | 27 ------------
 package/tbb/tbb.hash                          |  2 +-
 package/tbb/tbb.mk                            |  2 +-
 5 files changed, 2 insertions(+), 104 deletions(-)
 delete mode 100644 package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
 delete mode 100644 package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch
 delete mode 100644 package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch

diff --git a/package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch b/package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
deleted file mode 100644
index 82182ce109..0000000000
--- a/package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 883c2e5245c39624b3b5d6d56d5b203cf09eac38 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 Dec 2021 08:08:07 -0800
-Subject: [PATCH] Musl/linux can not use RTLD_DEEPBIND (#684)
-
-Exclude non-glibc linux systems along with android
-Fixes
-src/tbb/dynamic_link.cpp:417:29: error: use
- of undeclared identifier 'RTLD_DEEPBIND'                                                                                    |             flags = flags | RTLD_DEEPBIND;
-|                             ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-[Retrieved from:
-https://github.com/oneapi-src/oneTBB/commit/883c2e5245c39624b3b5d6d56d5b203cf09eac38]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/tbb/dynamic_link.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/tbb/dynamic_link.cpp b/src/tbb/dynamic_link.cpp
-index 3f1342503..5330d7107 100644
---- a/src/tbb/dynamic_link.cpp
-+++ b/src/tbb/dynamic_link.cpp
-@@ -413,7 +413,7 @@ namespace r1 {
-         int flags = RTLD_NOW;
-         if (local_binding) {
-             flags = flags | RTLD_LOCAL;
--#if __linux__ && !__ANDROID__ && !__TBB_USE_SANITIZERS
-+#if (__linux__ && __GLIBC__) && !__TBB_USE_SANITIZERS
-             flags = flags | RTLD_DEEPBIND;
- #endif
-         } else {
diff --git a/package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch b/package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch
deleted file mode 100644
index 9b397cac41..0000000000
--- a/package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3a7f96db56cc9821055cbc769d3065db86b8b4c9 Mon Sep 17 00:00:00 2001
-From: Julien Voisin <jvoisin@users.noreply.github.com>
-Date: Mon, 7 Feb 2022 07:56:15 +0100
-Subject: [PATCH] mallinfo is only defined on glibc and android (#764)
-
-It currently prevents compilation under musl:
-
-```
-[ 90%] Building CXX object src/tbbmalloc_proxy/CMakeFiles/tbbmalloc_proxy.dir/proxy.cpp.o
-/__w/mimalloc-bench/mimalloc-bench/extern/tbb/src/tbbmalloc_proxy/proxy.cpp:263:26: error: return type 'struct mallinfo' is incomplete
-  263 | struct mallinfo mallinfo() __THROW
-      |                          ^
-compilation terminated due to -Wfatal-errors.
-``
-
-[Retrieved from:
-https://github.com/oneapi-src/oneTBB/commit/3a7f96db56cc9821055cbc769d3065db86b8b4c9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/tbbmalloc_proxy/proxy.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.cpp
-index e58e55e0b..23b9c19c1 100644
---- a/src/tbbmalloc_proxy/proxy.cpp
-+++ b/src/tbbmalloc_proxy/proxy.cpp
-@@ -260,6 +260,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
-     return 1;
- }
- 
-+#if defined(__GLIBC__) || defined(__ANDROID__)
- struct mallinfo mallinfo() __THROW
- {
-     struct mallinfo m;
-@@ -267,6 +268,7 @@ struct mallinfo mallinfo() __THROW
- 
-     return m;
- }
-+#endif
- 
- #if __ANDROID__
- // Android doesn't have malloc_usable_size, provide it to be compatible
diff --git a/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch b/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch
deleted file mode 100644
index 5b7f002499..0000000000
--- a/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 6fad69889da67bc4d4baff4afa94f77da45e006d Mon Sep 17 00:00:00 2001
-From: Felix Yan <felixonmars@archlinux.org>
-Date: Thu, 7 Oct 2021 14:16:16 +0800
-Subject: [PATCH] Define ITT_ARCH_IA64 when undefiend (#550)
-
-[Retrieved from:
-https://github.com/oneapi-src/oneTBB/commit/6fad69889da67bc4d4baff4afa94f77da45e006d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/tbb/tools_api/ittnotify_config.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/tbb/tools_api/ittnotify_config.h b/src/tbb/tools_api/ittnotify_config.h
-index 8ecc23781..f904a8e9d 100644
---- a/src/tbb/tools_api/ittnotify_config.h
-+++ b/src/tbb/tools_api/ittnotify_config.h
-@@ -147,6 +147,10 @@
- #  define ITT_ARCH_IA32E 2
- #endif /* ITT_ARCH_IA32E */
- 
-+#ifndef ITT_ARCH_IA64
-+#  define ITT_ARCH_IA64 3
-+#endif /* ITT_ARCH_IA64 */
-+
- #ifndef ITT_ARCH_ARM
- #  define ITT_ARCH_ARM  4
- #endif /* ITT_ARCH_ARM */
diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
index 9992fb3c4f..579581cfe4 100644
--- a/package/tbb/tbb.hash
+++ b/package/tbb/tbb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e5b57537c741400cf6134b428fc1689a649d7d38d9bb9c1b6d64f092ea28178a  tbb-2021.5.0.tar.gz
+sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f8b  tbb-2021.8.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index fc720fd2f5..c3e06a4e6d 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBB_VERSION = 2021.5.0
+TBB_VERSION = 2021.8.0
 TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
 TBB_INSTALL_STAGING = YES
 TBB_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
