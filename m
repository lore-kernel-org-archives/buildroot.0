Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C1BC7EE22
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 20:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9841881D7D;
	Thu, 11 May 2023 20:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9841881D7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6GhYid5lutMB; Thu, 11 May 2023 20:18:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A6F581A6D;
	Thu, 11 May 2023 20:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6F581A6D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1F9C1BF283
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4CF981A6D
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4CF981A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaWCYGE0YGC4 for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 20:18:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1697F81831
 for <buildroot@buildroot.org>; Thu, 11 May 2023 20:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1697F81831
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 042C78632F; Thu, 11 May 2023 20:18:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 22:18:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a43fb5e8065f712d0f6afcc095b8a1da66462169
X-Git-Newrev: 2003877ceb9724f0c92c4e894e9b461a940a747a
X-Patchwork-Hint: ignore
Message-Id: <20230511201836.042C78632F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-firmware: bump to 16.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2003877ceb9724f0c92c4e894e9b461a940a747a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to release notes from Microchip, this fixes a memory
leak in AP modes, fixes a failure with an undisclosed but specific
AP, and re-certified with WFA for WILC1000.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
