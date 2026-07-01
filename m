Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85805C43602
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 19:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D0E1418F1;
	Wed,  1 Jul 2026 19:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4YggM9zZUeY; Wed,  1 Jul 2026 19:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92D0410BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782935983;
	bh=6ZWDfHff98A8S4EAq9JF1uzLH5nLLh4nvP4pmkaGs9Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eVzEcBBVFJmXn8k59UuaIM4BrTqKz45edT+TsaqO/fjaEnBs4tGbceK/1QplNCtIv
	 hVUtD88O4Dkeg3PBpK0vMsUncwja1Yt9acQxC+Tvf7VhoS5SOXQo5rHCH/uv1LIzCN
	 Ob+WUCfoMxDnjW+LXw+Lc8j2JYWJwbQW+rMRLn8fDuHtKn8NS4BEpLrdp11rtmB2D6
	 RgkjpZhve4wGPUeqsWMRNqZWHB/Ta+uD+0ZGDP9AUk9KvSPcpt1n7J/X3GI84AWQ4s
	 VFUdS1SAtJqTxVK0cjAZ9SoByCiGtzwdIuC8IbcYyh47fflxSfIAyFB4LnUKzmcpa3
	 KVYGnvfCNRqCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92D0410BD;
	Wed,  1 Jul 2026 19:59:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78E744B5
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ECDF82D75
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mm83Ys9b0jIw for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 19:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 375A982CD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 375A982CD4
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:59:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 990B987A6A; Wed,  1 Jul 2026 19:59:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 21:57:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c69f28ae5c31cf0a69ce184be1d0279cda4242eb
X-Git-Newrev: 6bb532a100139d3189ed180945e165e3a941efb8
X-Patchwork-Hint: ignore
Message-Id: <20260701195911.990B987A6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: security bump to
 v7.1.2-26
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6bb532a100139d3189ed180945e165e3a941efb8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the changelog:

- https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-24---2026-05-26
- https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-25---2026-06-04
- https://github.com/ImageMagick/ImageMagick/compare/7.1.2-25...7.1.2-26

The bump to the v7.1.2-25 fixes the following vulnerabilities:

- CVE-2026-53465
- CVE-2026-53464
- CVE-2026-53463
- CVE-2026-53462
- CVE-2026-53461
- CVE-2026-53460

The bump to the v7.1.2-24 fixes the following vulnerabilities:

- CVE-2026-49219
- CVE-2026-49218
- CVE-2026-48994
- CVE-2026-48734
- CVE-2026-48733
- CVE-2026-48724

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index fa46fc7cde..2330507566 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f129f7d87fc21da453d032dd291b80ea13faf2497f13ef8279d97759ed7d5c46  imagemagick-7.1.2-23.tar.gz
+sha256  d63594e334e1c410f600fb9370d78d49e4dc6f315722ca4ba083e864e5c354cb  imagemagick-7.1.2-26.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index e08f0a803c..1cae5c83fa 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-23
+IMAGEMAGICK_VERSION = 7.1.2-26
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
