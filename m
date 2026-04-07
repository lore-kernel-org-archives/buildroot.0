Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD142FEEF2A
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 11:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951CC409C0;
	Tue,  7 Apr 2026 11:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iupjcsI-GfHa; Tue,  7 Apr 2026 11:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E71840A10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775562829;
	bh=qXmfpUmMGYSytxGecrOtvSBPJoibPsh9ILooDHINpzE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F98+bJe5mgwlltghOnOIIFOOVRH1mXwgwQIBNv5Ps+jplidzfdUy4+Tl3v1Y6WeZo
	 ktZIzWFKcDQJbi5asmFrDrJNR4HX0/LkvCwHZHYu5uff6wQJ8bejPusuGN58Lc4C/i
	 ZDQ9skMOo2eJ97RJAKtteE89sY8sMUSM41XWECQN8Gnq37kdJisinz9xvB2Q4xeHa7
	 ZvSPA4M1wFkADHuou6jBM6OwkUdMe1hx0NgnLzCGcANh8q45krUkGcI3oQ3PV0VTMe
	 I4SchHiX2Cvl1A+WAtBjbGxZhcCaZRV7kJxkfSyzRIHI+No0KRDw89gsWmGyadf5PE
	 y2i+771r9pqlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E71840A10;
	Tue,  7 Apr 2026 11:53:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 693EA2EF
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 11:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D12140149
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 11:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZaqze-Caj_5 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 11:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4921440042
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4921440042
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 11:53:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF16B80714; Tue,  7 Apr 2026 11:53:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Apr 2026 13:50:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3374e49baa45679997c37a25accaf1574132c4a
X-Git-Newrev: ac4c32f6f839d1b813125e64f0e23a98922ac602
X-Patchwork-Hint: ignore
Message-Id: <20260407115346.BF16B80714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quickjs: security bump to version
 2025-09-13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac4c32f6f839d1b813125e64f0e23a98922ac602
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
