Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6490DC88CB2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 16:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02E29844A6;
	Mon, 12 Jun 2023 16:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E29844A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9f_pxuf7oH2; Mon, 12 Jun 2023 16:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FA73844FD;
	Mon, 12 Jun 2023 16:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA73844FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C14A41BF3C8
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F1E41578
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F1E41578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hiC5arW2BU6e for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 16:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B506C4155F
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 16:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B506C4155F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CA9082810; Mon, 12 Jun 2023 16:00:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 17:59:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e505488a0e034c074bf5897b4788e45670e82f6c
X-Git-Newrev: f71c30405022f39e5a965cfb14a6c0b7efc08854
X-Patchwork-Hint: ignore
Message-Id: <20230612160022.9CA9082810@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/wilc-firmware:
 bump to 16.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f71c30405022f39e5a965cfb14a6c0b7efc08854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

According to release notes from Microchip, this fixes a memory
leak in AP modes, fixes a failure with an undisclosed but specific
AP, and re-certified with WFA for WILC1000.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2003877ceb9724f0c92c4e894e9b461a940a747a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wilc-firmware/wilc-firmware.hash | 2 +-
 package/wilc-firmware/wilc-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/wilc-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
index 6e7850df16..802cb4f9b1 100644
--- a/package/wilc-firmware/wilc-firmware.hash
+++ b/package/wilc-firmware/wilc-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c2e2927a65fe4d7ec2f9872fca35c6b7bf12090ac62116d63c5f17b95a3a786  wilc-firmware-wilc_linux_15_7.tar.gz
+sha256  a06a6a46e03ca00d35da220f7a9f353cc650e5e5657a7988ea732913ad26d9a0  wilc-firmware-wilc_linux_16_1.tar.gz
 sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
diff --git a/package/wilc-firmware/wilc-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
index e31829d430..12c825cf92 100644
--- a/package/wilc-firmware/wilc-firmware.mk
+++ b/package/wilc-firmware/wilc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WILC_FIRMWARE_VERSION = wilc_linux_15_7
+WILC_FIRMWARE_VERSION = wilc_linux_16_1
 WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
 
 WILC_FIRMWARE_LICENSE = PROPRIETARY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
