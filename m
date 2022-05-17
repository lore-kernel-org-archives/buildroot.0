Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C10C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A6241A5C;
	Tue, 17 May 2022 20:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3p3dm9hSCQX; Tue, 17 May 2022 20:16:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC6D41959;
	Tue, 17 May 2022 20:16:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2EF1BF995
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0292419AC
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHpVnCtrtvh0 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:15:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3316A4196C
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:15:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F3B7785F77; Tue, 17 May 2022 20:04:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:15:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbd93825978e749f081d2c0bb3b3d6fb7c5324bc
X-Git-Newrev: e8fb79c8664234d0eb4ce73feb848a63f4d35543
X-Patchwork-Hint: ignore
Message-Id: <20220517200442.F3B7785F77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xr819-xradio: enable on riscv
 architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8fb79c8664234d0eb4ce73feb848a63f4d35543
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xr819-xradio/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xr819-xradio/Config.in b/package/xr819-xradio/Config.in
index 3d2dedf29e..b8acd71bfc 100644
--- a/package/xr819-xradio/Config.in
+++ b/package/xr819-xradio/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_XR819_XRADIO
 	bool "xr819-xradio"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || \
+		BR2_aarch64_be || BR2_riscv
 	help
 	  Wireless driver for SDIO WiFi chip XR819
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
