Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258E5D185D9
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA5448275A;
	Thu,  8 Jan 2026 11:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjGt7Tooh8aU; Thu,  8 Jan 2026 11:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B78282925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870034;
	bh=9zczbPXu2qP/LO+pyyeE3V3cbceC2hE14R0qdtb4sOk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cMlsJfbSSIgIvoJugIwzyQp3mn86iCb11YE4BxBRKVxSG5zlUfIPVJQvjQIUC+oMb
	 LACKG563hkqJaY2IsNKKzUqksLPauoe6Q0lpg5utvjK8TjFZOmIpLnJvqN7E8T+TAl
	 68X3jKJPZsI9m3Ip5FUja0DLJoGLy/Dg1Mr+F6iwJKzXvIvMkoRdvLn22nF0hIqSww
	 E5rDeLxeGD29mdQ9+jcyy05h3QKZfnRTwFeP4hi0mjNXVOi5NgdeHPWrZNXwrexY8O
	 Ccle1f10tQ8/y0eFIJv2EGi9BK9IcLz5OlyR5lvxe7kw5X2lMS1fF1I9vv1oS6V3lz
	 rycOprQphUKYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B78282925;
	Thu,  8 Jan 2026 11:00:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CD09436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1B0240087
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cz69F2GMLCQv for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0E9040264
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0E9040264
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEF3188442; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:31:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8d61c86811cf6d88d9185be4966ad245ddbc0b5
X-Git-Newrev: 23f335da435f0fdffa49bd1620fe3632b0493ac0
X-Patchwork-Hint: ignore
Message-Id: <20260108110023.DEF3188442@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-uri: bump to version 5.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=23f335da435f0fdffa49bd1620fe3632b0493ac0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index b53479803b..c1548bda3f 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  56aa2bc3efb180eceb4c143378ab4327  URI-5.32.tar.gz
-sha256  9632067d34e14e0dae2da94631c4f25a387fcc48d06fa29330e8b3c04c4e913d  URI-5.32.tar.gz
+md5  3736f3d6efe1710176a753a7029b7606  URI-5.34.tar.gz
+sha256  de64c779a212ff1821896c5ca2bb69e74767d2674cee411e777deea7a22604a8  URI-5.34.tar.gz
 
 # computed by scancpan
 sha256  a1730c55839ce3c9182c92e3387ba8f683ad6ab8b4a3257553a20c4db194c2cf  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 671d1f5a07..aab2b484ca 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.32
+PERL_URI_VERSION = 5.34
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
