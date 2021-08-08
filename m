Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45D5C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5CC60EBB
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F5CC60EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 115A182CC7;
	Sun,  8 Aug 2021 19:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bU5fx37Aur76; Sun,  8 Aug 2021 19:38:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 411AB82DDE;
	Sun,  8 Aug 2021 19:38:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 146601BF97E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 033934012D
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPSuuVJI3j7S for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:36:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07476400AE
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:36:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B139C8D2A0; Sun,  8 Aug 2021 19:35:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:35:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca92d31cff4281c968e505fc588c5a480e7f5843
X-Git-Newrev: c91e82b25f8d8f2eb7985ed2acf9d5577b5f892a
X-Patchwork-Hint: ignore
Message-Id: <20210808193556.B139C8D2A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: security bump to version
 3.0.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c91e82b25f8d8f2eb7985ed2acf9d5577b5f892a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP
- CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP
- CVE-2021-31799: A command injection vulnerability in RDoc

For more details, see the announcement:
https://www.ruby-lang.org/en/news/2021/07/07/ruby-3-0-2-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index b79596e57a..e3510cc97e 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/
-sha512  97d2e883656060846b304368d9d836e2f3ef39859c36171c9398a0573818e4ed75bfd7460f901a9553f7f53518c505327a66e74f83704a881469f5ac61fe13d7  ruby-3.0.1.tar.xz
+# https://www.ruby-lang.org/en/news/2021/07/07/ruby-3-0-2-released/
+sha512  0f702e2d8ca1342a9d4284dbdd234a3588e057b92566353aa7c21835cf09a3932864b2acf459a976960a1704e9befa562155d36b98b7cda8bd99526e10a374c4  ruby-3.0.2.tar.xz
 # License files, Locally calculated
 sha256  274f8d7983052448e7fd691c81043465c92ee6fb7bd8ab3f20a7997862f2778e  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a71ca3a8a2..7e0266c6df 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
-RUBY_VERSION_EXT = 3.0.1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION_EXT = 3.0.2
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
