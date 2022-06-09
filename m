Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6EBC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 14:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D7A7610F9;
	Thu,  9 Jun 2022 14:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3Ng_xiNoLoK; Thu,  9 Jun 2022 14:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B215610F6;
	Thu,  9 Jun 2022 14:16:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C708B1BF378
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B691B84065
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uPuTbKTkv2U for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 14:15:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 983B984059
 for <buildroot@busybox.net>; Thu,  9 Jun 2022 14:15:58 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id B9D9244053C;
 Thu,  9 Jun 2022 17:15:41 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1654784141;
 bh=zeg87vYg3zh2+kR1GPELdTuRc31RkibTMG0o6rw6nnU=;
 h=From:To:Cc:Subject:Date:From;
 b=YCrJ+Y1rabBx9L5t49XFFeBUlCzKnPFajccCxaqO/KL3DhNreN5ttZE9yuV59/+1x
 7PAjhXB58JbCK78NoNF4cugEIWda/Z0tvLO/TyMUR9fm3/fztUFd4oUzCAPsG5B560
 Yta+oevp+2ylLOKzelXDiWe61v/qLINmXh7E3j2x2K1aRRXZcQK6fBNeJ1hJ3eC7xF
 r51/xKRDJfXrHWHJJly5TYo5NsaXZ5012QyEbnbswJEiG88OsqsH5dgz8AJ9pE+Xh+
 B6oCeyI6WfnaAL6N2+gA1I6zJ4zCzqGDkV+3uEAnB608R455QVzn+HupWsQJX8CvXl
 WuO0fzqsNAmBQ==
To: buildroot@busybox.net
Date: Thu,  9 Jun 2022 17:14:59 +0300
Message-Id: <7ae79f05b1e4275dc7f27bc67344ed5c23229116.1654784099.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rustc: add support for ARMv8 with
 32-bit software
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Oscar Gomez Fuente <oscargomezf@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is not enabled when ARMv8
target hardware is combined with 32-bit software. That is because ARMv7
(32-bit) toolchain is only enabled for BR2_ARM_CPU_ARMV7A which is
mutually exclusive with BR2_ARM_CPU_ARMV8A.

Use ARMv7 toolchain for 32-bit software.

Cc: James Hilliard <james.hilliard1@gmail.com>
Reported-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/rustc/Config.in.host | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 9ce0f6259200..27c3a3cdebe1 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -42,6 +42,9 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 	default y if BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
 	# armv7-unknown-linux-gnueabihf
 	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
+	# armv7-unknown-linux-gnueabihf for armv8 hardware with 32-bit
+	# userspace
+	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
 	# mips-unknown-linux-gnu
 	default y if BR2_mips && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
 	# mips64-unknown-linux-gnuabi64
@@ -86,6 +89,9 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI && BR2_TOOLCHAIN_USES_MUSL
 	# armv7-unknown-linux-musleabihf
 	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
+	# armv7-unknown-linux-musleabihf for armv8 hardware with 32-bit
+	# userspace
+	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
 	# i586-unknown-linux-gnu
 	default y if BR2_i586 && BR2_TOOLCHAIN_USES_GLIBC
 	# i586-unknown-linux-musl
@@ -116,6 +122,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH
 	default "armv5te" if BR2_ARM_CPU_ARMV5
 	default "arm" if BR2_ARM_CPU_ARMV6
 	default "armv7"  if BR2_ARM_CPU_ARMV7A
+	default "armv7"  if BR2_ARM_CPU_ARMV7A || (BR2_arm && BR2_ARM_CPU_ARMV8A)
 	default "riscv64gc" if BR2_RISCV_64
 	default BR2_ARCH
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
