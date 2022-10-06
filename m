Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD48BC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5775F83FBA;
	Thu,  6 Oct 2022 18:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5775F83FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJK8XxIF1QLC; Thu,  6 Oct 2022 18:01:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BE683F9F;
	Thu,  6 Oct 2022 18:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89BE683F9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A63B61BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DC0C419E6
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DC0C419E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BInk2Q1_JOed for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68C36419E1
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68C36419E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 583588680C; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:54:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bd8e718a683a4af5db7f3aedb66717b45cdf2fc
X-Git-Newrev: 61c8dfe7d7090c004a3d766f8a2473141ce676f9
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.583588680C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] qemu_riscv64_nommu_virt_defconfig: specify
 kernel headers version
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

commit: https://git.buildroot.net/buildroot/commit/?id=61c8dfe7d7090c004a3d766f8a2473141ce676f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfigs uses a 5.19 kernel, so specify 5.19 kernel headers now that
is available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_riscv64_nommu_virt_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 5fab255d88..ee70beb208 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -3,6 +3,9 @@ BR2_riscv=y
 BR2_RISCV_64=y
 # BR2_RISCV_USE_MMU is not set
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # Busybox with hush
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
