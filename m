Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E93CD343B
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 775AA846C6;
	Mon,  4 May 2026 14:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulHRaSoMGpe3; Mon,  4 May 2026 14:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F7E2846C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906122;
	bh=KA857OIh7EBiB+Aa0c2WOYcsTTtVAExIDaxXeHOQ3e0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UiN2r0ihIiq0rKYfxOoB2kN02JADDhm07n9IJUzUgFqhR0lHQ/S/msdtH0xq6lYZz
	 POKIZtpZ77sGnhDhGNf2WkoP1VOO6vZOVd9sacg6i/ENB0djRvLw0pjElCFSi2D6lq
	 3ef5Xq08flhQC5UKQUqfgAuAZp+UFebkj6+kAbxHB8axsGrdCI+z2VBNNeWKPxBNmx
	 spb05WYbIcyYIyDDOHPFOVjAMaOQZPudQGHExLMeCcLVZpmlrK+MaiBOgtt2UoNk1P
	 pevhNq3OOTi30cHouUTjqYfxmBhimMN+QBcEJMqyFQd5/P2isr8w0fuvXnEzzmcJpY
	 WpfjJ4W8FTvWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F7E2846C3;
	Mon,  4 May 2026 14:48:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB8CE190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D183F846B4
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3I3tQgzwi9Nq for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07B8F845EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07B8F845EA
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3D847FB24; Mon,  4 May 2026 14:48:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:49:43 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d9e4d86cb0afdaa1598f30c658b85776e4c1c63e
X-Git-Newrev: 66221b107d6dd064ca6064d40fb0d158363028f4
X-Patchwork-Hint: ignore
Message-Id: <20260504144838.D3D847FB24@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ruby: bump to
 4.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66221b107d6dd064ca6064d40fb0d158363028f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

See here for news in the release:
https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8937414d68240e66d6345a946b2916bf62fcfe4b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index bd64f97339..9908fe8d4f 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2026/01/13/ruby-4-0-1-released/
-sha256  0531fe57dfdb56bf591620d2450642ea0e0964f3512a6ebee7dc9305de69395f  ruby-4.0.1.tar.xz
+# https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/
+sha256  4618db85bb9ec04d8152d0099db488694a3d3c4f52106625e4ad547f1318db87  ruby-4.0.2.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 5e8b40a556..6bd8ad43c5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
 RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
