Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65344CA0FE1
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 12:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CB0B404C3;
	Fri, 30 Aug 2024 12:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExuDA6CJH6yn; Fri, 30 Aug 2024 12:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C0A4114E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33C0A4114E;
	Fri, 30 Aug 2024 12:24:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63EE41BF98E
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DE6B42431
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZ9ERWj3HVTU for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 12:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 397414242A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 397414242A
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 12:24:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 265AD82248; Fri, 30 Aug 2024 12:24:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 14:24:14 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 842401fca0cd2c4dc6865da553a8141ac9968284
X-Git-Newrev: a9d61f75875423014f796a668ffd144ad6e1fab7
X-Patchwork-Hint: ignore
Message-Id: <20240830122447.265AD82248@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ruby: update to
 3.3.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a9d61f75875423014f796a668ffd144ad6e1fab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 89c9c131fe96235768bdb68fd67a3fc3626b8a39)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 4ac6200bca..3831e701fb 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-3-1-released/
-sha512  c58e9be9b5ab48191fbf7d67e13f0ec42ee71ed338170e0f7b246708e9cfc617ce65098f5ce7ab32d4305e785642d3e44253462104d5b9c4abcb1a4113f48347  ruby-3.3.1.tar.xz
+# https://www.ruby-lang.org/en/news/2024/07/09/ruby-3-3-4-released/
+sha512  b26461a13ff82a08a282f10108028bb2a2e4a28da6182a291062fc54089c6655d79c22cc69d59156f9b11cb10a17fe8c69d489343fbae123a45f03361b95c9eb  ruby-3.3.4.tar.xz
 
 # License files, Locally calculated
 sha256  e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index fcc637c5ea..08ecbf5941 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
 RUBY_VERSION_EXT = 3.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
