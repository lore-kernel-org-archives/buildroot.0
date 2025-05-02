Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46A5C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 246EA41521;
	Fri,  2 May 2025 11:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1nFp_2cd7o4; Fri,  2 May 2025 11:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F924161A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F924161A;
	Fri,  2 May 2025 11:12:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 148DF22D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 780E541A34
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4ix5PHA6jbM for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E88E4173D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E88E4173D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C86C860E9; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:10:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 48eae4808e28cfe8b75076431d9ffb7ce2375913
X-Git-Newrev: bc9846e598f64514bb99077e2f6eb2ea0409e66d
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.6C86C860E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/perl: security
 bump to version 5.40.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc9846e598f64514bb99077e2f6eb2ea0409e66d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

fix CVE-2024-56406: A heap buffer overflow vulnerability

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: fix check-package error in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 164c84ee9b820f5b21e79b4d52c07a613925d3f2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 04ebf83b33..d581054bb5 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.1.tar.xz.{md5,sha1,sha256}.txt
-md5  bab3547a5cdf2302ee0396419d74a42e  perl-5.40.1.tar.xz
-sha1  4ffe5246c791df884363aed05ba81ba41cb02084  perl-5.40.1.tar.xz
-sha256  dfa20c2eef2b4af133525610bbb65dd13777ecf998c9c5b1ccf0d308e732ee3f  perl-5.40.1.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.2.tar.xz.{md5,sha1,sha256}.txt
+md5  9ad7a269dc4053cdbeecd4fde444291b  perl-5.40.2.tar.xz
+sha1  661fe9ee085ca0aec8ddd65e055bee922af12663  perl-5.40.2.tar.xz
+sha256  0551c717458e703ef7972307ab19385edfa231198d88998df74e12226abf563b  perl-5.40.2.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.1/perl-cross-1.6.1.hash
-sha256  b5f4b4457bbd7be37adac8ee423beedbcdba8963a85f79770f5e701dabc5550f  perl-cross-1.6.1.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.2/perl-cross-1.6.2.hash
+sha256  131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d  perl-cross-1.6.2.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 37b9fe185d..34abb734d6 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.6.1
+PERL_CROSS_VERSION = 1.6.2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
