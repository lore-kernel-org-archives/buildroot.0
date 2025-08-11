Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A64CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 22:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 453F841C2A;
	Mon, 11 Aug 2025 22:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrFFFeF7T49n; Mon, 11 Aug 2025 22:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34CB041B74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34CB041B74;
	Mon, 11 Aug 2025 22:12:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 840CE183
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 22:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81216841BE
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 22:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAuKWd-UihGN for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 22:12:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.98;
 helo=smtpcmd0998.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8F5E841B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8F5E841B8
Received: from smtpcmd0998.aruba.it (smtpcmd0998.aruba.it [62.149.156.98])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8F5E841B8
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 22:12:41 +0000 (UTC)
Received: from localhost.localdomain ([95.168.105.14])
 by Aruba SMTP with ESMTPSA
 id lakwu2DzT0WuxlakxuAubt; Tue, 12 Aug 2025 00:12:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 12 Aug 2025 00:12:38 +0200
Message-ID: <20250811221238.85607-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCC1UY/iF8Y8g+tv/1Ru6rWVokm/qSCuJmrmw7LV8YiGtiexHnGFcl3SpGBgEE1cDlkreK7E6cw5sk9WeoTPeX4r4p3a0pqQt2BLZYDm37iz5gnnBE77
 jtSI2qwUTVW4oFf//JKbmVB+pcOrFr//+yfQtJAV5F/s7CpKyEzLj0q3RJav58xTNdtsrMd8ZXQwoEBn4O6L1l9i1vQiAUQkFkJfEhHZWDEKqdJAccgWiJxW
 U6v2nHJ/ztU78Cznf5YvBw8yFU98y1HTlDZWGLhJ+1jaI4iRuYZ/DPFiPXxp/roO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1754950359; bh=tjnjE2rnhr4xSUsPCKcbX1bVQPGiTYTj+23IUFdFvFk=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZqeDOfuxNfLkDhmkUV9cVid7dSL1DTjELjiRrBYzY5QNThtb5gZG9KKAA+Mb4yfPQ
 ZzsvYuV3EDIq8yTEx8nD4ijnXwvpNN1ztTt/WFCEE2UapK0oBGA23ul/TmmeW6x+P3
 uFSmphri8s7gN9HnMq0dtoXb36rDGXn4CHJk9gb9ZlErPxRIfg4zl7kGfzcHuDzpoR
 QMm18lobQK65LmCC2mLeA5D0GZgtUH8jZarvpaKVNsw0Q8rUbXo1FvJ+znkSYzz1SY
 9MSzm/9FyDSgyh6LdZ6Fj4R3D54caP0d8/n5Pt5aOc/TlqwiA3xcbPuEqLGOFjEeIl
 NQrJlEclXa/pQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ZqeDOfux
Subject: [Buildroot] [PATCH] package/swugenerator: bump to version 0.5
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

For release note, see:
https://github.com/sbabic/swugenerator/releases/tag/0.5

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swugenerator/swugenerator.hash | 2 +-
 package/swugenerator/swugenerator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
index 5c4878b400..184fd86e27 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  80351fc1c57a6162bc07c44765f2cfd76f3d984dbefca79c3d59844aacd2957f  swugenerator-0.4.tar.gz
+sha256  bb816a77278a2d320e36cdd6fd1bb9b8318b4ef4ccd05e79bb1d5ee631a1d5c1  swugenerator-0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index b5f7796ebe..5acabc2036 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.4
+SWUGENERATOR_VERSION = 0.5
 SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
