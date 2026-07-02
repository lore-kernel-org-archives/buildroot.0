Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE97AC43602
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 16:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC8A54145B;
	Thu,  2 Jul 2026 16:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNT2MB7cADrW; Thu,  2 Jul 2026 16:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664C441430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783011287;
	bh=izxHbWGPgojlWbmMyUHiXeXQeqbMKfI3kKXJnUa2U1Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cGP7zadoPCnxj2NAWbyUqcL695lF6UvcxEF4UyWdpfp1hdntPDRpkP5VUZCDBCBCa
	 cbHU+UcYBvYEbh+VXT8CA22y/yeLrdCFqwTdiL2tyElkblF+0uLPjRNsn7VXbNdEDF
	 7L2n90jls7zvyFnDhCEYJo6nQKaKhjViZMw2TRaaawkjPkQqPE7PDXB6NhXko9ieHU
	 a7ylRgcMXyQTrdGhCSROQcqtkEJd0F1MgcJaAYjmM3/V8q3252jVO6pWKLSRS0BP7j
	 paQUJQYiVHLHVBYNY4ZYZ2547v/l3zpDYj62Hxu+fuohaQer1k72tXbiR+hz+tCsNX
	 16MysBrmZlruA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664C441430;
	Thu,  2 Jul 2026 16:54:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D576047E
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBCDC404B4
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGjA58QR0Baa for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 16:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 097764005E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 097764005E
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:54:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0804A881D9; Thu,  2 Jul 2026 16:54:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 18:52:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f48325de69ddaed921572edad875694a8154419
X-Git-Newrev: 515b3b3eeba3dacea944f0ebaf516248f44906f0
X-Patchwork-Hint: ignore
Message-Id: <20260702165415.0804A881D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: security bump to 4.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/515b3b3eeba3dacea944f0ebaf516248f44906f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See changes here:
https://github.com/ruby/ruby/releases/tag/v4.0.5
https://github.com/ruby/ruby/releases/tag/v4.0.4

Security fix for:
CVE-2026-46727: Use-after-free in pthread-based getaddrinfo timeout handler

See here for details:
https://www.ruby-lang.org/en/news/2026/05/20/getaddrinfo-cve-2026-46727/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
