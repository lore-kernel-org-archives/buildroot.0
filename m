Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED67CD1296
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 667E860EDB;
	Wed, 10 Apr 2024 21:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_GrtQ6SzTgh; Wed, 10 Apr 2024 21:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0675060ECD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0675060ECD;
	Wed, 10 Apr 2024 21:12:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5581BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E99FF402D4
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54yLk1KL3iJ8 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44AF84036A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44AF84036A
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E99CB85F2D; Wed, 10 Apr 2024 21:11:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:09:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99e9ff08d0705279532ca0cf3de22ea54660cbdc
X-Git-Newrev: c245b37190f18d1f0551dd95027b2b65fa63e704
X-Patchwork-Hint: ignore
Message-Id: <20240410211158.E99CB85F2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mangopi_mq1rdw1_defconfig: fix
 build failure due to undefined linux headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=c245b37190f18d1f0551dd95027b2b65fa63e704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6 to prevent error:
Incorrect selection of kernel headers: expected 6.8.x, got 6.6.x

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6498278078

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/mangopi_mq1rdw2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mangopi_mq1rdw2_defconfig b/configs/mangopi_mq1rdw2_defconfig
index a2f8a1299b..2249fa4be5 100644
--- a/configs/mangopi_mq1rdw2_defconfig
+++ b/configs/mangopi_mq1rdw2_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_HOSTNAME="mangopi-mq1rdw2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to MangoPI MQ1RDW2"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
