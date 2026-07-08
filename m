Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EF1C44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA94810EC;
	Fri, 10 Jul 2026 13:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1efrgZzm0tR; Fri, 10 Jul 2026 13:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C736B810EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691107;
	bh=6eQYQsmJSwxOTtSMJWPFustwo/OehSAN8q49I7+JVmA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y/sOKkcZU+Wwe25CJOtTIWDS9PDkgdJ9hWkTT/reTnCb8wEuAYQyk7roXWNdfUJsm
	 dnszYafV4iKP54q4Ow5TUwQ78YvlYdOcrVfDON/QDZCOPdK15FdKeS5mDXWMZ8oGY4
	 +4YMo40DXHcbWY8Jfx86v22vRU1J46655kGolu5vzNvUDjftiPFLQ4RZTM9ZKWwUuL
	 LdnOc0xvNRr5FO6G1H8m9iTAMYUfIRSYsMDq7DC84LOD//mkQL0OI9D7WRC5IjMiCq
	 OwopDSFIuTYEHnsLN5uneMD2wgjtovA6tBBYlzHB7YJrajG941ityySXpEiYSZPbK9
	 ocA9mZe5z2GMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C736B810EF;
	Fri, 10 Jul 2026 13:45:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CBCF2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B05D40A6B
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8J9lcYzx7xF for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8E7240A23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8E7240A23
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D16748867A; Fri, 10 Jul 2026 13:44:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:29:44 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d10430adb6d016ab17b17c45d55c96387d7649f9
X-Git-Newrev: 17d604e3e4df79628f97559ad099051a69e95ea6
X-Patchwork-Hint: ignore
Message-Id: <20260710134415.D16748867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/ruby: security
 bump to 4.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17d604e3e4df79628f97559ad099051a69e95ea6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

See changes here:
https://github.com/ruby/ruby/releases/tag/v4.0.5
https://github.com/ruby/ruby/releases/tag/v4.0.4

Security fix for:
CVE-2026-46727: Use-after-free in pthread-based getaddrinfo timeout handler

See here for details:
https://www.ruby-lang.org/en/news/2026/05/20/getaddrinfo-cve-2026-46727/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 515b3b3eeba3dacea944f0ebaf516248f44906f0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ruby/ruby.hash | 6 +++---
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 7512d1153b..453c028d22 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,6 +1,6 @@
-# https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/
-sha256  22cf6005d25bbe496b5ebe9224d63a1aaabfbfe02591bb5d612517c5a7836f29  ruby-4.0.3.tar.xz
-sha512  5816fb264ce76df59f4bfe0cadceb45025fada2e61f2c14024d6b03f63d304820cddf94afcf82a4951fd12f3b0d9148683f856f3f2245d56042fc8407b6cbff5  ruby-4.0.3.tar.xz
+# https://www.ruby-lang.org/en/news/2026/05/20/ruby-4-0-5-released/
+sha256  5dc5521ea54c726e6cc10b1b5a0f4004b27b482e61c04c99aed79315e30895e5  ruby-4.0.5.tar.xz
+sha512  379d78a6d1af0455df60da46551f43438ad3ee81f83787554fc34cb1c8febb1bd363e3dc1a057b34a69f96526efc308d3dccc4b87d368897c2d1ccf179096463  ruby-4.0.5.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 7e6f6d8146..eae9db2156 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
 RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
