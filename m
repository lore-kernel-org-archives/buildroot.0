Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8699FE7C715
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 09:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4352760F46;
	Sun,  1 Feb 2026 09:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C667fJOQaACB; Sun,  1 Feb 2026 09:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C8961116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769938048;
	bh=RD+Mxkhl+HjU0p1L3jtEDiMupOwoioBPMYPSYsCrPdM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e6PskqzvxZfgPOpsfYP+scXq/BqVNRaGrAgVti5W/39Rg8Gntpipa/8oodd9zNnKs
	 KfEU301PdUTnCHv07ridA4uerMtWlI5rjh/lW+AodDyJzAoj8QZgjTdYTg8tMLTr7h
	 5zu3+m7cumP6eTIWeMJib2L2aZCClMFu5rmjPRI4UAzOQDvxEP8U+OGplj6Vv4pSgN
	 zW+sUinnCf7tfVAoxd+XROpye8uFtviQbPVe5EzkdYMc8+PVTlNHLkGrDOWAotMJcU
	 8veqwJ6aSJJxt407p4yma3kCx+t9DkYNLep2UzxZILdmvOC9/nY8MTKRjel8Y12EcS
	 95aqNsVYvghRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C8961116;
	Sun,  1 Feb 2026 09:27:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C6E134C
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 341FE40378
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7JbG6LecG6Y for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 09:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 634EA4002A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 634EA4002A
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:27:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58CE386115; Sun,  1 Feb 2026 09:27:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 10:24:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5715e7da20b37cb3b704bb1a18dd8a09e1fcbc28
X-Git-Newrev: 5d76026af735368cece979dfc551382135797fea
X-Patchwork-Hint: ignore
Message-Id: <20260201092725.58CE386115@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.18.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d76026af735368cece979dfc551382135797fea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 427bcedae7..f83883b936 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d0a78bf3f0d12aaa10af3b5adcaed5bc767b5b78705e5ef885d5e930b72e25d5  linux-6.18.1.tar.xz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 74ce958cd3..ca4ba27a28 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index d3912659db..240dfc46b6 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
