Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07275C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 07:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9CFC41816;
	Wed, 29 Nov 2023 07:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CFC41816
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUBx_IW3uvDL; Wed, 29 Nov 2023 07:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00DD141809;
	Wed, 29 Nov 2023 07:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00DD141809
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3491BF32D
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 07:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 449EB60B4E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 07:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449EB60B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNC1bz90P2Pn for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 07:43:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3650060AD8
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 07:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3650060AD8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1928A8755E; Wed, 29 Nov 2023 07:43:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 08:37:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9222fe0fc73aadf42ea8ed2c3514b19e15e9a62
X-Git-Newrev: 127986f3eda6cc8396f8f83269d525fe13dbde1a
X-Patchwork-Hint: ignore
Message-Id: <20231129074333.1928A8755E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: security bump to 5.36.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=127986f3eda6cc8396f8f83269d525fe13dbde1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix CVE-2023-47038 - Write past buffer end via illegal user-defined Unicode property

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 2165c8c601..667b09221d 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.1.tar.xz.{md5,sha1,sha256}.txt
-md5  825f6b1d7e03b22522e0bdb992fbb728  perl-5.36.1.tar.xz
-sha1  7b766266af08a6cef0487308e80b40d5d8069df7  perl-5.36.1.tar.xz
-sha256  bd91217ea8a8c8b81f21ebbb6cefdf0d13ae532013f944cdece2cd51aef4b6a7  perl-5.36.1.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.2.tar.xz.{md5,sha1,sha256}.txt
+md5  698ae4946b28e38a729916f04cc389a3  perl-5.36.2.tar.xz
+sha1  9bd6e3f7c333e2e5f14c8650333fc29da3df2d90  perl-5.36.2.tar.xz
+sha256  19445f09ea9f6ada33297010d5b76ac46be565568d1a4377a6bc736cd795a128  perl-5.36.2.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4.1/perl-cross-1.4.1.hash
-sha256  3e14bb4f28c83586c668c5f9f6b4e57b138b4ec2fae0271086e29d4e352670ca  perl-cross-1.4.1.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.5.1/perl-cross-1.5.1.hash
+sha256  35d859b49bab274021d8a61511fd39a70a58cb727223de5b54342898155cf5e0  perl-cross-1.5.1.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 734e8efec6..735adea01a 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 36
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.4.1
+PERL_CROSS_VERSION = 1.5.1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
