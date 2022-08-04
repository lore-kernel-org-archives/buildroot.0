Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C8EC19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 15:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B7DE40C63;
	Thu,  4 Aug 2022 15:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B7DE40C63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbWs6-r7oUel; Thu,  4 Aug 2022 15:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DA744010E;
	Thu,  4 Aug 2022 15:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DA744010E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 613DF1BF317
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D47882CFD
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D47882CFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9NLK76jMpdnW for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 15:05:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49E0582CDE
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 15:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49E0582CDE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ABD7886E66; Thu,  4 Aug 2022 14:50:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Aug 2022 17:04:29 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d23382db1f6d8f8dd1644a8927f44f8c55b6f48d
X-Git-Newrev: 3736acba6c0339081561dcfe9cde25fa6cf7d474
X-Patchwork-Hint: ignore
Message-Id: <20220804145057.ABD7886E66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/wilc-driver: fix
 kconfig syntax
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

commit: https://git.buildroot.net/buildroot/commit/?id=3736acba6c0339081561dcfe9cde25fa6cf7d474
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Sub-options SPI and SDIO weren't rendering as nested options for
wilc-driver, instead showing on the same indent level. Move the
comment and depends on to bottom of file to correct this.

Fixes: 1a47c42b33 ("package/wilc-driver: add missing BR2_LINUX_KERNEL dependency")
Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c74332c780019da16e373c4fde2bb52068e96b99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
