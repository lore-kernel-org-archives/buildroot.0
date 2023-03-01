Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0857AC64ED6
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 16:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A3581E6F;
	Wed,  1 Mar 2023 16:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91A3581E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTMGspNRxWwY; Wed,  1 Mar 2023 16:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96AC81F99;
	Wed,  1 Mar 2023 16:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96AC81F99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72FFB1BF599
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4430461051
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4430461051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmBI8rVlKpRd for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 16:05:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5980461033
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5980461033
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 16:05:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,225,1673884800"; d="scan'208";a="336518257"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 23:58:19 +0800
IronPort-SDR: UsXg2k9YjK4XO9g774k/odKkuPVwoju0EXWOi8XsX+cOSYdiQkQbxamhU7ESvFGXDD63IOlbct
 oGQ7snBQEuNTfRmuxCcHaAdTSFcWYTK1ZPWJxGEpbOCEENU9/Vx4okLkJyhGuc9yp5wtFrUDvb
 8G5l0vYdwmcYqskg5CqD66VXB6n6rsnSJzTn83f4KhuuoHKOF5o60LcoROPZxWeWlvR7HGGEf2
 qOXVso5FJiuKoiDrGzTsk66Nuq30+fx7sa4XlxhT6HVklk/e4Cmun24009grzb/CTGF1vu6Bcu
 iOA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Mar 2023 07:09:24 -0800
IronPort-SDR: G8nVyEaNGxiSsip2Ca0HTgIddffnfvW3JxoX4hrsLjnE7NoZ2+726E2IIVDOxFg3qiQQsTcOSI
 o9ujmA3NjpjA7q6wtua3Q+uR2YMGfHnA+bm19xCB5R/TbCYxfceMLSDfK5fThClyNnLbi57NTI
 a0d5LxA0aBulQav/KhXmWz1jQgAbH0KtR5KM4wEbgN5tyHQPKh68e34C+M6ESNDx27OGWwN6tt
 5N6ay9QhPtaDX/hdLSxDuJnxn6p3Zhv9o6PnrSTc6jxnl5n2rBpWOVXnDm55ikx6gCUX33wNtY
 29w=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 01 Mar 2023 07:58:18 -0800
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 16:58:09 +0100
Message-Id: <20230301155810.3222459-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301155810.3222459-1-niklas.cassel@wdc.com>
References: <20230301155810.3222459-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1677686724; x=1709222724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/4hqsEqII86Q5yPAfSYzh8AyXUQOHb8FHL2kMQkJTo=;
 b=rKoLotONk9UnJ8CRTrJUJrhyB/y3N2J/P2z7DaKwpvSnvWdOeeosKwcE
 k2+k6KDE/wQcggHkb7tbrOgus61VbVR49UQ7+mHyjmV/KRA7MZN+TWNcL
 2ykltOswexPvNqniUkesWPgmjtUwFSArOuYjVRXAKAcUFHIziPKHdOTg4
 xNAl5DYh4f7rQ69hPCi7AODAkeIZaLan9V7FFx5aNr5EZFOLWgW9WmhAW
 XkUxLXNZcGjNCosjmD8r66K9m2LT0+vGJsh1sxO4rczbtgVOZtzLaQb8k
 5DAyuMnoXW2GWma0qxTzz26eyAvh1xFH8lbWCOG7Rkg2GDGu7dujzVrBk
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=rKoLotON
Subject: [Buildroot] [PATCH 2/3] board/qemu/aarch64-sbsa: use the default
 console specified by ACPI
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

ARM SBBR (Server Base Boot Requirements) defines SPCR (Serial Port
Console Redirection Table) as a mandatory ACPI table that specifies
the configuration of a serial console.

In the linux kernel, ARM developers have decided that consoles defined
by SPCR are always enabled when existing, see e.g.:
https://lore.kernel.org/linux-serial/20200430161438.17640-1-alpernebiyasak@gmail.com/T/

Specifying console=ttyAMA0 (which is a serial console) is thus
redundant for an ARM SBSA board. (It also blindly assumes that
the serial console is on ttyAMA0, which might not be true.)

Drop the explicit console=ttyAMA0 on the kernel command line,
such that the kernel can pick up the default console defined
by SPCR.

This is similar to how it is currently done for
board/aarch64-efi/grub.cfg.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 board/qemu/aarch64-sbsa/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-sbsa/grub.cfg b/board/qemu/aarch64-sbsa/grub.cfg
index 39b7842f8f..d99e19c4cd 100644
--- a/board/qemu/aarch64-sbsa/grub.cfg
+++ b/board/qemu/aarch64-sbsa/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /Image root=PARTLABEL=root rootwait console=ttyAMA0
+	linux /Image root=PARTLABEL=root rootwait
 }
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
