Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E66C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 07:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AACC40B8A;
	Tue, 19 Jul 2022 07:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AACC40B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBJEBOM5AlvF; Tue, 19 Jul 2022 07:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4494F4019D;
	Tue, 19 Jul 2022 07:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4494F4019D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B63701BF355
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9004F4154D
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9004F4154D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alu9O1lBL6uy for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 07:40:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF4D841527
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF4D841527
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 07:40:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 32DB51C0008;
 Tue, 19 Jul 2022 07:40:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 09:40:38 +0200
Message-Id: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658216446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IL+9Tad3wfIP8INeKRXhAHE76Ne1UYOaUihZWk25a+w=;
 b=MPXLHnZTj91spfwyHjLKbJRMAUyH0wHkqnl/ND63RySFmZY2khCJQXhu6+gFPj63IY6UaA
 VGSB+hmlRRiaF2lr50lIXQ7PWKf7kNc9jgJlEo7npMe3KYdmhFAdodMrDoYSta5Dh3SYEh
 4HoEWazqYCoFqEnqbxoYGWaRo6YEOUDu0wKaTozzfFG+xgrZEJLxBwFIOGyC35aZLcEo8v
 pMT5DLKSPVtWIJLLAGgsM72qwuQcNFTv6v4C3GJhrX6XPJgsOYNybHNAnQi67KnpkT/GVy
 C4nbxalgKO628IpElSdToSqmJbCJTN1pITPWjpaDYLFnjAAN+cKN5bzBdq16mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MPXLHnZT
Subject: [Buildroot] [PATCH 0/4] Update grub to 2.06
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Finally, here it is, the series that drops 150 patches from
boot/grub2/, by bumping its version to 2.06.

As explained in the commit log, I have verified that all patches we
had on grub2 are indeed part of the grub 2.06 release.

Also, I wanted to add some test cases to easily test Grub. As part of
this, I needed a pre-built version of EDK2 for Qemu, which is why this
series adds a new ovmf-bin package. I could have used the boot/edk2
package to build it from source, but it sounded quicker and easier for
tests to use a pre-built version.

The test cases have some overlap with the ISO9660 test cases (some of
which use Grub), but I found it useful to have non-ISO9660 tests for
Grub, that use Grub in a more traditional manner. 4 test cases are
added Grub i386 BIOS, Grub i386 UEFI, Grub x86-64 UEFI, Grub AArch64
UEFI.

The ISO9660 test cases have been verified to work correctly with this
series applied.

Best regards,

Thomas

Thomas Petazzoni (4):
  boot/ovmf-bin: new package
  boot/grub2: update to 2.06
  boot/grub2: update readme.txt details
  support/testing/tests/boot: new test cases for Grub

 DEVELOPERS                                    |     3 +
 boot/Config.in                                |     1 +
 ...x-GRUB-i386-pc-build-with-Ubuntu-gcc.patch |   313 -
 ...lexer-fatal-errors-actually-be-fatal.patch |    73 -
 ...e-arithmetic-primitives-that-check-f.patch |   128 -
 ...-we-always-have-an-overflow-checking.patch |   246 -
 ...005-calloc-Use-calloc-at-most-places.patch |  1840 ---
 ...low-checking-primitives-where-we-do-.patch |  1326 --
 ...on-t-leak-memory-on-realloc-failures.patch |    72 -
 ...-not-load-more-than-one-NAME-section.patch |    41 -
 ...fxmenu-Fix-double-free-in-load_image.patch |    39 -
 ...ree-in-grub_xnu_devprop_add_property.patch |    58 -
 ...sure-we-don-t-dereference-past-array.patch |    55 -
 ...012-term-Fix-overflow-on-user-inputs.patch |    69 -
 boot/grub2/0013-udf-Fix-memory-leak.patch     |    59 -
 ...emory-leak-if-grub_create_loader_cmd.patch |    38 -
 .../0015-tftp-Do-not-use-priority-queue.patch |   283 -
 ...t-grub_relocator_alloc_chunk_addr-in.patch |   153 -
 ...t-grub_relocator_alloc_chunk_align-m.patch |   341 -
 ...used-fields-from-grub_script_functio.patch |    37 -
 ...se-after-free-when-redefining-a-func.patch |   113 -
 ...ub_relocator_alloc_chunk_align-top-m.patch |    49 -
 .../0021-hfsplus-Fix-two-more-overflows.patch |    61 -
 ...-potential-data-dependent-alloc-over.patch |   116 -
 .../0023-emu-Make-grub_free-NULL-safe.patch   |    38 -
 ...formed-device-path-arithmetic-errors.patch |   239 -
 ...Propagate-errors-from-copy_file_path.patch |    78 -
 ...x-use-after-free-in-halt-reboot-path.patch |   183 -
 ...id-overflow-on-initrd-size-calculati.patch |    32 -
 ...er-overflows-in-initrd-size-handling.patch |   173 -
 ...m_lock-GUID-and-protocol-type-public.patch |    97 -
 ...efi_status_t-from-grub_efi_get_varia.patch |   149 -
 ...on-to-read-EFI-variables-with-attrib.patch |    78 -
 .../0032-efi-Add-secure-boot-detection.patch  |   541 -
 ...s-Move-verifiers-API-to-kernel-image.patch |  1650 --
 ...-shim_lock-verifier-to-the-GRUB-core.patch | 13225 ----------------
 .../0035-kern-Add-lockdown-support.patch      |   763 -
 ...t-a-variable-if-the-GRUB-is-locked-d.patch |    57 -
 ...-GRUB-when-the-UEFI-Secure-Boot-is-e.patch |    49 -
 ...lockdown-instead-of-hardcoding-a-dis.patch |   232 -
 ...ter-the-acpi-command-when-locked-dow.patch |    76 -
 ...ter-cutmem-and-badram-commands-when-.patch |    70 -
 ...t-commands-that-can-load-BIOS-or-DT-.patch |   105 -
 ...Restrict-setpci-command-when-locked-.patch |    37 -
 ...Restrict-hdparm-command-when-locked-.patch |    35 -
 ...Restrict-GDB-access-when-locked-down.patch |    62 -
 ...-allow-loading-extension-and-package.patch |    61 -
 ...046-docs-Document-the-cutmem-command.patch |    65 -
 ...loading-modules-that-are-not-depende.patch |    87 -
 ...le-out-of-bound-accesses-caused-by-m.patch |   116 -
 ...leak-when-iterating-over-mapped-memo.patch |    40 -
 ...ible-dereference-to-of-a-NULL-pointe.patch |    40 -
 ...net-tftp-Fix-dangling-memory-pointer.patch |    34 -
 ...n-parser-Fix-resource-leak-if-argc-0.patch |    51 -
 ...-kern-efi-Fix-memory-leak-on-failure.patch |    31 -
 ...ix-possible-NULL-pointer-dereference.patch |    66 -
 ...ulib-regexec-Resolve-unused-variable.patch |    90 -
 ...mp-Fix-uninitialized-token-structure.patch |    82 -
 ...-Fix-dereference-of-a-possibly-NULL-.patch |    82 -
 ...egexec-Fix-possible-null-dereference.patch |    83 -
 ...b-regcomp-Fix-uninitialized-re_token.patch |    88 -
 ...e-unnecessary-self-assignment-errors.patch |    42 -
 ...std-Initialize-seq_t-structure-fully.patch |    35 -
 ...heck-for-NULL-before-dereferencing-i.patch |    44 -
 ...re-comp-data-is-freed-before-exiting.patch |   129 -
 ...-If-failed-then-free-vg-variable-too.patch |    29 -
 ...ory-leak-on-uninserted-lv-references.patch |    51 -
 ...odisk-Fix-potential-integer-overflow.patch |    51 -
 ...that-the-volume-name-length-is-valid.patch |    44 -
 ...ix-possible-negative-shift-operation.patch |    43 -
 ...source-leaks-while-constructing-path.patch |   122 -
 ...0-zfs-Fix-possible-integer-overflows.patch |    57 -
 ...-a-check-for-error-allocating-memory.patch |    36 -
 boot/grub2/0072-affs-Fix-memory-leaks.patch   |    83 -
 ...x-possible-unintended-sign-extension.patch |    50 -
 ...pt-mpi-Fix-possible-NULL-dereference.patch |    49 -
 ...slinux-Fix-memory-leak-while-parsing.patch |    44 -
 ...n-Fix-leaking-of-memory-when-process.patch |    53 -
 ...7-commands-hashsum-Fix-a-memory-leak.patch |    57 -
 ...move-unnecessary-return-value-of-gru.patch |    95 -
 ...bfill-Fix-potential-integer-overflow.patch |    79 -
 ...eo_fb-Fix-multiple-integer-overflows.patch |   105 -
 ...deo_fb-Fix-possible-integer-overflow.patch |    40 -
 ...eg-Test-for-an-invalid-next-marker-r.patch |    39 -
 ...-Remove-code-that-coverity-is-flaggi.patch |    35 -
 ...ader-bsd-Check-for-NULL-arg-up-front.patch |    48 -
 .../0086-loader-xnu-Fix-memory-leak.patch     |    39 -
 ...driverkey-data-when-an-error-is-dete.patch |    78 -
 ...k-if-pointer-is-NULL-before-using-it.patch |    43 -
 ...nstall-Fix-NULL-pointer-dereferences.patch |    42 -
 ...v-Fix-incorrect-casting-of-a-signed-.patch |    47 -
 ...x-incorrect-use-of-a-possibly-negati.patch |    51 -
 ...ix-NULL-dereference-in-grub_script_e.patch |    29 -
 ...ire-device_name-is-not-NULL-before-p.patch |    34 -
 ...void-crash-when-using-outside-a-func.patch |    38 -
 ...peated-short-options-that-require-an.patch |    56 -
 ...on-t-crash-on-a-for-loop-with-no-ite.patch |    40 -
 ...ntry-Fix-quoting-in-setparams_prefix.patch |    48 -
 ...misc-Always-set-end-in-grub_strtoull.patch |    47 -
 ...eg-Catch-files-with-unsupported-quan.patch |    53 -
 ...eg-Catch-OOB-reads-writes-in-grub_jp.patch |    48 -
 ...eg-Don-t-decode-data-before-start-of.patch |    40 -
 ...-t-set-up-a-font-with-glyphs-that-ar.patch |    52 -
 ...impermissibly-large-block-sizes-in-r.patch |    47 -
 ...-fetch-a-key-beyond-the-end-of-the-n.patch |    33 -
 ...-use-uninitialized-data-on-corrupt-f.patch |   108 -
 .../0106-fs-hfs-Disable-under-lockdown.patch  |    47 -
 ...fs-Fix-over-read-of-root-object-name.patch |    50 -
 ...ve-to-leaf-level-if-name-length-is-n.patch |    34 -
 ...the-extents-that-getblk-can-consider.patch |    62 -
 ...0110-fs-jfs-Catch-infinite-recursion.patch |    46 -
 ...0111-fs-nilfs2-Reject-too-large-keys.patch |    46 -
 ...search-children-if-provided-number-i.patch |   100 -
 ...ly-bail-on-errors-in-grub_nilfs2_btr.patch |    68 -
 ...4-io-gzio-Bail-if-gzio-tl-td-is-NULL.patch |    67 -
 ..._dynamic_block-clean-up-if-unpacking.patch |    67 -
 ...issing-values-in-huft_build-and-bail.patch |    57 -
 ...o-tl-td-in-init_dynamic_block-if-huf.patch |    42 -
 ...o-beyond-the-end-of-the-data-we-read.patch |    49 -
 ...last-past-the-end-of-the-circular-me.patch |    43 -
 ...120-disk-lvm-Bail-on-missing-PV-list.patch |    35 -
 ...crash-if-an-expected-string-is-not-f.patch |    83 -
 ...22-disk-lvm-Do-not-overread-metadata.patch |   111 -
 ...ze-rlocn-offset-to-prevent-wild-read.patch |    41 -
 ...allow-a-LV-to-be-it-s-own-segment-s-.patch |    39 -
 ...e-the-number-of-stripes-parities-in-.patch |    33 -
 ...trfs-Squash-some-uninitialized-reads.patch |    43 -
 .../0127-kern-parser-Fix-a-memory-leak.patch  |    77 -
 ...parser-Introduce-process_char-helper.patch |   120 -
 ...arser-Introduce-terminate_arg-helper.patch |    66 -
 ...ctor-grub_parser_split_cmdline-clean.patch |    92 -
 ...uffer-Add-variable-sized-heap-buffer.patch |  1237 --
 ...n-parser-Fix-a-stack-buffer-overflow.patch |   248 -
 ...itial-stack-protector-implementation.patch |   466 -
 ...emove-unused-code-to-add-BSS-section.patch |    61 -
 ...-grub_host_to_target32-instead-of-gr.patch |   113 -
 ...ays-use-grub_host_to_target32-to-ini.patch |    39 -
 ...fy-more-of-the-PE32-and-PE32-header-.patch |   169 -
 ...rder-PE-optional-header-fields-set-u.patch |    73 -
 ...-Improve-data_size-value-calculation.patch |    50 -
 ...factor-section-setup-to-use-a-helper.patch |   221 -
 ...-an-option-to-import-SBAT-metadata-i.patch |   264 -
 ...-grub-install-common-Add-sbat-option.patch |    85 -
 ...kip-loading-shim_lock-verifier-with-.patch |   270 -
 ...parse_printf_args-into-format-parsin.patch |    50 -
 ...RING-type-for-internal-printf-format.patch |    68 -
 ...nction-to-check-printf-format-agains.patch |   219 -
 ...k-printf-format-in-the-gui_progress_.patch |    62 -
 ...tes-Disable-the-os-prober-by-default.patch |    87 -
 ...-grub_debug_calloc-compilation-error.patch |    33 -
 ...e-libgrub.pp-depend-on-config-util.h.patch |    66 -
 boot/grub2/grub2.hash                         |     6 +-
 boot/grub2/grub2.mk                           |    28 +-
 boot/grub2/readme.txt                         |    21 +-
 boot/ovmf-bin/Config.in                       |    15 +
 boot/ovmf-bin/ovmf-bin.hash                   |     3 +
 boot/ovmf-bin/ovmf-bin.mk                     |    45 +
 support/testing/tests/boot/test_grub.py       |   153 +
 .../boot/test_grub/genimage-aarch64-efi.cfg   |    32 +
 .../tests/boot/test_grub/grub-aarch64-efi.cfg |     6 +
 .../boot/test_grub/linux-aarch64-efi.config   |     1 +
 .../tests/boot/test_grub/post-build.sh        |     7 +
 .../boot/test_grub/post-image-aarch64-efi.sh  |     8 +
 163 files changed, 287 insertions(+), 32369 deletions(-)
 delete mode 100644 boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
 delete mode 100644 boot/grub2/0002-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch
 delete mode 100644 boot/grub2/0003-safemath-Add-some-arithmetic-primitives-that-check-f.patch
 delete mode 100644 boot/grub2/0004-calloc-Make-sure-we-always-have-an-overflow-checking.patch
 delete mode 100644 boot/grub2/0005-calloc-Use-calloc-at-most-places.patch
 delete mode 100644 boot/grub2/0006-malloc-Use-overflow-checking-primitives-where-we-do-.patch
 delete mode 100644 boot/grub2/0007-iso9660-Don-t-leak-memory-on-realloc-failures.patch
 delete mode 100644 boot/grub2/0008-font-Do-not-load-more-than-one-NAME-section.patch
 delete mode 100644 boot/grub2/0009-gfxmenu-Fix-double-free-in-load_image.patch
 delete mode 100644 boot/grub2/0010-xnu-Fix-double-free-in-grub_xnu_devprop_add_property.patch
 delete mode 100644 boot/grub2/0011-lzma-Make-sure-we-don-t-dereference-past-array.patch
 delete mode 100644 boot/grub2/0012-term-Fix-overflow-on-user-inputs.patch
 delete mode 100644 boot/grub2/0013-udf-Fix-memory-leak.patch
 delete mode 100644 boot/grub2/0014-multiboot2-Fix-memory-leak-if-grub_create_loader_cmd.patch
 delete mode 100644 boot/grub2/0015-tftp-Do-not-use-priority-queue.patch
 delete mode 100644 boot/grub2/0016-relocator-Protect-grub_relocator_alloc_chunk_addr-in.patch
 delete mode 100644 boot/grub2/0017-relocator-Protect-grub_relocator_alloc_chunk_align-m.patch
 delete mode 100644 boot/grub2/0018-script-Remove-unused-fields-from-grub_script_functio.patch
 delete mode 100644 boot/grub2/0019-script-Avoid-a-use-after-free-when-redefining-a-func.patch
 delete mode 100644 boot/grub2/0020-relocator-Fix-grub_relocator_alloc_chunk_align-top-m.patch
 delete mode 100644 boot/grub2/0021-hfsplus-Fix-two-more-overflows.patch
 delete mode 100644 boot/grub2/0022-lvm-Fix-two-more-potential-data-dependent-alloc-over.patch
 delete mode 100644 boot/grub2/0023-emu-Make-grub_free-NULL-safe.patch
 delete mode 100644 boot/grub2/0024-efi-Fix-some-malformed-device-path-arithmetic-errors.patch
 delete mode 100644 boot/grub2/0025-efi-chainloader-Propagate-errors-from-copy_file_path.patch
 delete mode 100644 boot/grub2/0026-efi-Fix-use-after-free-in-halt-reboot-path.patch
 delete mode 100644 boot/grub2/0027-loader-linux-Avoid-overflow-on-initrd-size-calculati.patch
 delete mode 100644 boot/grub2/0028-linux-Fix-integer-overflows-in-initrd-size-handling.patch
 delete mode 100644 boot/grub2/0029-efi-Make-shim_lock-GUID-and-protocol-type-public.patch
 delete mode 100644 boot/grub2/0030-efi-Return-grub_efi_status_t-from-grub_efi_get_varia.patch
 delete mode 100644 boot/grub2/0031-efi-Add-a-function-to-read-EFI-variables-with-attrib.patch
 delete mode 100644 boot/grub2/0032-efi-Add-secure-boot-detection.patch
 delete mode 100644 boot/grub2/0033-verifiers-Move-verifiers-API-to-kernel-image.patch
 delete mode 100644 boot/grub2/0034-efi-Move-the-shim_lock-verifier-to-the-GRUB-core.patch
 delete mode 100644 boot/grub2/0035-kern-Add-lockdown-support.patch
 delete mode 100644 boot/grub2/0036-kern-lockdown-Set-a-variable-if-the-GRUB-is-locked-d.patch
 delete mode 100644 boot/grub2/0037-efi-Lockdown-the-GRUB-when-the-UEFI-Secure-Boot-is-e.patch
 delete mode 100644 boot/grub2/0038-efi-Use-grub_is_lockdown-instead-of-hardcoding-a-dis.patch
 delete mode 100644 boot/grub2/0039-acpi-Don-t-register-the-acpi-command-when-locked-dow.patch
 delete mode 100644 boot/grub2/0040-mmap-Don-t-register-cutmem-and-badram-commands-when-.patch
 delete mode 100644 boot/grub2/0041-commands-Restrict-commands-that-can-load-BIOS-or-DT-.patch
 delete mode 100644 boot/grub2/0042-commands-setpci-Restrict-setpci-command-when-locked-.patch
 delete mode 100644 boot/grub2/0043-commands-hdparm-Restrict-hdparm-command-when-locked-.patch
 delete mode 100644 boot/grub2/0044-gdb-Restrict-GDB-access-when-locked-down.patch
 delete mode 100644 boot/grub2/0045-loader-xnu-Don-t-allow-loading-extension-and-package.patch
 delete mode 100644 boot/grub2/0046-docs-Document-the-cutmem-command.patch
 delete mode 100644 boot/grub2/0047-dl-Only-allow-unloading-modules-that-are-not-depende.patch
 delete mode 100644 boot/grub2/0048-usb-Avoid-possible-out-of-bound-accesses-caused-by-m.patch
 delete mode 100644 boot/grub2/0049-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch
 delete mode 100644 boot/grub2/0050-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch
 delete mode 100644 boot/grub2/0051-net-tftp-Fix-dangling-memory-pointer.patch
 delete mode 100644 boot/grub2/0052-kern-parser-Fix-resource-leak-if-argc-0.patch
 delete mode 100644 boot/grub2/0053-kern-efi-Fix-memory-leak-on-failure.patch
 delete mode 100644 boot/grub2/0054-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch
 delete mode 100644 boot/grub2/0055-gnulib-regexec-Resolve-unused-variable.patch
 delete mode 100644 boot/grub2/0056-gnulib-regcomp-Fix-uninitialized-token-structure.patch
 delete mode 100644 boot/grub2/0057-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch
 delete mode 100644 boot/grub2/0058-gnulib-regexec-Fix-possible-null-dereference.patch
 delete mode 100644 boot/grub2/0059-gnulib-regcomp-Fix-uninitialized-re_token.patch
 delete mode 100644 boot/grub2/0060-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch
 delete mode 100644 boot/grub2/0061-zstd-Initialize-seq_t-structure-fully.patch
 delete mode 100644 boot/grub2/0062-kern-partition-Check-for-NULL-before-dereferencing-i.patch
 delete mode 100644 boot/grub2/0063-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch
 delete mode 100644 boot/grub2/0064-disk-ldm-If-failed-then-free-vg-variable-too.patch
 delete mode 100644 boot/grub2/0065-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch
 delete mode 100644 boot/grub2/0066-disk-cryptodisk-Fix-potential-integer-overflow.patch
 delete mode 100644 boot/grub2/0067-hfsplus-Check-that-the-volume-name-length-is-valid.patch
 delete mode 100644 boot/grub2/0068-zfs-Fix-possible-negative-shift-operation.patch
 delete mode 100644 boot/grub2/0069-zfs-Fix-resource-leaks-while-constructing-path.patch
 delete mode 100644 boot/grub2/0070-zfs-Fix-possible-integer-overflows.patch
 delete mode 100644 boot/grub2/0071-zfsinfo-Correct-a-check-for-error-allocating-memory.patch
 delete mode 100644 boot/grub2/0072-affs-Fix-memory-leaks.patch
 delete mode 100644 boot/grub2/0073-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch
 delete mode 100644 boot/grub2/0074-libgcrypt-mpi-Fix-possible-NULL-dereference.patch
 delete mode 100644 boot/grub2/0075-syslinux-Fix-memory-leak-while-parsing.patch
 delete mode 100644 boot/grub2/0076-normal-completion-Fix-leaking-of-memory-when-process.patch
 delete mode 100644 boot/grub2/0077-commands-hashsum-Fix-a-memory-leak.patch
 delete mode 100644 boot/grub2/0079-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch
 delete mode 100644 boot/grub2/0080-video-fb-fbfill-Fix-potential-integer-overflow.patch
 delete mode 100644 boot/grub2/0081-video-fb-video_fb-Fix-multiple-integer-overflows.patch
 delete mode 100644 boot/grub2/0082-video-fb-video_fb-Fix-possible-integer-overflow.patch
 delete mode 100644 boot/grub2/0083-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch
 delete mode 100644 boot/grub2/0084-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch
 delete mode 100644 boot/grub2/0085-loader-bsd-Check-for-NULL-arg-up-front.patch
 delete mode 100644 boot/grub2/0086-loader-xnu-Fix-memory-leak.patch
 delete mode 100644 boot/grub2/0087-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch
 delete mode 100644 boot/grub2/0088-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch
 delete mode 100644 boot/grub2/0089-util-grub-install-Fix-NULL-pointer-dereferences.patch
 delete mode 100644 boot/grub2/0090-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch
 delete mode 100644 boot/grub2/0091-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch
 delete mode 100644 boot/grub2/0092-script-execute-Fix-NULL-dereference-in-grub_script_e.patch
 delete mode 100644 boot/grub2/0093-commands-ls-Require-device_name-is-not-NULL-before-p.patch
 delete mode 100644 boot/grub2/0094-script-execute-Avoid-crash-when-using-outside-a-func.patch
 delete mode 100644 boot/grub2/0095-lib-arg-Block-repeated-short-options-that-require-an.patch
 delete mode 100644 boot/grub2/0096-script-execute-Don-t-crash-on-a-for-loop-with-no-ite.patch
 delete mode 100644 boot/grub2/0097-commands-menuentry-Fix-quoting-in-setparams_prefix.patch
 delete mode 100644 boot/grub2/0098-kern-misc-Always-set-end-in-grub_strtoull.patch
 delete mode 100644 boot/grub2/0099-video-readers-jpeg-Catch-files-with-unsupported-quan.patch
 delete mode 100644 boot/grub2/0100-video-readers-jpeg-Catch-OOB-reads-writes-in-grub_jp.patch
 delete mode 100644 boot/grub2/0101-video-readers-jpeg-Don-t-decode-data-before-start-of.patch
 delete mode 100644 boot/grub2/0102-term-gfxterm-Don-t-set-up-a-font-with-glyphs-that-ar.patch
 delete mode 100644 boot/grub2/0103-fs-fshelp-Catch-impermissibly-large-block-sizes-in-r.patch
 delete mode 100644 boot/grub2/0104-fs-hfsplus-Don-t-fetch-a-key-beyond-the-end-of-the-n.patch
 delete mode 100644 boot/grub2/0105-fs-hfsplus-Don-t-use-uninitialized-data-on-corrupt-f.patch
 delete mode 100644 boot/grub2/0106-fs-hfs-Disable-under-lockdown.patch
 delete mode 100644 boot/grub2/0107-fs-sfs-Fix-over-read-of-root-object-name.patch
 delete mode 100644 boot/grub2/0108-fs-jfs-Do-not-move-to-leaf-level-if-name-length-is-n.patch
 delete mode 100644 boot/grub2/0109-fs-jfs-Limit-the-extents-that-getblk-can-consider.patch
 delete mode 100644 boot/grub2/0110-fs-jfs-Catch-infinite-recursion.patch
 delete mode 100644 boot/grub2/0111-fs-nilfs2-Reject-too-large-keys.patch
 delete mode 100644 boot/grub2/0112-fs-nilfs2-Don-t-search-children-if-provided-number-i.patch
 delete mode 100644 boot/grub2/0113-fs-nilfs2-Properly-bail-on-errors-in-grub_nilfs2_btr.patch
 delete mode 100644 boot/grub2/0114-io-gzio-Bail-if-gzio-tl-td-is-NULL.patch
 delete mode 100644 boot/grub2/0115-io-gzio-Add-init_dynamic_block-clean-up-if-unpacking.patch
 delete mode 100644 boot/grub2/0116-io-gzio-Catch-missing-values-in-huft_build-and-bail.patch
 delete mode 100644 boot/grub2/0117-io-gzio-Zero-gzio-tl-td-in-init_dynamic_block-if-huf.patch
 delete mode 100644 boot/grub2/0118-disk-lvm-Don-t-go-beyond-the-end-of-the-data-we-read.patch
 delete mode 100644 boot/grub2/0119-disk-lvm-Don-t-blast-past-the-end-of-the-circular-me.patch
 delete mode 100644 boot/grub2/0120-disk-lvm-Bail-on-missing-PV-list.patch
 delete mode 100644 boot/grub2/0121-disk-lvm-Do-not-crash-if-an-expected-string-is-not-f.patch
 delete mode 100644 boot/grub2/0122-disk-lvm-Do-not-overread-metadata.patch
 delete mode 100644 boot/grub2/0123-disk-lvm-Sanitize-rlocn-offset-to-prevent-wild-read.patch
 delete mode 100644 boot/grub2/0124-disk-lvm-Do-not-allow-a-LV-to-be-it-s-own-segment-s-.patch
 delete mode 100644 boot/grub2/0125-fs-btrfs-Validate-the-number-of-stripes-parities-in-.patch
 delete mode 100644 boot/grub2/0126-fs-btrfs-Squash-some-uninitialized-reads.patch
 delete mode 100644 boot/grub2/0127-kern-parser-Fix-a-memory-leak.patch
 delete mode 100644 boot/grub2/0128-kern-parser-Introduce-process_char-helper.patch
 delete mode 100644 boot/grub2/0129-kern-parser-Introduce-terminate_arg-helper.patch
 delete mode 100644 boot/grub2/0130-kern-parser-Refactor-grub_parser_split_cmdline-clean.patch
 delete mode 100644 boot/grub2/0131-kern-buffer-Add-variable-sized-heap-buffer.patch
 delete mode 100644 boot/grub2/0132-kern-parser-Fix-a-stack-buffer-overflow.patch
 delete mode 100644 boot/grub2/0133-kern-efi-Add-initial-stack-protector-implementation.patch
 delete mode 100644 boot/grub2/0134-util-mkimage-Remove-unused-code-to-add-BSS-section.patch
 delete mode 100644 boot/grub2/0135-util-mkimage-Use-grub_host_to_target32-instead-of-gr.patch
 delete mode 100644 boot/grub2/0136-util-mkimage-Always-use-grub_host_to_target32-to-ini.patch
 delete mode 100644 boot/grub2/0137-util-mkimage-Unify-more-of-the-PE32-and-PE32-header-.patch
 delete mode 100644 boot/grub2/0138-util-mkimage-Reorder-PE-optional-header-fields-set-u.patch
 delete mode 100644 boot/grub2/0139-util-mkimage-Improve-data_size-value-calculation.patch
 delete mode 100644 boot/grub2/0140-util-mkimage-Refactor-section-setup-to-use-a-helper.patch
 delete mode 100644 boot/grub2/0141-util-mkimage-Add-an-option-to-import-SBAT-metadata-i.patch
 delete mode 100644 boot/grub2/0142-grub-install-common-Add-sbat-option.patch
 delete mode 100644 boot/grub2/0143-shim_lock-Only-skip-loading-shim_lock-verifier-with-.patch
 delete mode 100644 boot/grub2/0144-kern-misc-Split-parse_printf_args-into-format-parsin.patch
 delete mode 100644 boot/grub2/0145-kern-misc-Add-STRING-type-for-internal-printf-format.patch
 delete mode 100644 boot/grub2/0146-kern-misc-Add-function-to-check-printf-format-agains.patch
 delete mode 100644 boot/grub2/0147-gfxmenu-gui-Check-printf-format-in-the-gui_progress_.patch
 delete mode 100644 boot/grub2/0148-templates-Disable-the-os-prober-by-default.patch
 delete mode 100644 boot/grub2/0149-kern-mm-Fix-grub_debug_calloc-compilation-error.patch
 delete mode 100644 boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch
 create mode 100644 boot/ovmf-bin/Config.in
 create mode 100644 boot/ovmf-bin/ovmf-bin.hash
 create mode 100644 boot/ovmf-bin/ovmf-bin.mk
 create mode 100644 support/testing/tests/boot/test_grub.py
 create mode 100644 support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
 create mode 100644 support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg
 create mode 100644 support/testing/tests/boot/test_grub/linux-aarch64-efi.config
 create mode 100755 support/testing/tests/boot/test_grub/post-build.sh
 create mode 100755 support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh

-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
