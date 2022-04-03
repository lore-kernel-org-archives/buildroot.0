Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644A1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0EBC416D9;
	Sun,  3 Apr 2022 19:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKrJI09ftnjp; Sun,  3 Apr 2022 19:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA5E416D5;
	Sun,  3 Apr 2022 19:12:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D45FB1BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C20FC40395
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycsm-tSM5mZL for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30FEF40236
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C7A49860AE; Sun,  3 Apr 2022 19:03:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 21:10:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7130bcb44c4c5cd9fd83dba6da28617f6c77a615
X-Git-Newrev: 158b062a42c393e9084bde9691f663ee0ef59b18
X-Patchwork-Hint: ignore
Message-Id: <20220403190312.C7A49860AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: properly fix
 drivers names for iwl3945/iwl4965
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

commit: https://git.buildroot.net/buildroot/commit/?id=158b062a42c393e9084bde9691f663ee0ef59b18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 7130bcb44c4c (package/linux-firmware: Add Intel WiFi
3945ABG/BG/4965AGN), I improperly fixed the two drivers names...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index a0dda5fb6f..8ce71140da 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -203,13 +203,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945
 	bool "Intel iwlwifi 3945"
 	help
 	  Firmware files for the Intel Wifi 3945 devices supported by
-	  the iwl3965 kernel driver.
+	  the iwl3945 kernel driver.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965
 	bool "Intel iwlwifi 4965"
 	help
 	  Firmware files for the Intel Wifi 4965 devices supported by
-	  the iwl4945 kernel driver.
+	  the iwl4965 kernel driver.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	bool "Intel iwlwifi 5000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
