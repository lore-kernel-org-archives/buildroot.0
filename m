Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7A7D185D6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5038482425;
	Thu,  8 Jan 2026 11:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oP80VkSf2xaC; Thu,  8 Jan 2026 11:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 715EF82948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870041;
	bh=w6lHzOfJiR2mx6OcQJ9E9ZPmkkjGs1+P9WB1SwE9nsc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rV+a4DH2h0jXtf2m5DS/5KlzUPwTZI2kgF0o6d8ypVfbivPUwQIOOl2kJACJO7vC2
	 KFmcr39Iojid70d9Gu3uRtxXkTy1SwT/W2YBJTBF0zCh2y9gul6HUJLJFsFXVLG9kA
	 RZc4H/V7vsSurlcBlgRTjxmt5CoCC2JReu5pBatOoaXuqw1ZEZ7OYMj3wkgC+X1m8Q
	 HTkJ3jOfIkEOsjNk+p+i/oiS3t6W3p08GDdrQOMr0ntCYQYW/sUU3VMYHr/ukUMsrv
	 +4HDS3E8EmvpS4z9zdwgI1XN+Mm1vcyTvcxMckPZaL7GVWD2oiWDoMTgvOm4hjIO0y
	 /oqfAX5aOvfXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 715EF82948;
	Thu,  8 Jan 2026 11:00:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADA6B237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18F0B40087
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcRsO7ud43SC for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5303740689
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5303740689
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 513DA883B6; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:35:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9659afcd7956f7eca87219c89ae43fcb57ee8761
X-Git-Newrev: aa66f3dfd0f0afdd0d7d0ac214a0a054dbaedca6
X-Patchwork-Hint: ignore
Message-Id: <20260108110024.513DA883B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-type-tiny: bump to version
 2.010001
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa66f3dfd0f0afdd0d7d0ac214a0a054dbaedca6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: update copyright years
    see https://metacpan.org/release/TOBYINK/Type-Tiny-2.010001/diff/TOBYINK/Type-Tiny-2.006000#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-type-tiny/perl-type-tiny.hash | 6 +++---
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 5c97fbf964..9c4e1431e1 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  afc902c6b56ab6320492cd09c689a940  Type-Tiny-2.006000.tar.gz
-sha256  4c685ebbba5145dc02944c305e8e82759811032a55e6da270a751b63b76500ea  Type-Tiny-2.006000.tar.gz
+md5  d2b1edaf0e2ba8a0e17dc5e0eadd92c1  Type-Tiny-2.010001.tar.gz
+sha256  cd583e4983039f35052d490f0c4439124ba667d4f09c4e3aec47de5200f9921a  Type-Tiny-2.010001.tar.gz
 
 # computed by scancpan
-sha256  80067f577fa565f34f833e302cac68ea1435f3863885540f94071ccd6d5e900d  LICENSE
+sha256  ca1cc40b3da7bebb1b0368764650ad38ac603b31a25fbc5b6f9fb217cc6fa1e8  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index a4c9cd2672..b7077fb998 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 2.006000
+PERL_TYPE_TINY_VERSION = 2.010001
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
