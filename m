Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757E9CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A24A6131D;
	Thu,  9 Oct 2025 10:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cu8RbbAESQvi; Thu,  9 Oct 2025 10:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E85E6125B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E85E6125B;
	Thu,  9 Oct 2025 10:06:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 116E09DA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EAE2611FA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbhjVQ6bhBGn for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 234D1611FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 234D1611FF
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20E1186D26; Thu,  9 Oct 2025 10:06:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:44:48 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: e7e74b8390f5ace16f6b2b7b668ac56a03e754bc
X-Git-Newrev: ad3c7c8855c34669a5fc74019cba0ae94a6dbf75
X-Patchwork-Hint: ignore
Message-Id: <20251009100624.20E1186D26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/ruby: update to
 3.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad3c7c8855c34669a5fc74019cba0ae94a6dbf75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

See here for changes:
https://github.com/ruby/ruby/releases/tag/v3_4_4
https://github.com/ruby/ruby/releases/tag/v3_4_5
https://github.com/ruby/ruby/releases/tag/v3_4_6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 38d49568da243b11620a58cb55420a9746653eef)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index ec17b092a4..90faed4c32 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2025/04/14/ruby-3-4-3-released/
-sha512  b30aad675cdcc1bdfe9e5fffe9d1925db3b3ac854a5e34180c368bc6e66f73e29ba5d802fea249353b7d799c01384c58bdd763fd1b679303158baa7824b9c08e  ruby-3.4.3.tar.xz
+# https://www.ruby-lang.org/en/news/2025/09/16/ruby-3-4-6-released/
+sha512  29000b3396ab95fc2dc13d2d78441ff5c34258e5421115181c54b1b4d55d5c0d4f3d0c3cec6b32b9a1bb8de5c51b383fcad4369ec3fb244fd0ce182afbe79ba4  ruby-3.4.6.tar.xz
 
 # License files, Locally calculated
 sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index b06a728799..ffe42968b5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
