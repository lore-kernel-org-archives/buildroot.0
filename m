Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211FDC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D74AF81EB6;
	Sun, 18 May 2025 14:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wK4h7WdLDGqN; Sun, 18 May 2025 14:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A749C81EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A749C81EC7;
	Sun, 18 May 2025 14:41:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 149631BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE1DF408E3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5pdqQd0pM-0 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23AF8408E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23AF8408E0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:41:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E64C86F8D; Sun, 18 May 2025 14:41:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 16:26:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a43be7df48148774e1a3f6623d2b4d7eb282197
X-Git-Newrev: 0575a3ab10932a030c0726a8d8bedc2d06b6499c
X-Patchwork-Hint: ignore
Message-Id: <20250518144115.1E64C86F8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf3: bump to version 3.19
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2615335828261716614=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2615335828261716614==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0575a3ab10932a030c0726a8d8bedc2d06b6499c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/esnet/iperf/releases/tag/3.19

Updated license hash due to copyright year bump:
https://github.com/esnet/iperf/commit/9f6dc2164dea62221298818c54992c3f24a7e214

Added a patch to fix the build error with uClibc.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...lation-issue-with-uClibc-due-to-a-missing.patch | 51 ++++++++++++++++++++++
 package/iperf3/iperf3.hash                         |  6 +--
 package/iperf3/iperf3.mk                           |  2 +-
 3 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch b/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch
new file mode 100644
index 0000000000..cc2f4bd595
--- /dev/null
+++ b/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch
@@ -0,0 +1,51 @@
+From e5c4263c6b2c5b84a6edeb1cf3c95bddd73d4d7c Mon Sep 17 00:00:00 2001
+From: Kadambini Nema <kadambini.nema@gmail.com>
+Date: Sat, 17 May 2025 16:20:07 -0700
+Subject: [PATCH] Fix a compilation issue with uClibc due to a missing include
+ file.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+------
+In file included from t_auth.c:35:
+iperf_api.h:395:77: error: unknown type name ‘va_list’
+  395 | void iperf_exit(struct iperf_test *test, int exit_code, const char *format, va_list argp) __attribute__ ((noreturn));
+	  |                                                                             ^~~~~~~
+iperf_api.h:33:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
+   32 | #include <setjmp.h>
+  +++ |+#include <stdarg.h>
+   33 | #include <stdio.h>
+-----
+
+Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
+Upstream: https://github.com/esnet/iperf/pull/1888
+---
+ src/iperf_api.c | 1 -
+ src/iperf_api.h | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/iperf_api.c b/src/iperf_api.c
+index aeec91dd3..d4a06bec9 100644
+--- a/src/iperf_api.c
++++ b/src/iperf_api.c
+@@ -53,7 +53,6 @@
+ #include <sys/stat.h>
+ #include <sched.h>
+ #include <setjmp.h>
+-#include <stdarg.h>
+ #include <math.h>
+ 
+ #if defined(HAVE_CPUSET_SETAFFINITY)
+diff --git a/src/iperf_api.h b/src/iperf_api.h
+index 03d273e8c..cd82e6f9b 100644
+--- a/src/iperf_api.h
++++ b/src/iperf_api.h
+@@ -30,6 +30,7 @@
+ #include <sys/socket.h>
+ #include <sys/time.h>
+ #include <setjmp.h>
++#include <stdarg.h>
+ #include <stdio.h>
+ #include <stdint.h>
+ #ifdef __cplusplus
diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 2aef76578a..1ffb2c6c02 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.18.tar.gz.sha256
-sha256  c0618175514331e766522500e20c94bfb293b4424eb27d7207fb427b88d20bab  iperf-3.18.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.19.tar.gz.sha256
+sha256  040161da1555ec7411a9d81191049830ef37717d429a94ee6cf0842618e0e29c  iperf-3.19.tar.gz
 # Locally computed
-sha256  3dc3e2076dd9cdea2b66d8fe213997ff25fb6171594f055b59fe25321b438f6f  LICENSE
+sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 744ee070a4..69c4792f98 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.18
+IPERF3_VERSION = 3.19
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT

--===============2615335828261716614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2615335828261716614==--
