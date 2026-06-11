Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E94ACD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2921F60EF8;
	Fri, 12 Jun 2026 11:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzAmYNsU9qI8; Fri, 12 Jun 2026 11:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD07861171
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263488;
	bh=9rz9wGyT+peVmvfw72wu1PxXKReBBQfegQZuQqgihNo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YShEKemzrELSkjUiFjkvLLQg2czckDV3TCM0vAPkYThDRDeyTEA5GA6nUBUFfFdK5
	 eyU6+/J91V2BbBh4IK26p/ndiwvkRdebakfEKmrE2yKmM+q+f6A3jSfWNMZpUgGXy5
	 +qpGt+pf22l+ig+0PP1jx9tzc75nmX6nm6QkL0pyhJhQpFKQRWq4VwAmMPozGG9at2
	 /UlYgnNyP+oqtcHc278INSu85VcqRqsYj9VUYfdpG5ahpF+G23/u9IkFa8xxQBe5S9
	 qHb7NNRhi+02oCmcW44cdVWNMfBQYp/kEVtB2LrdajrjGJfNAYNsYAgvNgQX+aaHMu
	 KwbfXitz1dq+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD07861171;
	Fri, 12 Jun 2026 11:24:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5C96237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 843664067C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiNBc9NTwRQ5 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A37CF4067E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A37CF4067E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D3F4880EA; Fri, 12 Jun 2026 11:23:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:56:23 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 364a271d9418fadbc503a99c80a95c24d01c51b7
X-Git-Newrev: 470e20cadd41f1f56ce67274df53ab532ebffbba
X-Patchwork-Hint: ignore
Message-Id: <20260612112350.7D3F4880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] configs/arcturus_ucp1020:
 specify Linux license file
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/470e20cadd41f1f56ce67274df53ab532ebffbba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit bbb1e2c8df3d6eee107b64c949557009489aaaac)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                                 | 1 -
 board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash | 1 +
 board/arcturus/ppc-ucp1020/patches/linux/linux.hash                 | 2 ++
 board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash                 | 2 ++
 configs/arcturus_ucp1020_defconfig                                  | 3 +++
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ce6fcf28ae..62ffc5ca2d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -72,7 +72,6 @@ boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_pat
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
 configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
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
