Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7B0C64EC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 12:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 986594119E;
	Fri,  3 Mar 2023 12:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 986594119E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Py70ISb7EaYn; Fri,  3 Mar 2023 12:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3B15411A3;
	Fri,  3 Mar 2023 12:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3B15411A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD3F1BF239
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F54C40242
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F54C40242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5Nd-CToUiFC for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 12:23:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 849B94118A
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 849B94118A
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 12:23:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,230,1673884800"; d="scan'208";a="224726811"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 20:22:59 +0800
IronPort-SDR: u+eQNgUt+MQbmWUCIUegZyuHpv5IApi3l/Ynj8H1ZT2vK9BKG9xY0iaWYsbNACGqIRL4GVCixJ
 xAYcD5e6EUEMYG96o4rQDIvHFZHVubYJtWkA1ZFuJoaXI2jLqQ03NxUTNx1b/EfYiArl1kMXHv
 89WSn21c+L/zpEN3C9FiHMy0dzCNd3wP7KyIl5PQg5XArW3PRd4sbJ/T2ihb86x2mp6MUjAs5i
 RS9q0fYN32TnbXPZYZvVbyu8Kkw/3ZnEra3hgerFpXwtjc9kq3L0Iv4f626wqCZtNkc3vWdL5K
 M+c=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 03:39:43 -0800
IronPort-SDR: uimCVxS4Go3CJYm5osa1iBwvxw5IRwb83T5gijt6xX2MuXNn25lcAL6N4mftUW0BjSCnCTP6J4
 v6QXAsbW22f1AxBnovFOuaK7x30fvLKqLGF6qJcrNq55QKkOAoZRCpRrqwzhIsl7kQDkNOYOTg
 roJrLYOj3Siou0tACHsRcG0kHhDgsKzLixOALr1m7e0WTqAvlekUU8jNm+POEoHrKLuSh61xRd
 oG3+WZvh+SmoMBDcDkTr9gW5n7EjN9SEDC70U4nAg4MpuygSGn2hru7e8x+GX80vtU8pB0YDpV
 ArY=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.35])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2023 04:22:57 -0800
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 13:22:49 +0100
Message-Id: <20230303122251.3392998-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303122251.3392998-1-niklas.cassel@wdc.com>
References: <20230303122251.3392998-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1677846180; x=1709382180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IGWz9rjDG3GnaUH/F2+lwQ43PSqjanCv3Zk02yZzFs=;
 b=McjCUdjZTn5OaBdn3ePnmohXUE28J15hD/86C/7ufPS5VjOzDO4pC5l6
 1Ueu+1853b9F2P04SQ2ZavRYZ+x2+2DIVzo1/sSIG8bliilK/SlC9w6EY
 gy2Hhw4z7q4x0qpJ2yMyScz+Dha4uZaDCc5ch1AmoTHW/dVt24jt9uhwh
 zt1rRpcDtdx1mZo1epd0Y+MxAfDxYamqSWM3mhBRod64A+Zihf/K5OgGJ
 q+3B3hvAWjNFriCRGrg7zOewjtoAsrjPX21KtnCN1Wcht/CeykALKDpKf
 gGPvmtdD78DXe86EP9CxUfIbjy4p7w5d2/dfdVRP5y1UE/Duu9v7FZKM5
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=McjCUdjZ
Subject: [Buildroot] [PATCH v2 1/3] board/qemu/aarch64-sbsa: use PARTLABEL
 to specify root
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Specifying /dev/sda2 is ambigious, and when booting my arm64 machine
this tries to mount the second partition of my ATA drive, instead of
the second partition of the USB-stick, simply because the ATA driver
is probed earlier than the USB controller driver.

To solve this problem, use PARTLABEL=root to specify the root filesystem.
This is similar to how it is currently done for board/aarch64-efi/grub.cfg
and board/qemu/aarch64-ebbr/grub.cfg.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 board/qemu/aarch64-sbsa/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-sbsa/grub.cfg b/board/qemu/aarch64-sbsa/grub.cfg
index cd486caf4c..39b7842f8f 100644
--- a/board/qemu/aarch64-sbsa/grub.cfg
+++ b/board/qemu/aarch64-sbsa/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /Image root=/dev/sda2 rootwait console=ttyAMA0
+	linux /Image root=PARTLABEL=root rootwait console=ttyAMA0
 }
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
