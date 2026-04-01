Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E7CD35164
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 09:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B89C80710;
	Wed,  1 Apr 2026 09:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fapNdJwE7wx; Wed,  1 Apr 2026 09:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A09C980747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775036391;
	bh=XPViHPCzjfGlKnIPGzmHbUsHbnIEnwbIuiIEN1aHoGg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=shhEJnhveN9cxzJ39M6RhCJe/e1GA9C4gH0vqbSF3aErUxcca2J5SJnk7S3FV2VMt
	 fYVgONaq6RYtyWgJE0aCAI7SGAf9H75iBHHJYwtSdYlc0yWX4Le27/92xe00YI9cpN
	 RQOLuVJBeiCQNGvaviY0devI8bCbxoXe8LrQXnSYgJMzaKATy+cF2Pj5mxYoo0cfwc
	 NiBNoBzx1Q3uy91QcL5OT5/fjihLwo65C3gFhRSYXpN2EHCVe9mus2l9xVxUKP0yPr
	 LYIe8F5hdzsdNIKVHnSmpx3cu69EPg1vqLYco4aO7brcDWS5F3f/wolTzNhpI7Jye6
	 UG2mQLWerf2TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A09C980747;
	Wed,  1 Apr 2026 09:39:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3753E4
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9AFF80710
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ln4ytgBKHj3r for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 09:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF16806CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CF16806CF
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70E567FE2B; Wed,  1 Apr 2026 09:39:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Apr 2026 11:38:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f51f58eed2bfc01ddd78d9ce95a91b3e3a404ff
X-Git-Newrev: d6900606188dec4c100a648715d8c702e74dd7cd
X-Patchwork-Hint: ignore
Message-Id: <20260401093949.70E567FE2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: security bump to version
 5.42.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6900606188dec4c100a648715d8c702e74dd7cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

fix CVE 2026-4176 : contains a vulnerable version of Compress::Raw::Zlib

For release notes, see:
https://perldoc.perl.org/5.42.2/perl5422delta

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 14 +++++++-------
 package/perl/perl.mk   |  5 +++--
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 3aefdd05b6..d88de6c425 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.0.tar.xz.{md5,sha1,sha256}.txt
-md5  7a6950a9f12d01eb96a9d2ed2f4e0072  perl-5.42.0.tar.xz
-sha1  3b557f28dcb412b115d9628c37fc94b2fda08384  perl-5.42.0.tar.xz
-sha256  73cf6cc1ea2b2b1c110a18c14bbbc73a362073003893ffcedc26d22ebdbdd0c3  perl-5.42.0.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.2.tar.xz.{md5,sha1,sha256}.txt
+md5  be6e70b71ec6589fc090f7303c5b3056  perl-5.42.2.tar.xz
+sha1  dc36549204ec31680e1c7c0acb37fad0de83a339  perl-5.42.2.tar.xz
+sha256  0a585eeb9e363c0f80482ddb3571625250c2c86aeb408853e8ea50805cfb14bb  perl-5.42.2.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
-sha256  cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.4/perl-cross-1.6.4.hash
+sha256  b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7  perl-cross-1.6.4.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  8979e6dd61852041643c5c5c40ea63b2bd1b438a67d114e62cbaef808c514315  Copying
-sha256  189e9d6ac7743ed4e832f14c9edb6f782c92d8868b447fa2684f7fe5a81465c1  README
+sha256  16381bf5fe73ad96ed26449b52eb4a85b2a32a49763c8a788d43af80f3add548  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index c31a368b70..c96eb44135 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 42
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.6.3
+PERL_CROSS_VERSION = 1.6.4
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
@@ -28,6 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+	mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs/perl5-5.42.2
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
