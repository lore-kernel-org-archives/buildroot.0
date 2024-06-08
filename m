Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAE2C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 15:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94AD2843A5;
	Sat,  8 Jun 2024 15:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mA2pZiEION_l; Sat,  8 Jun 2024 15:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 705C98437D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 705C98437D;
	Sat,  8 Jun 2024 15:30:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8ED1BF417
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A13E8437D
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAmZbBDFHnJd for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91413842C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91413842C2
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A83087A30; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 17:18:28 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 22bd9931a30d6b455a5932bd50f9cce120d35965
X-Git-Newrev: 520c2185b7b28218541ffbdecbf7d5fd5dd50f48
X-Patchwork-Hint: ignore
Message-Id: <20240608152958.7A83087A30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 configs/orangepi_r1_defconfig: u-boot 2024.01 needs host-openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=520c2185b7b28218541ffbdecbf7d5fd5dd50f48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689094

Commit 113eeb55d67 (configs/orangepi_r1_defconfig: bump U-boot to v2024.01
to fix compatibility with setuptools >= 69) bumped U-Boot, but forgot to add
a dependency on host-openssl.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8eae5a07d272db6e15252d0adcb8c5ef85b93780)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_r1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index d7a21894bd..5e7dccf49b 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_r1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
