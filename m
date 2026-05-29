Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B633BCD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B7F280CB6;
	Fri, 29 May 2026 18:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxyvkAM1g4Fx; Fri, 29 May 2026 18:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0406180B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780080866;
	bh=ne0q9Btf9jiw0cQVNsJHlXgiqdKSDHNsQ34s1K+tCJM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O/lP2EktdGb1e6V0zHrDQ8qHlSUVaYjcFuH0KwWvZcmKrvCauzJHLJ4X9RiuwubLj
	 TWng8W7kge7Qs+1zG4z4XB3soJincnR6sz8FsFI3soekIjvg3InEqeO1mOkErhxSxw
	 n3PGR/gAVIv1WDhoywW5/8oSMaYO8FDQih1phe3XaiuRvdxaoy3K+oxKYtUgJUjei+
	 FkxEzGpk9I8YBVn8srTtjDPQ99yk1ZgEuuRArhmJ04kDJoaD3Qla/Z4FQTWyoSliTw
	 q+25FwlFHytwQtLHCo4EPHy2dPcZdjoln+8+cet9dkLaUh95iRWwip5sdRWeWdWIH9
	 U2UIGiqaVtDSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0406180B34;
	Fri, 29 May 2026 18:54:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86E93372
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8376380854
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x71xbp1FL0EC for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D268E8083F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D268E8083F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:54:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E62D8744D; Fri, 29 May 2026 18:54:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:53:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1681beaba367b43657c64832b66f99cf5224444d
X-Git-Newrev: 1c1fa6ce67448ef8bab16d795623be730ff658ea
X-Patchwork-Hint: ignore
Message-Id: <20260529185410.2E62D8744D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/pc/linux.config: enable
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
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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
