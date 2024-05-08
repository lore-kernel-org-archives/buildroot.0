Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D145C25B4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 099F660E07;
	Wed,  8 May 2024 16:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgFoDpzOaqF8; Wed,  8 May 2024 16:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD13360D5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD13360D5F;
	Wed,  8 May 2024 16:38:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A990F1BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96D6B605BD
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-OldHOypNQw for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA96D60585
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA96D60585
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:38:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 227C886B16; Wed,  8 May 2024 16:38:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:37:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b74cb51c0f3215199495b07c94e83c93a3517152
X-Git-Newrev: 121c5f7b422bf393f51e0e873e7ceaef55b0d3d3
X-Patchwork-Hint: ignore
Message-Id: <20240508163800.227C886B16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=121c5f7b422bf393f51e0e873e7ceaef55b0d3d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9b25246e9b731f167454ba4f8182eed1926f50a6 made a typo in license
filename and forgot to add its hash:

ERROR: No hash found for LICENCE.ivsc

Fixes: 9b25246e9b731f167454ba4f8182eed1926f50a6
 - http://autobuild.buildroot.org/results/144ce581645d78a2d27a59a63130977d0f549db8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 6462112fea..a94f368b1f 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -16,6 +16,7 @@ sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENC
 sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
 sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENSE.ice_enhanced
 sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
+sha256  646957007887aed50d56c1f4fd9c6ef760d5b96d0a03577bda3492206dba1d05  LICENSE.ivsc
 sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  a90d3f66704d85889945fec5525ea77622549da83aced1aac99828383f8f1805  LICENCE.mediatek
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 84c96d2216..e6227c2ab9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -849,7 +849,7 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ATOMISP),y)
 LINUX_FIRMWARE_FILES += intel/ipu/shisp_2400b0_v21.bin
 LINUX_FIRMWARE_FILES += intel/ipu/shisp_2401a0_v21.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ivsc
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ivsc
 endif
 
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
