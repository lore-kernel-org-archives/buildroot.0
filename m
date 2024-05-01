Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD336C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73B5B81EFE;
	Wed,  1 May 2024 19:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJo4BFH_ogx3; Wed,  1 May 2024 19:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58B5682094
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B5682094;
	Wed,  1 May 2024 19:17:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13CE01BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 000AD40560
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXWMIZe5ImAb for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:17:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D66D74038A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D66D74038A
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:17:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47564863DF; Wed,  1 May 2024 19:17:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:08:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16e9f514905a12caab1d1b308dd95f8b79977828
X-Git-Newrev: 9fb4ed3a041eceffdc40139b33de697ca9afa30e
X-Patchwork-Hint: ignore
Message-Id: <20240501191737.47564863DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: bump version to
 2024-04-01
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9fb4ed3a041eceffdc40139b33de697ca9afa30e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for Linux 6.9

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...osted_ng-fix-build-failure-on-Linux-6.9.0.patch | 37 ++++++++++++++++++++++
 package/esp-hosted/esp-hosted.hash                 |  2 +-
 package/esp-hosted/esp-hosted.mk                   |  2 +-
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch b/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch
new file mode 100644
index 0000000000..21e8730d37
--- /dev/null
+++ b/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch
@@ -0,0 +1,37 @@
+From 1cd8671eb64a1278466e7a9c90ceca1be0f8c0d5 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 1 Apr 2024 17:15:19 +0200
+Subject: [PATCH] esp_hosted_ng: fix build failure on Linux 6.9.0
+
+With Linux commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=620d269f29a569ba37419cc03cf1da2d55f6252a
+spi_master compatibility has gone, so let's redefine missing needed
+macros spi_master and spi_master_put() locally if Linux version is >=
+6.9.0.
+
+Upstream: https://github.com/espressif/esp-hosted/pull/358
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/spi/esp_spi.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/esp_hosted_ng/host/spi/esp_spi.c b/esp_hosted_ng/host/spi/esp_spi.c
+index d0bd513bd6..9817056b2d 100644
+--- a/esp_hosted_ng/host/spi/esp_spi.c
++++ b/esp_hosted_ng/host/spi/esp_spi.c
+@@ -378,6 +378,11 @@ static int __spi_controller_match(struct device *dev, const void *data)
+ 	return ctlr->bus_num == *bus_num;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 9, 0))
++#define spi_master			spi_controller
++#define spi_master_put(_ctlr)		spi_controller_put(_ctlr)
++#endif
++
+ static struct spi_controller *spi_busnum_to_master(u16 bus_num)
+ {
+ 	struct platform_device *pdev = NULL;
+-- 
+2.34.1
+
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index ff0839076e..d449f5030e 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1c4df08132d5204a01adc2797e8f6f6d7ff945609b288cfe2dc2ea50789e8af4  esp-hosted-6a25417fc880fd744b3b0d93c11659c3e7d86384.tar.gz
+sha256  8f25c01522fdcb2003ffbfcc0ccf4981f27bddc8080ba978e33590d56f5ae20b  esp-hosted-669fd9cd1892bb8b364701968d5f06225346eea9.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index cc61e39b36..520ad5dc8c 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 6a25417fc880fd744b3b0d93c11659c3e7d86384
+ESP_HOSTED_VERSION = 669fd9cd1892bb8b364701968d5f06225346eea9
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
