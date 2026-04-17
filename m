Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0D4F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE7B58174C;
	Fri, 17 Apr 2026 15:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFCfEGQlqPcw; Fri, 17 Apr 2026 15:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648B9816D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439370;
	bh=JxWthkhh5RfhdNpAMY5OzH0fi5V3HypsnCexA8BrleM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SRDy03D3gsqf9VeOyCLB8/d2t+V1EibgyrGyuvhhVDeaRj7QysnDCE09q7jXTSzam
	 lkSfDfcuhRfO5Uv4WyBy5B5US6fppQ8PaGQ1CSjwn0wEKPAcQ0RYRuu6EcG9fTmPA6
	 e1J8J2fhD9xtIz/P9aWlGnoSBTvXeHbQgr0yofMXl+GmOJlj42Vo3ZkZWQQnDxqZjb
	 PGxtbb1e3BaJBosAA8uu9soFOGjQvU7tpAn2+3cxnf7NrQW4l4UgMvokqDZOVt90Lh
	 +GfYgEyCOdWZyfsHcckC7XdW1HYWSeq3OoaZOYk+CBCDaHXBAFK/ksG3KI7HphRBco
	 eVDfWoSjcB04g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648B9816D9;
	Fri, 17 Apr 2026 15:22:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 812824E0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 679EA405F7
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7A_9Jnhr_iXr for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F927405F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F927405F5
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BDF981DDA; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:00 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 39ca2c22b29bae3202c3ca342b385b5cc03383d7
X-Git-Newrev: 2512acc8621bd78b02c8c185857416c4adf6582f
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.4BDF981DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/quickjs: security
 bump to version 2025-09-13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2512acc8621bd78b02c8c185857416c4adf6582f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

fixes this serie of CVE:
https://security-tracker.debian.org/tracker/CVE-2025-62490
https://security-tracker.debian.org/tracker/CVE-2025-62491
https://security-tracker.debian.org/tracker/CVE-2025-62492
https://security-tracker.debian.org/tracker/CVE-2025-62493
https://security-tracker.debian.org/tracker/CVE-2025-62494
https://security-tracker.debian.org/tracker/CVE-2025-62495
https://security-tracker.debian.org/tracker/CVE-2025-62496

For release notes, see:
https://bellard.org/quickjs/Changelog

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ac4c32f6f839d1b813125e64f0e23a98922ac602)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/quickjs/Config.in    | 2 +-
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index a59d460706..0ae0389b2e 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_QUICKJS
 	depends on BR2_USE_MMU # fork()
 	help
 	  QuickJS is a small and embeddable Javascript engine.
-	  It supports the ES2020 specification including modules,
+	  It supports the ES2023 specification including modules,
 	  asynchronous generators, proxies and BigInt.
 
 	  https://bellard.org/quickjs/
diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 798c857a10..70dfb2d19c 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2f20074c25166ef6f781f381c50d57b502cb85d470d639abccebbef7954c83bf  quickjs-2025-04-26.tar.xz
+sha256  6f1f322aea3bb3a90858db85c9fe717013fde4df7dfcafe2f57e78f5bb4b4a0c  quickjs-2025-09-13.tar.xz
 sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index e2170b2978..511f142456 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2025-04-26
+QUICKJS_VERSION = 2025-09-13
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
