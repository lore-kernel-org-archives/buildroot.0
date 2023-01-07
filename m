Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8EFC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB78382A4E;
	Mon, 20 Feb 2023 23:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB78382A4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOLz_eKwWaSJ; Mon, 20 Feb 2023 23:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EDD782A83;
	Mon, 20 Feb 2023 23:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EDD782A83
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37A861BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 878A341731
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 878A341731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qtyu8odq1ox for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C62014172F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C62014172F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3A2B8648F; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Jan 2023 20:24:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c1d22c7331d5888c4d1bac0504e35862d72829fe
X-Git-Newrev: a564f4da0ffbfd180186a34bdbdccf1cb5f9272f
X-Patchwork-Hint: ignore
Message-Id: <20230220205227.C3A2B8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/qemu_riscv32_virt_defconfig: use OpenSBI 1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a564f4da0ffbfd180186a34bdbdccf1cb5f9272f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rather than the default (currently 0.9).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_riscv32_virt_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index faf4e1e312..f354e303e5 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -25,6 +25,8 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 
 # host-qemu for gitlab testing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
