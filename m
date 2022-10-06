Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E726C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34E7E40BBB;
	Thu,  6 Oct 2022 18:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34E7E40BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I10l90hUUkCP; Thu,  6 Oct 2022 18:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DE6240B8A;
	Thu,  6 Oct 2022 18:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DE6240B8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77B0C1BF3FB
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 303B083F88
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 303B083F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7gtmj9AF6AlD for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 618DB83FBA
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 618DB83FBA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 600078693A; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:54:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61c8dfe7d7090c004a3d766f8a2473141ce676f9
X-Git-Newrev: 2a012d68972e6762cb0ab8be531d66657fe102a9
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.600078693A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] friendlyarm_nanopi_r2s_defconfig: specify
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a012d68972e6762cb0ab8be531d66657fe102a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfigs uses a 5.16 kernel, so specify 5.16 kernel headers to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/friendlyarm_nanopi_r2s_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
index ce252a5d76..284b28ec31 100644
--- a/configs/friendlyarm_nanopi_r2s_defconfig
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_TARGET_GENERIC_HOSTNAME="rk3328-nanopi-r2s"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Nanopi R2S RK3328"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r2s/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
