Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0323CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:57:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F916103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1F916103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C47840626;
	Tue,  3 Aug 2021 23:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuPIHqeTobT5; Tue,  3 Aug 2021 23:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BBCC4065E;
	Tue,  3 Aug 2021 23:57:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 550ED1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EBF040E4B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnwWMP7hihzu for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE2AD40E8C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 50E5185583; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 21:43:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eb8a32a21c5a2d7b15387393dd1129d27558c30e
X-Git-Newrev: 7801a85c137785145d2268a7a40152c48adf62d1
X-Patchwork-Hint: ignore
Message-Id: <20210803211011.50E5185583@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/strace: bump to
 version 5.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=7801a85c137785145d2268a7a40152c48adf62d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ace_get_syscall_info-disable_ptrace_getre.patch | 33 ----------------------
 package/strace/strace.hash                         |  4 +--
 package/strace/strace.mk                           |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch b/package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch
deleted file mode 100644
index 1367d2985a..0000000000
--- a/package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 84536a993417f3bfff4a54830fa34a3f91f5716e Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 11 Mar 2021 06:43:26 +0200
-Subject: [PATCH] disable_ptrace_get_syscall_info, disable_ptrace_getregset:
- require fork()
-
-These helper programs require fork(), so they are incompatible with
-no-MMU systems. Make the code depend on HAVE_FORK.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://lists.strace.io/pipermail/strace-devel/2021-March/010421.html
-
- src/disable_ptrace_request.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/disable_ptrace_request.c b/src/disable_ptrace_request.c
-index 57163e77f0f4..715006941572 100644
---- a/src/disable_ptrace_request.c
-+++ b/src/disable_ptrace_request.c
-@@ -41,7 +41,8 @@ init(int argc, char **argv)
-  && defined PR_SET_NO_NEW_PRIVS \
-  && defined PR_SET_SECCOMP \
-  && defined BPF_JUMP \
-- && defined BPF_STMT
-+ && defined BPF_STMT \
-+ && defined HAVE_FORK
- 
- static unsigned int
- get_arch(void)
--- 
-2.30.1
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index e4fe690f61..f7a634000c 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.11/strace-5.11.tar.xz.asc
-sha256  ffe340b10c145a0f85734271e9cce56457d23f21a7ea5931ab32f8cf4e793879  strace-5.11.tar.xz
+# https://strace.io/files/5.12/strace-5.12.tar.xz.asc
+sha256  29171edf9d252f89c988a4c340dfdec662f458cb8c63d85431d64bab5911e7c4  strace-5.12.tar.xz
 sha256  f847d5ef26ad1151ca63bb88536b23a4cac5040c67917f3d5ee7ea1316e2b736  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 013bfdcd55..810f55e82b 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.11
+STRACE_VERSION = 5.12
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
