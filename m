Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570A9C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B6496076B;
	Mon,  3 Jun 2024 20:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaUcm28gqplB; Mon,  3 Jun 2024 20:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 076AD60B5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 076AD60B5B;
	Mon,  3 Jun 2024 20:00:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4E301BF3BD
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1C3460B5B
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vt5T1E05F16W for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 20:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3DDB6076B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3DDB6076B
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3DDB6076B
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 20:00:29 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id EDr0sihYkmFXqEDr0spy3R; Mon, 03 Jun 2024 22:00:27 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 22:00:25 +0200
Message-Id: <20240603200025.1246055-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIZQEPs43X+v1oHDTwmXZxszhj0GMhaq+b0EEzEML0qlTl+AElGgoBPcm03ycLYwscSJs7arzHtkmHfZ7NVHUeiL9iVvGTfnBBqzZdU9rkf1y+b6wbbt
 esLLW3I0YxfCpaHesNL0BgHxClmpMZ4rYj0Wh2Gpa/ErwF7tDniU9j8/MoGsvRoWjc/2yLgIMxKrhWkz3M6OfTaseAZWfGWsFOtZlo0xjuNJD984RalkTTQA
 8XQVJl9aDX4OGwTv8m4baciRwR3OLFidAMjjA6qgW94=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1717444827; bh=eOmTxFulu9hVLaWrHWjF5gyiPwAXM3Obm9lSdj278ck=;
 h=From:To:Subject:Date:MIME-Version;
 b=Rr9zyLD4U7ic8NQ6K3xTuByoULnz/QMy8/0qYRbacEuICSroLqKA09cUqL0+VzJxi
 SaNGRJfNDVO4OFgjPoONZyAiYQHkN6i+CUoC579pIKqRK/FgaEUmmHujltnb9O6Pad
 kojFwAf5WIe+AVP5QBwJhzmQ/yvDIN/Mvr7/J1F3bv1Sa+ZxMUp2q2kzRKzIa1GxdZ
 bKwUS4acRkIk0f21lySW3uIYuT03poKEmPKIrB5S3wFFFpF4/i+mEyhdUB/Q92mxTp
 AIBlzVN3htZZCiy4tIjQxbLR7Yui6Zhz9uxQqIf2ILcz7y7CIKVQW9leAkxnZNUXnx
 SX6iq8tt7uBPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Rr9zyLD4
Subject: [Buildroot] [PATCH v2] package/esp-hosted: fix build failure on
 Linux 6.8.12+
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix build failure due to old Linux
Bluetooth API.

Fixes:
http://autobuild.buildroot.net/results/d64fa083ec27c3684d4186d2b1b05e041ad330f5/
http://autobuild.buildroot.net/results/5c4fac191970444e63109a762023c0e60f9693e2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add missing Upstream tag in local patch
---
 ...x-Bluetooth-build-failure-on-Linux-6.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch

diff --git a/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
new file mode 100644
index 0000000000..c701aaa82f
--- /dev/null
+++ b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
@@ -0,0 +1,37 @@
+From f8903bc2be7ae5ac9fb9bbeed8512e974c6e60ec Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 3 Jun 2024 21:53:38 +0200
+Subject: [PATCH] esp_hosted_ng: Fix Bluetooth build failure on Linux 6.8.11+
+
+After Linux commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=84a4bb6548a29326564f0e659fb8064503ecc1c7
+BT_HS has been removed and consequently AMP controllers can't be created,
+so at this point only HCI_PRIMARY has been left as unique controller type
+to be created and this became implicit with no need to define if the
+controller if HCI_PRIMARY or HCI_AMP. So let's assign HCI_PRIMARY up to
+Linux 6.8.11 only preventing build failure.
+
+Upstream: https://github.com/espressif/esp-hosted/pull/400
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/esp_bt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/esp_hosted_ng/host/esp_bt.c b/esp_hosted_ng/host/esp_bt.c
+index 3b78c11698..4598ac0e0a 100644
+--- a/esp_hosted_ng/host/esp_bt.c
++++ b/esp_hosted_ng/host/esp_bt.c
+@@ -240,7 +240,9 @@ int esp_init_bt(struct esp_adapter *adapter)
+ 	hdev->set_bdaddr = esp_bt_set_bdaddr;
+ #endif
+ 
++#if (LINUX_VERSION_CODE <= KERNEL_VERSION(6, 8, 11))
+ 	hdev->dev_type = HCI_PRIMARY;
++#endif
+ 
+ 	SET_HCIDEV_DEV(hdev, adapter->dev);
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
