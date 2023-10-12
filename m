Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4563ACDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CB52826A4;
	Thu, 12 Oct 2023 16:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB52826A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hdvdr5NBWxD2; Thu, 12 Oct 2023 16:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B51778266D;
	Thu, 12 Oct 2023 16:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B51778266D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93FD01BF2F8
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DF37402D7
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF37402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79ZqsQi1hdrh for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 16:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5019240018
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 16:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5019240018
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3880A84616; Thu, 12 Oct 2023 16:32:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 18:31:39 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: ede5bd5859e27b2e2d81464e671836a8df7a4c94
X-Git-Newrev: 5567239034016358b250d2d314ff141111508d7c
X-Patchwork-Hint: ignore
Message-Id: <20231012163223.3880A84616@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 board/qemu/aarch64-virt/linux.config: enable base ACPI support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5567239034016358b250d2d314ff141111508d7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

When testing the virt machine with EDK2, the buildroot 6.1 kernel
will not boot as it has no base ACPI support. Whilst you can run
qemu with the -no-acpi option, it would help if basic ACPI support
was there as otherwise there is no output from the kernel post the
ACPI BIOS initialisation.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b1f9c511626e2a91f99ed6113ff29a504a717711)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/aarch64-virt/linux.config | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index f9763b73b7..971b9fcf86 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -12,8 +12,7 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_VEXPRESS=y
 CONFIG_COMPAT=y
-CONFIG_FW_CFG_SYSFS=y
-CONFIG_FW_CFG_SYSFS_CMDLINE=y
+CONFIG_ACPI=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
@@ -34,6 +33,8 @@ CONFIG_PCI=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_CFG_SYSFS=y
+CONFIG_FW_CFG_SYSFS_CMDLINE=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
