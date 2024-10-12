Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D475CF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E967241B43;
	Sat, 12 Oct 2024 14:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLlZOItFM3ue; Sat, 12 Oct 2024 14:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7841A41B3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7841A41B3C;
	Sat, 12 Oct 2024 14:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E6E51BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA32140865
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnKQWqCdMyBC for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C32540884
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C32540884
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 091C381524; Sat, 12 Oct 2024 14:05:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:30 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 720c61fff9aefb2cd18bc5edb47d3c814dd12269
X-Git-Newrev: d9e4a18b9c0ce63d0372e6fc7108ca568a94c75b
X-Patchwork-Hint: ignore
Message-Id: <20241012140532.091C381524@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] boot/uboot: fix typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9e4a18b9c0ce63d0372e6fc7108ca568a94c75b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ab34bdcb38f950ac5232397e1168a9c1b66b2af4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 2 +-
 boot/uboot/uboot.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c4d052595c..dd80693614 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -150,7 +150,7 @@ config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
 	  Text file containing the variables to be used as the default
 	  environment in U-Boot.
 
-	  If empty, let U-Boot generate the default enviromnent from the
+	  If empty, let U-Boot generate the default environment from the
 	  source code and other U-Boot configuration values, which is
 	  the default behaviour.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2c04abc896..ab534a8b3a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -54,7 +54,7 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
 UBOOT_BINS += u-boot
-# To make elf usable for debuging on ARC use special target
+# To make elf usable for debugging on ARC use special target
 ifeq ($(BR2_arc),y)
 UBOOT_MAKE_TARGET += mdbtrick
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
