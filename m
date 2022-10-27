Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11661C38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 09:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9990740923;
	Thu, 27 Oct 2022 09:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9990740923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pADSgUNoLIR; Thu, 27 Oct 2022 09:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9207B408B7;
	Thu, 27 Oct 2022 09:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9207B408B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A83E1BF2CB
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 09:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76DA460BC0
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 09:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76DA460BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLZCEysZifqz for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 09:56:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A668160B9F
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 09:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A668160B9F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93C498732E; Thu, 27 Oct 2022 09:56:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 11:55:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fdf8731e727dc5c2d4080d7a56e1d71dc25e533
X-Git-Newrev: f51600d04ccb20ed5c47b9e0e894fe560f16539e
X-Patchwork-Hint: ignore
Message-Id: <20221027095620.93C498732E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdio-tools: fix Config.in comment
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f51600d04ccb20ed5c47b9e0e894fe560f16539e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to show the headers >= 5.1 Config.in comment when the
BR2_LINUX_KERNEL is satisfied, not when it isn't.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mdio-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
index d63ba8f727..f24c1a6974 100644
--- a/package/mdio-tools/Config.in
+++ b/package/mdio-tools/Config.in
@@ -2,7 +2,7 @@ comment "mdio-tools needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
 comment "mdio-tools needs a toolchain w/ headers >= 5.1"
-	depends on !BR2_LINUX_KERNEL
+	depends on BR2_LINUX_KERNEL
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 
 config BR2_PACKAGE_MDIO_TOOLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
