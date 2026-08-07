Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6CEC5AC9E
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21EB281249;
	Fri,  7 Aug 2026 09:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z93sisFoGz6y; Fri,  7 Aug 2026 09:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6258123F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095242;
	bh=QA5gS/jvEUJJD4awpZrTBE0e8mf4lkTcGhAyEpP5jdE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZaZ8pAjiK2oV50eZIc8lJazWOi0GuBcd1FYR3swuIp7mCAYV1G99Ar7W/WvZNMuwo
	 98TXO+jENxNYL9NM69IEr15sy4HS6xtvlyCpVC1T8NIVfenl5om5QPOpVr9qhPEC9Z
	 WidNkkYRdFDYM8CEtoPFhNKNIEpR9S+bcJzKBCn9rAtnL9bV4wBOerjvHhhqhs1PiI
	 zCENo46QWTmmqFUuby53vayrJCkJNcCoSRtt4d4F9LlReGzhl9ReBNJBBGk8sp1H9R
	 rPkdnj8bXU5YN1mWK1ny90feYGsSI7hLnbPoWQLYvpYm1lKko6ILEX6XVpFyP80ld3
	 Jg+RSQjlTjxLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6258123F;
	Fri,  7 Aug 2026 09:34:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFF23704
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1F61409F9
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1S8YnfkONob for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CEE340A03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CEE340A03
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6FA78CA40; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ac53be9a4d67e84c7fbcf4c2ed867a8129fafa6c
X-Git-Newrev: e3ee4c8e84c8c362576866ed19951dea6f1d7861
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.B6FA78CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/perl: security
 bump to version 5.40.5
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3ee4c8e84c8c362576866ed19951dea6f1d7861
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

fix CVE-2026-8376 - Buffer overflow in Perl_study_chunk
fix CVE-2026-57432 - Buffer overflow in S_measure_struct
fix CVE-2026-13221 - Regex trie 16-bit field overflow

For release notes, see:
https://perldoc.perl.org/5.40.5/perl5405delta

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
(alternative to commit e3ff7a6f0204a2ec92a0666485c9f4f5d0d066bf)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/perl/perl.hash | 8 ++++----
 package/perl/perl.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 2fe7b5c210..7b5e0d0013 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.4.tar.xz.{md5,sha1,sha256}.txt
-md5  2e83cf578d5044444eb9e445f58cf36f  perl-5.40.4.tar.xz
-sha1  85790a2f35446a9dca6749a563117a36bf381a2e  perl-5.40.4.tar.xz
-sha256  eb0b1116b84ded552f686c9ee40c83000d8388c454f54197ca1d3a3b17246bd3  perl-5.40.4.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.5.tar.xz.{md5,sha1,sha256}.txt
+md5  980490b3ff28a22631436d29bca365bc  perl-5.40.5.tar.xz
+sha1  6a6fbf5e474db635670b02c59841a5280669392f  perl-5.40.5.tar.xz
+sha256  1fe6f825b487d26c35aa51a35f52fe494d4cfc77b8051f8b1ee3391bf0289bc6  perl-5.40.5.tar.xz
 
 # Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.4/perl-cross-1.6.4.hash
 sha256  b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7  perl-cross-1.6.4.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 41bb8d5dc1..8dbf0957de 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).4
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).5
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -28,7 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-	mv $(@D)/cnf/diffs/perl5-5.40.3 $(@D)/cnf/diffs/perl5-5.40.4
+	mv $(@D)/cnf/diffs/perl5-5.40.3 $(@D)/cnf/diffs/perl5-5.40.5
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
