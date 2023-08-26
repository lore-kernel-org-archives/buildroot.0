Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12977C83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 17:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A642F418B3;
	Sat, 26 Aug 2023 17:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A642F418B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16THhr092r8y; Sat, 26 Aug 2023 17:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C173F41911;
	Sat, 26 Aug 2023 17:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C173F41911
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE2A91BF589
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 17:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5E1283281
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 17:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5E1283281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYzJsIr5Uco6 for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 17:51:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9880582ECF
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 17:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9880582ECF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8147685FA8; Sat, 26 Aug 2023 17:51:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:50:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6a96f8be27f98d3132cc2464ecd33594c2f1cd3
X-Git-Newrev: 01893c74ebee2fb7be5248d35ff33d387ca5a92d
X-Patchwork-Hint: ignore
Message-Id: <20230826175111.8147685FA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hifive_unleashed_defconfig: bump
 to kernel 5.10.190
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

commit: https://git.buildroot.net/buildroot/commit/?id=01893c74ebee2fb7be5248d35ff33d387ca5a92d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have to bump the kernel version to build with gcc >= 12 for riscv
and zicsr/zifencei extension [1] [2].

Similar to 0a4ac1e7fa715669aa2ab2a58b564fc875c07c68.

Fixes:
./arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
./arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01', extension `zicsr' required

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7486227fa47aa84b102be18fd9985f6e8e11e756
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0b077b22ea9ff698840ff9305d9382935fb41540

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/hifive_unleashed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 37898284ac..c9d4a31ede 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -28,7 +28,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.190"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
 BR2_LINUX_KERNEL_IMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
