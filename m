Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F703E77374
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB37C81E9B;
	Sat, 30 Sep 2023 14:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB37C81E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJMwXbY8Fz-m; Sat, 30 Sep 2023 14:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 991B781F03;
	Sat, 30 Sep 2023 14:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 991B781F03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 086471BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E407F83DBE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E407F83DBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWmSRbBaZ48W for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:24:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E35DF82331
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E35DF82331
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFCDF83B07; Sat, 30 Sep 2023 14:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:24:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1308d2ec36493208e9bad97e76c15d43c16ed6b
X-Git-Newrev: 317a77b854394fe08dc66ea54d2585cb68347f47
X-Patchwork-Hint: ignore
Message-Id: <20230930142416.CFCDF83B07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-lwp-protocol-https: bump to
 version 6.11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=317a77b854394fe08dc66ea54d2585cb68347f47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: switch to Perl Artistic
see https://metacpan.org/release/OALDERS/LWP-Protocol-https-6.11/diff/OALDERS/LWP-Protocol-https-6.10#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-lwp-protocol-https/Config.in                    | 1 -
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash | 8 ++++----
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/perl-lwp-protocol-https/Config.in b/package/perl-lwp-protocol-https/Config.in
index 9793b6f5d0..fa429a2ce0 100644
--- a/package/perl-lwp-protocol-https/Config.in
+++ b/package/perl-lwp-protocol-https/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PERL_LWP_PROTOCOL_HTTPS
 	bool "perl-lwp-protocol-https"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_IO_SOCKET_SSL # runtime
-	select BR2_PACKAGE_PERL_MOZILLA_CA # runtime
 	select BR2_PACKAGE_PERL_NET_HTTP # runtime
 	select BR2_PACKAGE_PERL_LIBWWW_PERL # runtime
 	help
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
index a3c011fe84..7304a4cb34 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  cf64e4bc57a9266ac4343cdf0808c5c8  LWP-Protocol-https-6.10.tar.gz
-sha256  cecfc31fe2d4fc854cac47fce13d3a502e8fdfe60c5bc1c09535743185f2a86c  LWP-Protocol-https-6.10.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  6615a250c8963a2333ea6d0fbbec306b  LWP-Protocol-https-6.11.tar.gz
+sha256  0132ddbf03661565ca85050f2a5094fb9263cbbc3ccb1a4d9c41ac9bb083b917  LWP-Protocol-https-6.11.tar.gz
 
 # computed by scancpan
-sha256  294e73f9bd40ea600e9478cd57489a7da72558a83c6a66f37a82e4e0d5a706d9  LICENSE
+sha256  e4def55436b2bd99fe2cdbf546a72ad5958327e28831db9b5adb497c6bd580ba  LICENSE
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index 0663820b2e..960de52f0b 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.10
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.11
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
-PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic or GPL-1.0+
+PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_LWP_PROTOCOL_HTTPS_LICENSE_FILES = LICENSE
 PERL_LWP_PROTOCOL_HTTPS_DISTNAME = LWP-Protocol-https
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
