Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4582AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E0E408D4;
	Sat,  8 Jan 2022 17:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FeqbKYaSNcVe; Sat,  8 Jan 2022 17:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53B01408D0;
	Sat,  8 Jan 2022 17:40:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4CD1BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72570408CD
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qK5MmvZRSJjp for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:39:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1EC9408CE
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:39:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 11DED832CE; Sat,  8 Jan 2022 17:33:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:39:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0de6291e3fe8d9f6c572a5206b8ead3719f6829
X-Git-Newrev: 956cd5b9b7136344bc2641fbe3e1abfa2eff1bc8
X-Patchwork-Hint: ignore
Message-Id: <20220108173323.11DED832CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvidia-driver: add Linux in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=956cd5b9b7136344bc2641fbe3e1abfa2eff1bc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add "Linux" before kernel in comment to be consistent with other
packages and manual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nvidia-driver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 9631b3e70c..a8617a939b 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -75,7 +75,7 @@ config BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS
 
 endif # BR2_PACKAGE_NVIDIA_DRIVER_CUDA
 
-comment "nvidia kernel module needs a kernel to be built"
+comment "nvidia kernel module needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
