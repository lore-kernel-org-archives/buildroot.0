Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07C1C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA05F80BDE;
	Thu,  1 Aug 2024 21:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFfRHYxrEyMz; Thu,  1 Aug 2024 21:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A049B8111F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A049B8111F;
	Thu,  1 Aug 2024 21:45:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA59B1BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4B80409E0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 951hGb4Nbvp2 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC85040998
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC85040998
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:45:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3E3583A26; Thu,  1 Aug 2024 21:45:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:42:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afd4c4d708ade684c732e982785968047900e655
X-Git-Newrev: ab78dae649e663c8744be5343e4a59ef3b1efb9b
X-Patchwork-Hint: ignore
Message-Id: <20240801214516.B3E3583A26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-firmware: bump to 16.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab78dae649e663c8744be5343e4a59ef3b1efb9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wraps up firmware 16.2 and 16.3

Changelog from https://github.com/linux4wilc/firmware/releases:
- Fixed the transmission issue for the large data blocks
- Unified driver codebase for the ATWILC & nextGen products.
- Fix for Powersave state issue when network interface is down
  (using 'ifconfig wlan0 down') and 'up' again.
- Migrated the ATWILC driver codebase to Kernel 6.6

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wilc-firmware/wilc-firmware.hash | 2 +-
 package/wilc-firmware/wilc-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/wilc-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
index 8a7957a1d2..543aaa0f1e 100644
--- a/package/wilc-firmware/wilc-firmware.hash
+++ b/package/wilc-firmware/wilc-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6cd5fc52150520bedb736f58124063041b4d9849ea33481a8b075f51aec64f8e  wilc-firmware-wilc_linux_16_1_2.tar.gz
+sha256  b9305e1ed5a43eaffed880ba0486431c13cdf93b2e449aed650e7a605a291c83  wilc-firmware-wilc_linux_16_3.tar.gz
 sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
diff --git a/package/wilc-firmware/wilc-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
index 3381162bbd..ac0f33440e 100644
--- a/package/wilc-firmware/wilc-firmware.mk
+++ b/package/wilc-firmware/wilc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WILC_FIRMWARE_VERSION = wilc_linux_16_1_2
+WILC_FIRMWARE_VERSION = wilc_linux_16_3
 WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
 
 WILC_FIRMWARE_LICENSE = PROPRIETARY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
