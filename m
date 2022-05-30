Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE277C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C8E7831C1;
	Mon, 30 May 2022 20:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCrebttVJME2; Mon, 30 May 2022 20:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF85381A6A;
	Mon, 30 May 2022 20:52:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C29A1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 922926121B
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zr-OBHlxHVz3 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:52:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF48A60AE8
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:52:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EE98B867EF; Mon, 30 May 2022 20:41:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:40:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7564f1de067e9e3cf0aa2662cab79b9834b54ff1
X-Git-Newrev: db14515e879e550fde617e2baa24c40f4694ecb8
X-Patchwork-Hint: ignore
Message-Id: <20220530204109.EE98B867EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: security bump to version
 3.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=db14515e879e550fde617e2baa24c40f4694ecb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2022-28738: Double free in Regexp compilation
- CVE-2022-28739: Buffer overrun in String-to-Float conversion

For more details, see the announcement:
https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-1-2-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-By: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ruby/ruby.hash | 5 +++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 90e7627a97..da6221ec50 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,6 @@
-# https://www.ruby-lang.org/en/news/2021/12/25/ruby-3-1-0-released/
-sha512  a2bb6b5e62d5fa06dd9c30cf84ddcb2c27cb87fbaaffd2309a44391a6b110e1dde6b7b0d8c659b56387ee3c9b4264003f3532d5a374123a7c187ebba9293f320  ruby-3.1.0.tar.xz
+# https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-1-2-released/
+sha512  4a74e9efc6ea4b3eff4fec7534eb1fff4794d021531defc2e9937e53c6668db8ecdc0fff2bc23d5e6602d0df344a2caa85b31c5414309541e3d5313ec82b6e21  ruby-3.1.2.tar.xz
+
 # License files, Locally calculated
 sha256  794c384f94396ab07e3e6f53a9f8be093facb7eb4193266024302b93b29e12dc  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4f3b94f83b..cbdfa4b826 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
 RUBY_VERSION_EXT = 3.1.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
