Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD55CC3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 17:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB10412C2;
	Thu,  8 May 2025 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBEWea8Nf4z4; Thu,  8 May 2025 17:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB8EF40DB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8EF40DB4;
	Thu,  8 May 2025 17:07:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 622CC439
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A2D40BC1
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bn47z8kPU2QJ for <buildroot@buildroot.org>;
 Thu,  8 May 2025 17:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 605A940720
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 605A940720
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:07:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50BDA865D3; Thu,  8 May 2025 17:07:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 8 May 2025 17:25:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97c7311c64468532c71699e18e724d8488d3aa3c
X-Git-Newrev: 30cf5a07546602e6e88d1501ac1ec182b693fcbb
X-Patchwork-Hint: ignore
Message-Id: <20250508170721.50BDA865D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc*: backport a patch for
 GCC 15.x compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=30cf5a07546602e6e88d1501ac1ec182b693fcbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

powerpc kernel maintainer merged a patch [1] for GCC 15.x compatibility
that will likely be merged upstream soon.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=5a821e2d69e26b51b7f3740b6b0c3462b8cacaff

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-powerpc-boot-Fix-build-with-gcc-15.patch  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch b/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..78a4034a32
--- /dev/null
+++ b/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch
@@ -0,0 +1,38 @@
+From 2d04c5b3c5728cd5e5202176e8796ffc0085c24a Mon Sep 17 00:00:00 2001
+From: Michal Suchanek <msuchanek@suse.de>
+Date: Mon, 31 Mar 2025 12:57:19 +0200
+Subject: [PATCH] powerpc/boot: Fix build with gcc 15
+
+Similar to x86 the ppc boot code does not build with GCC 15.
+
+Copy the fix from
+commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
+
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next-test&id=5a821e2d69e26b51b7f3740b6b0c3462b8cacaff
+
+Signed-off-by: Michal Suchanek <msuchanek@suse.de>
+Tested-by: Amit Machhiwal <amachhiw@linux.ibm.com>
+Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
+Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
+Link: https://patch.msgid.link/20250331105722.19709-1-msuchanek@suse.de
+[Romain: backport to 6.12.27]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ arch/powerpc/boot/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
+index fa8518067d38..60a495771c05 100644
+--- a/arch/powerpc/boot/Makefile
++++ b/arch/powerpc/boot/Makefile
+@@ -70,6 +70,7 @@ BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
+ BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
+ 
+ BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
++		   -std=gnu11 \
+ 		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
+ 		   -fno-strict-aliasing -O2 \
+ 		   -msoft-float -mno-altivec -mno-vsx \
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
