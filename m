Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52891CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B33E41CA2;
	Mon,  4 May 2026 14:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PSn6_NLUAWl; Mon,  4 May 2026 14:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B0F141CAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906130;
	bh=9kkEdmiiGVzmMzE8YF6TUZmtD9xfOr+mBoRGLwNrg2E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JnTvdcT8DMItLykMkiRJES4i7U39x718FspmN+0DcxOheiXRzO1+FufW6MRZw9xmQ
	 7UESq7L92aKmpUs0YWPPaNPVhl7Gt0HhAcuYQ732I8XiBnMngA7l2h0fk5HE856vnx
	 F/OP3z30mN+axDGs7ktvOFIpPV+rcWtgBaSy1j7keExfOKJivK7wH/DC+pQg88eZVx
	 PraN7EyHk6gARjFjOhhrSSwdtP6FAixtgN/067k0+bTbs08ilcBvoja4Y5/khGmyM6
	 n1RAFtYUli/wUF8wb/6W6IwzlryOR9FngwGz4fMAzpxmtdW26skQi4B5BZxcM6uOce
	 AllbM9+SruArA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0F141CAE;
	Mon,  4 May 2026 14:48:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F4CA190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28BF1846AE
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkgAr3zs9P3M for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B0DA84628
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B0DA84628
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6C4784364; Mon,  4 May 2026 14:48:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:49:49 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 66221b107d6dd064ca6064d40fb0d158363028f4
X-Git-Newrev: c83584617406dbd4904034d70d16426b8fd2dc6d
X-Patchwork-Hint: ignore
Message-Id: <20260504144838.E6C4784364@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ruby: security
 bump version to 4.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c83584617406dbd4904034d70d16426b8fd2dc6d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/

Added sha512 tarball hash provided by upstream.

Fixes CVE-2026-41316:
https://www.ruby-lang.org/en/news/2026/04/21/erb-cve-2026-41316/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 92746d0dea25125bbda6359dcbeb2f90b192eeef)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
