Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FF6C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 04:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AF0440106;
	Tue, 21 May 2024 04:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkG_C6G8-oHm; Tue, 21 May 2024 04:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B16940125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B16940125;
	Tue, 21 May 2024 04:48:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CCFA1C4F27
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 206A840350
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUQCtQKZwnYU for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 04:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3575140106
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3575140106
 for <buildroot@buildroot.org>; Tue, 21 May 2024 04:47:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9C378746D; Tue, 21 May 2024 04:47:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 06:47:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c617ebbc977d28c5c0ebc7d3bdfa3888f432640c
X-Git-Newrev: a9207e8ccd0812ed6bff01220a5df680bd1007e5
X-Patchwork-Hint: ignore
Message-Id: <20240521044757.C9C378746D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: security bump to version
 3.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9207e8ccd0812ed6bff01220a5df680bd1007e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release includes security fixes:
 - CVE-2024-27282: Arbitrary memory address read vulnerability with
   Regex search
 - CVE-2024-27281: RCE vulnerability with .rdoc_options in RDoc
 - CVE-2024-27280: Buffer overread vulnerability in StringIO

https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-3-1-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index c729c59453..4ac6200bca 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/
-sha512  7959c5753bfa0bfc4d6d74060869aabbe9815c1c97930659da11b917ee0803ddbbd80e869e00c48b8694b4ba48709c3b6493fd045568e36e902616c35ababf01  ruby-3.3.0.tar.xz
+# https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-3-1-released/
+sha512  c58e9be9b5ab48191fbf7d67e13f0ec42ee71ed338170e0f7b246708e9cfc617ce65098f5ce7ab32d4305e785642d3e44253462104d5b9c4abcb1a4113f48347  ruby-3.3.1.tar.xz
 
 # License files, Locally calculated
 sha256  e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 00fa0e0f65..fcc637c5ea 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
 RUBY_VERSION_EXT = 3.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
