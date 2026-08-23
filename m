Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C2CC5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 20:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379A580B50;
	Sun, 23 Aug 2026 20:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEdjOzwvAr5f; Sun, 23 Aug 2026 20:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787515677;
	bh=cTyKuw4lzmeIe2MnMW3Yvn0eRDaSBo5b6ytBeeyeNc0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YoCmj9UqY92ZcZs4Q2SqMI1R3LQVwoJBaOdyHLNzdlbxn6Pcz+Su6O9gCJmEC5RuU
	 p4bv3tQc4rOvfLpgeHA5hd7OCpxHTyZ8yXk8EfbfT492FIZ4R+qUwskGoPQwVUAtbe
	 zuRNpnk9PXZ5gdU0o0+ewcxOvyB214VIfna61P1Nixsvho9H90jr2gbxF08kQm3nI0
	 wlzHQ/JbxzXhCKxPKlMfUwZYHKRwu1Vjf+o22Wiar6vFTk51SEC5csWh9AI6RhYo8z
	 GKqw2O+QS9c8usb8khfSaEhpW6HQhr55k+EI0J7YoD1KHj/HOu2DoEOC4a8ox0ymHK
	 oS8C1XGj/2txA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724BA80BCD;
	Sun, 23 Aug 2026 20:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D744435
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F9A680BC4
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kvT5nt2Lho3 for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 20:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7D9580B50
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AC2D8EE95; Sun, 23 Aug 2026 20:06:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 22:04:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4f41f4f3f6273a37e2c4c96c230c6c99f5826b6
X-Git-Newrev: ca2c31b019eadbed5875dce52ed8e6249a606e86
X-Patchwork-Hint: ignore
Message-Id: <20260823200659.4AC2D8EE95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/x86_64-efi/linux.config: enable
 CONFIG_EFI_STUB to fix with grub2 >= 2.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ca2c31b019eadbed5875dce52ed8e6249a606e86
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since Buildroot commit [1] (boot/grub2: bump to version 2.14), the
qemu_x86_64_efi_defconfig fails at boot time with the error:

    !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
    ExceptionData - 0000000000000003  I:0 R:0 U:0 W:1 P:1 PK:0 SS:0 SGX:0

This issue happens because EDK2 and Grub 2.14 are enabling NX and the
kernel lacks the CONFIG_EFI_STUB configuration. For the full explanation
see the commit log of [2] (board/pc/linux.config: enable CONFIG_EFI_STUB).

This commit enables CONFIG_EFI_STUB=y.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219375

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/da278ba1dab7e29369879c8a29cbd1b42dbe9ce0
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/1c1fa6ce67448ef8bab16d795623be730ff658ea

Reported-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/x86_64-efi/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/x86_64-efi/linux.config b/board/qemu/x86_64-efi/linux.config
index 9362b7ecb5..4f5f0b386d 100644
--- a/board/qemu/x86_64-efi/linux.config
+++ b/board/qemu/x86_64-efi/linux.config
@@ -3,6 +3,7 @@ CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_EFI=y
+CONFIG_EFI_STUB=y
 # CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
