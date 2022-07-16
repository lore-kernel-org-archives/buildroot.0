Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1190C43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C63B4051B;
	Sat, 16 Jul 2022 22:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C63B4051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_wajnmWAc6E; Sat, 16 Jul 2022 22:07:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E4A9404ED;
	Sat, 16 Jul 2022 22:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E4A9404ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 945991BF3D0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DCBC81496
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCBC81496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBoQXw4B4Vje for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:07:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2FDC8146A
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2FDC8146A
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 03EFF83979; Sat, 16 Jul 2022 21:54:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 00:06:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e23b230a203ea974479fdc9fbc703eaa23b4d35b
X-Git-Newrev: c74332c780019da16e373c4fde2bb52068e96b99
X-Patchwork-Hint: ignore
Message-Id: <20220716215408.03EFF83979@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-driver: fix kconfig syntax
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

commit: https://git.buildroot.net/buildroot/commit/?id=c74332c780019da16e373c4fde2bb52068e96b99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sub-options SPI and SDIO weren't rendering as nested options for
wilc-driver, instead showing on the same indent level. Move the
comment and depends on to bottom of file to correct this.

Fixes: 1a47c42b33 ("package/wilc-driver: add missing BR2_LINUX_KERNEL dependency")
Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wilc-driver/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
index 24a7b05b17..7ed062bb66 100644
--- a/package/wilc-driver/Config.in
+++ b/package/wilc-driver/Config.in
@@ -17,9 +17,6 @@ config BR2_PACKAGE_WILC_DRIVER
 
 	  https://github.com/embeddedTS/wilc3000-external-module
 
-comment "wilc kernel module needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-
 if BR2_PACKAGE_WILC_DRIVER
 
 config BR2_PACKAGE_WILC_DRIVER_SPI
@@ -60,3 +57,6 @@ config BR2_PACKAGE_WILC_DRIVER_SDIO_OOB
 	  time division interrupt.
 endif
 endif
+
+comment "wilc kernel module needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
