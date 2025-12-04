Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA4ED43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93A5983EFE;
	Fri, 12 Dec 2025 07:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCp7tiCo1qk3; Fri, 12 Dec 2025 07:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B56983DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526238;
	bh=4RxTeKrmrFGNBGRUIvYS2+s0tc4kVoomMYel0wxxcyM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kppa2Ty5EtB0CdC9eMfGO1e9FnApr++L4SNCkbJ63lNE/ME3EcpByTjnd7RXLzDu2
	 VPAsS27eJQg3ZiFSx8krz7Bb/cdvAFIV/6DZSMoyvI4dWsx3gvMS/iV/8Ku+H08YrL
	 ark+14MEhbidIZFERWSNomsJXl/Ql54JkxnfylSs1WbfBWo54O6FaQGasAop0hDlP9
	 9cOnpMoi3BWBiLZSmcwYQ3J4M9OiHCUpdtukC1b3AoFQbBIv65oGM6md75jcGp/AwR
	 U/2wFFgx9ypb6hVrTIHfaRng453Yam+x+cRVgDlqcFWNdms0HggpSF/URYvThTTfNw
	 RPg7o0xG/p0Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B56983DF4;
	Fri, 12 Dec 2025 07:57:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84F75E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F4BC4114E
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8yBau2EX6aU for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D81A141152
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D81A141152
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D741886C93; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 21:34:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95c385e2d6b92e7afa2d1fac84ecf2dabfb81d25
X-Git-Newrev: da8f89a6a4027c0875b38de7256dd617ea68fe13
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.D741886C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf3: bump to version 3.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8873807225128202453=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8873807225128202453==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=da8f89a6a4027c0875b38de7256dd617ea68fe13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/esnet/iperf/releases/tag/3.20

Drop the upstreamed 001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...lation-issue-with-uClibc-due-to-a-missing.patch | 51 ----------------------
 package/iperf3/iperf3.hash                         |  4 +-
 package/iperf3/iperf3.mk                           |  2 +-
 3 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch b/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch
deleted file mode 100644
index cc2f4bd595..0000000000
--- a/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From e5c4263c6b2c5b84a6edeb1cf3c95bddd73d4d7c Mon Sep 17 00:00:00 2001
-From: Kadambini Nema <kadambini.nema@gmail.com>
-Date: Sat, 17 May 2025 16:20:07 -0700
-Subject: [PATCH] Fix a compilation issue with uClibc due to a missing include
- file.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-------
-In file included from t_auth.c:35:
-iperf_api.h:395:77: error: unknown type name ‘va_list’
-  395 | void iperf_exit(struct iperf_test *test, int exit_code, const char *format, va_list argp) __attribute__ ((noreturn));
-	  |                                                                             ^~~~~~~
-iperf_api.h:33:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
-   32 | #include <setjmp.h>
-  +++ |+#include <stdarg.h>
-   33 | #include <stdio.h>
------
-
-Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
-Upstream: https://github.com/esnet/iperf/pull/1888
----
- src/iperf_api.c | 1 -
- src/iperf_api.h | 1 +
- 2 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/iperf_api.c b/src/iperf_api.c
-index aeec91dd3..d4a06bec9 100644
---- a/src/iperf_api.c
-+++ b/src/iperf_api.c
-@@ -53,7 +53,6 @@
- #include <sys/stat.h>
- #include <sched.h>
- #include <setjmp.h>
--#include <stdarg.h>
- #include <math.h>
- 
- #if defined(HAVE_CPUSET_SETAFFINITY)
-diff --git a/src/iperf_api.h b/src/iperf_api.h
-index 03d273e8c..cd82e6f9b 100644
---- a/src/iperf_api.h
-+++ b/src/iperf_api.h
-@@ -30,6 +30,7 @@
- #include <sys/socket.h>
- #include <sys/time.h>
- #include <setjmp.h>
-+#include <stdarg.h>
- #include <stdio.h>
- #include <stdint.h>
- #ifdef __cplusplus
diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 3d9ff0cf5d..ee60d717e6 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.19.1.tar.gz.sha256
-sha256  dc63f89ec581ea99f8b558d8eb35109de06383010db5a1906c208a562ba0c270  iperf-3.19.1.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.20.tar.gz.sha256
+sha256  3acc572d1ecca4e0b20359c7bf0132ddc80d982efeee20c86f6726a9a6094388  iperf-3.20.tar.gz
 # Locally computed
 sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index df6b32abc1..bb8eece6b2 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.19.1
+IPERF3_VERSION = 3.20
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT

--===============8873807225128202453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8873807225128202453==--
