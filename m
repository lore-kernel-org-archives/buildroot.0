Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C08C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 02:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1348A81255;
	Thu, 27 Jun 2024 02:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaxvIGwLb2id; Thu, 27 Jun 2024 02:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21FCF81164
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21FCF81164;
	Thu, 27 Jun 2024 02:19:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 884511BF3E0
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 02:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7032C40491
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 02:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TCgoy_aeieB for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 02:19:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=58.32.228.46;
 helo=mail-sh.amlogic.com; envelope-from=yang.li@amlogic.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CDA5400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CDA5400E2
Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CDA5400E2
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 02:19:18 +0000 (UTC)
Received: from droid02-cd.amlogic.com (10.98.11.201) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Thu, 27 Jun 2024
 10:19:10 +0800
From: Yang Li <yang.li@amlogic.com>
To: <buildroot@buildroot.org>
Date: Thu, 27 Jun 2024 10:18:37 +0800
Message-ID: <20240627021848.2484831-1-yang.li@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.98.11.201]
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amlogic.com
Subject: [Buildroot] [PATCH] package/linux-firmware: change Amlogic
 Bluetooth binary path
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Yang Li <yang.li@amlogic.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove bluetooth subdirectory, and use generic pattern aml_*
to install all bluetooth binary.

Signed-off-by: Yang Li <yang.li@amlogic.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 13dbc6d98c..22ebecf6c6 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -53,7 +53,7 @@ endif
 
 # Amlogic SoC Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
-LINUX_FIRMWARE_FILES += amlogic/bluetooth/*.bin
+LINUX_FIRMWARE_FILES += amlogic/aml_*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amlogic
 endif
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
