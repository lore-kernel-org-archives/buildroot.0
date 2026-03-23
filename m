Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A8EF483F3
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F6FD60838;
	Mon, 23 Mar 2026 20:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzJfBOKu1XRJ; Mon, 23 Mar 2026 20:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15ED36082E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774296556;
	bh=u1D8uG/DbqStxXsrhUPuD6TL2J7zL8LwajK6JdVHxys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TYYuve/ZMXGXPkaIeuZXVWiFFxU/OHvmkwKryuFsTmMRTOZZf9c/lVCsAVzAMqAMl
	 8hoHdioiGPOhSKWxK3oOG7SkZ7jmfBEi3Mgr9wrwyxuIQYyLFptA2dqVJVbPH383Qw
	 CdMWiFDwQ73DIwW0TGDWSzWCFjGk+FwKbuYY1Da8UQmNCDrp8GjpXiDsUyJtEJxSLU
	 3aUIOaGm7n0APdcCKiZi4qD2cJwcgc+opmwfvqW6zBcRaK22Dj6439L1kR1PbpW7Op
	 nRQzsc8+tnFOYg1gWGpq1fUg090cwM0l2dyhfqrNpgP5GSLEwyfJfnSIPWdaQYew7s
	 l/tNEPMb3rjvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15ED36082E;
	Mon, 23 Mar 2026 20:09:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0309353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C010D820E1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3lPG5355cc8 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 083A0820A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 083A0820A9
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:09:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 367B484A80; Mon, 23 Mar 2026 20:09:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 21:01:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83386ecb9c45daa73fc768894a2eb01de51fcccf
X-Git-Newrev: 8937414d68240e66d6345a946b2916bf62fcfe4b
X-Patchwork-Hint: ignore
Message-Id: <20260323200913.367B484A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: bump to 4.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8937414d68240e66d6345a946b2916bf62fcfe4b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for news in the release:
https://www.ruby-lang.org/en/news/2026/03/16/ruby-4-0-2-released/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
