Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1205C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 14:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AFBF820EE;
	Sun,  5 May 2024 14:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bo3gbIg_FWMW; Sun,  5 May 2024 14:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ACF882103
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ACF882103;
	Sun,  5 May 2024 14:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB9CC1BF616
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 14:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A589A400D0
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 14:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVwPmCthnJ6u for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 14:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9141400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9141400B8
 for <buildroot@buildroot.org>; Sun,  5 May 2024 14:22:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C377F8666E; Sun,  5 May 2024 14:22:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 16:22:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8c7a53985a62fd8a25cbe803628c64527da21fc
X-Git-Newrev: 5924a5c2c649c067a4bc434da5aa180170cbc30c
X-Patchwork-Hint: ignore
Message-Id: <20240505142233.C377F8666E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ti-sgx-km: needs BR2_ARM_EABIHF
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

commit: https://git.buildroot.net/buildroot/commit/?id=5924a5c2c649c067a4bc434da5aa180170cbc30c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ti-sgx-km raises the following build failure without BR2_ARM_EABIHF:

eurasiacon/build/linux2/toplevel.mk:230: eurasiacon/build/linux2/moduledefs/target_armel.mk: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/17e4da346d062570b9a84ab8eb1ce93c6d7384be
 - http://autobuild.buildroot.org/results/04fd659472f1928c2621354bb0ea3b60c5dfadec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
