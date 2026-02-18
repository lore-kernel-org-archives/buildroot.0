Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26D9E9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 21:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 958E0816D8;
	Wed, 18 Feb 2026 21:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9lc2dSczzH7; Wed, 18 Feb 2026 21:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22944816D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771451012;
	bh=rqWrBBbLOrP/ASnJ3nH/UzFcskh4L05eZwwgChbAKoA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qHnYBru5yI9+0zgzZZUYWokKmzvlOQfWY0CPhMDC5hoQkFfBF8rk4MKEwKYQg1GoX
	 y+qnPXd00NifagDTJMy0rbI+Zplqpuc97nioe2jZnmiImbb1uZRuv1NtKZ4Tc7OCnk
	 V5WlVASEnaycpgkeTP4k28tYaMQV0dwuy9dy/bIlPwhfj1uAJqkXbanKG7/bQdBIML
	 tKWk80LlD0JfP0B6W2HU2P9gt+JfpdMeMZmY9goxXTXjjlgnY9od0rEpnKX+M2fW4I
	 r0ZfaZpuTRRuIHQRCkBtVcCP8nZqaBU7TkTrabVUGvXl4muw0/d0vz2CZ5KScUTfVp
	 6Ls48PDbLPCxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22944816D3;
	Wed, 18 Feb 2026 21:43:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78C8D183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 21:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A24D403B2
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 21:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgh6m3ef54yl for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 21:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92CDF4035B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92CDF4035B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 21:43:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D92386FFD; Wed, 18 Feb 2026 21:43:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 22:27:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06b964b362b1b30cc346145c38e2a4aad78d0eec
X-Git-Newrev: 127f36b406e80a6e5f773ce6e588a5ba9e5b3974
X-Patchwork-Hint: ignore
Message-Id: <20260218214330.7D92386FFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: bump to version 4.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/127f36b406e80a6e5f773ce6e588a5ba9e5b3974
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release announce:
https://www.ruby-lang.org/en/news/2026/01/13/ruby-4-0-1-released/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add link to release announce]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 95d968e8e2..bd64f97339 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released/
-sha256  a72bacee9de07283ebc19baa4ac243b193129f21aa4e168c7186fb1fe7d07fe1  ruby-4.0.0.tar.xz
+# https://www.ruby-lang.org/en/news/2026/01/13/ruby-4-0-1-released/
+sha256  0531fe57dfdb56bf591620d2450642ea0e0964f3512a6ebee7dc9305de69395f  ruby-4.0.1.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 76ad9cc73f..a9668e36f1 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
-RUBY_VERSION_EXT = 4.0.0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION_EXT = 4.0.1
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
