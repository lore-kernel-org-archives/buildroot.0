Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C15C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 16:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D288360BA1;
	Sat, 15 Jan 2022 16:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MGyyYp7ik2-3; Sat, 15 Jan 2022 16:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD3060ADC;
	Sat, 15 Jan 2022 16:03:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E566E1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF0FA81419
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxuq5vMQVG98 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 16:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37678813F8
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 16:03:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CF74C82B5A; Sat, 15 Jan 2022 15:56:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 17:02:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a17d4aba54e62359cba638809fde5752dd40cf59
X-Git-Newrev: 04afe86cd7e85790360548647419a5a40efa6936
X-Patchwork-Hint: ignore
Message-Id: <20220115155637.CF74C82B5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/arm-vexpress-tz: use enable=on
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

commit: https://git.buildroot.net/buildroot/commit/?id=04afe86cd7e85790360548647419a5a40efa6936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Qemu 6.0.0 [1], a warning appear in the log if a short-form
boolean option is used.

[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=ccd3b3b8112b670fdccf8a392b8419b173ffccb4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/arm-vexpress-tz/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index 7e62e943a6..3036dd54ca 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -16,7 +16,7 @@ from the image directory:
 	-smp 1 -s -m 1024 -d unimp \
 	-serial stdio \
 	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
-	-semihosting-config enable,target=native \
+	-semihosting-config enable=on,target=native \
 	-bios flash.bin # qemu_arm_vexpress_tz_defconfig
 
 The boot stage traces (if any) followed by the login prompt will appear
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
