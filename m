Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77C6EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 19:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74029405E7;
	Sat,  8 Jul 2023 19:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74029405E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p5M3HxjM_jcW; Sat,  8 Jul 2023 19:42:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2428405F4;
	Sat,  8 Jul 2023 19:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2428405F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 485271BF2B9
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F06B405CF
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F06B405CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ch2Gd_f3bkvO for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 19:42:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04EE5405AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04EE5405AE
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 19:42:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EEA1DA4C0DA4;
 Sat,  8 Jul 2023 21:41:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43470)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIDoT-0005KE-2P;
 Sat, 08 Jul 2023 21:41:49 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 21:41:44 +0200
Message-Id: <20230708194149.3441129-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688845309;
 bh=T7zDv8qkBuoNYRyUHUXwNnrrkpTY2BaVMCEuI3g15Ns=;
 h=From:To:Cc:Subject:Date:From;
 b=DfPfb//O4tneuh6/NbIhVrKo8kay6gIs563vxmEwYzOWKojC9raZ/WBn9HGZ1MZ3e
 xRYYqGfmJMyPhq2WyxUWy5ATDC5knqXPEcU7bRQ4QGKq8l2tAgW7GAVwUDrU518cGV
 ZBocR5VHt6kSV+edTtDZ8QEnCLwO8Fa9WLb/W90+ZViba1sI47R1Y5dHKCI8qDQ0X+
 DgIMSDOuZaeSLdoGJ2Hrqzb99QEp51FYHWoTLznBZqrTMWQweLCxKN/T9AsF+EMza3
 zQVwVV1lGmMbqEKkGSkna+bpEEISvVZT830hg2ZhJPAhaORZ3xplLDnXCziQjYFikb
 mb6kY7Za/M9pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=DfPfb//O
Subject: [Buildroot] [PATCH 1/6] package/perl-html-parser: bump version to
 3.81
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed md5 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-html-parser/perl-html-parser.hash | 3 +--
 package/perl-html-parser/perl-html-parser.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index ccd115d6c9..fbdffa03d6 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,6 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  8e7151d08f30457a2ba80020b936285f  HTML-Parser-3.80.tar.gz
-sha256  63411db03016747e37c2636db11b05f8cc71608ef5bff36d04ddb0dc92f7835b  HTML-Parser-3.80.tar.gz
+sha256  c0910a5c8f92f8817edd06ccfd224ba1c2ebe8c10f551f032587a1fc83d62ff2  HTML-Parser-3.81.tar.gz
 
 # computed by scancpan
 sha256  9081922eb873ec1809c20672a7385a65f3c6b1163166bf69b2bbe986fb5b0159  LICENSE
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 1e1f8e6050..50efaa273a 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.80
+PERL_HTML_PARSER_VERSION = 3.81
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
