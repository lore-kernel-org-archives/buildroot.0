Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594CFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1152F80C58;
	Wed, 27 Apr 2022 19:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLySw_JaQT8X; Wed, 27 Apr 2022 19:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E3A82F80;
	Wed, 27 Apr 2022 19:43:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B88A1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA49F409ED
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zw1Os3Ac9yR for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF5BA40621
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 56D2C84604; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:27:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbf78c2a738b1a0413c835201064abfa9a3a03f1
X-Git-Newrev: 1a47c42b33f0426776e29a0df58c08fb654ab4ca
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.56D2C84604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-driver: add missing
 BR2_LINUX_KERNEL dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a47c42b33f0426776e29a0df58c08fb654ab4ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/40b/40b8aa0c19917f64c3f272f5479068e7631ffcc3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wilc-driver/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
index caf46ae281..24a7b05b17 100644
--- a/package/wilc-driver/Config.in
+++ b/package/wilc-driver/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WILC_DRIVER
 	bool "wilc kernel module"
+	depends on BR2_LINUX_KERNEL
 	help
 	  External kernel module for WILC1000/3000 devices.
 
@@ -16,6 +17,9 @@ config BR2_PACKAGE_WILC_DRIVER
 
 	  https://github.com/embeddedTS/wilc3000-external-module
 
+comment "wilc kernel module needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 if BR2_PACKAGE_WILC_DRIVER
 
 config BR2_PACKAGE_WILC_DRIVER_SPI
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
