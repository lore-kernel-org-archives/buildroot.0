Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91727C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 08:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 487B2610A7;
	Thu, 27 Jan 2022 08:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVP3zBqS7P7j; Thu, 27 Jan 2022 08:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C31610A2;
	Thu, 27 Jan 2022 08:05:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE1D51C113E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 08:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C7D784D3C
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 08:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HZvTe_Zf3-E for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 08:05:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2D8884D35
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 08:05:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 435948287C; Thu, 27 Jan 2022 07:58:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:58:15 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 579654f570d24778d5ec86dae652cc48803cb01d
X-Git-Newrev: fbec0270f3a5f7c0370cec64418da311f721dc89
X-Patchwork-Hint: ignore
Message-Id: <20220127075826.435948287C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/nvidia-driver:
 add Linux in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbec0270f3a5f7c0370cec64418da311f721dc89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add "Linux" before kernel in comment to be consistent with other
packages and manual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 956cd5b9b7136344bc2641fbe3e1abfa2eff1bc8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
