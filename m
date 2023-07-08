Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1902EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 19:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 748AE409E1;
	Sat,  8 Jul 2023 19:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 748AE409E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tnyr47mIZQGQ; Sat,  8 Jul 2023 19:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A01B7405B3;
	Sat,  8 Jul 2023 19:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A01B7405B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 875DE1BF2B9
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FDAC81F04
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FDAC81F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6j2QUVIbknRG for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 19:42:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BB1881E76
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BB1881E76
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 19:42:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21E81A4C0EF6;
 Sat,  8 Jul 2023 21:41:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43470)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIDoT-0005KE-2w;
 Sat, 08 Jul 2023 21:41:49 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 21:41:46 +0200
Message-Id: <20230708194149.3441129-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708194149.3441129-1-bernd@kuhls.net>
References: <20230708194149.3441129-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688845311;
 bh=q/IgfaIX8CtWnY9bbOIjaN2e4fg1ep8jHBC7qPbMAvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XL+NwEYbBHvmeae/3iPOlZDzM43bF7NZEVPTjwh5WJjjSBbM+72ZDEJNYQN5jA1IW
 hzZBoEp4X9P/2iPBhvQZ9S3p/ifK7Z4cgvCGsXR3sTn18mfpDVl01n04ZX6/JmIqe5
 GcBqTRwAuz4yHegzmAJeLSqD3rVY7Z5ZykZNF6nEuMNSm/3QKWTBZ9S9yZbtMDjnij
 7QsGYQ4wA6BeMkdpJZi+ZpimWlAIFFYF+TnZbR+bSU+qlz37aySdJvI2RRz76hpP5W
 +gE23m7VIU2jm+LOC+oapuKEZ/KyIWm/Pk95B6z9hakTKJSfchMpd7hZHfur61qW5b
 5JYiCRrqGZoZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=XL+NwEYb
Subject: [Buildroot] [PATCH 3/6] package/perl-mail-dkim: bump version to
 1.20230630
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
 package/perl-mail-dkim/perl-mail-dkim.hash | 3 +--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index 6edeaa9d8b..5b0e77294d 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,6 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  5a0dec58f0c2526521b2952a3c126906  Mail-DKIM-1.20220520.tar.gz
-sha256  8ac4b8c84bbfad00a3d24bf676493d207dd3cd4a735efabb9e17181534f23646  Mail-DKIM-1.20220520.tar.gz
+sha256  0fa09a93a00f43ac91017a91628265ae7d47deb507e2770532bbb2597550d3d4  Mail-DKIM-1.20230630.tar.gz
 
 # computed by scancpan
 sha256  ffaa40feb768566e52d93879fedd2c5483828b6de483874f30a0a4425351555f  LICENSE
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index f3383a02bf..4f4d86ee10 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 1.20220520
+PERL_MAIL_DKIM_VERSION = 1.20230630
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
