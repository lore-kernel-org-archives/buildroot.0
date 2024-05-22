Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30E5C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 06:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0C1160A99;
	Wed, 22 May 2024 06:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guiykQn6-PoW; Wed, 22 May 2024 06:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3390060AA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3390060AA7;
	Wed, 22 May 2024 06:16:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4537E1C57CB
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 329DE40446
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvGe0YWfwNAl for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 06:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72B7C40181
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72B7C40181
 for <buildroot@buildroot.org>; Wed, 22 May 2024 06:16:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47832874F7; Wed, 22 May 2024 06:16:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 08:12:48 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ad20908243763804f859429cd4bf7f3ca82eae86
X-Git-Newrev: 3edd6d9fceba1ea53447d6586c2a573704847918
X-Patchwork-Hint: ignore
Message-Id: <20240522061614.47832874F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ti-sgx-km: needs
 BR2_ARM_EABIHF
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

commit: https://git.buildroot.net/buildroot/commit/?id=3edd6d9fceba1ea53447d6586c2a573704847918
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

ti-sgx-km raises the following build failure without BR2_ARM_EABIHF:

eurasiacon/build/linux2/toplevel.mk:230: eurasiacon/build/linux2/moduledefs/target_armel.mk: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/17e4da346d062570b9a84ab8eb1ce93c6d7384be
 - http://autobuild.buildroot.org/results/04fd659472f1928c2621354bb0ea3b60c5dfadec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5924a5c2c649c067a4bc434da5aa180170cbc30c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-sgx-km/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
index 964889ff40..3e8a41b755 100644
--- a/package/ti-sgx-km/Config.in
+++ b/package/ti-sgx-km/Config.in
@@ -1,10 +1,10 @@
 comment "ti-sgx-km needs a Linux kernel to be built"
-	depends on BR2_arm
+	depends on BR2_ARM_EABIHF
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_TI_SGX_KM
 	bool "ti-sgx-km"
-	depends on BR2_LINUX_KERNEL && BR2_arm
+	depends on BR2_LINUX_KERNEL && BR2_ARM_EABIHF
 	select BR2_LINUX_NEEDS_MODULES
 	help
 	  Kernel modules for TI CPUs with SGX GPU.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
