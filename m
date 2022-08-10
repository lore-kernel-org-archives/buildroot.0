Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD0DC25B07
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 15:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5099B824F4;
	Wed, 10 Aug 2022 15:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5099B824F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31N51APFXSm9; Wed, 10 Aug 2022 15:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67BAE8271D;
	Wed, 10 Aug 2022 15:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67BAE8271D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3A51BF488
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0E7A40C39
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0E7A40C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TCwkB12a6y5a for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 15:04:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15CC640C2D
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 15:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15CC640C2D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D1E8987075; Wed, 10 Aug 2022 14:49:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 17:03:29 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 412433539d737b4c70b33fd034b2b52be69fff9d
X-Git-Newrev: b17de2459cdf7cf6c02ff21dd67a1750ad50094d
X-Patchwork-Hint: ignore
Message-Id: <20220810144947.D1E8987075@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/perl: bump
 perl-cross to version 1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b17de2459cdf7cf6c02ff21dd67a1750ad50094d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This bump will fix the following static build failure with berkeleydb
thanks to
https://github.com/arsv/perl-cross/commit/31dac3e264a7f1f53dbf49570771123ebd514055:

/nvmedata/autobuild/instance-6/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: lib/auto/DB_File/DB_File.a(DB_File.o): in function `ParseOpenInfo':
DB_File.c:(.text+0x7d30): undefined reference to `db_create'

Fixes:
 - http://autobuild.buildroot.org/results/e01a042185b2221bee815bb9096c4419eeb6e558

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0425b12daf0d95abd4d5309426bc4af915a626b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 4 ++--
 package/perl/perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index d8344d9754..9ec2b42e34 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -3,8 +3,8 @@ md5  7d2ece7f50775ea1ff739831935a24bd  perl-5.34.1.tar.xz
 sha1  e7dbef3c1ea7caa73e2c705bba9e4bfb92ea98f0  perl-5.34.1.tar.xz
 sha256  6d52cf833ff1af27bb5e986870a2c30cec73c044b41e3458cd991f94374039f7  perl-5.34.1.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.7/perl-cross-1.3.7.hash
-sha256  77f13ca84a63025053852331b72d4046c1f90ded98bd45ccedea738621907335  perl-cross-1.3.7.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4/perl-cross-1.4.hash
+sha256  be9d9f9f7148edff7a2f9695ba3cb7e3975eff6b25a9a81dd311725fd757aa91  perl-cross-1.4.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 392fb8b6e2..27acfaeff2 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.7
+PERL_CROSS_VERSION = 1.4
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
