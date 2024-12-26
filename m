Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ADFE7718E
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 22:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B666605F4;
	Thu, 26 Dec 2024 22:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-LRqmeFezHE; Thu, 26 Dec 2024 22:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 335A5607AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335A5607AF;
	Thu, 26 Dec 2024 22:14:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEDD8F1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A16980C75
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_6dLGP5li3H for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 22:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85C5F80A73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85C5F80A73
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85C5F80A73
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:14:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 872561BF203;
 Thu, 26 Dec 2024 22:14:47 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2024 23:14:45 +0100
Message-ID: <20241226221446.2644580-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735251287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nerWIDsK8oXfaxawwf+gxOsNcmibYA7eSOw3McTMpjQ=;
 b=BUVgyElaEkTRkTWhd6X+InidpjuuNJ4Hz3kYaZ5NmCEI93dZRnhjDFQbAr9GEYHq1PGLb2
 cAvXsP8DeBnVF39EUkkhdk+RonFwE1o5APZkATkkcFeEzWShty6hdRyvFUKx8HWI/D+sVp
 xeBsLbiRHabd73abVV7THFf9hhej8UoKkCvlVFg9tuOSiaqYDOVNRgakFeh1UlgNPUVHNH
 iQvzRLGP6Mloc7oXEvdy+GvP7+5GmaMRG+OWv2R3Y/cN/gq7hxO736xmLTwxox+SvDZYH4
 2bVjlM87XH00VU9sXvVQ56JmY9vUGably6/2eIyuPw73KYin27yJ7pBoXdiIDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BUVgyEla
Subject: [Buildroot] [PATCH] package/flashrom: bump to version 1.5.1
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

Changes in 1.5.0 and 1.5.1 are described at:
https://www.flashrom.org/release_notes/v_1_5.html

The option classic_cli_print_wiki has been removed in upstream commit
87134f538dd9b69fa1331514f7b492e92f8bd66d ("tree: Remove
print_wiki.c"). It was used to generate some parts of the Wiki, and
was anyway not used by Buildroot as it was disabled.

The build was tested including with fwupd, which is the one reverse
dependency of flashrom in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/flashrom.hash | 2 +-
 package/flashrom/flashrom.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 17ebdee3af..0e1faf34e7 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b77ce458b3b874387270a71805e899ac63f057d7553dc320da7e4c58e750577c  flashrom-1.4.0.tar.gz
+sha256  3f4dc7878e962e165b7eba73104d4e61231f9d4e838eb47df6ca3d87060a2aa5  flashrom-1.5.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 4eede48e03..f253c5f9d8 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.4.0
+FLASHROM_VERSION = 1.5.1
 FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
 	-Dclassic_cli=enabled \
-	-Dclassic_cli_print_wiki=disabled \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
 	-Duse_internal_dmi=true \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
