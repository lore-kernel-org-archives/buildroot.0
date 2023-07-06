Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD5BEB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 15:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF1B61123;
	Thu,  6 Jul 2023 15:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAF1B61123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuhX4CKAO3Zc; Thu,  6 Jul 2023 15:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28E206111E;
	Thu,  6 Jul 2023 15:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28E206111E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 716A01BF97D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 15:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BAF641565
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 15:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BAF641565
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyuaEpnq4o4H for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 15:37:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80AB940A88
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 15:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80AB940A88
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F68E86925; Thu,  6 Jul 2023 15:37:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 17:33:45 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 6ff5b03f930b0eb0c7f9b3d16f494a7f29960d48
X-Git-Newrev: 71eb15a51fc1b6a16fb8024aec94836303970b88
X-Patchwork-Hint: ignore
Message-Id: <20230706153722.6F68E86925@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] configs/mx53loco: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=71eb15a51fc1b6a16fb8024aec94836303970b88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Select  BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following
build error:

include/image.h:1383:12: fatal error: openssl/evp.h: No such file or directory

Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 044c38b71d8cda99e893f0bdcfb18992a229d017)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/mx53loco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 212a032d84..d03c7d0916 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_BOARDNAME="mx53loco"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
