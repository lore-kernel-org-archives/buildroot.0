Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA879CAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 15:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8492B405A6;
	Sun, 28 Sep 2025 15:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4qop30ERe0Q; Sun, 28 Sep 2025 15:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1CE7405AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1CE7405AD;
	Sun, 28 Sep 2025 15:14:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94E2B197
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 15:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B809405AD
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 15:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPOs3DfJKpJW for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 15:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2936405A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2936405A6
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 15:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C169186616; Sun, 28 Sep 2025 15:14:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 17:10:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5e5db4b7e972d49448284c21be897d2b4e0b64b
X-Git-Newrev: a4bca5d8ad129213b4150deda7c9b9958c8ac591
X-Patchwork-Hint: ignore
Message-Id: <20250928151452.C169186616@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: drop uboot-tools select
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a4bca5d8ad129213b4150deda7c9b9958c8ac591
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Users may be building U-Boot outside Buildroot or Build U-Boot but not use
the rauc u-boot bootloader backend (E.G. as using the U-Boot environment is
tricky in secure boot setups) - So replace the selects by a note in the help
text.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rauc/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 8d0c0a4f2a..9a910963a3 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -9,14 +9,15 @@ config BR2_PACKAGE_RAUC
 	# uses ENGINE_* API
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
-	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time dependency
-	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
 	help
 	  RAUC is the Robust Auto-Update Controller developed by
 	  Pengutronix. It supports updating embedded Linux
 	  systems over the network or from disks and provides a
 	  d-bus interface.
 
+	  Notice: The U-Boot bootloader support requires fw_getenv /
+	  fw_setenv from uboot-tools.
+
 	  http://rauc.io/
 
 if BR2_PACKAGE_RAUC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
