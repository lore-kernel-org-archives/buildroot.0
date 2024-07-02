Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E217C3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 12:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4126C40490;
	Tue,  2 Jul 2024 12:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLvA9mkHp9GW; Tue,  2 Jul 2024 12:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C5E640A27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C5E640A27;
	Tue,  2 Jul 2024 12:18:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42FB11BF30D
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F573410C7
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJfmzcLwEIdb for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 12:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=58.32.228.46;
 helo=mail-sh.amlogic.com; envelope-from=yang.li@amlogic.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 246A440630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246A440630
Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 246A440630
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 12:18:00 +0000 (UTC)
Received: from droid02-cd.amlogic.com (10.98.11.201) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Tue, 2 Jul 2024
 20:17:51 +0800
From: Yang Li <yang.li@amlogic.com>
To: <buildroot@buildroot.org>
Date: Tue, 2 Jul 2024 20:17:37 +0800
Message-ID: <20240702121745.3445375-1-yang.li@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.98.11.201]
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
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
Cc: bernd@kuhls.net, Yang Li <yang.li@amlogic.com>, yann.morin.1998@free.fr
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
