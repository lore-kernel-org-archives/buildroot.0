Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EABCD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D8C857C1;
	Tue,  9 Jun 2026 13:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39y5ttxGsvGc; Tue,  9 Jun 2026 13:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE2F857B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010146;
	bh=QtThRzNxUlDM243dFplrmSOULiMoWULLRgKTYwGHNq8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R2nfdaglLCcifhM9WT0jLz1U5G89Qwy0HFojN+1N4NUS9lm1h3oBKSq90iTV5BtYl
	 +jCx/VXaFbrY+4SPYBohr2cIPFofWS8f8YrBMSQW92XRPe5pMfxQSWShE8H1HCIp0Z
	 fvPCuEAvPR5htjEYDCQlKngrS5qm31ZkHAg5V+Cw/38U/81HSD1C3tiCNGyfRLtGLN
	 yW9GxEdUbtichGdcWA6U+m8M09i6QRmZOPu0NYPuo7Lg6421krejocaANLFijJdV3w
	 2+ySg6/cd/IGrISTuFx99hWLI34RS/WJiK/iiSFcbKZNqzeInJ7PBankRXyk/cR8ER
	 cu/gtBdQ5UZVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE2F857B4;
	Tue,  9 Jun 2026 13:02:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD5C190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F10F6F67E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InzIdWy9elEu for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F6156F691
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F6156F691
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA11F87E68; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:53:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c1fa6ce67448ef8bab16d795623be730ff658ea
X-Git-Newrev: da278ba1dab7e29369879c8a29cbd1b42dbe9ce0
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.DA11F87E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: bump to version 2.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da278ba1dab7e29369879c8a29cbd1b42dbe9ce0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release announce on mailing list, see [1].
For release general news, see [2].

This commit removes all package patches as they are all included in
this version, except patch #74 for which an alternate fix is included
in this new version in commit [3].

Tested by compiling and booting the defconfigs using grub2:

qemu_aarch64_sbsa_defconfig
qemu_arm_ebbr_defconfig
qemu_loongarch64_virt_efi_defconfig
qemu_riscv64_virt_efi_defconfig
pc_x86_64_bios_defconfig
pc_x86_64_efi_defconfig

and running the tests:

    support/testing/run-tests \
        -d dl -o output_folder \
            tests.boot.test_grub \
            tests.fs.test_iso9660

[1] https://lists.gnu.org/archive/html/grub-devel/2026-01/msg00029.html
[2] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.14/NEWS
[3] https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/0739d24cd1648531d0708d1079ff6bbfa6140268

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-grub-core-extra_deps.lst-file-in-release.patch |  37 --
 boot/grub2/0002-misc-Implement-grub_strlcpy.patch  |  70 ---
 boot/grub2/0003-fs-ufs-Fix-a-heap-OOB-write.patch  |  36 --
 ...-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch |  36 --
 ...ar-Initialize-name-in-grub_cpio_find_file.patch |  45 --
 ...-Integer-overflow-leads-to-heap-OOB-write.patch |  94 ----
 ...7-fs-f2fs-Set-a-grub_errno-if-mount-fails.patch |  36 --
 ...s-hfsplus-Set-a-grub_errno-if-mount-fails.patch |  40 --
 ...s-iso9660-Set-a-grub_errno-if-mount-fails.patch |  38 --
 boot/grub2/0010-fs-iso9660-Fix-invalid-free.patch  |  55 --
 .../0011-fs-jfs-Fix-OOB-read-in-jfs_getent.patch   |  68 ---
 ...OOB-read-caused-by-invalid-dir-slot-index.patch |  69 ---
 ...full-40-bits-offset-and-address-for-a-dat.patch | 133 -----
 ...nsistent-signed-unsigned-types-usage-in-r.patch |  90 ----
 ...Fix-out-of-bounds-read-for-inline-extents.patch |  51 --
 .../grub2/0016-fs-xfs-Fix-out-of-bounds-read.patch |  48 --
 ...suring-failing-to-mount-sets-a-grub_errno.patch |  47 --
 .../0018-kern-file-Ensure-file-data-is-set.patch   |  37 --
 ...e-Implement-filesystem-reference-counting.patch | 449 -----------------
 ...pback-Reference-tracking-for-the-loopback.patch | 108 ----
 .../0021-kern-disk-Limit-recursion-depth.patch     | 125 -----
 ...partition-Limit-recursion-in-part_iterate.patch |  49 --
 ...-script-execute-Limit-the-recursion-depth.patch |  60 ---
 ...ter-net_default_ip-and-net_default_mac-va.patch |  34 --
 ...variables-hooks-when-interface-is-unregis.patch |  93 ----
 ...-OOB-write-in-grub_net_search_config_file.patch |  89 ----
 ...tp-Fix-stack-buffer-overflow-in-tftp_open.patch | 120 -----
 ...rs-jpeg-Do-not-permit-duplicate-SOF0-mark.patch |  38 --
 ...ix-for-an-integer-overflow-in-grub_dl_ref.patch | 143 ------
 ...ck-for-the-SHF_INFO_LINK-flag-in-grub_dl_.patch |  46 --
 ...xtcmd-Missing-check-for-failed-allocation.patch |  39 --
 .../0032-commands-ls-Fix-NULL-dereference.patch    |  37 --
 ...p-Unregister-the-check_signatures-hooks-o.patch |  36 --
 ...l-Remove-variables-hooks-on-module-unload.patch |  42 --
 ...t-Remove-variables-hooks-on-module-unload.patch |  39 --
 ...eger-overflow-leads-to-heap-OOB-write-or-.patch |  40 --
 ...-Integer-overflow-leads-to-heap-OOB-write.patch |  58 ---
 ...ad-Fix-an-integer-overflow-when-supplying.patch |  74 ---
 ...st-Stack-overflow-due-to-unlimited-recurs.patch |  88 ----
 ...nicmd-Block-the-dump-command-in-lockdown-.patch |  38 --
 ...mrw-Disable-memory-reading-in-lockdown-mo.patch |  55 --
 ...xdump-Disable-memory-reading-in-lockdown-.patch |  42 --
 .../grub2/0043-fs-bfs-Disable-under-lockdown.patch |  57 ---
 ...s-Disable-many-filesystems-under-lockdown.patch | 396 ---------------
 ...Use-safe-math-macros-to-prevent-overflows.patch | 551 ---------------------
 ...t-overflows-when-allocating-memory-for-ar.patch |  47 --
 ...if-returned-pointer-for-allocated-memory-.patch | 157 ------
 ...75-ofdisk-Call-grub_ieee1275_close-when-g.patch |  36 --
 ...Use-safe-math-macros-to-prevent-overflows.patch | 362 --------------
 ...overflows-when-allocating-memory-for-arra.patch |  87 ----
 ...overflows-when-assigning-returned-values-.patch | 110 ----
 ...Use-safe-math-macros-to-prevent-overflows.patch | 143 ------
 ...ent-overflows-when-allocating-memory-for-.patch |  45 --
 ...k-if-returned-pointer-for-allocated-memor.patch |  93 ----
 ...missing-NULL-check-after-grub_strdup-call.patch |  29 --
 ...Use-safe-math-macros-to-prevent-overflows.patch | 250 ----------
 ...-overflows-when-allocating-memory-for-arr.patch |  50 --
 ...f-returned-pointer-for-allocated-memory-i.patch |  36 --
 ...-fs-sfs-Check-if-allocated-memory-is-NULL.patch |  37 --
 ...ute-Fix-potential-underflow-and-NULL-dere.patch |  37 --
 ...sdep-unix-getroot-Fix-potential-underflow.patch |  40 --
 ...Ensure-consistent-overflow-error-messages.patch |  60 ---
 ...i-Define-GRUB_EHCI_TOGGLE-as-grub_uint32_.patch |  35 --
 ...-Use-safe-math-to-avoid-an-integer-overfl.patch |  46 --
 ...ion-Add-sanity-check-after-grub_strtoul-c.patch |  51 --
 ...-Add-sanity-check-after-grub_strtoul-call.patch |  62 ---
 ...86-linux-Cast-left-shift-to-grub_uint32_t.patch |  35 --
 ...i386-bsd-Use-safe-math-to-avoid-underflow.patch |  61 ---
 ...ork-out-of-bounds-read-for-inline-and-ext.patch |  69 ---
 ...grub_xfs_iterate_dir-return-value-in-case.patch |  53 --
 ...agate-incorrect-inode-error-from-grub_xfs.patch |  77 ---
 ...le-root-inode-read-failure-in-grub_xfs_mo.patch |  29 --
 ...rs-ieee1275-ofnet-Add-missing-grub_malloc.patch |  36 --
 .../0074-Constant-time-grub_crypto_memcmp.patch    |  64 ---
 boot/grub2/grub2.hash                              |   4 +-
 boot/grub2/grub2.mk                                |  33 +-
 76 files changed, 3 insertions(+), 6247 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
