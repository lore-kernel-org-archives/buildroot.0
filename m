Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6295ACA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EBBE61C24;
	Mon,  8 Sep 2025 10:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJOjdQt0UM4P; Mon,  8 Sep 2025 10:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6668661525
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6668661525;
	Mon,  8 Sep 2025 10:39:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BBD5186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CFE542BBC
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATSnI5uMq1s3 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EE5841BDB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EE5841BDB
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C4B483A90; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:14:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1d9340709cd9babb211cff46c7282ecc185d6247
X-Git-Newrev: fdb09610b79e630676cd1723b9d013f2ea9a2b2e
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.0C4B483A90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 configs/imx6ulz_bsh_smm_m2_defconfig: Fix processor VFP
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdb09610b79e630676cd1723b9d013f2ea9a2b2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

imx6ull is compatible with VFPV4. Update it from VFPV3

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a9d487ae5de279fc1402552a8f608e898d6bc7f0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 configs/imx6ulz_bsh_smm_m2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 4d870e03c2..d43d45f8eb 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV3=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/imx6ulz-bsh-smm-m2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
