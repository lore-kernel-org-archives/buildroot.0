Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AB1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77F56610CE;
	Sat, 28 May 2022 19:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MS7imjXjv36o; Sat, 28 May 2022 19:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8A260C04;
	Sat, 28 May 2022 19:46:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 886BB1BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 857A34186A
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtw5EwfSFSZX for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:46:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B16154184B
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:46:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6DAB685EEB; Sat, 28 May 2022 19:34:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 21:46:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7f7d13a6176b09c59cffed87f31bea346f07433
X-Git-Newrev: 4245bc29d4ac37ffaaaee0f502a7abf3729a6715
X-Patchwork-Hint: ignore
Message-Id: <20220528193445.6DAB685EEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_arm_vexpress_tz_defconfig:
 optee-os needs dtc compiler
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

commit: https://git.buildroot.net/buildroot/commit/?id=4245bc29d4ac37ffaaaee0f502a7abf3729a6715
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

optee-os 3.17.0 need host-dtc package to compile the devicetree
added by the commit [1].

[1] https://github.com/OP-TEE/optee_os/commit/3e03eb38ae68be06f43432d8034b69b7b3bd7ff6

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2510255578

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/qemu_arm_vexpress_tz_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index def11721ae..f8956f1c05 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -38,6 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
 
 # OP-TEE components
 BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
 BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
 BR2_PACKAGE_OPTEE_BENCHMARK=y
 BR2_PACKAGE_OPTEE_EXAMPLES=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
