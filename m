Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA37AC5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B09A3608EE;
	Fri, 14 Aug 2026 13:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ALAN1bkEnoS; Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3A2A608D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713689;
	bh=EJgc0YUbTWxOf/WTYqN8RDF8U06oo8Zk4N7q2Qs5HlE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kov+zvUj5qfxDatJX4Ntw+3doEzvAXS6AyWjRKujpgaN+Lu0CmICNf5cDWEBViLt7
	 aaQie6b/Vnq96gL9DICoXR51WLaXdenUsX4Jn9F3UN5xNlPLTPfFNkmSBESoM0bZ+b
	 521ObvlMQvSnZDWu6j6gb7AIFzSPO3rMhfWpiusulo73eDR8bIdGKARwrpj6aZ3a4x
	 OunygRtKNRt4WiIQINiVNHuJGiDSv3pVk5xcPxVQFkRXOa1lx1/lm3zLyLr1Bxv+09
	 tId374W/bZJk/lWV+IyQA0PLmhtcxW/TrnWCCmXadJnlMeLG8OYQMTC86Yxzv5qV6c
	 shL1DvsBc+5CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3A2A608D6;
	Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D5F4139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3387A8123C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDRGiwB95jVD for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A3F80E3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37A3F80E3E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B3E38D66D; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 09:04:27 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 039fa2334fedf03234c556d986b7fa4bf91f6c35
X-Git-Newrev: d3e0161b9afb6a4eee18a55085502b1eaf294897
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.3B3E38D66D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/perl: security
 bump to version 5.42.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3e0161b9afb6a4eee18a55085502b1eaf294897
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

fix CVE-2026-8376 - Buffer overflow in Perl_study_chunk
fix CVE-2026-57432 - Buffer overflow in S_measure_struct
fix CVE-2026-13221 - Regex trie 16-bit field overflow

For release notes, see:
https://perldoc.perl.org/5.42.3/perl5423delta

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e3ff7a6f0204a2ec92a0666485c9f4f5d0d066bf)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/perl/perl.hash | 8 ++++----
 package/perl/perl.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index d88de6c425..7649ec47c9 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.2.tar.xz.{md5,sha1,sha256}.txt
-md5  be6e70b71ec6589fc090f7303c5b3056  perl-5.42.2.tar.xz
-sha1  dc36549204ec31680e1c7c0acb37fad0de83a339  perl-5.42.2.tar.xz
-sha256  0a585eeb9e363c0f80482ddb3571625250c2c86aeb408853e8ea50805cfb14bb  perl-5.42.2.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.3.tar.xz.{md5,sha1,sha256}.txt
+md5  fb96e6cf064bf374e84ef232b0eda5c1  perl-5.42.3.tar.xz
+sha1  1d878802a55eacc778bb1d84b1f1b8ab9b22cc96  perl-5.42.3.tar.xz
+sha256  c9387e1473a1866935cb047ece7c2e0a80767a3acdecb79d4a375f8a95970ddc  perl-5.42.3.tar.xz
 
 # Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.4/perl-cross-1.6.4.hash
 sha256  b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7  perl-cross-1.6.4.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index c96eb44135..912445ccc8 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 42
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -28,7 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-	mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs/perl5-5.42.2
+	mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs/perl5-5.42.3
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
