Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F84EE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 23:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D20E814BC;
	Sun, 28 Dec 2025 23:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJ6b8MrFLW6w; Sun, 28 Dec 2025 23:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE813814BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766965057;
	bh=NCAlXCUwODOhwV54f9NU4QcFfIfE0DcIUIBO6yyg16U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lv5mUY3w5BZZwYrBL1CEPsN1kVBlbiMiYf731xsMxIg04g1PBrRNiqi/dU+i+6y3w
	 +Gk43zMCYVPqrqDBBbkp98bYEBNQqznj2HGwoOx839RqvCqtciPUdCWTgjQPbEpp77
	 oqBY6GvWrribSUsIsOObr5SL94Z5DTlN5d96NVkEGSpJVyEqmaTqTHiI3vJYH9PZIM
	 U5WYj9pM3fMHkm9mvGB5hVg+49VtuguryjuEd8JLbBj5QVVi30pNo631IJqHGAKN3M
	 ZWWcoRZn2e5Va9E0bTbeCfoKWxBCpl2lODh9HumsFw8K84wePAbeGtNp0ZmC9J9a+I
	 1SgHEMA8c6dMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE813814BA;
	Sun, 28 Dec 2025 23:37:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1076B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D77F4814BA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qo5DvqEo4VH for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 23:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C920814B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C920814B1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:37:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2719187A35; Sun, 28 Dec 2025 23:37:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 00:32:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d5e0ccd8fe141c9cbda7137f84c93a834496e0b
X-Git-Newrev: 8892bb2b384aba54c9b7b99287067b9150f91ade
X-Patchwork-Hint: ignore
Message-Id: <20251228233734.2719187A35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 12.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8892bb2b384aba54c9b7b99287067b9150f91ade
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index dbe10255ec..cb5b63507c 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ecb603aa426a8b24665718667bda64a84c1504db7454ee4cadbd362eea64e545  harfbuzz-12.2.0.tar.xz
+sha256  8660ebd3c27d9407fc8433b5d172bafba5f0317cb0bb4339f28e5370c93d42b7  harfbuzz-12.3.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 268e4ac5d0..5aed4e31f9 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 12.2.0
+HARFBUZZ_VERSION = 12.3.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
