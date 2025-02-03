Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD85C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138E9506FB;
	Fri, 28 Feb 2025 17:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YEY8_ihhVU4; Fri, 28 Feb 2025 17:08:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1CEF4FB02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1CEF4FB02;
	Fri, 28 Feb 2025 17:08:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 087FA711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6614A42F03
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MT006WNwUpxc for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C458D42509
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C458D42509
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF15587A92; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 12:54:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ec29817de50bc98e47291c28db986954e0c50f93
X-Git-Newrev: 2bec75ea790e07d99e3140c129e82d21bc611b14
X-Patchwork-Hint: ignore
Message-Id: <20250228163024.BF15587A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/nvidia_bf3: set
 BR2_cortex_a78
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bec75ea790e07d99e3140c129e82d21bc611b14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The nvidia BlueField-3 DPU includes Arm Cortex-A78 Hercules
processors. See [1].

The Cortex-A78 support was added in Buildroot in commit [2].

This commit adds BR2_cortex_a78=y in nvidia_bf3_defconfig to enable
optimisations for this processor.

[1] https://www.nvidia.com/en-us/networking/products/data-processing-unit/
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f4690c2bfd7d51c614d09ff470e725c795bab980

Cc: Vincent Jardin <vjardin@free.fr>
Tested-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/nvidia_bf3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
index 3f958c0062..e44bb55a3a 100644
--- a/configs/nvidia_bf3_defconfig
+++ b/configs/nvidia_bf3_defconfig
@@ -1,4 +1,5 @@
 BR2_aarch64=y
+BR2_cortex_a78=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/nvidia/bf3/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
