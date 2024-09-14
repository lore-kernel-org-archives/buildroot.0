Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D943C021A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 19:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 293C5605A7;
	Sat, 14 Sep 2024 19:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSE-nkf8mlKO; Sat, 14 Sep 2024 19:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39FC56062C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39FC56062C;
	Sat, 14 Sep 2024 19:04:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3129C1BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15526405C1
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiSoMccz6KoM for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 19:04:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75D4F4057B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75D4F4057B
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75D4F4057B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 19:04:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pY40s8GQo0w3UpY40sCiPj; Sat, 14 Sep 2024 21:04:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 21:04:07 +0200
Message-Id: <20240914190407.3083815-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAQKp/tE0xQUYNxnrt1WY+tgEPZRA/4GKq6P4TEYiH17Uf+MzxN7n+2+CgxYvilpg92+LIa9V9ekaePA5oMU+I8RUCpKdzbj1442ehvKM2WTrOp7/UXN
 2MOKgn1rmBRBv8oUm5zjxOaCje8DOTS9SBUqlsoddzdSejKpjAMO7U3aP3nRviQcJryIRZA6nc1nPG/XUD2v6+ciGwCgZyfL/hwBGFDhsU1uAGJiOw7Uc7Qx
 NpZnElcvaJjAgS/rZKYejtEFQTybiOz+YUYwGrDHJtY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1726340648; bh=7FdWhNVk2zs7JsIxOSMWXbfkfMRdTV7sWMY97tPpL9I=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ch2l/AKhKbiR5dJ4AOIvPz0F5k/R8Kr6XTKhCnLQe1SxdgTea9OEaMGLAaCcLqZC/
 V9l9arrTsKbZ2pGXe6midFNorNQDcPZihlkw2eY9s+M/u8NSUVV9dinf8+izBmBWKd
 UvBkW8VR4whQEYGTw9WJCOAEGSQXDS/0OrbjcOIqtr1vVqGvOcTF2BCGf/GnmpqGbq
 8RvQ+6F8wCZPON8kwSQ/Vx83tInskOGxsbYyMDkk037dhoPo0Mx6IovA8pWo1x3Eru
 r/s6tPGOMiEm6kz/80u+hjcfEC+OOjBZrPB8Su54ar4vM7t3XENsEWLAfR1BoSNMjL
 7CREtkzJsLF9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Ch2l/AKh
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.7.5
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index e0cb65642d..e46cfbdf29 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/sha256sums.asc
-sha256  dce29903a58f7b774fe61191e7e6de955de0f40d9e27b0028ffcf3438c0e9480  cryptsetup-2.7.4.tar.xz
+sha256  d2be4395b8f503b0ebf4b2d81db90c35a97050a358ee21fe62a0dfb66e5d5522  cryptsetup-2.7.5.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 15cadb2840..52f79e177f 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
