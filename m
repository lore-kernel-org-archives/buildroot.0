Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30072EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 14:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD99B60B9A;
	Sat, 24 Jun 2023 14:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD99B60B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jy8rydV2AP9s; Sat, 24 Jun 2023 14:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B8F960B05;
	Sat, 24 Jun 2023 14:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B8F960B05
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D42F1BF3E0
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55017401B3
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55017401B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbkemoJ7ZyUw for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 14:18:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47BEC400E5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47BEC400E5
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 14:18:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82AAAA4C0780
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 16:18:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41054)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qD46D-0006J8-0u
 for buildroot@buildroot.org; Sat, 24 Jun 2023 16:18:49 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 16:18:47 +0200
Message-Id: <20230624141847.3243715-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230624141847.3243715-1-bernd@kuhls.net>
References: <20230624141847.3243715-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687616329;
 bh=7csEbZBi2Gzy0v6V8pml5pHCTCj1tOt23dPyXiUlojQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Z8COnkJ4TUwfWb+o1FYCZXpgZFWTyK5UF6XLh/6Nifth1caXcrzD70DNTKqsFPyR7
 A13sLe80WKtmq7OpHyvRhl94uCwHES6U0nJ70SGaECkn02LzgPXc84cUtUvuWf0CPF
 Czy6SeXeagV3p5RDTwdDyqCprmtVUQgzOJM92dhYVOQte7fiQXIBX312xM129uODG5
 hgcmwN7K6H8GXpLHtY4vzyvjTNR7Y6yUDUHBXGDrxIHDmtXLNu629kRjyEcuuNiFZ7
 KpSxnVpKV9i5FTfBRVLRU+LCyOvP/rwo1UglY6yrApJ+wcs2LHzsAdjVoBOaAtZys/
 7kUmJLOAbnhwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Z8COnkJ4
Subject: [Buildroot] [PATCH 2/2] package/samba4: update patch 0004
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

Fix typo in title, add upstream URL

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...dparty-heindal-Use-perl-module-JSON-part-of-core-i.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
index 7eb31e5d07..aa55c09891 100644
--- a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
+++ b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
@@ -1,15 +1,15 @@
 From bd8fc19c8383914b518a9d56f4c08fba3baeb967 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Sun, 7 May 2023 11:02:26 +0200
-Subject: [PATCH] 3rdparty/heindal: Use perl module JSON, part of core, instead
- of JSON:PP package
+Subject: [PATCH] 3rdparty/heimdal: Use perl module JSON:PP, part of core, instead
+ of JSON package
 
 Downloaded from
 https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: unknown
+Upstream: https://github.com/heimdal/heimdal/pull/1176
 ---
  third_party/heimdal/cf/make-proto.pl | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
