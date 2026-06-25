Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B6FCDE001
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 16:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C7641139;
	Thu, 25 Jun 2026 16:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AjpovUA7YcN; Thu, 25 Jun 2026 16:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB20B410FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782403413;
	bh=3ckjC6AWzjN2IaYvkXkulEah39KLVnv5qyT5pJwhzFs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l3RCv6xgOgypijj7udyde0+5wXfayW/w7LCYtDDTld85BbRaiwFaNAFkcbYSModlm
	 3Kjap42nHe0C7RxS4AEWPLxaSCU9J6or69XlfwkjltF1Px31l873vhiu8DtzQlGTIY
	 SccHp7IcCUZQeYqWFNXW5rGoSJthFE/f27hZdTqxPNWPHaE1USLwvbl+i1NEOCElsN
	 ipblLQQIImWnCOYm54T9T521FbWl1GFo73y7pvKXIM8ZvHDJctZ0rBQUMAhyY7nOaO
	 ebJwyLW9pl2rckM3tNZldS26sgLaqWqxR027VmBDgcyegvWUpL8DPLRBP7g9PGJu4x
	 KIa8VoX4emSrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB20B410FD;
	Thu, 25 Jun 2026 16:03:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E9BC18F
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 16:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6039D4025E
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 16:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeCZwVRR6_G5 for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 16:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B5DB40289
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B5DB40289
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 16:03:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B3F9857B2; Thu, 25 Jun 2026 16:03:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 17:55:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91d356ee7e85016e659fece19c9cd660b3cb4787
X-Git-Newrev: 8fe41d5506d1d1c7a453be9977a4ffa65d39e886
X-Patchwork-Hint: ignore
Message-Id: <20260625160306.0B3F9857B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongoose: security bump to version
 7.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8fe41d5506d1d1c7a453be9977a4ffa65d39e886
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/cesanta/mongoose/releases/tag/7.22

Fixes CVE-2026-37635.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 556a438880..1a60b0c89c 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d4ddbd12c12f223abefcc0a74417a638ae5c118d7cf10ba546553c6b0e0b5ada  mongoose-7.21.tar.gz
+sha256  87727cd2c240ff559b16e9710d44b61ba3513dbee50428bd8ee1596d7c58460a  mongoose-7.22.tar.gz
 sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 8250751eb8..207d31cdfa 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.21
+MONGOOSE_VERSION = 7.22
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
