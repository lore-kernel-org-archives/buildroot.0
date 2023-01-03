Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E562EC4708E
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 19:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F53B817AC;
	Tue,  3 Jan 2023 19:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F53B817AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lv649OR5Ww-l; Tue,  3 Jan 2023 19:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C836181570;
	Tue,  3 Jan 2023 19:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C836181570
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32F7E1BF834
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E1C66079B
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E1C66079B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMOByjyVPU_c for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 19:37:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D331605DB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D331605DB
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 19:37:06 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.231.8])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1583513F89D;
 Tue,  3 Jan 2023 20:37:01 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 20:36:46 +0100
Message-Id: <20230103193649.7488-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103193649.7488-1-ju.o@free.fr>
References: <20230103193649.7488-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672774623;
 bh=YRPcnhPT3LenqbBgJgec5w/jHsLziZXNiVJIt84BAco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NrDRKsrwO3TjE02u1K+pdNuAr83ooFF1yc1mtrxx4tv39dJt0U8ATyknfo7ZzAvPv
 +oIN/pkoUmvQ0liMn9ulT21LkRndArbzIRVIndGngzsXgXXh8LIip++Vj8+SllUaQ9
 P5VBccfqbG3pY7O+Ly96JIG0k11KakyABNfq3ereYS/stnMcU8Xa7o0+72bA+MdmCG
 WrbTNieuCaOM2kfu5RgmC13YKuxCkFkoJULPpdpv+dGeE9gK57jQLwwx7m0Tj93YI8
 zuTAyT+S3U40hZO+hKMujUEhPxs77n91ff+I3jyS2ZY8mieR0cujUUQJvLGXeJA7iT
 MOzdvO0xZnEPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NrDRKsrw
Subject: [Buildroot] [PATCH 2/5] package/libksba: security bump to version
 1.6.3
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-47629

See also:
https://gnupg.org/blog/20221017-pepe-left-the-ksba.html

For changelog see:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=log;h=libksba-1.6.3

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libksba/libksba.hash | 2 +-
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 77485c0cb6..5c6c5eda7a 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971  libksba-1.6.2.tar.bz2
+sha256  3f72c68db30971ebbf14367527719423f0a4d5f8103fc9f4a1c01a9fa440de5c  libksba-1.6.3.tar.bz2
 
 # Hash for license files:
 sha256  8f1b87e551d97b2b23b6d3403a5d598c63ea89824cb8ee351f631f6cab2beaa5  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 727a836cf4..b7c0508df8 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.2
+LIBKSBA_VERSION = 1.6.3
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
