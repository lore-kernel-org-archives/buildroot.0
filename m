Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01DAC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B51818434E;
	Wed, 19 Jun 2024 20:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfNY9RAWG4qE; Wed, 19 Jun 2024 20:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0058B8435C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0058B8435C;
	Wed, 19 Jun 2024 20:35:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AA4D1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C44A5414B5
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1IfjMGpMH1a for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93E19414EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93E19414EE
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:34:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B5CE8806F; Wed, 19 Jun 2024 20:34:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 22:22:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c986928affc59f5bbefae8c7af963eaf45fdc8c8
X-Git-Newrev: 238975031101247078f99724e6dc5d85317fc484
X-Patchwork-Hint: ignore
Message-Id: <20240619203457.7B5CE8806F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: bump version to
 2024-06-05
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=238975031101247078f99724e6dc5d85317fc484
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop both local patches that have been committed upstream.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...osted_ng-fix-build-failure-on-Linux-6.9.0.patch | 37 ----------------------
 ...ng-Fix-Bluetooth-build-failure-on-Linux-6.patch | 37 ----------------------
 package/esp-hosted/esp-hosted.hash                 |  2 +-
 package/esp-hosted/esp-hosted.mk                   |  2 +-
 4 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch b/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch
deleted file mode 100644
index 21e8730d37..0000000000
--- a/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1cd8671eb64a1278466e7a9c90ceca1be0f8c0d5 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 1 Apr 2024 17:15:19 +0200
-Subject: [PATCH] esp_hosted_ng: fix build failure on Linux 6.9.0
-
-With Linux commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=620d269f29a569ba37419cc03cf1da2d55f6252a
-spi_master compatibility has gone, so let's redefine missing needed
-macros spi_master and spi_master_put() locally if Linux version is >=
-6.9.0.
-
-Upstream: https://github.com/espressif/esp-hosted/pull/358
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- esp_hosted_ng/host/spi/esp_spi.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/esp_hosted_ng/host/spi/esp_spi.c b/esp_hosted_ng/host/spi/esp_spi.c
-index d0bd513bd6..9817056b2d 100644
---- a/esp_hosted_ng/host/spi/esp_spi.c
-+++ b/esp_hosted_ng/host/spi/esp_spi.c
-@@ -378,6 +378,11 @@ static int __spi_controller_match(struct device *dev, const void *data)
- 	return ctlr->bus_num == *bus_num;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 9, 0))
-+#define spi_master			spi_controller
-+#define spi_master_put(_ctlr)		spi_controller_put(_ctlr)
-+#endif
-+
- static struct spi_controller *spi_busnum_to_master(u16 bus_num)
- {
- 	struct platform_device *pdev = NULL;
--- 
-2.34.1
-
diff --git a/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
deleted file mode 100644
index c701aaa82f..0000000000
--- a/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f8903bc2be7ae5ac9fb9bbeed8512e974c6e60ec Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 3 Jun 2024 21:53:38 +0200
-Subject: [PATCH] esp_hosted_ng: Fix Bluetooth build failure on Linux 6.8.11+
-
-After Linux commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=84a4bb6548a29326564f0e659fb8064503ecc1c7
-BT_HS has been removed and consequently AMP controllers can't be created,
-so at this point only HCI_PRIMARY has been left as unique controller type
-to be created and this became implicit with no need to define if the
-controller if HCI_PRIMARY or HCI_AMP. So let's assign HCI_PRIMARY up to
-Linux 6.8.11 only preventing build failure.
-
-Upstream: https://github.com/espressif/esp-hosted/pull/400
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- esp_hosted_ng/host/esp_bt.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/esp_hosted_ng/host/esp_bt.c b/esp_hosted_ng/host/esp_bt.c
-index 3b78c11698..4598ac0e0a 100644
---- a/esp_hosted_ng/host/esp_bt.c
-+++ b/esp_hosted_ng/host/esp_bt.c
-@@ -240,7 +240,9 @@ int esp_init_bt(struct esp_adapter *adapter)
- 	hdev->set_bdaddr = esp_bt_set_bdaddr;
- #endif
- 
-+#if (LINUX_VERSION_CODE <= KERNEL_VERSION(6, 8, 11))
- 	hdev->dev_type = HCI_PRIMARY;
-+#endif
- 
- 	SET_HCIDEV_DEV(hdev, adapter->dev);
- 
--- 
-2.34.1
-
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index d449f5030e..3afee5aef4 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f25c01522fdcb2003ffbfcc0ccf4981f27bddc8080ba978e33590d56f5ae20b  esp-hosted-669fd9cd1892bb8b364701968d5f06225346eea9.tar.gz
+sha256  2c87d68c2b74dd000b128696abc0cdc76d22abfefb6581ff61b7d7bcdaab51f5  esp-hosted-b1422afc4fe0a2ea1ffd6b5459edddc4d968ee71.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 520ad5dc8c..70ca7bf572 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 669fd9cd1892bb8b364701968d5f06225346eea9
+ESP_HOSTED_VERSION = b1422afc4fe0a2ea1ffd6b5459edddc4d968ee71
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
