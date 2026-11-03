Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A63606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sdB/QYWB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1AA8119F;
	Fri,  6 Nov 2026 15:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYMqVc4npoA3; Fri,  6 Nov 2026 15:58:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1C195810AF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980715;
	b=k48yGcK792X8HSlfyx1jqOcLK9gkHxhGL3CGqOBGVDWW7Bo0x+ZBVade40/xxnzWeQ1W
	 34XrJTGgRhrsrNoAwMWySg73o4z5OGLYlcmVkpBYTwIWbsVfJApvp04MhYv+62sC6fhcN
	 AHEHAoLKM0tyY1D2UPgLMbT2UktzWWqUS8nD8oTABtxFMJkKYFfYdSK8JDrAkCQudhgep
	 a1ylfmoG97H7XGrwXAYuU1ujCh14XMw/xMbBNMsYoed1SJnK7ZUUkfMKpSgdiXUpwQqax
	 JhQ+yaCx46CGX8mG6/knIx5zdqXY5KZeKKvgoEUWDliW9s90aZwxtnS7QdaAqnfmx8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980715;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=OWqpVLbYEMq/rbPYmAfdd7naZWVLtUl82KwE4iqsoT0=;
	b=Eq9pdOGCkMtJhCZJW+qbM3m6AFPaI2pApEtwKJwW2XImRcO3TAFmX7qJF9BitLhRKjk0
	 /p5YAJR9RmDYqsttG4umSBNjsY0Z0bqaSJHBrZJTTxWbjhELqpU170RAxWJDECt+pxMwE
	 xvFWA1ooUCkjdERM5TRV6VbbZiYlnS95E5iDv1+yUHOg+LtP88izesMwRzEPgcgjBVFdC
	 1S8NPfBQ1eY1Pn0fwr3iK1POG84+hKVd84SBA/vNW4ahJTLKvlINhDN0ku8Y8IwekDUid
	 tD4/9be1i6NXrunM0j/MZPMsUFFXnzApGeEA6PPP7SRYuw34G25FTLxIOEDd41Bp+zg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980715;
	bh=OWqpVLbYEMq/rbPYmAfdd7naZWVLtUl82KwE4iqsoT0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sdB/QYWBwIOcqnbvAdtkfbX70VSuOHxKKG6gK/nbM3OvSV2D6juIuiBpRQZmCcyqb
	 MvW7F1a+skv3GnVwQZ3R/uGRV9C8AYZ7bUXfpW3TxCItikaqoUbmOnEHDDP+BDtEH+
	 AX7iIXpvrA4Z9Wei5ul8UvfOZqtZQdIY7h4bOFRq93IyfFR1xHSCUysndeVU7gKZYK
	 INCFSKtRF0bh2yKfRgyV7eHI0eTSSq/VF41GoxBYZSUEb4OGVZC8qggzHZHp2rGk5n
	 ggOaUoB5w6FO8ojMsZkKy/cRLbCLA/ihdxjEtrNfbku8hVbdKEFT6+yGm+HuTpfe5b
	 9ZWclrLRZzujA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C195810AF;
	Fri,  6 Nov 2026 15:58:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0A424B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 860AF40925
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMYHUg0Kklv2 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D1DB4406CA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1DB4406CA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04B189E0AC; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Nov 2026 11:16:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 095fc2849af12a25994e5f92657c144ca72515c4
X-Git-Newrev: 6e8c29614091f1f0d0964dd0a8cc7d309b83b902
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.04B189E0AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iperf3: bump to
 version 3.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1687441900144511830=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1687441900144511830==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e8c29614091f1f0d0964dd0a8cc7d309b83b902
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/esnet/iperf/releases/tag/3.20

Drop the upstreamed 001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit da8f89a6a4027c0875b38de7256dd617ea68fe13)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============1687441900144511830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1687441900144511830==--
