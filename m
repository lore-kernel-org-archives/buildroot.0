Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD123FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FEA584DF8;
	Fri, 24 Apr 2026 16:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dcDzElLdxU3; Fri, 24 Apr 2026 16:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B115484DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047966;
	bh=A3EXcb/vPrHcvA1jfPwxME4DGOJQ0EqZHT+sYWUFle4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M3IHD8aIcliLzJU7TIncTZrZxi/W67NOsySDv6yo1nU8Yi+5rX0s1AVwg3nsl60z6
	 rZHam8pgJTCNbjFsJCM4djmSUoVPAq/EpGRZgJYKkZK4ZPcMY+DGf6o8kfYw7odh2q
	 UpRKqDqizf4EtOwHexP0Y/m1HJgnjJ36N+wIIIBmewb580VkJZWJiVJT6ng8PAvLlf
	 lWx1GC6VaHM0pN9hvKV2T2IJOq+pTYOf+zhWwefQ+PEr7jYqFK+mhtgUr0q3ZR7qS1
	 EM8Xk5hXJu6CMHYSzkOD19+96Mr1BhZyFTgQB8gQGhq3B9f4q87vAJp5UArUimB5lI
	 PmhEhvTZocwJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B115484DF2;
	Fri, 24 Apr 2026 16:26:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B4A24D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87EC184C4C
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pngmgiOYgETI for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5DA484D2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5DA484D2F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E14E82B2E; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:21:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: efcd4354e61ed0b7e94f6696e5a37df573aab0e7
X-Git-Newrev: 7159759a9ab553d0892eee36c7b7fea607d671c7
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.9E14E82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dash: add patch
 for CVE-2026-31323
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7159759a9ab553d0892eee36c7b7fea607d671c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The vulnerability description is not disclosed yet.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 7e24f892f6120d008e6a73617398ddc3111ee3a2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dash/0002-fix-CVE-2026-31323.patch | 42 ++++++++++++++++++++++++++++++
 package/dash/dash.mk                       |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/package/dash/0002-fix-CVE-2026-31323.patch b/package/dash/0002-fix-CVE-2026-31323.patch
new file mode 100644
index 0000000000..5c92119db5
--- /dev/null
+++ b/package/dash/0002-fix-CVE-2026-31323.patch
@@ -0,0 +1,42 @@
+From 0034bfe185d3d875cebace8cb3ca5c9dabf9e0f3 Mon Sep 17 00:00:00 2001
+From: Muchen Hou <996029583@qq.com>
+Date: Mon, 13 Apr 2026 10:28:29 +0800
+Subject: arith: Fix CVE-2026-31323 INTMAX_MIN / -1 overflow
+
+Division and remainder currently guard against division by zero, but not
+against the signed overflow case INTMAX_MIN / -1. On affected systems
+this can trigger SIGFPE during arithmetic expansion.
+
+Add an explicit guard before evaluating division or remainder.
+
+Signed-off-by: Muchen Hou <996029583@qq.com>
+
+Merge the overflow check with the zero division check.
+
+Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
+
+CVE: CVE-2026-31323
+Upstream: https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?h=601bc50bfc2858ab7a9ec327fe4e33a9c4877759&id=0034bfe185d3d875cebace8cb3ca5c9dabf9e0f3
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/arith_yacc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/arith_yacc.c b/src/arith_yacc.c
+index 1a087c3..b978ef0 100644
+--- a/src/arith_yacc.c
++++ b/src/arith_yacc.c
+@@ -98,8 +98,8 @@ static intmax_t do_binop(int op, intmax_t a, intmax_t b)
+ 	default:
+ 	case ARITH_REM:
+ 	case ARITH_DIV:
+-		if (!b)
+-			yyerror("division by zero");
++		if (!b || (a == INTMAX_MIN && b == -1))
++			yyerror("division error");
+ 		return op == ARITH_REM ? a % b : a / b;
+ 	case ARITH_MUL:
+ 		return a * b;
+-- 
+cgit 1.3-korg
+
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 0993cb99a6..a5455d8ea9 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -13,6 +13,9 @@ DASH_AUTORECONF = YES
 
 DASH_CPE_ID_VENDOR = dash
 
+# 0002-fix-CVE-2026-31323.patch
+DASH_IGNORE_CVES += CVE-2026-31323
+
 # dash does not build in parallel
 DASH_MAKE = $(MAKE1)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
