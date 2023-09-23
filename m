Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2D2CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 17:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 806D840267;
	Sat, 23 Sep 2023 17:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 806D840267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VmOBKrXfjnE; Sat, 23 Sep 2023 17:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D6B41907;
	Sat, 23 Sep 2023 17:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50D6B41907
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1491BF299
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 17:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 027C34188E
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 17:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 027C34188E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHGw6raA40Yi for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 17:33:34 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C949B40267
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 17:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C949B40267
Received: from fli4l.lan.fli4l (p54a1bfc3.dip0.t-ipconnect.de [84.161.191.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1482CA4C0E62;
 Sat, 23 Sep 2023 19:32:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38544)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk6Uu-0002RQ-1z;
 Sat, 23 Sep 2023 19:32:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 19:32:52 +0200
Message-Id: <20230923173252.3079114-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923173252.3079114-1-bernd@kuhls.net>
References: <20230923173252.3079114-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695490373;
 bh=hXZ3pdTZS2UEgt8zPKT6ov1rEpARHyOJDb8ED3n3Ji0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bqjU9CGNc3+FqdeSJ/pPwsmuip2HMHIGsyS7vQ18+KadS0pfMIbhlaieAy8Tv7UCe
 Q9W0SuzS3jSMhQU2AybRt2gTc2mMM2bAUGXljbAKczpzCmOOUBSgMnA4H/ZCvdxptN
 6sSUVN1GxcM4U9aBy9X4ylVNr4cwAszrjwLjr+nzslonW1dmQqmpkJbudRIUrWbO3b
 UNCaRgefeeHHVPtsMp0ejRmkOb4NMCPbc+uEHYTGE655ZkUjQxlbOjPKS9dnI1LAHn
 PO36hfWuODGmLhiOngQvOUItLMJq+cgm5cJwSSMuFzgvwrZc4Wie0cN8kQf84mvCVE
 W3fb4SCpVz7vQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=bqjU9CGN
Subject: [Buildroot] [PATCH 4/4] package/linux-headers: drop 6.4.x option
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 6.4.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index daf83dda4a..ca80279212 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_KERNEL_HEADERS_6_4
+	bool "kernel headers version 6.4.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.4.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
 	bool "google-material-design-icons removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 858e615a12..bdd27eb600 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  8cf10379f7df8ea731e09bff3d0827414e4b643dd41dc99d0af339669646ef95  linux-6.5.5.tar.xz
-sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
 sha256  a87e241ec15d53452c4efe219713a3769d88cc436b5b98cf6efb262c4aff15c0  linux-6.1.55.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  ef845e7934897b88e4448378ea9daacac19e07f156fe904844fab0a7d8ff5ddd  linux-5.15.133.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ee4e953bf0..d1023a15e6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -49,10 +49,6 @@ config BR2_KERNEL_HEADERS_6_1
 	bool "Linux 6.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1
 
-config BR2_KERNEL_HEADERS_6_4
-	bool "Linux 6.4.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
-
 config BR2_KERNEL_HEADERS_6_5
 	bool "Linux 6.5.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
@@ -414,7 +410,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.197"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.133"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.55"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
 	default "6.5.5"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
