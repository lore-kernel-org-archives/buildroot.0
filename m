Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CABD185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3813960E03;
	Thu,  8 Jan 2026 11:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXvGM86PqBtq; Thu,  8 Jan 2026 11:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27FBD60DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870036;
	bh=yR0MjIz66mjk+Ud2bKNmu9iLfFjEjIA5PF5xCbLqyTk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RzLxXh3stYbQfMe8K+xko1pC6ey/d87/YOM1H2orwuQGKjCueT7HRkgSClQMOFuOd
	 NylMVn/m9e6W4x1GuoEQPnJ9ExYnwsFbsTrLYvKFwQp6JeveJaU20QAMAb4T7y5Ppq
	 aeVauYS8w0dTw/DHrOACumM8ne9S/FHSyhLofl2BJjIQwgAvCo5UYB2QXzzVcvybuA
	 uWMvW/AjnzT7HZpPesjfPDLPSgrjafnuBZqpjSsZbyXNe83ZBmRwRBotumO7BJq1RH
	 ana3IFbkcOG6B+AzkEMetEumB0awrmrSG5hZSUfXoyNYBIK4mxwHF6x8RWR7YQqm+E
	 DcFoLR4CNDoVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27FBD60DE5;
	Thu,  8 Jan 2026 11:00:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63580AEB
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D81F40264
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-Ua4X0ozb4h for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 064C840581
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 064C840581
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04B6488442; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:32:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8143138f9d764b574c1f5fa51df7ddc81e8c99c4
X-Git-Newrev: 1fe37b6fb703caeb575ab2a1d9a466465288fe41
X-Patchwork-Hint: ignore
Message-Id: <20260108110024.04B6488442@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-exporter-tiny: bump to
 version 1.006003
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1fe37b6fb703caeb575ab2a1d9a466465288fe41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: update copyright years & use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/TOBYINK/Exporter-Tiny-1.006003/diff/TOBYINK/Exporter-Tiny-1.006002#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-exporter-tiny/perl-exporter-tiny.hash | 6 +++---
 package/perl-exporter-tiny/perl-exporter-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.hash b/package/perl-exporter-tiny/perl-exporter-tiny.hash
index 0e16f92b1e..5b0d50f646 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.hash
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  0545ee8f4edcb9dc5a87b21ed25edd74  Exporter-Tiny-1.006002.tar.gz
-sha256  6f295e2cbffb1dbc15bdb9dadc341671c1e0cd2bdf2d312b17526273c322638d  Exporter-Tiny-1.006002.tar.gz
+md5  a70bdc039b12f90191e7c5669b2b55f9  Exporter-Tiny-1.006003.tar.gz
+sha256  6499f09a6432cf87b133fb9580a8a9a9a6c566821346b1fdee95f7b64c0317b1  Exporter-Tiny-1.006003.tar.gz
 
 # computed by scancpan
-sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
+sha256  8e7094312357a5a73b44c1b87d32fca39e6d2f6c5a5504bcbcd0f0cf34b7c9cc  LICENSE
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index 715070623e..68f3b9eeb6 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXPORTER_TINY_VERSION = 1.006002
+PERL_EXPORTER_TINY_VERSION = 1.006003
 PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
