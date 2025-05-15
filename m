Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF8BC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92DD74247B;
	Fri, 16 May 2025 11:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zd6guKMm1KJ; Fri, 16 May 2025 11:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B3B4247C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69B3B4247C;
	Fri, 16 May 2025 11:23:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2D6613D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5BE781210
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ka1U4k22Nfwm for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 623F283A8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 623F283A8B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B4A086A00; Fri, 16 May 2025 11:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 17:06:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9c435793aac03fa1b1be0399835541d222c55525
X-Git-Newrev: 4c033376a34562ccd748743ae0d70c1f4969461f
X-Patchwork-Hint: ignore
Message-Id: <20250516112155.5B4A086A00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs: rock4se: bump
 Linux versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c033376a34562ccd748743ae0d70c1f4969461f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This patch bumps:
- Linux kernel to version 6.12.28 (LTS)

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 595dd3ae885ba9d3688676ca542111b2b227f191)
[tperale: Only bump linux]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/radxa/rock4se/patches/linux/linux.hash | 2 +-
 configs/rock4se_defconfig                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rock4se/patches/linux/linux.hash b/board/radxa/rock4se/patches/linux/linux.hash
index 9108b3e01a..8ad0e7d8c0 100644
--- a/board/radxa/rock4se/patches/linux/linux.hash
+++ b/board/radxa/rock4se/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4a516e5ed748537a73cb42ec47fbbeb6df8b1298e8892c29c0e91de79095b297  linux-6.12.10.tar.xz
+sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
index 31fc2c6ecb..a3c95ab6f0 100644
--- a/configs/rock4se_defconfig
+++ b/configs/rock4se_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock4se/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-4se"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
