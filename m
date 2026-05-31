Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D90CD6E55
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1167561BF9;
	Sun, 31 May 2026 06:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVKfq5nt_2xi; Sun, 31 May 2026 06:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6B8461AC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208028;
	bh=5CiPFcrdvesbFXMYdPSGeOX/RuqVUdtkwF7fjZUpL7M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j2HMmGr0DzoPbwihZ6DX/cGqy4260qnsSgVH9WJ/nOeNNPQL03CHC6qyqS3CKsG1z
	 /aKxdCV3qnGYsO/5meNH6ZduI9RSCiNMKGiawzXjHP5oY6SSVMWomYFZp5WXrAIraL
	 /lj5w8qK88fDlLWsKl1q/cS0JiVRAIp63UA8+SzKcHZXvyubDFuwroXBCmORpYnDRT
	 lVP27n+CBaElmqfLUym2Gdti2SJ+Vj+keCZsa/uLLgwU0IN6WYfvY0F1Z54llb6jNi
	 fe8u65CKwmiDIf3aNpkPjrZ4MqBh3Y7W/WF6MTm82gBeNUNs7/8bxhdx61W/bc10JS
	 kH+012oJtQrRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6B8461AC4;
	Sun, 31 May 2026 06:13:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38D28397
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3642C403DA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PS7LJX0JDyqB for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75422402BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75422402BC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:13:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2543E8769F; Sun, 31 May 2026 06:13:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 08:13:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7a60724dc4490c7845ee446fd424c2be6ba11599
X-Git-Newrev: 3d5302d4201912295ee37abe51cfd3b97ba8d38b
X-Patchwork-Hint: ignore
Message-Id: <20260531061331.2543E8769F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/pine64_pinecube:
 enable FORCE_CHECK_HASHES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d5302d4201912295ee37abe51cfd3b97ba8d38b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Jan Havran <havran.jan@email.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                            | 1 -
 board/pine64/pinecube/patches/linux/linux.hash | 2 ++
 board/pine64/pinecube/patches/uboot/uboot.hash | 2 ++
 configs/pine64_pinecube_defconfig              | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ca622d4d92..684921535c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -130,7 +130,6 @@ configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
-configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/pine64/pinecube/patches/linux/linux.hash b/board/pine64/pinecube/patches/linux/linux.hash
new file mode 100644
index 0000000000..788483030c
--- /dev/null
+++ b/board/pine64/pinecube/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  6f16ff302599f6fe34742890322cf0775703105fbd8767449682fca6af0fb782  linux-6.18.33.tar.xz
diff --git a/board/pine64/pinecube/patches/uboot/uboot.hash b/board/pine64/pinecube/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..36322a6a90
--- /dev/null
+++ b/board/pine64/pinecube/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/pine64_pinecube_defconfig b/configs/pine64_pinecube_defconfig
index 742be94d17..2a0c567d76 100644
--- a/configs/pine64_pinecube_defconfig
+++ b/configs/pine64_pinecube_defconfig
@@ -4,6 +4,8 @@ BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/pine64/pinecube/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="pinecube"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Pine64 Pinecube"
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
