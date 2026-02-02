Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E40E7DEFA
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BDAE407BB;
	Mon,  2 Feb 2026 15:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z32kTIqnW24S; Mon,  2 Feb 2026 15:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D08D40B4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770046823;
	bh=jaCG5yRoC9kQNRhQiv0lMbj++6uqxCYdP3EDBu+XkMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HZcc4BI+koraJt8OVQNhLb5QQmQW4KXqVSurz609V5FbcDNQnmxYgGdmv8/3pw8RV
	 I36AqQmuAOji1mkALZTrO9P6/Am89J5MI6XzUJPwjHW1mSpruZgZNjNZW8MON7/zu3
	 bIHIq0EAySVcYW86ka+27KFkqzwD5ujyPJT/m11t4Q/6gzaLBwW9tX8Isipf++Os+K
	 KGvS3iVOowRXaoU3HhogobBvyLAUkOudB/WnvcKbqIdNOR4RHT45zZwdtHDV/4R5mW
	 /CP0AvxlAbeLLloVtwDdUyf046jdtqrWIF+0HOrKEufpVkU20BbyrrvW2jCR5Y+n5A
	 iIM+LoS2M1vFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D08D40B4F;
	Mon,  2 Feb 2026 15:40:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4391C70E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2731160723
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewS68HuO2gvB for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 250D2600C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 250D2600C4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E16F863AD; Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 16:21:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b327cb7f2a1b0bcbca632c6a8dbe001b01565cb
X-Git-Newrev: d214905353be2227290243e85554f817e1d0253c
X-Patchwork-Hint: ignore
Message-Id: <20260202154017.0E16F863AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_hppa_b160l: new defconfig
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7798572067919337401=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7798572067919337401==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d214905353be2227290243e85554f817e1d0253c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig to run Linux on a HP Visualize B160L PA-RISC
Workstation, emulated with Qemu.

While at it, add this defconfig to myself in DEVELOPERS.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Romain Naour <romain.naour@gmail.com>
[Julien: update kernel to 6.18.7 to align with other qemu defconfigs]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                        |  2 ++
 board/qemu/hppa-b160l/readme.txt  | 33 +++++++++++++++++++++++++++++++++
 configs/qemu_hppa_b160l_defconfig | 18 ++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cb5fc3a4ee..7cc4fcbace 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3372,8 +3372,10 @@ F:	arch/Config.in.hppa
 F:	arch/arch.mk.hppa
 F:	board/arm/foundation-v8/
 F:	board/bananapi/bananapi-m2-zero/
+F:	board/qemu/hppa-b160l/
 F:	configs/arm_foundationv8_defconfig
 F:	configs/bananapi_m2_zero_defconfig
+F:	configs/qemu_hppa_b160l_defconfig
 F:	configs/uevm5432_defconfig
 F:	package/i7z/
 F:	package/msr-tools/
diff --git a/board/qemu/hppa-b160l/readme.txt b/board/qemu/hppa-b160l/readme.txt
new file mode 100644
index 0000000000..052ca9b848
--- /dev/null
+++ b/board/qemu/hppa-b160l/readme.txt
@@ -0,0 +1,33 @@
+Introduction
+============
+
+The qemu_hppa_b160l_defconfig is meant to run Linux on a HP Visualize B160L
+PA-RISC Workstation[1], emulated with Qemu.
+
+Building
+========
+
+  $ make qemu_hppa_b160l_defconfig
+  $ make
+
+Generated files under output/images:
+
+* rootfs.ext4: the root filesystem.
+* vmlinux: the Linux kernel.
+
+Running under Qemu
+==================
+
+Run the emulation with:
+
+  qemu-system-hppa \
+      -machine B160L \
+      -append "rootwait root=/dev/sda" \
+      -hda output/images/rootfs.ext4 \
+      -kernel output/images/vmlinux \
+      -nographic \
+      -smp 2 # qemu_hppa_b160l_defconfig
+
+The login prompt will appear in the terminal that started Qemu.
+
+[1] https://www.openpa.net/systems/hp-visualize_b132l_b160l_b180l.html
diff --git a/configs/qemu_hppa_b160l_defconfig b/configs/qemu_hppa_b160l_defconfig
new file mode 100644
index 0000000000..7e3e561e3f
--- /dev/null
+++ b/configs/qemu_hppa_b160l_defconfig
@@ -0,0 +1,18 @@
+BR2_hppa=y
+BR2_parisc11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

--===============7798572067919337401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7798572067919337401==--
