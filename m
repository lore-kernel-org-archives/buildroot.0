Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B577DCFD314
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 11:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72FCE605D4;
	Sun, 14 Dec 2025 11:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIFxElyFKqXs; Sun, 14 Dec 2025 11:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59087606C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765711396;
	bh=s132WgR0MysaCQiOsSjXJ42sphv8hDfB7tpOWRrN1v0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K13x0K2+kDXNPCEOxMailJ0s4R4ROhQGGrzsm4fOC+NpyQzvPBmMxtprINpeYmW2Y
	 qOQhr+TzhOCYwC03VXqxy/L95WU+b7GBX0OQuomlUWNujT6ca2xn+e1s0CkZPmHdKF
	 VOEkh45xtcMsgYatAQwB3WM75DhfHjoK2hRq8geBH68RUxHV1JzOZZtaKwfOxumycc
	 nCXG5+UClNsd5lNm13EuBxmFN8rkPBfCepSqV1odmzQjlnrI03/+wUqhNP5i28nGpa
	 MftlhjC3G2TGoLuhYXz5SlrdlW3N2n+iI1d+b8nmk4ZwPwqtcEqZBuvU5J028e9GrT
	 kQFfpO12XbWag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59087606C9;
	Sun, 14 Dec 2025 11:23:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F01A62C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6B878143C
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIWE0WjaWXHA for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 11:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2A0C8131D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2A0C8131D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:23:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E9CD86DE5; Sun, 14 Dec 2025 11:23:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 11:56:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d39ec850916d17b28ccba614f0ef5d03a2878042
X-Git-Newrev: 61f5e2efcae5ece840a561ad56cdec04dad3a25d
X-Patchwork-Hint: ignore
Message-Id: <20251214112313.8E9CD86DE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: security bump to version
 5.40.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=61f5e2efcae5ece840a561ad56cdec04dad3a25d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes CVE-2025-40909:
Perl threads have a working directory race condition where file
operations may target unintended paths.

For release notes, see:
https://perldoc.perl.org/5.40.3/perl5403delta

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-40909

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to cve.org]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  5 +++--
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index d581054bb5..0035c448c5 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.2.tar.xz.{md5,sha1,sha256}.txt
-md5  9ad7a269dc4053cdbeecd4fde444291b  perl-5.40.2.tar.xz
-sha1  661fe9ee085ca0aec8ddd65e055bee922af12663  perl-5.40.2.tar.xz
-sha256  0551c717458e703ef7972307ab19385edfa231198d88998df74e12226abf563b  perl-5.40.2.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.3.tar.xz.{md5,sha1,sha256}.txt
+md5  f526a5975a7cc6f53f28326437b1eb39  perl-5.40.3.tar.xz
+sha1  7c95250ceff00d649c1f5afa511987a2c4da61d3  perl-5.40.3.tar.xz
+sha256  65f63b4763ab6cb9bb3d5731dd10369e1705be3c59be9847d453eb60b349ab43  perl-5.40.3.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.2/perl-cross-1.6.2.hash
-sha256  131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d  perl-cross-1.6.2.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
+sha256  cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 34abb734d6..a301b93e46 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.6.2
+PERL_CROSS_VERSION = 1.6.3
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
@@ -28,6 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+	mv $(@D)/cnf/diffs/perl5-5.40.2 $(@D)/cnf/diffs/perl5-5.40.3
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
