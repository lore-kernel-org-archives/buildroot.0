Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37249C0218C
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF3C184723;
	Sat, 14 Sep 2024 09:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBI9CVzYo2bQ; Sat, 14 Sep 2024 09:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CC71846FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC71846FF;
	Sat, 14 Sep 2024 09:29:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC7461BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B85B34034B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFZ_bjdlbseK for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99C7D40179
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99C7D40179
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85E2981191; Sat, 14 Sep 2024 09:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:28:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d90c669777ebe48eb9ea180e962a8adffc031f91
X-Git-Newrev: 8bb08e7f43a76cce0e9e69f353cc1b77c3b6f6e5
X-Patchwork-Hint: ignore
Message-Id: <20240914092913.85E2981191@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-uri: bump to version 5.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bb08e7f43a76cce0e9e69f353cc1b77c3b6f6e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-uri/Config.in     | 1 +
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/Config.in b/package/perl-uri/Config.in
index 3f51c517f3..a09f30178d 100644
--- a/package/perl-uri/Config.in
+++ b/package/perl-uri/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_URI
 	bool "perl-uri"
+	select BR2_PACKAGE_PERL_MIME_BASE32 # runtime
 	help
 	  Uniform Resource Identifiers (absolute and relative).
 
diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index c10a829e98..fb70f0c266 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  9b45e7635f0968deabe377fc4c99a8b5  URI-5.21.tar.gz
-sha256  96265860cd61bde16e8415dcfbf108056de162caa0ac37f81eb695c9d2e0ab77  URI-5.21.tar.gz
+md5  34cf48b69c4fbcc40cfebac94af39424  URI-5.29.tar.gz
+sha256  a34b9f626c3ff1e20c0d4a23ec5c8b7ae1de1fb674ecefed7e46791388137372  URI-5.29.tar.gz
 
 # computed by scancpan
 sha256  a1730c55839ce3c9182c92e3387ba8f683ad6ab8b4a3257553a20c4db194c2cf  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index aa0c1ed8b5..d02a729dc2 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.21
+PERL_URI_VERSION = 5.29
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
