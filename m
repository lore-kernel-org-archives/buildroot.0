Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31661C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 12:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEF7560BA8;
	Tue, 14 Dec 2021 12:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uaZCCOuKC1le; Tue, 14 Dec 2021 12:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F2D160BA6;
	Tue, 14 Dec 2021 12:33:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 660A91BF30C
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 12:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 546F98131F
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 12:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqMYw55VdCje for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 12:33:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2766580A52
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:33:17 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8CFA131E0086; Tue, 14 Dec 2021 13:33:10 +0100 (CET)
Date: Tue, 14 Dec 2021 13:33:10 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <YbiPBtumWqf2+41V@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-9-amd64 x86_64
Subject: [Buildroot] [PATCH] package/ruby: security update to 3.0.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index e3510cc97e..1208461cd0 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2021/07/07/ruby-3-0-2-released/
-sha512  0f702e2d8ca1342a9d4284dbdd234a3588e057b92566353aa7c21835cf09a3932864b2acf459a976960a1704e9befa562155d36b98b7cda8bd99526e10a374c4  ruby-3.0.2.tar.xz
+# https://www.ruby-lang.org/en/news/2021/11/24/ruby-3-0-3-released/
+sha512  bb9ea426278d5a7ac46595296f03b82d43df8b7db41045cdf85611e05e26c703c53f700494cd7cf5d4c27fa953bdc5c144317d7720812db0a6e3b6f4bc4d2e00  ruby-3.0.3.tar.xz
 # License files, Locally calculated
 sha256  274f8d7983052448e7fd691c81043465c92ee6fb7bd8ab3f20a7997862f2778e  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index b02744f0e5..7966450fd1 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 3.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
