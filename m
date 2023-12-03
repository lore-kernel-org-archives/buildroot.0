Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC06C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0439A409F0;
	Sun,  3 Dec 2023 16:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0439A409F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwMJxKXIrQ-C; Sun,  3 Dec 2023 16:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FD4409A2;
	Sun,  3 Dec 2023 16:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36FD4409A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 642B11BF8C7
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BA2F409A2
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA2F409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YN8aObLsXcp2 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C97540873
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C97540873
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D42E98770B; Sun,  3 Dec 2023 16:26:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 15:38:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38c4aa2826ce31bd77140a55b5dca78eb28e53a5
X-Git-Newrev: bc7b0e1002ed393c6ffb784aa245cbaa40569106
X-Patchwork-Hint: ignore
Message-Id: <20231203162609.D42E98770B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: security bump to version
 5.36.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc7b0e1002ed393c6ffb784aa245cbaa40569106
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix CVE-2023-47038 - Write past buffer end via illegal user-defined Unicode property

note: 5.36.2 was a broken release
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 667b09221d..983b921e27 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.2.tar.xz.{md5,sha1,sha256}.txt
-md5  698ae4946b28e38a729916f04cc389a3  perl-5.36.2.tar.xz
-sha1  9bd6e3f7c333e2e5f14c8650333fc29da3df2d90  perl-5.36.2.tar.xz
-sha256  19445f09ea9f6ada33297010d5b76ac46be565568d1a4377a6bc736cd795a128  perl-5.36.2.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.3.tar.xz.{md5,sha1,sha256}.txt
+md5  17946060e6279cf32d08edc92c40efc3  perl-5.36.3.tar.xz
+sha1  9949e79c92171b39f4fb2b19ffd4ea293b8dd589  perl-5.36.3.tar.xz
+sha256  45a228daef66d02fdccc820e71f87e40d8e3df1fc4431f8d4580ec08033866bd  perl-5.36.3.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.5.1/perl-cross-1.5.1.hash
-sha256  35d859b49bab274021d8a61511fd39a70a58cb727223de5b54342898155cf5e0  perl-cross-1.5.1.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.5.2/perl-cross-1.5.2.hash
+sha256  584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90  perl-cross-1.5.2.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 735adea01a..71aef9997b 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 36
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.5.1
+PERL_CROSS_VERSION = 1.5.2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
