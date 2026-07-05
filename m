Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF75C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 16:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D29440859;
	Sun,  5 Jul 2026 16:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8odFQEWW_byg; Sun,  5 Jul 2026 16:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE5CF40831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783269887;
	bh=a7343UVLZXhNpXP7GNc5vtBHMUKBGIvacu+IkmiqHf8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hgnWZ3JGQNfhshh7d93zXQzkdofilia9TEzazjAD4ijUKXepwdxc3fAm5xvCSnkUy
	 QYqnnHhkogJTngnOcw4aaPhTxBBc+A7rUJq3/WDZkbUc47evaVTqnNe6u0VEA/ucUT
	 TTvDO8YJi3l/TNY9rQXqytOYptwPgc18sCzKtpdbH+Vhasfq5CP9d7J+IBPnoWbFcL
	 TsG5fN8YZgV7YMPLX2dkXEuA6LT3BOggSAr1KGplv3GdiDCEYWnvJUYjwCaFKOZ+vg
	 H9SdCigygATe5RKmcUWqd5UAXMN9k8is771vUMVg2DgUFOvXmQ9njK56wMPA3okppd
	 OPFHbYJKV9q1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5CF40831;
	Sun,  5 Jul 2026 16:44:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 981DF316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E85060706
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt4IOcQCmumc for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 16:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C97F460703
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C97F460703
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 602E68848F; Sun,  5 Jul 2026 16:44:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jul 2026 18:39:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 013612b4962332ef528682a037a91c7a420f5bab
X-Git-Newrev: cc5c36afffd71e6e01a9371f1a7316fc10a8e3f9
X-Patchwork-Hint: ignore
Message-Id: <20260705164415.602E68848F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmt: bump to version 12.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc5c36afffd71e6e01a9371f1a7316fc10a8e3f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

changelog:
https://github.com/fmtlib/fmt/releases/tag/12.2.0

LICENSE hash changed due to split-out of exceptions:
https://github.com/fmtlib/fmt/commit/91d1aced0a846161135310249664506b4a56e196

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmt/fmt.hash | 4 ++--
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 76bdd3171b..094a755aac 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  695fd197fa5aff8fc67b5f2bbc110490a875cdf7a41686ac8512fb480fa8ada7  fmt-12.1.0.zip
-sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE
+sha256  a2f4a8d51178f954e4c339007f77edd76ba0cb2e36f87a48e5a5403d9be5878f  fmt-12.2.0.zip
+sha256  a65fcc5a1095fc33cc37e4fff69366e49d7e92f613558a2b95ed1b70e33758b4  LICENSE
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 7d11cfddc3..b1d25e077b 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 12.1.0
+FMT_VERSION = 12.2.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
