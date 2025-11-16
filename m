Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A10ACEBF61
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 20:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C52D60BA8;
	Sun, 16 Nov 2025 20:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZBTCyOq1C64; Sun, 16 Nov 2025 20:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D94C60BA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D94C60BA5;
	Sun, 16 Nov 2025 20:21:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C1A158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10FEB403F4
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nb4POwzAcPzp for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 20:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37008403C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37008403C6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37008403C6
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:21:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.18.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ykg-1vGrco1J3O-00EhZK; Sun, 16
 Nov 2025 21:21:16 +0100
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 16 Nov 2025 21:20:51 +0100
Message-ID: <20251116202053.3276072-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:kvUJmdsfvaASN3qg+g1GDablo1iSp5vBvSTzB+qTJGXALpAoZcW
 Gnm7FPdiCboi/7x9RZIa93nSSpccyPshvdkP0ZHFPafAr+E0tzaM8m8JDKpkFb2DwbCn4DE
 1ZC+aeaTpydHRaJLLf26ndCjqgsCrLqzy5XgimkLRnTYcT6JPWjtqYMFGEZPo3W5S4jDvWg
 fKxPcfQhUzub0vA8kQr7A==
UI-OutboundReport: notjunk:1;M01:P0:UjzXyrui+tQ=;zZr3vQFxdeFoStyhgDfsssl2GYc
 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
 B0TVJKxwGBb3eSOLrCgLlBH3/OR0i
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1763324476; x=1763929276; i=fiona.klute@gmx.de;
 bh=mzAyIAf61pYi1FgGJpNMExg7/CeJG+QfWT2AwJfxaw4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XoNoS1+gDQN4OuTffPDiIoUM1I8xw6AOxO+smPNw2RwRFuMuhPCiAaM41jvxpFjy
 Fjl7C9BjMc11lMpYWk7WOysjoYhWCW+BVVmdSYIS2UmAuwS8/rCQSJZludkbxsaw6
 +QJDtbJp3/yThQlzlLf30oqVa4VPo4Ii2h5cTY/6Tv4PhuX0D7MUWDfgMZbSPCZiX
 tMtmx2Pjce5V9VpqjHOFXt8cVZPs2GND7+roRFR6Wyfeq5eRDr7e9TsYEulyiP47k
 ulDInDx6/OkQarWH5haNqNAliH8kXCJRaH94wed36mmveZeETI38mIIZlqlL1tddE
 YRak45OMfkqHSJB70g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=XoNoS1+g
Subject: [Buildroot] [PATCH 1/3] package/uboot-tools: include FIT print
 support if FIT support is enabled
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Otherwise "dumpimage -l" produces only a newline when processing a FIT
image.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/uboot-tools/uboot-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 37ccd7b953..1135fb9c03 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -32,6 +32,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
@@ -124,6 +125,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
