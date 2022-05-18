Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AB4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89AE461275;
	Wed, 18 May 2022 19:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Y8t-XGAyHPM; Wed, 18 May 2022 19:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E6AE6126C;
	Wed, 18 May 2022 19:23:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B2F01BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25F3F405CF
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2Cr0st_Ngys for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A6F541044
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:20:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 27A9486065; Wed, 18 May 2022 19:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 21:16:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e59b3acc3603e55fbaec25406258ec9ca9623564
X-Git-Newrev: 1e2fe860f3a261fc877591c056808d6fb30e25d4
X-Patchwork-Hint: ignore
Message-Id: <20220518190953.27A9486065@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc64*: downgrade binutils to
 2.36.1
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
Content-Type: multipart/mixed; boundary="===============2178955718260688822=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2178955718260688822==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1e2fe860f3a261fc877591c056808d6fb30e25d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ppc64 or powernv Linux defconfig fail to build with gcc 11 and/or
binutils 2.37 [1] :

  CC      kernel/kexec_file.o
  Cannot find symbol for section 10: .text.unlikely.
  kernel/kexec_file.o: failed

Patches have been sent upstream and should reach Linux 5.18. Until
then, limit binutils to 2.36.1 which doesn't raise the issue.

[1] https://github.com/linuxppc/issues/issues/388

Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/qemu_ppc64_e5500_defconfig      | 1 +
 configs/qemu_ppc64_pseries_defconfig    | 1 +
 configs/qemu_ppc64le_powernv8_defconfig | 1 +
 configs/qemu_ppc64le_pseries_defconfig  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 072240c99c..c455fcffe4 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -3,6 +3,7 @@ BR2_powerpc64=y
 BR2_powerpc_e5500=y
 
 # System
+BR2_BINUTILS_VERSION_2_36_X=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index ad523ec2ef..efa8106ff1 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -3,6 +3,7 @@ BR2_powerpc64=y
 BR2_powerpc_power7=y
 
 # System
+BR2_BINUTILS_VERSION_2_36_X=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 
diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
index a784695ddf..773ee4023f 100644
--- a/configs/qemu_ppc64le_powernv8_defconfig
+++ b/configs/qemu_ppc64le_powernv8_defconfig
@@ -3,6 +3,7 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 
 # System
+BR2_BINUTILS_VERSION_2_36_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_SYSTEM_DHCP="eth0"
 
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index f10b0fdf40..8a20f58f1e 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -3,6 +3,7 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 
 # System
+BR2_BINUTILS_VERSION_2_36_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_SYSTEM_DHCP="eth0"
 

--===============2178955718260688822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2178955718260688822==--
