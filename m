Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4070DD185CC
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC30160E23;
	Thu,  8 Jan 2026 11:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPnUwyQTJ-bF; Thu,  8 Jan 2026 11:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA6560E17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870040;
	bh=spM7ztcT7p9rymTZYFIi520Xn56YqvSBZIHEsHBW3h0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ADrXWs49024KyEKMXDGvJ+p4PMCQGWnijun2vStfYKrWq+dDHacf0BILc4sh3S1X+
	 wEUHEcZXQIgIC75pvKurYACs7b7bXmbXDFxse0S0WYo3ynSiv5Sug+98uAF+E8CADo
	 JmdfdOMz4epxE5OOZ3rVnDExNqCfk9/wbKIjsZmNybOyNJsM343IjCbarxxgoe23zv
	 jPPFv1rNX5bYj3fC2HOcngIVjAmnNHe2uWBLuxVjitbeKfQPzuB1701ud9MCq23U/Z
	 6rd6E1IrrcCQ8epJ+UO36IhHLjBQOt6/1yYrLPylhQhdbvEJfOHa/WD0EMiGhyHQXD
	 ZmmQcolQ1Y0tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FA6560E17;
	Thu,  8 Jan 2026 11:00:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8177C237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 154904089D
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zL71mvEnUm-n for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D6A840AC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D6A840AC2
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BC818834B; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:34:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0f96c4eecd36d922236d6ce0101995c4ad4f6dc
X-Git-Newrev: 5d5e93f14f9b87650e5a9a284f5d584337310462
X-Patchwork-Hint: ignore
Message-Id: <20260108110024.2BC818834B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-libwww-perl: bump to version
 6.81
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d5e93f14f9b87650e5a9a284f5d584337310462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: minor cleanup
    see https://metacpan.org/release/OALDERS/libwww-perl-6.81/diff/OALDERS/libwww-perl-6.77#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 6 +++---
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 5951c34a58..1271c656f1 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  e70e2f41a97b8d97608569d10b75b931  libwww-perl-6.77.tar.gz
-sha256  94a907d6b3ea8d966ef43deffd4fa31f5500142b4c00489bfd403860a5f060e4  libwww-perl-6.77.tar.gz
+md5  dd84e119517e07a1af261b8eb1fafe1e  libwww-perl-6.81.tar.gz
+sha256  ab30552f194e8b5ae3ac0885132fd1d4ea04c4c7fe6555765b98f01af70c1736  libwww-perl-6.81.tar.gz
 
 # computed by scancpan
-sha256  6186a79a305a0e62c5087f9737b4f66fa5793fa1b396da0126e3c8722c460245  LICENSE
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 38f68385aa..ff1cbba459 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.77
+PERL_LIBWWW_PERL_VERSION = 6.81
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
