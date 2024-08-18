Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAF9C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 21:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 692C140021;
	Sun, 18 Aug 2024 21:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5IGXw1z4xz9; Sun, 18 Aug 2024 21:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222AD402E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 222AD402E5;
	Sun, 18 Aug 2024 21:56:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D5841BF407
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 038C080E78
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snbOByhecLs4 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 21:56:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C94680D35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C94680D35
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C94680D35
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 21:56:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id F0CD51BF203;
 Sun, 18 Aug 2024 21:56:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 23:56:25 +0200
Message-ID: <20240818215627.1055491-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724018189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lxZ6YBPZnT7oJZuYmyVQVdMQSe2JqJPW3HTGzqGxH44=;
 b=Ir4VI9/+IDXpNzA2Ua+e5Y9IW0Fq0JC88mmMUll6q3MfmKU0FHBm/uyerSo+191WJqqEjW
 7bxpe8qkIC/ztUt/gkRAYNICenRCsQXDzj3EZZAUXgyISaxOceHjOtduCR3/fo/Kw0rhOo
 VlA8nSTLxuWJhmfjDsK83V3gDFrCYUWaidhjpDCL1h1RjxN1gv1rmSks2GTN/BIY67hVx2
 +/+af/TecddNxC5+ExTW7Cj+nQheC0xJMJPLjdWonqiONiQlq+WkxxHOtOWzlY9Ykjtb04
 ChfShWLpR0citki1noVyRBVWp6epxueTdjb3iHPMPWDxHAz7ST52AAkupEvhFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ir4VI9/+
Subject: [Buildroot] [PATCH 1/2] package/flashrom: bump to final 1.4.0
 release
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit is suitable for master because:

$ git log --format=oneline v1.4.0-rc2..v1.4.0
eace095b15eb034e42d97202cad70ce979d8ca38 VERSION: Update version to 1.4.0
30c85a62c1abe07d57d5a7b523ef62c2c5b825c9 doc: Release notes for version 1.4.0
e4e0fd0d8232260af052fde52a9fb636181b2e2e meson: Fix project name as flashrom

And it looks nicer to have a final 1.4.0 release than a 1.4.0-rc2
release candidate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/flashrom.hash | 2 +-
 package/flashrom/flashrom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index cecec5273f..17ebdee3af 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  318c54a4143a1a05b30cecd64fbff41a0f5cd35a020622864c11fb44f8ed04d4  flashrom-1.4.0-rc2.tar.gz
+sha256  b77ce458b3b874387270a71805e899ac63f057d7553dc320da7e4c58e750577c  flashrom-1.4.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 1e7d332dae..46d42640e9 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.4.0-rc2
+FLASHROM_VERSION = 1.4.0
 FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
