Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B42CE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 16:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 462866084C;
	Sat, 28 Dec 2024 16:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Of63uUqUJSzr; Sat, 28 Dec 2024 16:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9332960845
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9332960845;
	Sat, 28 Dec 2024 16:23:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DDE17C8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 16:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7BC160845
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 16:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dy5BOi9rGoX for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 16:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5FB8605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5FB8605A9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5FB8605A9
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 16:23:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E22D71BF206;
 Sat, 28 Dec 2024 16:23:15 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2024 17:23:14 +0100
Message-ID: <20241228162315.3156194-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735402996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Ze2lqxGELTznEshskhGB4gIVsIYIK0YD+o0bP8RfuU=;
 b=JyWKetQIUXgTJ9IVTVhhr0ppCoFZ498UR9xdSXE+bHSUEBh5Tf171pfXMp/PfBPYsKITiW
 sDaLBi62At/9Zbbd+CZD7BPh5SEV/gWAbJapypnUvXgyNVhILtdtJgGa0LPEcnHaFytnv8
 BIflos9pclChb74FQn5nr13FPfTlF+90ywmkUm33jE210M8jlsEebgbGT05DoctXqodukg
 Hw4evONFrO2xqppz53YQd7yZ6y8zzqVvfqPOSL8Ra8pAU7yxGag6RWv5glZWcAhYwHa9Mm
 TPAN+fyXGuWZdJfJzgs1qm4HcLsDt10p9vU45LhCAN48TPAh/2Of9WghbrBXvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JyWKetQI
Subject: [Buildroot] [PATCH] package/tinifier: bump version to 4.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

3.4.0 -> 3.5.0:

Changed

    Go version updated from 1.17.3 up to 1.18.0

3.5.0 -> 4.0.0:

Changed

    Go version updated from 1.18 up to 1.19
    Sub-command quota now supports multiple keys at once
    Default threads count for compress sub-command is now NumCPU * 6
    Go package (module) name changed to github.com/tarampampam/tinifier/v4
    New terminal UI

Added

    .env file support
    Global --version flag
    --update-mod-date flag for compress sub-command (since this release, the original file modification date will be preserved by default)
    --keep-original-file flag for compress sub-command #103

Removed

    Sub-command version (you can use --version flag instead)
    Global --debug flag
    Global --verbose flag

4.0.0 -> 4.1.0:

Changed

    Go dependencies updated
    Go version updated from 1.19 up to 1.20
    Module name changed from github.com/tarampampam/tinifier/v4 to gh.tarampamp.am/tinifier/v4

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinifier/tinifier.hash | 2 +-
 package/tinifier/tinifier.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinifier/tinifier.hash b/package/tinifier/tinifier.hash
index c43e77b88f..f22203cac6 100644
--- a/package/tinifier/tinifier.hash
+++ b/package/tinifier/tinifier.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a56fd648cdc86f82837fedfd3e1a9ecc5750f15be24630ea1533d64fc6d1c2bb  tinifier-3.4.0-go2.tar.gz
+sha256  42e5ad67a1533c009f655d8c66dbdbf5e6fe3b9934293586534b55143d1a542e  tinifier-4.1.0-go2.tar.gz
 sha256  18f524914c0df04e21289c3d9ca3e27c10abe5869cc4e4d4790a1b2c56df282c  LICENSE
diff --git a/package/tinifier/tinifier.mk b/package/tinifier/tinifier.mk
index d7ed6f7c93..d837b5da00 100644
--- a/package/tinifier/tinifier.mk
+++ b/package/tinifier/tinifier.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINIFIER_VERSION = 3.4.0
+TINIFIER_VERSION = 4.1.0
 TINIFIER_SITE = $(call github,tarampampam,tinifier,v$(TINIFIER_VERSION))
 TINIFIER_LICENSE = MIT
 TINIFIER_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
