Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A490BD2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7652261C7A;
	Thu,  4 Dec 2025 20:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZoqSRdvcCY9; Thu,  4 Dec 2025 20:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB7566147E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880945;
	bh=ucapC1IxXfAEuDNS1hkhJSQabrY3+P1RbtdvBN27SYg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NKa6OWfk/150GVJ8TCBdCq/NESd9fHYpSUD+PdcL4NRu7FQazbI1JKhakjwwVQ//Y
	 0Xse0xGuBm4PDNHFjH1VcwYdGEjkXB18s5QY1RLR8RSgdQdQm4Ts2gB4UH5EZA8eEM
	 GswwR9ejZTMvbIR9tz+ndXExLudGn8IF21dzptBbhvheMd8q9c3zADHy7raP4ReEzJ
	 6PvqUyuHL2GWq3E2ZTlScmc6EsoD9igR+jr0XwbuWUts2NlUzmExcYcs4btXWpSp9G
	 Qd3v1JqWjMXTrUeVe7P+imUIt7JRIRzpXWgweyPzEcuY/W4MTA5Ymu0aZO9WTJ0Hdw
	 2kvnE4bVOyn4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB7566147E;
	Thu,  4 Dec 2025 20:42:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC6C9D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC6208471A
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5vuCi1Miua4 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B86F584714
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B86F584714
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:42:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A873E8653B; Thu,  4 Dec 2025 20:42:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 21:34:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 95c385e2d6b92e7afa2d1fac84ecf2dabfb81d25
X-Git-Newrev: da8f89a6a4027c0875b38de7256dd617ea68fe13
X-Patchwork-Hint: ignore
Message-Id: <20251204204221.A873E8653B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iperf3: bump to
 version 3.20
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
Content-Type: multipart/mixed; boundary="===============3603562369190899485=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3603562369190899485==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=da8f89a6a4027c0875b38de7256dd617ea68fe13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============3603562369190899485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3603562369190899485==--
