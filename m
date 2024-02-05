Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB642C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 741EB417DA;
	Mon,  5 Feb 2024 10:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 741EB417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7g8Cb9EZf-F; Mon,  5 Feb 2024 10:14:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A167C417E7;
	Mon,  5 Feb 2024 10:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A167C417E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81F141BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B54D8254A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B54D8254A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2OKoS3VJW2g for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:14:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B72820B0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B72820B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8305A869F4; Mon,  5 Feb 2024 10:14:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:14:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8120f29935c0070c2c7ebdcfeceb37d2c3dc0d7d
X-Git-Newrev: 6c5981d1a119bc9779a9c1d507899f835559f7b8
X-Patchwork-Hint: ignore
Message-Id: <20240205101443.8305A869F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc_firmware: bump to 16.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c5981d1a119bc9779a9c1d507899f835559f7b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release changelog:
- Use default values for IQ calibration correction when the eFuse
  register has zero values.
- Fix for "WILC1000 Firmware initialization issue" by updating
  the PMU clock switching sequence during firmware initialization.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wilc-firmware/wilc-firmware.hash | 2 +-
 package/wilc-firmware/wilc-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/wilc-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
index 802cb4f9b1..8a7957a1d2 100644
--- a/package/wilc-firmware/wilc-firmware.hash
+++ b/package/wilc-firmware/wilc-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a06a6a46e03ca00d35da220f7a9f353cc650e5e5657a7988ea732913ad26d9a0  wilc-firmware-wilc_linux_16_1.tar.gz
+sha256  6cd5fc52150520bedb736f58124063041b4d9849ea33481a8b075f51aec64f8e  wilc-firmware-wilc_linux_16_1_2.tar.gz
 sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
diff --git a/package/wilc-firmware/wilc-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
index 12c825cf92..3381162bbd 100644
--- a/package/wilc-firmware/wilc-firmware.mk
+++ b/package/wilc-firmware/wilc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WILC_FIRMWARE_VERSION = wilc_linux_16_1
+WILC_FIRMWARE_VERSION = wilc_linux_16_1_2
 WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
 
 WILC_FIRMWARE_LICENSE = PROPRIETARY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
