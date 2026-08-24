Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A21C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 19:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 241F880BCD;
	Mon, 24 Aug 2026 19:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02OKbXSo5ep4; Mon, 24 Aug 2026 19:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787598928;
	bh=f9XUGDygKwlpN1RrrH373jeUGqkzZ3gvZHM11CAQI6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WFk6+eKWQbQkxs7pDN1/6qSsJP0K4UPOkWT0vHqI9qdlxO4mt+Spv+UfuYROo5yCP
	 5KWFAPjGbEYN2oKHX+b58CdN9/TAwKMUR4VfMv0woz2T0kcWL8CVVEibQe/7KPV2Ab
	 4bvFWJ1KroBJiVQ3dTSNhn/sqae9myUBnvuSAbzn088bbxneqtC2VOZb3tA6eyOll6
	 tp6q42Ql+2T1Jsx26qZqkU4oOY7qfKVknleN0mOUrixfy+TWzpFOVVmMzKHTyWMTyu
	 HJeSdVsWcHaHfQTZRJwcj+f1EILPsYC3n9D8vixteFcdGDpSBY89rT07f8WCQXJqAt
	 12f72K7x4vQzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4268580BD2;
	Mon, 24 Aug 2026 19:15:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40B91396
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D4C400A2
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jY7zY17dfFf for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 19:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DB2C400D1
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:15:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B1368FF41; Mon, 24 Aug 2026 19:14:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 21:14:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 087a15f578823206ead71b791ea4d299af96ed38
X-Git-Newrev: 7e036c739ff82bf3a5aaf5dc79b7c560e5040787
X-Patchwork-Hint: ignore
Message-Id: <20260824191430.5B1368FF41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml-parser-perl: add
 host-libxcrypt dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e036c739ff82bf3a5aaf5dc79b7c560e5040787
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

host-libxml-parser-perl compiles XS modules against the system perl
headers, which #include <crypt.h>. On build hosts without libcrypt-dev
installed, the build fails:

    .../CORE/reentr.h:126:16: fatal error: crypt.h: No such file or directory

Declaring host-libxcrypt ensures crypt.h is present in the per-package
host sysroot before the build.

This can for example be reproduced on a minimal Debian Forky system,
where libc6-dev no longer pulls libxcrypt-dev.

Signed-off-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxml-parser-perl/libxml-parser-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 06bbd3b1ad..7cc60774bd 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -7,7 +7,7 @@
 LIBXML_PARSER_PERL_VERSION = 2.47
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
-HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
+HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat host-libxcrypt
 LIBXML_PARSER_PERL_LICENSE = Artistic or GPL-1.0+
 LIBXML_PARSER_PERL_LICENSE_FILES = README
 LIBXML_PARSER_PERL_RUN_PERL = `which perl`
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
