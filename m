Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B0CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0DDF85453;
	Tue,  9 Jun 2026 13:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTMWVgucMoMu; Tue,  9 Jun 2026 13:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF1684716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010274;
	bh=2RC2KfliJQmPUap6ySRwvkeca5B59aM1LaoBsb6Drz4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mm0WXFlTPf6PPfjr1BCb99oDgZdF3+hyoh3STE84kKkvex4B3sneEoVXlKIdF9o5z
	 IczuXsebecyhY1RvABkc5tuAroTJr7HkKfF6GTevMNiyZZ8hyUBft6yfUpLeiefEVD
	 UE1e8t8ZcZV65ecEIxy2aScgo16jhgTqmrM0lhK+lAckfwVt9sFgoA9wM6u2QCAAH1
	 JaqjduadgjA6ACD4GaINqLBB41thhdxGkMnjhpCK9e/419JQdZU6+qy2B7V8FYhK8y
	 /l7ysxHBGdVJ0XFduiuBDqgd+7HMTSbw97PVdt4xWCIC3h0DVTnzGW1mxj9liSKU4a
	 Zb1rPuO97lhhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BF1684716;
	Tue,  9 Jun 2026 13:04:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96169196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB35142723
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFe67UR4-Os7 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F473426FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F473426FC
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB34A87E7E; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:53:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1681beaba367b43657c64832b66f99cf5224444d
X-Git-Newrev: 1c1fa6ce67448ef8bab16d795623be730ff658ea
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.BB34A87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/pc/linux.config: enable
 CONFIG_EFI_STUB
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c1fa6ce67448ef8bab16d795623be730ff658ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When the Linux Kernel image does not include the EFI stub [1],
Grub2 EFI linux loader fallback to the legacy i386 loading.
See [2] [3]. Grub 2.14 enabled the NX compatible for the EFI
image in [4].

When booting a Linux Kernel without the EFI stub with Grub 2.14 with
NX flag, the boot fails before starting the kernel with a EDK2 page
fault error [5]:

!!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
ExceptionData - 0000000000000003  I:0 R:0 U:0 W:1 P:1 PK:0 SS:0 SGX:0

This commit adds CONFIG_EFI_STUB to board/pc/linux.config to make sure
grub will load the Kernel using its efi loading code.

This commit is needed with EDK2 with NX protection enabled and
Grub 2.14 also enabling NX.

[1] https://docs.kernel.org/admin-guide/efi-stub.html
[2] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.14/grub-core/loader/efi/linux.c#L532
[3] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.14/grub-core/loader/i386/linux.c#L675
[4] https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/f5bb766e688b1180e0ace3417d4947a934957a31
[5] https://github.com/tianocore/edk2/blob/edk2-stable202602/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ArchExceptionHandler.c#L273

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/pc/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/pc/linux.config b/board/pc/linux.config
index 43b15c94be..cbc4f5a6b0 100644
--- a/board/pc/linux.config
+++ b/board/pc/linux.config
@@ -5,6 +5,7 @@ CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_EFI=y
+CONFIG_EFI_STUB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
