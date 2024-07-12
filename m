Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6991C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A46A4065D;
	Fri, 12 Jul 2024 20:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2Yo50OvbbK3; Fri, 12 Jul 2024 20:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DBFC412F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DBFC412F5;
	Fri, 12 Jul 2024 20:42:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AD751BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6484C400B9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwO-LHLn8J6H for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67FF1400A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67FF1400A6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:42:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C59886245; Fri, 12 Jul 2024 20:42:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:39:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6d9fa3692b0e5dd75bb1fee5d151fe58da7800d
X-Git-Newrev: 38d84178ce29ac3433cc1d1ae5b52ff17aace724
X-Patchwork-Hint: ignore
Message-Id: <20240712204214.4C59886245@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/spike/riscv64/readme.txt: remove
 obsolete comment
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38d84178ce29ac3433cc1d1ae5b52ff17aace724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the time the spike_riscv64_defconfig was introduced in commit [1], it
was not possible to have a console input using Spike and OpenSBI for
RISC-V 32 bits. This limitation no longer applies, as upstream
components now implements support for this.

Buildroot commit [2] updated riscv-isa-sim (Spike), which now includes a
NS16550 uart emulation. This can be used by RV32 Linux Kernel. Finally,
a spike_riscv32_defconfig was added in [3].

This commit removes the comment about this limitation, since it no
longer applies.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/24d07fdc1404901fb1872ac55f875fe1d555cbb3
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/853b7661bf5ddca5d4b81964ef1a19a133beac85
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/a83ab3f4c8621dec58dc78a8dcb48e519377ac3d

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/spike/riscv64/readme.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/board/spike/riscv64/readme.txt b/board/spike/riscv64/readme.txt
index 5ad7df46df..34db625aad 100644
--- a/board/spike/riscv64/readme.txt
+++ b/board/spike/riscv64/readme.txt
@@ -20,11 +20,6 @@ The boot is made with the standard RISC-V OpenSBI boot loader. In
 order to keep the simulation simple, the rootfs is passed as an initrd
 ramfs.
 
-Note: at the time of this writing, Spike v1.1.0 and OpenSBI v1.0 does
-not support console input emulation for 32bit RISC-V systems. A 32bit
-Linux system can boot and reach the login, but it's not possible to
-login. See [4].
-
 
 [1].
 https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#simulating-a-new-instruction
@@ -34,6 +29,3 @@ https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#debugging-with-g
 
 [3].
 https://github.com/riscv/riscv-openocd
-
-[4].
-https://github.com/riscv-software-src/opensbi/blob/v1.0/lib/utils/sys/htif.c#L127
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
