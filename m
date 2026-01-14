Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E225D3CC87
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 22:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452AE40D3A;
	Wed, 14 Jan 2026 22:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuJo98f7Ws1A; Wed, 14 Jan 2026 22:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB0E40D24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768429549;
	bh=Irtrc3LP4CwwWdvKdOA+7kxH2Tksb9OEUcE+jeCzBbA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lpBhH1oVdA/liIR4mGZF1Y/u3JriYjb/7KhwxZ6e3akpbSRAxGXESpsSOfbYmgr2o
	 LvYqwDpFZn2CfpSDG7lxior9278cu9GIrmCI13jarly+QEaHn4IM+BwNGlHA7ye9GN
	 xAPCa+/RBUHcE8PIeuPXuwnJHTO3NVvXOtj2uzKbuIt1xz34i5nwIOla/WGS82iNHA
	 eJNLNcn91EwbUW1H4mCv8QOSJtI3DZtGAz+knAxuWhg2wkigd4qi/En5lswHKG8c+v
	 IKvgSEr02RMOvFco8RBg0zn8DupWpwBW3/FXfubjY5PtLGm6DU9gfNjY63+n9/zVvS
	 FwbAFxAglj9ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB0E40D24;
	Wed, 14 Jan 2026 22:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09CB41C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 22:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED05E405CC
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 22:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taibZrMTy1QA for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 22:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 262824016C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 262824016C
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 22:25:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FB4387CCD; Wed, 14 Jan 2026 22:25:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 21:49:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e382cea6a086ffbe9b14476a264c010228f6afe
X-Git-Newrev: f594f86f9d6f6a3b8dcd03d486b0c30a1381e7bd
X-Patchwork-Hint: ignore
Message-Id: <20260114222545.1FB4387CCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: bump to 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f594f86f9d6f6a3b8dcd03d486b0c30a1381e7bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for a Changelog:
https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released

License files were updated. Apache and Boost License were added.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: update link in hash file comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ruby/ruby.hash | 8 ++++----
 package/ruby/ruby.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 90faed4c32..95d968e8e2 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,7 +1,7 @@
-# https://www.ruby-lang.org/en/news/2025/09/16/ruby-3-4-6-released/
-sha512  29000b3396ab95fc2dc13d2d78441ff5c34258e5421115181c54b1b4d55d5c0d4f3d0c3cec6b32b9a1bb8de5c51b383fcad4369ec3fb244fd0ce182afbe79ba4  ruby-3.4.6.tar.xz
+# https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released/
+sha256  a72bacee9de07283ebc19baa4ac243b193129f21aa4e168c7186fb1fe7d07fe1  ruby-4.0.0.tar.xz
 
 # License files, Locally calculated
-sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
-sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
+sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
+sha256  4ebe48076b3ee165fbb9350aa8a9552f8043c8ed8a7edca2089133d33c1ea45f  COPYING
 sha256  36a9a6e7347214bbba599a412617204e65bff065dcbe5c46f5cb454c80de9eb0  BSDL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index ffe42968b5..76ad9cc73f 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
-RUBY_VERSION_EXT = 3.4.0
+RUBY_VERSION_MAJOR = 4.0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
