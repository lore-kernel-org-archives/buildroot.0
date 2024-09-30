Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18135CDD1A9
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 19:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D623D402C1;
	Mon, 30 Sep 2024 19:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIWJ1D3wiFg4; Mon, 30 Sep 2024 19:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99978402C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99978402C2;
	Mon, 30 Sep 2024 19:37:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC531BF4E5
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 19:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3986F402C2
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 19:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWNqN-FzAc5N for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 19:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3114402C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3114402C1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3114402C1
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 19:37:56 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F2D4FB00565;
 Mon, 30 Sep 2024 21:37:52 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 21:37:43 +0200
Message-ID: <20240930193743.50889-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727725075;
 bh=Weh3vzAZQeZLczmXvqA4IUHkdAJbUHy4OAWd3YTMXmE=;
 h=From:To:Cc:Subject:Date:From;
 b=lFAIeZ5F5DRm1Tbcpb11TtMaHTrFBymLqD9VTjNQEBM84Ui8yt3VMdV7EDXt8Pznp
 EgiYj2iwgehEo/pNdPU5NAD9rxOiTLcv940BKRoErRa7ouYK5VDmJn92HPaSV0sO/i
 S6E8EJ9EHx2XnMB/cGOWOcu5Ql/u327DE/pGcTN/+PGr3NQRFd9MBgD5jIOPkzMbns
 WegxRYISiX1DFtmEZWOQvKuBZ+gtFR/iDQQoZtFsHkaRZD2Lf8Gn4s7IWKEDzEDQ5c
 iPWRqQwlrl2TmMlwC8ocFJJj4bs+BaVh54eXetbYBcj1fvWBp+gy0RyzrZoIxPfwPu
 NI+nATHsx6ZYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lFAIeZ5F
Subject: [Buildroot] [PATCH 1/1] package/liblinear: change homepage url to
 use https
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package homepage http url redirects to https. This commit updates
this url to directly use https.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liblinear/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
index cabcba05ad..8c112678cc 100644
--- a/package/liblinear/Config.in
+++ b/package/liblinear/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBLINEAR
 	  liblinear is a linear classifier for data with millions of
 	  instances and features.
 
-	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
+	  https://www.csie.ntu.edu.tw/~cjlin/liblinear/
 
 comment "liblinear needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
