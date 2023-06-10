Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D64C7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 17:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D15EE40A6C;
	Sat, 10 Jun 2023 17:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D15EE40A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBOP3pfSwRbS; Sat, 10 Jun 2023 17:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C2C240217;
	Sat, 10 Jun 2023 17:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C2C240217
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D22E01BF32B
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B874C60F9D
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B874C60F9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jtAKBgjUCZkG for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 17:20:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B250D60F94
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B250D60F94
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 17:20:45 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout12.t-online.de (Postfix) with SMTP id D08E311A89
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 19:20:42 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd72.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q82GY-1IJefB0; Sat, 10 Jun 2023 19:20:42 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36390)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q82GY-00083y-0N
 for buildroot@buildroot.org; Sat, 10 Jun 2023 19:20:42 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 19:20:42 +0200
Message-Id: <20230610172042.1096872-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686417642-5BFF457F-901E97A2/0/0 CLEAN NORMAL
X-TOI-MSGID: 11839d96-87aa-4814-8f3a-1f92a89597ea
Subject: [Buildroot] [PATCH 1/1] package/pngquant: bump version to 2.18.0
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

Bump this package to the latest release of the package written in C.
Version 3.x are written in Rust: https://pngquant.org/rust.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pngquant/pngquant.hash | 2 +-
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index a7ea4aa997..2926dfb6de 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,4 +1,4 @@
 # From https://pngquant.org/releases.html
-sha256  a27cf0e64db499ccb3ddae9b36036e881f78293e46ec27a9e7a86a3802fcda66  pngquant-2.17.0-src.tar.gz
+sha256  e72194b52b36f040deaec49a1ddd5dcd8d4feecc3a5fe6c5e9589a9707b233d4  pngquant-2.18.0-src.tar.gz
 # Locally computed
 sha256  e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 87537aa18e..8ef3216007 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.17.0
+PNGQUANT_VERSION = 2.18.0
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
