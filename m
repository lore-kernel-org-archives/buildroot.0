Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E56C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 22:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D64408B6;
	Sun, 18 Dec 2022 22:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0D64408B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PJUyJfMWH47; Sun, 18 Dec 2022 22:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1774340340;
	Sun, 18 Dec 2022 22:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1774340340
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADF2B1BF38E
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89A1C403B7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89A1C403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOsNa0Umscho for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 22:03:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59E6540167
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59E6540167
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 22:03:24 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout08.t-online.de (Postfix) with SMTP id 5D938116A;
 Sun, 18 Dec 2022 23:03:20 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p71kc-2cvCYz0; Sun, 18 Dec 2022 23:03:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:36338)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p71kc-00019N-0F;
 Sun, 18 Dec 2022 23:03:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 23:03:17 +0100
Message-Id: <20221218220318.563479-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671400998-2FFFE535-244EBA9A/0/0 CLEAN NORMAL
X-TOI-MSGID: 16cefb9d-3cf1-4d35-932b-094db1ee0b17
Subject: [Buildroot] [PATCH 1/2] package/linux-firmware: add RTL8125B NIC
 firmware
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed due to kernel commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0439297be95111cf9ef5ece2091af16d140ce2ef

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 200b4ca564..526e8c1c44 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -584,6 +584,7 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8107e-1.fw \
 	rtl_nic/rtl8107e-2.fw \
 	rtl_nic/rtl8125a-3.fw \
+	rtl_nic/rtl8125b-2.fw \
 	rtl_nic/rtl8168d-1.fw \
 	rtl_nic/rtl8168d-2.fw \
 	rtl_nic/rtl8168e-1.fw \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
