Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA847C27C6E
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 15:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9222F84398;
	Sat,  8 Jun 2024 15:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFIVX3vONiLv; Sat,  8 Jun 2024 15:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77DB1843A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77DB1843A8;
	Sat,  8 Jun 2024 15:30:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 287751BF417
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 162F640253
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeriBbsI3WID for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 15:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32EAE402B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32EAE402B1
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89E8E87E8E; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 17:18:34 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 520c2185b7b28218541ffbdecbf7d5fd5dd50f48
X-Git-Newrev: 25c23920ffd49f2a6c752488167e93bf87e89b89
X-Patchwork-Hint: ignore
Message-Id: <20240608152958.89E8E87E8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 configs/orangepi_pc_defconfig: u-boot 2024.01 needs host-openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=25c23920ffd49f2a6c752488167e93bf87e89b89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 2e349be94a87db05d (configs/orangepi_pc_defconfig: bump U-boot to
v2024.01 to fix compatibility with setuptools >= 69) bumped U-Boot, but
forgot to add a dependency on host-openssl.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 96e41a849e128b580507f65ca25ffc8233e227d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_pc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 0464de5619..e6898bd13d 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
