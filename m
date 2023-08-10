Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8267DC001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 16:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 128D583FFA;
	Thu, 10 Aug 2023 16:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 128D583FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0crFX5jfSRp; Thu, 10 Aug 2023 16:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5066483F5F;
	Thu, 10 Aug 2023 16:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5066483F5F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EEAE1BF45A
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 16:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0592583F5F
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 16:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0592583F5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccvvXdSMAhrW for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 16:26:55 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 256C883F57
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 16:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256C883F57
Received: from fli4l.lan.fli4l (p4fd6cd7b.dip0.t-ipconnect.de [79.214.205.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EB26AA4C0CAD;
 Thu, 10 Aug 2023 18:26:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47834)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qU8Ut-0005H6-0Y;
 Thu, 10 Aug 2023 18:26:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 18:26:51 +0200
Message-Id: <20230810162651.24450-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691684811;
 bh=BykmrYhSMwXFMXtJqlYbn08Ki5OS7rhxdok/z8yu1kA=;
 h=From:To:Cc:Subject:Date:From;
 b=sn09zPtUyB0aJnWfAIctd9C2gV0YxJG+91H2GOVBmI1ekWVWfkg9axQnKjuU4CZhL
 K9odu2q3m9P3nLArho2SsDJQdaTceQEoaZRcubZxXSwdmi7u+L/8tQP1kcBfxDf0kk
 T9YywwCwWBC5OUI0aCvSyHJKG7g0Xn9ujGMtb2i8JFqdPTJXOYVTvKr7UZ5Tf34rp7
 uEwdLwMFvupr6Z2DmB4wqnzeW92Cwkzf7v3Dhp+b5nmeSZnJeuZNBL4uJDVKg8QwFQ
 NeegpEAglQkGLT16npbgDSvxGrilJKImcr2hhLYfH9G42dQQdSHAp1jMt3aNEs+E7V
 +mtfmppoVvvdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=sn09zPtU
Subject: [Buildroot] [PATCH/next 1/1] package/intel-gmmlib: bump version to
 22.3.10
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index c164c78300..9f2c8cc1fd 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  62d2f8333f1da3361952546a83dd40d1eb23d8bddacf67a160e63f565b68b5a6  intel-gmmlib-22.3.9.tar.gz
+sha256  8a6005440bf336309a2abbeeb3e006e229715c4b39ca31c6d0e510050e53dcc7  intel-gmmlib-22.3.10.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index c637b8a5b4..dddd1a13fd 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.3.9
+INTEL_GMMLIB_VERSION = 22.3.10
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
