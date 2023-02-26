Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B986BC6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 13:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E99080C3B;
	Sun, 26 Feb 2023 13:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E99080C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8y0NSGLr5di; Sun, 26 Feb 2023 13:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E88C80C38;
	Sun, 26 Feb 2023 13:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E88C80C38
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC1DC1BF361
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEEBD4028B
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEEBD4028B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0nJh4nCdp3J for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 13:18:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A873940287
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A873940287
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 13:18:50 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.219.212])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E898D5FF7A;
 Sun, 26 Feb 2023 14:18:45 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 14:18:38 +0100
Message-Id: <20230226131838.509224-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677417527;
 bh=l8ScRqObzEeK12rerj2rQuFdPuUtZDCdy1o6QEKogxM=;
 h=From:To:Cc:Subject:Date:From;
 b=HyN7C4t8j/n7afYr6zwndxiJu36RgFxmlKW4/y1lKRr2MTn8V7qIF09UUtqDWTiMh
 GcFfcSoc8jUYhv/wha4OLM0+FW12+fIlDfTWTK5pc1dEv/YQQQOKMw0DSvJwjBSlCw
 movk2nAM6vrNszGb5m0irTUyBgzNm5PTgZOnQCNUOUiHxe9UnFfDcRb8zPMZh/oRgL
 +Vlw9TNHuoxMrrIuCzTfDBrLq7kyQMws2gO81XUTGRMCNR190aR0xCkQt4YquWQy2U
 gLeEwZ4UJMRKzphj4+2nMcG5Gb8LAWKvdmYEfK+/8Os89DBUqm1+UWbt7UY83dDXqX
 iaSY+HePEO7hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HyN7C4t8
Subject: [Buildroot] [PATCH next 1/1] configs/spike_riscv64: bump kernel to
 6.1.14
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux Kernel 6.1 now being officially promoted to be a LTS, this
commit bump the kernel version of this defconfig to 6.1.14.

A Kernel config fragment "linux.fragment" is now needed as the kernel
no longer enable SBI v0.1 support and the earlycon RISC-V SBI in its
riscv arch defconfig. See [1] [2].

The Spike riscv-isa-sim was updated upstream accordingly [3].

In order to keep a smooth transition, this kernel config fragment
re-enable those options to make sure this kernel will work with
both old Spike versions (not including commit [3] like the v1.1.0
currently included in Buildroot), and newer versions. This commit
was also successfully tested with riscv-isa-sim at commit
0d1a48c0c0.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6f562570b9c5d6a3e30d87aec60a9d8f22a3203c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3938d5a2f9369d1ebd56320629fed395ce327e9c
[3] https://github.com/riscv-software-src/riscv-isa-sim/commit/191634d2854dfed448fc323195f9b65c305e2d77

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on top of branch next at commit b793f3a with commands:

    make spike_riscv64_defconfig
    make
    board/spike/riscv64/start.sh
---
 board/spike/riscv64/linux.fragment | 3 +++
 configs/spike_riscv64_defconfig    | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 board/spike/riscv64/linux.fragment

diff --git a/board/spike/riscv64/linux.fragment b/board/spike/riscv64/linux.fragment
new file mode 100644
index 0000000000..b443b0ab36
--- /dev/null
+++ b/board/spike/riscv64/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_RISCV_SBI_V01=y
+CONFIG_HVC_RISCV_SBI=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index e23f1ce32c..73ea566084 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -2,9 +2,10 @@ BR2_riscv=y
 BR2_RISCV_64=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.86"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/spike/riscv64/linux.fragment"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
