Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2E4D597A4
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 21:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F1B8605E4;
	Tue, 12 Nov 2024 21:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcgbdkEG34cI; Tue, 12 Nov 2024 21:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36CA660659
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CA660659;
	Tue, 12 Nov 2024 21:05:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26362DB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 21:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0552140270
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 21:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cic3cIt5_m3m for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 21:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B70B4026C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B70B4026C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B70B4026C
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 21:05:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5B397B005AA;
 Tue, 12 Nov 2024 22:05:44 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Steve Kenton <skenton@ou.edu>,
	Julien Olivain <ju.o@free.fr>
Date: Tue, 12 Nov 2024 22:05:31 +0100
Message-ID: <20241112210531.14735-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731445546;
 bh=6oxO4wSUebiKE2wMSnEGEP2xDYThg4bXBd+U41tn60Q=;
 h=From:To:Cc:Subject:Date:From;
 b=LZ0Lib0TtQt4Y6AB5k9uZn6USxN+eKav0f6wNlaZmRHXOeLk/oXRcXemBMA19C42U
 KpOnHZjtN85roWGW5CskT8LkESR/EyLlTzE8dDbzL/IEQ80tYaSGM53uP5IepGqt1x
 GaDMyxe5+ylQ9rkwatjphaTNZtbi3LLprRydhHeiOapX6q2JnVm7OH9W3fMZSgKuTv
 uv0Bo8RcN9vsE0JvKoCZFdEqRgtDhN6hCO7R5dC2g0HRSEpaNOq8szbgT1FvHqHuyq
 rPAOOCsX5aEKWkoWnenuSzRgmZkAsMqoMo/sNyHzgVyJsR+T3dzp5QPYDwtU3+tjuT
 i8yWFxBl93Y9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LZ0Lib0T
Subject: [Buildroot] [PATCH 1/1] package/memtest86: bump version to 7.20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 6.20, see:
https://github.com/memtest86plus/memtest86plus/releases/tag/v7.20
https://github.com/memtest86plus/memtest86plus/releases/tag/v7.00

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested by running the built memtest.efi on a real x86_64 pc.
---
 package/memtest86/memtest86.hash | 2 +-
 package/memtest86/memtest86.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
index 695e6a234b..20d96dce95 100644
--- a/package/memtest86/memtest86.hash
+++ b/package/memtest86/memtest86.hash
@@ -1,3 +1,3 @@
 # locally computed using sha256sum
-sha256  463b2db66128e45c96be76136272e2ee940f1319804b1b88cc2ef04edccd01d8  memtest86-6.20.tar.gz
+sha256  8bad4b5788bc28e4dd1db78c9069bd0c65a4a6baf16409ab537c795bb04578b3  memtest86-7.20.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index c0f85755fe..4f9c1b9a28 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTEST86_VERSION = 6.20
+MEMTEST86_VERSION = 7.20
 MEMTEST86_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86_VERSION))
 MEMTEST86_LICENSE = GPL-2.0
 MEMTEST86_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
