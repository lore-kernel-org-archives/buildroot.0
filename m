Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AC5F94CA7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 20:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FBE6088C;
	Tue, 21 Apr 2026 20:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vaKGGW6gVvF; Tue, 21 Apr 2026 20:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC3E960B5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776803467;
	bh=1A5JTtfDv9Y9HwilvrhbmjuKKAROr5dq4zQA5lH9iPc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d6LPvaUy92hY13xRW6ymXP5Z1qFTYobIAewfJUOOkeCjVLW2USGcWJLkMdU7yCKCq
	 By2o8UmX20+S1x587oWqsQsv5HD21+faSsJlyGSCZ8Cxm5FvV3j5f4r/tBYcroDLSS
	 a/VP+37Tc9gF/xrzRJZqStUxwOZRDYSoRGW0Y4/yn7pbnhPhzeS6Gu+G9O0qp/Ev81
	 mzc0/Doknw2CiUV2e9y3+7eXTY8CR1i456qYmba9ecJfM8yd17XjEqRKwjuDTqRjFH
	 vs01G7Up52AyM0vhL9seIb0Avu6TKplLuexnF49NKX06jr903Sf1Qo51JYO0tYlL+K
	 nrJ5PPTwJtPcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC3E960B5D;
	Tue, 21 Apr 2026 20:31:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C18FF183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B41D341FC1
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhveH4cZX2BZ for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 20:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE47541FB7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE47541FB7
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 505F08216D; Tue, 21 Apr 2026 20:31:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 22:24:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 591e28a557e5693d955013a5d9b9f3078fe47ccf
X-Git-Newrev: 92746d0dea25125bbda6359dcbeb2f90b192eeef
X-Patchwork-Hint: ignore
Message-Id: <20260421203103.505F08216D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: security bump version to
 4.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92746d0dea25125bbda6359dcbeb2f90b192eeef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/

Added sha512 tarball hash provided by upstream.

Fixes CVE-2026-41316:
https://www.ruby-lang.org/en/news/2026/04/21/erb-cve-2026-41316/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ruby/ruby.hash | 5 +++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 9908fe8d4f..7512d1153b 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,6 @@
-# https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/
-sha256  4618db85bb9ec04d8152d0099db488694a3d3c4f52106625e4ad547f1318db87  ruby-4.0.2.tar.xz
+# https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/
+sha256  22cf6005d25bbe496b5ebe9224d63a1aaabfbfe02591bb5d612517c5a7836f29  ruby-4.0.3.tar.xz
+sha512  5816fb264ce76df59f4bfe0cadceb45025fada2e61f2c14024d6b03f63d304820cddf94afcf82a4951fd12f3b0d9148683f856f3f2245d56042fc8407b6cbff5  ruby-4.0.3.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 6bd8ad43c5..7e6f6d8146 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
