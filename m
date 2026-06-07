Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8B4CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 20:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE2E880C33;
	Sun,  7 Jun 2026 20:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tf6Z_zjrpBT2; Sun,  7 Jun 2026 20:11:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0143880CDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780863072;
	bh=HxzHygSS6kYbnI+jmhfqSFLIbr7VEukbvpDdmlDYOJ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AenLwmuArlqzBD8FrLS745SogYsK4+YSHdQ9Y/gtOYBTJookiIZPVOD4OO4q33ojA
	 4jpwVekDlGbtFjK4C4tS2CkNj5rlucGrTWcP7PePS6NWpkOdcCNThC5fKXH3H+cO6U
	 1f1FwwucKDcSnyeDZcO6CAjufi0/UeHDz8U9UDG5BpGcXuaw7d4PPvg7UDXoccJsuF
	 nPSM97f7MYf5h+qYJpn0CsRvh9MYeX2A2HBVsEzkmPdPBrItxR8Lq9MzUPanhJvaIf
	 wO3csiE++KxGMMCgzGT9vtTW/u155mirpNPBrWo2HpmgMwFrfGh1Jn+4Ls2buYPlKZ
	 uKCwn9WzBSiYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0143880CDA;
	Sun,  7 Jun 2026 20:11:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA047345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 20:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F52C80CDA
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 20:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsy1XgEcFLje for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 20:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E4980C33
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2E4980C33
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 20:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D28A687CE9; Sun,  7 Jun 2026 20:10:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Jun 2026 21:50:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1339bba787deecda28461bff591e029a38d14b53
X-Git-Newrev: bbb1e2c8df3d6eee107b64c949557009489aaaac
X-Patchwork-Hint: ignore
Message-Id: <20260607201052.D28A687CE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/arcturus_ucp1020: specify Linux
 license file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbb1e2c8df3d6eee107b64c949557009489aaaac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The used Linux kernel (4.4.144) does not contain the default license
files as those were only added in 4.16 with commit e00a844aca
("LICENSES: Add Linux syscall note exception"), so specify the correct
license file to fix:

make legal-info
..
cp: cannot stat '/path/to/output/build/linux-headers-custom/LICENSES/preferred/GPL-2.0': No such file or directory

And add the sha256sum to the .hash file.
Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913808 (arcturus_ucp1020_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Michael Durrant <mdurrant@ArcturusNetworks.com>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                                 | 1 -
 board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash | 1 +
 board/arcturus/ppc-ucp1020/patches/linux/linux.hash                 | 2 ++
 board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash                 | 2 ++
 configs/arcturus_ucp1020_defconfig                                  | 3 +++
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b4e7919c07..cf197e4b16 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -71,7 +71,6 @@ boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_p
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
-configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash b/board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/arcturus/ppc-ucp1020/patches/linux/linux.hash b/board/arcturus/ppc-ucp1020/patches/linux/linux.hash
new file mode 100644
index 0000000000..eafb86d8cb
--- /dev/null
+++ b/board/arcturus/ppc-ucp1020/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  5ad0192e5cd10eca5f9fabb3234f2bfcbafba3382a9577139cc66be629e5bafa  linux-v20190618.tar.gz
diff --git a/board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash b/board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..eb9744043c
--- /dev/null
+++ b/board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  eba8aaf634affec7c27a55b899c404a85a0c219c3f814d576793e3c21b711b05  uboot-v20190618.tar.gz
diff --git a/configs/arcturus_ucp1020_defconfig b/configs/arcturus_ucp1020_defconfig
index 8e489f7f19..c0423032bc 100644
--- a/configs/arcturus_ucp1020_defconfig
+++ b/configs/arcturus_ucp1020_defconfig
@@ -1,6 +1,8 @@
 BR2_powerpc=y
 BR2_powerpc_8548=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_GLOBAL_PATCH_DIR="board/arcturus/ppc-ucp1020/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -8,6 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCP1020-kernel,v20190618)/linux-v20190618.tar.gz"
+BR2_LINUX_KERNEL_LICENSE_FILES="COPYING"
 BR2_LINUX_KERNEL_DEFCONFIG="ucp1020"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ucp1020"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
