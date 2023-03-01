Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93A2C6FA9D
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 16:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C1EB81F70;
	Wed,  1 Mar 2023 16:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C1EB81F70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvKz73HuMZIe; Wed,  1 Mar 2023 16:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C90F81F78;
	Wed,  1 Mar 2023 16:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C90F81F78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78F611BF599
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C67060FEA
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C67060FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvB2AdR8KXvg for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 16:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF0D661033
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF0D661033
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 16:05:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,225,1673884800"; d="scan'208";a="336518255"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 23:58:17 +0800
IronPort-SDR: VDPbMDGKDDbiEf3+4DkjZzPe5ZCUD5OwKh+wcn+ZOFz6DSbjIGbjwtLkBUt4c10MUPqWi9zciV
 TO9+2bOKNZUFDtOhHiYrq1GwR3+F91wdz8LvYM6M4wED4n/RwhxaESHrD4AbDB+TnkjpvLHCkH
 vtXjUJgMFTGMNBJza8aqwWywdayQKVuMo8SikzQNLHO0RVvMIiKg/CyqBGVsbkN0g9GOUzhZfP
 4atrMNMMjsWSsfRBN+8f74oIKDyoyqQ+FccQ3jYZ0cJpHhshzk+wfrTOLnxTWf+ovu8ozyHMm+
 P5s=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Mar 2023 07:09:22 -0800
IronPort-SDR: 42CHgXw4BasC5Abtqsse4WFLk814fd7lIucsYdSxaQFK8TmhdXiEm/sZvbTd1Nj0QoGdXcScfP
 jpsVyHfOmjmuA3DDzIrXd3Vno/TJ0PpgVLvc1H+mZMZQi84tBN0ZqUbiOBmEQ4wTuayKe4D6F7
 KXPqZjzAxsKSQzdmGwc2MwyZYga/u1vZLPY19wLjHEtcZ5pdHCCqWvhZV1lsz8+mSMpDMuLJmk
 M+82NCXDx+Jgb0aRlWWOTwXFc1yMJXM5No/bNm0RkvX5sFSKa/mIu3wyuj3ivCbo7CzrcRaEl2
 8Ww=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 01 Mar 2023 07:58:16 -0800
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 16:58:08 +0100
Message-Id: <20230301155810.3222459-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301155810.3222459-1-niklas.cassel@wdc.com>
References: <20230301155810.3222459-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1677686722; x=1709222722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IGWz9rjDG3GnaUH/F2+lwQ43PSqjanCv3Zk02yZzFs=;
 b=Ktc5qNbfn7sNvq2gKQr53Ei2l/95y/2n1eTcrB6cnxl5XNUpSsgQ8yWd
 O1uyRZ/MUWteeJQhBYAlfK4xu7+I85JsN/cRz8m9uOiaBASRGA3YmgTcy
 TLVKL8qtlw7Yg0GNWNXipMQqpN1FAuQjkrT1kJpDtbKAoSgZPqXY3c5aI
 akTw6QnEawkn5GSjDgSXORVF5LgWo9/EiyX85BvoDR/vG5KdrhQtOrG/W
 XkWqB25j9XmS16nnjAi96RNVRUvzbuDmMOiCYMZjZdK5Iiy0WCKGYOkcu
 g6k33bs9fC7yzBXWQaBgr1+BUDHms/FUvIH6RaWQs0/xnbewEtlaCxY7P
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=Ktc5qNbf
Subject: [Buildroot] [PATCH 1/3] board/qemu/aarch64-sbsa: use PARTLABEL to
 specify root
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
