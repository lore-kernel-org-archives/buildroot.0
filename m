Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD42C678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 09:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3615F60797;
	Tue,  7 Mar 2023 09:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3615F60797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Ld8fqNFIaTI; Tue,  7 Mar 2023 09:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E35B60FE7;
	Tue,  7 Mar 2023 09:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E35B60FE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 767831BF255
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE69760FE7
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE69760FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GhaWt9Ld7NM for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 09:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E0F60BF0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9E0F60BF0
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 09:35:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,240,1673884800"; d="scan'208";a="223280790"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Mar 2023 17:35:16 +0800
IronPort-SDR: x+kLzxiJZVoaUQeE29hndewGgQ/b3NsSj2mz7UZCpx1UamHJ3a90yA8ZbLe1bcVCo/Zi3CR+Wi
 SdbGv/OwtDDKYuMNh6o4ZwcoIxOzsbIiC/9Ag0M/empW9REpu1d/XBwrXJUQSebvTaENt8z3GY
 LuDVSrxWbqfMwPPHflYMAfV7E70f2wT5nNZsVqYks2z1kJiQRmI6ND3EucmL8TtFwXm/lcFU/q
 RNrGzNx7q2F+SIERhYpCNUP4dPG02iBjAblcCgl244zGGxsZ+lznDmVCt6DcbWdOquKKAyBAp1
 2SA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Mar 2023 00:46:14 -0800
IronPort-SDR: Ihjjj1PTRh3qUz9VN6uWN6zVbSEXYHZai75saQgbzSzYBxfj3FaQDlRhx3ksttHdN/vXMfSCz9
 UXvMFygHWt9DU739M41GCneSVCtuppGZpehAj0gd8NWcGXGr/25YWPtjlKg+dr8OLyLNrUKFkI
 qmpnLqBUDbh/po0BdoFsRN8oqYvxB35D29/Z68nzlV5Equr5fuQCY+ooeesR6/MhWH64tXpQvm
 AKmYamXu4RuVD5fIKTuVYxxm0mOBzjbBRMmOKQwIXYy2Z5dRSmUGsMb8YuuM+F9NKH/ZMWTNRl
 ZZk=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.41])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Mar 2023 01:35:15 -0800
To: buildroot@buildroot.org
Date: Tue,  7 Mar 2023 10:35:02 +0100
Message-Id: <20230307093504.3611941-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307093504.3611941-1-niklas.cassel@wdc.com>
References: <20230307093504.3611941-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678181717; x=1709717717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IGWz9rjDG3GnaUH/F2+lwQ43PSqjanCv3Zk02yZzFs=;
 b=FDdqE7CZ/MHGny5hZxduSJJyKAVQdZsknTUtGYq4xIu3VEkxhJ9Hgebf
 mtgqhdIohOiD9f9aks55yxG+jsPmNBTFbDeAM22IWtmglXrJivbQPpoO1
 PAyZKTyUCbgiTgcpcTFDBTCz3wA7v5lnY5zzN8avOpct6T49yc51XLkqy
 DDpSa8H7trHHE8yHFydZc+DRbrseO9Iq3yJtAOlDjdmNejNpE6j3fw0Rw
 4MkOQrabvOZ7S+n71KRWCcsyv0II5Jz+RpFtiZmqNlbxV8cPphdfv2blA
 RiG2w7hDSN5KMszw9YVrRk6lXaoTMcuWe+hC3CM7VhXr7a1elTYe+Xt9b
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=FDdqE7CZ
Subject: [Buildroot] [PATCH v3 1/3] board/qemu/aarch64-sbsa: use PARTLABEL
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
