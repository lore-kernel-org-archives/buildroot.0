Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61342C25B74
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 06:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26B5961038;
	Tue,  4 Jun 2024 06:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WVuJ-jWVrDg; Tue,  4 Jun 2024 06:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF72D61044
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF72D61044;
	Tue,  4 Jun 2024 06:16:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0D71BF2FF
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA86284406
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3FHqOSlFYzg for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 06:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C58D843F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C58D843F1
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 06:16:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F40687A5C; Tue,  4 Jun 2024 06:16:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 08:11:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40d0797027a610a3afcb8c2703210298a52f60f5
X-Git-Newrev: 454426961cf43c8ab0cf13b8fe83e498b1de424a
X-Patchwork-Hint: ignore
Message-Id: <20240604061621.1F40687A5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: fix build failure on
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=454426961cf43c8ab0cf13b8fe83e498b1de424a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream to fix build failure due to old Linux
Bluetooth API.

Fixes:
http://autobuild.buildroot.net/results/d64fa083ec27c3684d4186d2b1b05e041ad330f5/
http://autobuild.buildroot.net/results/5c4fac191970444e63109a762023c0e60f9693e2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ng-Fix-Bluetooth-build-failure-on-Linux-6.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
