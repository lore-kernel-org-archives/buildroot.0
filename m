Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9BDEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 14:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B938405A2;
	Fri, 14 Jul 2023 14:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B938405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8ujkWIybyLq; Fri, 14 Jul 2023 14:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27971404BE;
	Fri, 14 Jul 2023 14:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27971404BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49BBF1BF2B4
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 14:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 237A640469
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 14:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 237A640469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 35f4pgrJAq7N for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 14:38:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F0884028D
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F0884028D
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 14:38:13 +0000 (UTC)
Received: from ubuntu-jammy.. (unknown [223.102.84.82])
 by zwqz-smtp-mta-g4-1 (Coremail) with SMTP id _____wCn3jLQXbFkTswhAQ--.52189S2;
 Fri, 14 Jul 2023 22:38:09 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 14:37:52 +0000
Message-Id: <20230714143752.10215-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wCn3jLQXbFkTswhAQ--.52189S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF18Wr4UWF4rArWxJFW7CFg_yoW8XF1UpF
 1DGa1DJ3yjgw1rJFWUC3yDZr1fZrZ2grW7KFyjgFWrKFy3CrWvq395uan8Aryxur109347
 GF13JrWkur9rC37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFAp5UUUUU=
X-Originating-IP: [223.102.84.82]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXRGsjVWBqP3s7AAAss
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=sVY32
 EaOa8OCfnl78AOxmiqkUC1itleE3I5Hud0g+Rk=; b=qVpy2V7k5dgA9hZ2MJZtR
 6VncPfpjNcC0CPPIb0SwNvBZXtkQze1acX+g8+c3MasWcO7KQ+jMbkM9A4e79b8h
 jPOtWz2SntlpsQiHp4CMLcMa40JSEzi9/z30sT/4knV8gZSsnAa3c1P6XMBEi9Ul
 r6ixlwhF6u4QFMLIyrb7Gc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=qVpy2V7k
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: move old Mediatek
 WiFi firmware to mediatek
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

See:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/linux-firmware/linux-firmware.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9383b20c15..068de3859e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -348,7 +348,7 @@ endif
 
 # MT7601
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U),y)
-LINUX_FIRMWARE_FILES += mt7601u.bin
+LINUX_FIRMWARE_FILES += mediatek/mt7601u.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
@@ -360,13 +360,13 @@ endif
 
 # MT7650
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650),y)
-LINUX_FIRMWARE_FILES += mt7650.bin
+LINUX_FIRMWARE_FILES += mediatek/mt7650.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
 # MT76x2e
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E),y)
-LINUX_FIRMWARE_FILES += mt7662.bin mt7662_rom_patch.bin
+LINUX_FIRMWARE_FILES += mediatek/mt7662.bin mediatek/mt7662_rom_patch.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
