Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63FACF34B6
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 15:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75F3860035;
	Thu,  3 Oct 2024 15:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQ0Glc7XIKMZ; Thu,  3 Oct 2024 15:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E4D260594
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E4D260594;
	Thu,  3 Oct 2024 15:47:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE681BF5A4
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EBE360594
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tzu40D7grgDa for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 15:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B4B60035
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B4B60035
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 15:47:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31F1C84ED4; Thu,  3 Oct 2024 15:47:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Oct 2024 16:30:19 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7a4f80420781f533a2db61d6597d6c50c9ac54d1
X-Git-Newrev: 947fc1b9d47329477e5a9771373981f387f37fd9
X-Patchwork-Hint: ignore
Message-Id: <20241003154731.31F1C84ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/glibc: drop
 support of ARC 7x0 targets
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

commit: https://git.buildroot.net/buildroot/commit/?id=947fc1b9d47329477e5a9771373981f387f37fd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Synopsys ARC 7x0 family is not supported by glibc. Thus, it is
necessary to prevent selecting glibc while configuring for that
processors family.

Fixes:

  http://autobuild.buildroot.net/results/9f0a4d69aed71a840b1c278a9623c9687207ffc6/
  http://autobuild.buildroot.org/results/fa9960365bd54872762d5e959b98882b86c5e956/

Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5aecb99902c35ed48435d7bd7945a0ff58048940)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 81c64083f4..6075d28874 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	default y if BR2_microblaze
 	default y if BR2_nios2
-	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
+	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
