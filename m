Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B34EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B29FE418A9;
	Sat, 23 Jul 2022 14:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B29FE418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mj00zoj_I3GP; Sat, 23 Jul 2022 14:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD8DE416CD;
	Sat, 23 Jul 2022 14:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8DE416CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B90C1BF85D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8222384B01
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8222384B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUbOrDg9gQux for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:07:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95B5884AE9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95B5884AE9
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 979128447C; Sat, 23 Jul 2022 13:54:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:06:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a87ae216305059efdef9e43a3bda7bd557c46da0
X-Git-Newrev: 9f1b4d24ce2845242b2c1c497558a56cb3c2fb14
X-Patchwork-Hint: ignore
Message-Id: <20220723135401.979128447C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: update to 2.06
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f1b4d24ce2845242b2c1c497558a56cb3c2fb14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The update is very straightforward, as no changes in grub2.mk are
needed beyond the version bump.

Spacing in the hash file is adjusted to the new Buildroot standard.

All patches are dropped as they have all been upstreamed between 2.04
and 2.06. Here is the full list of patches and their corresponding
upstream commit:

 * 0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
   6643507ce30f775008e093580f0c9499dfb2c485 build: Fix GRUB i386-pc build with Ubuntu gcc
 * 0002-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch
   a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e yylex: Make lexer fatal errors actually be fatal
 * 0003-safemath-Add-some-arithmetic-primitives-that-check-f.patch
   68708c4503018d61dbcce7ac11cbb511d6425f4d safemath: Add some arithmetic primitives that check for overflow
 * 0004-calloc-Make-sure-we-always-have-an-overflow-checking.patch
   64e26162ebfe68317c143ca5ec996c892019f8f8 calloc: Make sure we always have an overflow-checking calloc() available
 * 0005-calloc-Use-calloc-at-most-places.patch
   f725fa7cb2ece547c5af01eeeecfe8d95802ed41 calloc: Use calloc() at most places
 * 0006-malloc-Use-overflow-checking-primitives-where-we-do-.patch
   3f05d693d1274965ffbe4ba99080dc2c570944c6 malloc: Use overflow checking primitives where we do complex allocations
 * 0007-iso9660-Don-t-leak-memory-on-realloc-failures.patch
   2a1edcf2ede865b60604815d3bc5c01029379ca4 iso9660: Don't leak memory on realloc() failures
 * 0008-font-Do-not-load-more-than-one-NAME-section.patch
   89f3da1a3d14023eda182e075919dd584031ecad font: Do not load more than one NAME section
 * 0009-gfxmenu-Fix-double-free-in-load_image.patch
   26a8c19307f998f67dbfb784068e394c8e9c8478 gfxmenu: Fix double free in load_image()
 * 0010-xnu-Fix-double-free-in-grub_xnu_devprop_add_property.patch
   6d7a59a2a184f7af8a90a4c90d7c7b6482acc656 xnu: Fix double free in grub_xnu_devprop_add_property()
 * 0011-lzma-Make-sure-we-don-t-dereference-past-array.patch
   16c0dbf4bc6a953c41bc7a031b36dfa8e906afea lzma: Make sure we don't dereference past array
 * 0012-term-Fix-overflow-on-user-inputs.patch
   61b7ca08d173adf62facdd6a266cbd2471165e67 term: Fix overflow on user inputs
 * 0013-udf-Fix-memory-leak.patch
   d17770857e1c901a8167f63d6558856cfaf313ff udf: Fix memory leak
 * 0014-multiboot2-Fix-memory-leak-if-grub_create_loader_cmd.patch
   f8ad7a3dd8213f691b0f32d0e9eb656a70cefc13 multiboot2: Fix memory leak if grub_create_loader_cmdline() fails
 * 0015-tftp-Do-not-use-priority-queue.patch
   781b3e5efc35c17cbce95393aafd63a5b429f9e6 tftp: Do not use priority queue
 * 0016-relocator-Protect-grub_relocator_alloc_chunk_addr-in.patch
   caea56d1f8fa1ae298936f8d75b220e7f12b73d3 relocator: Protect grub_relocator_alloc_chunk_addr() input args against integer underflow/overflow
 * 0017-relocator-Protect-grub_relocator_alloc_chunk_align-m.patch
   61ff5602fe8f2a3446346795daebe4ec3b82c20f relocator: Protect grub_relocator_alloc_chunk_align() max_addr against integer underflow
 * 0018-script-Remove-unused-fields-from-grub_script_functio.patch
   1a8d9c9b4ab6df7669b5aa36a56477f297825b96 script: Remove unused fields from grub_script_function struct
 * 0019-script-Avoid-a-use-after-free-when-redefining-a-func.patch
   426f57383d647406ae9c628c472059c27cd6e040 script: Avoid a use-after-free when redefining a function during execution
 * 0020-relocator-Fix-grub_relocator_alloc_chunk_align-top-m.patch
   07e5b79e22fd58c5382323dd71d64aaa42f928ec relocator: Fix grub_relocator_alloc_chunk_align() top memory allocation
 * 0021-hfsplus-Fix-two-more-overflows.patch
   f5703eb0625b786f141d09be19b7af40b572a446 hfsplus: Fix two more overflows
 * 0022-lvm-Fix-two-more-potential-data-dependent-alloc-over.patch
   879c4a8342eacc0ba4b9dd11dc69d3ec3dbe73af lvm: Fix two more potential data-dependent alloc overflows
 * 0023-emu-Make-grub_free-NULL-safe.patch
   b73cee7f1f8287ed3af32fffe8aaf33cdff52f6b emu: Make grub_free(NULL) safe
 * 0024-efi-Fix-some-malformed-device-path-arithmetic-errors.patch
   d2cf823d0e31818d1b7a223daff6d5e006596543 efi: Fix some malformed device path arithmetic errors
 * 0025-efi-chainloader-Propagate-errors-from-copy_file_path.patch
   098058752e1cee7b457ff45562a81e756ab0b532 efi/chainloader: Propagate errors from copy_file_path()
 * 0026-efi-Fix-use-after-free-in-halt-reboot-path.patch
   f7bd9986f607a924bf23b813900a8595f2815f0c efi: Fix use-after-free in halt/reboot path
 * 0027-loader-linux-Avoid-overflow-on-initrd-size-calculati.patch
   0dcbf3652b6738971407dacc03fb685dfafc5ec5 loader/linux: Avoid overflow on initrd size calculation
 * 0028-linux-Fix-integer-overflows-in-initrd-size-handling.patch
   e7b8856f8be3292afdb38d2e8c70ad8d62a61e10 linux: Fix integer overflows in initrd size handling
 * 0029-efi-Make-shim_lock-GUID-and-protocol-type-public.patch
   f76a27996c34900f2c369a8a0d6ac72ae2faa988 efi: Make shim_lock GUID and protocol type public
 * 0030-efi-Return-grub_efi_status_t-from-grub_efi_get_varia.patch
   04ae030d0eea8668d4417702d88bf2cf04713d80 efi: Return grub_efi_status_t from grub_efi_get_variable()
 * 0031-efi-Add-a-function-to-read-EFI-variables-with-attrib.patch
   ac5c9367548750e75ed1e7fc4354a3d20186d733 efi: Add a function to read EFI variables with attributes
 * 0032-efi-Add-secure-boot-detection.patch
   d7e54b2e5feee95d2f83058ed30d883c450d1473 efi: Add secure boot detection
 * 0033-verifiers-Move-verifiers-API-to-kernel-image.patch
   9e95f45ceeef36fcf93cbfffcf004276883dbc99 verifiers: Move verifiers API to kernel image
 * 0034-efi-Move-the-shim_lock-verifier-to-the-GRUB-core.patch
   5e280caa6530ed160dcf2920c94f1605fb1f1f7c efi: Move the shim_lock verifier to the GRUB core
 * 0035-kern-Add-lockdown-support.patch
   578c95298bcc46e0296f4c786db64c2ff26ce2cc kern: Add lockdown support
 * 0036-kern-lockdown-Set-a-variable-if-the-GRUB-is-locked-d.patch
   d90367471779c240e002e62edfb6b31fc85b4908 kern/lockdown: Set a variable if the GRUB is locked down
 * 0037-efi-Lockdown-the-GRUB-when-the-UEFI-Secure-Boot-is-e.patch
   98b00a403cbf2ba6833d1ac0499871b27a08eb77 efi: Lockdown the GRUB when the UEFI Secure Boot is enabled
 * 0038-efi-Use-grub_is_lockdown-instead-of-hardcoding-a-dis.patch
   8f73052885892bc0dbc01e297f79d7cf4925e491 efi: Use grub_is_lockdown() instead of hardcoding a disabled modules list
 * 0039-acpi-Don-t-register-the-acpi-command-when-locked-dow.patch
   3e8e4c0549240fa209acffceb473e1e509b50c95 acpi: Don't register the acpi command when locked down
 * 0040-mmap-Don-t-register-cutmem-and-badram-commands-when-.patch
   d298b41f90cbf1f2e5a10e29daa1fc92ddee52c9 mmap: Don't register cutmem and badram commands when lockdown is enforced
 * 0041-commands-Restrict-commands-that-can-load-BIOS-or-DT-.patch
   468a5699b249fe6816b4e7e86c5dc9d325c9b09e commands: Restrict commands that can load BIOS or DT blobs when locked down
 * 0042-commands-setpci-Restrict-setpci-command-when-locked-.patch
   58b77d4069823b44c5fa916fa8ddfc9c4cd51e02 commands/setpci: Restrict setpci command when locked down
 * 0043-commands-hdparm-Restrict-hdparm-command-when-locked-.patch
   5c97492a29c6063567b65ed1a069f5e6f4e211f0 commands/hdparm: Restrict hdparm command when locked down
 * 0044-gdb-Restrict-GDB-access-when-locked-down.patch
   508270838998f151a82e9c13e7cb8a470a2dc23d gdb: Restrict GDB access when locked down
 * 0045-loader-xnu-Don-t-allow-loading-extension-and-package.patch
   9c5565135f12400a925ee901b25984e7af4442f5 loader/xnu: Don't allow loading extension and packages when locked down
 * 0046-docs-Document-the-cutmem-command.patch
   f05e79a0143beb2d9a482a3ebf4fe0ce76778122 docs: Document the cutmem command
 * 0047-dl-Only-allow-unloading-modules-that-are-not-depende.patch
   7630ec5397fe418276b360f9011934b8c034936c dl: Only allow unloading modules that are not dependencies
 * 0048-usb-Avoid-possible-out-of-bound-accesses-caused-by-m.patch
   128c16a682034263eb519c89bc0934eeb6fa8cfa usb: Avoid possible out-of-bound accesses caused by malicious devices
 * 0049-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch
   8cb2848f9699642a698af84b12ba187cab722031 mmap: Fix memory leak when iterating over mapped memory
 * 0050-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch
   03f2515ae0c503406f1a99a2178405049c6555db net/net: Fix possible dereference to of a NULL pointer
 * 0051-net-tftp-Fix-dangling-memory-pointer.patch
   0cb838b281a68b536a09681f9557ea6a7ac5da7a net/tftp: Fix dangling memory pointer
 * 0052-kern-parser-Fix-resource-leak-if-argc-0.patch
   d06161b035dde4769199ad65aa0a587a5920012b kern/parser: Fix resource leak if argc == 0
 * 0053-kern-efi-Fix-memory-leak-on-failure.patch
   ed286ceba6015d37a9304f04602451c47bf195d7 kern/efi: Fix memory leak on failure
 * 0054-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch
   6aee4bfd6973c714056fb7b56890b8d524e94ee1 kern/efi/mm: Fix possible NULL pointer dereference
 * 0055-gnulib-regexec-Resolve-unused-variable.patch
   a983d36bd9178d377d2072fd4b11c635fdc404b4 gnulib/regexec: Resolve unused variable
 * 0056-gnulib-regcomp-Fix-uninitialized-token-structure.patch
   75c3d3cec4f408848f575d6d5e30a95bd6313db0 gnulib/regcomp: Fix uninitialized token structure
 * 0057-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch
   3a37bf120a9194c373257c70175cdb5b337bc107 gnulib/argp-help: Fix dereference of a possibly NULL state
 * 0058-gnulib-regexec-Fix-possible-null-dereference.patch
   0b7f347638153e403ee2dd518af3ce26f4f99647 gnulib/regexec: Fix possible null-dereference
 * 0059-gnulib-regcomp-Fix-uninitialized-re_token.patch
   03477085f9a33789ba6cca7cd49ab9326a1baa0e gnulib/regcomp: Fix uninitialized re_token
 * 0060-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch
   59666e520f44177c97b82a44c169b3b315d63b42 io/lzopio: Resolve unnecessary self-assignment errors
 * 0061-zstd-Initialize-seq_t-structure-fully.patch
   2777cf4466719921dbe4b30af358a75e7d76f217 zstd: Initialize seq_t structure fully
 * 0062-kern-partition-Check-for-NULL-before-dereferencing-i.patch
   bc9c468a2ce84bc767234eec888b71f1bc744fff kern/partition: Check for NULL before dereferencing input string
 * 0063-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch
   23e39f50ca7a107f6b66396ed4d177a914dee035 disk/ldm: Make sure comp data is freed before exiting from make_vg()
 * 0064-disk-ldm-If-failed-then-free-vg-variable-too.patch
   e0b83df5da538d2a38f770e60817b3a4b9d5b4d7 disk/ldm: If failed then free vg variable too
 * 0065-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch
   156c281a1625dc73fd350530630c6f2d5673d4f6 disk/ldm: Fix memory leak on uninserted lv references
 * 0066-disk-cryptodisk-Fix-potential-integer-overflow.patch
   a201ad17caa430aa710654fdf2e6ab4c8166f031 disk/cryptodisk: Fix potential integer overflow
 * 0067-hfsplus-Check-that-the-volume-name-length-is-valid.patch
   2298f6e0d951251bb9ca97d891d1bc8b74515f8c hfsplus: Check that the volume name length is valid
 * 0068-zfs-Fix-possible-negative-shift-operation.patch
   a02091834d3e167320d8a262ff04b8e83c5e616d zfs: Fix possible negative shift operation
 * 0069-zfs-Fix-resource-leaks-while-constructing-path.patch
   89bdab965805e8d54d7f75349024e1a11cbe2eb8 zfs: Fix resource leaks while constructing path
 * 0070-zfs-Fix-possible-integer-overflows.patch
   302c12ff5714bc455949117c1c9548ccb324d55b zfs: Fix possible integer overflows
 * 0071-zfsinfo-Correct-a-check-for-error-allocating-memory.patch
   7aab03418ec6a9b991aa44416cb2585aff4e7972 zfsinfo: Correct a check for error allocating memory
 * 0072-affs-Fix-memory-leaks.patch
   178ac5107389f8e5b32489d743d6824a5ebf342a affs: Fix memory leaks
 * 0073-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch
   e8814c811132a70f9b55418f7567378a34ad3883 libgcrypt/mpi: Fix possible unintended sign extension
 * 0074-libgcrypt-mpi-Fix-possible-NULL-dereference.patch
   ae0f3fabeba7b393113d5dc185b6aff9b728136d libgcrypt/mpi: Fix possible NULL dereference
 * 0075-syslinux-Fix-memory-leak-while-parsing.patch
   95bc016dba94cab3d398dd74160665915cd08ad6 syslinux: Fix memory leak while parsing
 * 0076-normal-completion-Fix-leaking-of-memory-when-process.patch
   9213575b7a95b514bce80be5964a28d407d7d56d normal/completion: Fix leaking of memory when processing a completion
 * 0077-commands-hashsum-Fix-a-memory-leak.patch
   8b6f528e52e18b7a69f90b8dc3671d7b1147d9f3 commands/hashsum: Fix a memory leak
 * 0079-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch
   fc5951d3b1616055ef81a019a5affc09d13344d0 video/efi_gop: Remove unnecessary return value of grub_video_gop_fill_mode_info()
 * 0080-video-fb-fbfill-Fix-potential-integer-overflow.patch
   7ce3259f67ac2cd93acb0ec0080c24b3b69e66c6 video/fb/fbfill: Fix potential integer overflow
 * 0081-video-fb-video_fb-Fix-multiple-integer-overflows.patch
   08e098b1dbf01e96376f594b337491bc4cfa48dd video/fb/video_fb: Fix multiple integer overflows
 * 0082-video-fb-video_fb-Fix-possible-integer-overflow.patch
   08413f2f4edec0e2d9bf15f836f6ee5ca2e379cb video/fb/video_fb: Fix possible integer overflow
 * 0083-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch
   5f5eb7ca8e971227e95745abe541df3e1509360e video/readers/jpeg: Test for an invalid next marker reference from a jpeg file
 * 0084-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch
   4a1aa5917595650efbd46b581368c470ebee42ab gfxmenu/gui_list: Remove code that coverity is flagging as dead
 * 0085-loader-bsd-Check-for-NULL-arg-up-front.patch
   5d5391b0a05abe76e04c1eb68dcc6cbef5326c4a loader/bsd: Check for NULL arg up-front
 * 0086-loader-xnu-Fix-memory-leak.patch
   bcb59ece3263d118510c4440c4da0950f224bb7f loader/xnu: Fix memory leak
 * 0087-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch
   4b4027b6b1c877d7ab467896b04c7bd1aadcfa15 loader/xnu: Free driverkey data when an error is detected in grub_xnu_writetree_toheap()
 * 0088-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch
   7c8a2b5d1421a0f2a33d33531f7561f3da93b844 loader/xnu: Check if pointer is NULL before using it
 * 0089-util-grub-install-Fix-NULL-pointer-dereferences.patch
   8b3a95655b4391122e7b0315d8cc6f876caf8183 util/grub-install: Fix NULL pointer dereferences
 * 0090-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch
   5dc41edc4eba259c6043ae7698c245ec1baaacc6 util/grub-editenv: Fix incorrect casting of a signed value
 * 0091-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch
   1641d74e16f9d1ca35ba1a87ee4a0bf3afa48e72 util/glue-efi: Fix incorrect use of a possibly negative value
 * 0092-script-execute-Fix-NULL-dereference-in-grub_script_e.patch
   41ae93b2e6c75453514629bcfe684300e3aec0ce script/execute: Fix NULL dereference in grub_script_execute_cmdline()
 * 0093-commands-ls-Require-device_name-is-not-NULL-before-p.patch
   6afbe6063c95b827372f9ec310c9fc7461311eb1 commands/ls: Require device_name is not NULL before printing
 * 0094-script-execute-Avoid-crash-when-using-outside-a-func.patch
   fe0586347ee46f927ae27bb9673532da9f5dead5 script/execute: Avoid crash when using "$#" outside a function scope
 * 0095-lib-arg-Block-repeated-short-options-that-require-an.patch
   2a330dba93ff11bc00eda76e9419bc52b0c7ead6 lib/arg: Block repeated short options that require an argument
 * 0096-script-execute-Don-t-crash-on-a-for-loop-with-no-ite.patch
   0a05f88e2bb33ed2a0cfd93f481f471efb7791aa script/execute: Don't crash on a "for" loop with no items
 * 0097-commands-menuentry-Fix-quoting-in-setparams_prefix.patch
   2f533a89a8dfcacbf2c9dbc77d910f111f24bf33 commands/menuentry: Fix quoting in setparams_prefix()
 * 0098-kern-misc-Always-set-end-in-grub_strtoull.patch
   f41f0af48ab7f7c135aac17ac862c30bde0bbab7 kern/misc: Always set *end in grub_strtoull()
 * 0099-video-readers-jpeg-Catch-files-with-unsupported-quan.patch
   693989598fd38c3c0b2a928f4f64865b5681762f video/readers/jpeg: Catch files with unsupported quantization or Huffman tables
 * 0100-video-readers-jpeg-Catch-OOB-reads-writes-in-grub_jp.patch
   34b85a6e07014383ddcad09f99ff239ad752dd1a video/readers/jpeg: Catch OOB reads/writes in grub_jpeg_decode_du()
 * 0101-video-readers-jpeg-Don-t-decode-data-before-start-of.patch
   8338a8238f08d9f3ae4c2ddfff0603eff80af9e2 video/readers/jpeg: Don't decode data before start of stream
 * 0102-term-gfxterm-Don-t-set-up-a-font-with-glyphs-that-ar.patch
   829329bddb2c3e623270cc634cc9ab32e6455fe7 term/gfxterm: Don't set up a font with glyphs that are too big
 * 0103-fs-fshelp-Catch-impermissibly-large-block-sizes-in-r.patch
   b5bc456f664bc301ab4cd5a17d3d23c6661c259e fs/fshelp: Catch impermissibly large block sizes in read helper
 * 0104-fs-hfsplus-Don-t-fetch-a-key-beyond-the-end-of-the-n.patch
   58ea11d5b9ca0966bd9c68d8ba5240cf7dc3ba83 fs/hfsplus: Don't fetch a key beyond the end of the node
 * 0105-fs-hfsplus-Don-t-use-uninitialized-data-on-corrupt-f.patch
   2ca0e5dbcdcb6fc93ccae39a0f39d0dba4a7ff20 fs/hfsplus: Don't use uninitialized data on corrupt filesystems
 * 0106-fs-hfs-Disable-under-lockdown.patch
   1c15848838d924552611247110723e2a1c17a5a1 fs/hfs: Disable under lockdown
 * 0107-fs-sfs-Fix-over-read-of-root-object-name.patch
   8d3ae59dee2930d640add3bba983006e1f5dd1b6 fs/sfs: Fix over-read of root object name
 * 0108-fs-jfs-Do-not-move-to-leaf-level-if-name-length-is-n.patch
   ffd5a46f68710e2781899d0be4d701429a5a817d fs/jfs: Do not move to leaf level if name length is negative
 * 0109-fs-jfs-Limit-the-extents-that-getblk-can-consider.patch
   bd0cf8148ccf721f6e39ffbd70f8abad0c8897f0 fs/jfs: Limit the extents that getblk() can consider
 * 0110-fs-jfs-Catch-infinite-recursion.patch
   223120dd83745126cb232a0248c9a8901d7e350d fs/jfs: Catch infinite recursion
 * 0111-fs-nilfs2-Reject-too-large-keys.patch
   20ab8cb44bc140a1dedda82a3fccdd45e9bc6929 fs/nilfs2: Reject too-large keys
 * 0112-fs-nilfs2-Don-t-search-children-if-provided-number-i.patch
   37c0eb05cdcc64c28d31c4ebd300f14d5239d05e fs/nilfs2: Don't search children if provided number is too large
 * 0113-fs-nilfs2-Properly-bail-on-errors-in-grub_nilfs2_btr.patch
   ca5d9ac206043b1fb4cb06259272fb1c5946bb6d fs/nilfs2: Properly bail on errors in grub_nilfs2_btree_node_lookup()
 * 0114-io-gzio-Bail-if-gzio-tl-td-is-NULL.patch
   3334a5e6c86f10e715cca3bf66ce0fc2f164b61b io/gzio: Bail if gzio->tl/td is NULL
 * 0115-io-gzio-Add-init_dynamic_block-clean-up-if-unpacking.patch
   18490336d91da2b532277cba56473bfed1376fc4 io/gzio: Add init_dynamic_block() clean up if unpacking codes fails
 * 0116-io-gzio-Catch-missing-values-in-huft_build-and-bail.patch
   4e76b08f7171a8603d74fcafb27409a91f578647 io/gzio: Catch missing values in huft_build() and bail
 * 0117-io-gzio-Zero-gzio-tl-td-in-init_dynamic_block-if-huf.patch
   b5a2b59cc5b8f5ee7ba3b951e7693e402d5b3a6f io/gzio: Zero gzio->tl/td in init_dynamic_block() if huft_build() fails
 * 0118-disk-lvm-Don-t-go-beyond-the-end-of-the-data-we-read.patch
   a8cc95de74ccc3ad090e8062ac335c844f13c9f4 disk/lvm: Don't go beyond the end of the data we read from disk
 * 0119-disk-lvm-Don-t-blast-past-the-end-of-the-circular-me.patch
   27a79bf38e6d050e497eb96a3fdddce43af25577 disk/lvm: Don't blast past the end of the circular metadata buffer
 * 0120-disk-lvm-Bail-on-missing-PV-list.patch
   2958695c4cdc785de6ed708709af071a2d20afef disk/lvm: Bail on missing PV list
 * 0121-disk-lvm-Do-not-crash-if-an-expected-string-is-not-f.patch
   db29073fc7aec71a40dabfc722a96ea9f3280907 disk/lvm: Do not crash if an expected string is not found
 * 0122-disk-lvm-Do-not-overread-metadata.patch
   1155d7dffd3337942cb7583706b429d567d4db86 disk/lvm: Do not overread metadata
 * 0123-disk-lvm-Sanitize-rlocn-offset-to-prevent-wild-read.patch
   701293684742d00133b39bf957d3642c81dc83f4 disk/lvm: Sanitize rlocn->offset to prevent wild read
 * 0124-disk-lvm-Do-not-allow-a-LV-to-be-it-s-own-segment-s-.patch
   e18a00073890021362b4a48097672f1d4b340d3c disk/lvm: Do not allow a LV to be it's own segment's node's LV
 * 0125-fs-btrfs-Validate-the-number-of-stripes-parities-in-.patch
   b88a82e78cdd0ab8e0339c1c3f9564c4d8c0c969 fs/btrfs: Validate the number of stripes/parities in RAID5/6
 * 0126-fs-btrfs-Squash-some-uninitialized-reads.patch
   b911884dd707ba1e6f641eb17857df3155013a45 fs/btrfs: Squash some uninitialized reads
 * 0127-kern-parser-Fix-a-memory-leak.patch
   c6c426e5ab6ea715153b72584de6bd8c82f698ec kern/parser: Fix a memory leak
 * 0128-kern-parser-Introduce-process_char-helper.patch
   b1c9e9e889e4273fb15712051c887e6078511448 kern/parser: Introduce process_char() helper
 * 0129-kern-parser-Introduce-terminate_arg-helper.patch
   3d157bbd06506b170fde5ec23980c4bf9f7660e2 kern/parser: Introduce terminate_arg() helper
 * 0130-kern-parser-Refactor-grub_parser_split_cmdline-clean.patch
   8bc817014ce3d7a498db44eae33c8b90e2430926 kern/parser: Refactor grub_parser_split_cmdline() cleanup
 * 0131-kern-buffer-Add-variable-sized-heap-buffer.patch
   030fb6c4fa354cdbd6a8d6903dfed5d36eaf3cb2 kern/buffer: Add variable sized heap buffer
 * 0132-kern-parser-Fix-a-stack-buffer-overflow.patch
   4ea7bae51f97e49c84dc67ea30b466ca8633b9f6 kern/parser: Fix a stack buffer overflow
 * 0133-kern-efi-Add-initial-stack-protector-implementation.patch
   133d73079c5771bbf3d8311281b6772846357ec1 kern/efi: Add initial stack protector implementation
 * 0134-util-mkimage-Remove-unused-code-to-add-BSS-section.patch
   d52f78def1b9c4f435fdbf6b24fd899208580c76 util/mkimage: Remove unused code to add BSS section
 * 0135-util-mkimage-Use-grub_host_to_target32-instead-of-gr.patch
   1710452aca05ccdd21e74390ec08c63fdf0ee10a util/mkimage: Use grub_host_to_target32() instead of grub_cpu_to_le32()
 * 0136-util-mkimage-Always-use-grub_host_to_target32-to-ini.patch
   ae8936f9c375e1a38129e85a1b5d573fb451f288 util/mkimage: Always use grub_host_to_target32() to initialize PE stack and heap stuff
 * 0137-util-mkimage-Unify-more-of-the-PE32-and-PE32-header-.patch
   a4e8936f010a8e928e973b80390c8f83ad6b8000 util/mkimage: Unify more of the PE32 and PE32+ header set-up
 * 0138-util-mkimage-Reorder-PE-optional-header-fields-set-u.patch
   ba44c87e56a8bccde235ebb7d41d5aa54604d241 util/mkimage: Reorder PE optional header fields set-up
 * 0139-util-mkimage-Improve-data_size-value-calculation.patch
   ff406eff25465932b97a2857ee5a75fd0957e9b9 util/mkimage: Improve data_size value calculation
 * 0140-util-mkimage-Refactor-section-setup-to-use-a-helper.patch
   f60ba9e5945892e835e53f0619406d96002f7f70 util/mkimage: Refactor section setup to use a helper
 * 0141-util-mkimage-Add-an-option-to-import-SBAT-metadata-i.patch
   b11547137703bbc642114a816233a5b6fed61b06 util/mkimage: Add an option to import SBAT metadata into a .sbat section
 * 0142-grub-install-common-Add-sbat-option.patch
   bb51ee2b49fbda0f66c1fa580a33442ff578f110 grub-install-common: Add --sbat option
 * 0143-shim_lock-Only-skip-loading-shim_lock-verifier-with-.patch
   968de8c23c1cba0f18230f778ebcf6c412ec8ec5 shim_lock: Only skip loading shim_lock verifier with explicit consent
 * 0144-kern-misc-Split-parse_printf_args-into-format-parsin.patch
   7f11bde3143b21b40d8225ea1d641e0f83b5a01e kern/misc: Split parse_printf_args() into format parsing and va_list handling
 * 0145-kern-misc-Add-STRING-type-for-internal-printf-format.patch
   1a2a5aff71e8edba436398492279de434abfe7a3 kern/misc: Add STRING type for internal printf() format handling
 * 0146-kern-misc-Add-function-to-check-printf-format-agains.patch
   83603bea6ce8fdff5ab3fbc4c9e592a8c71a8706 kern/misc: Add function to check printf() format against expected format
 * 0147-gfxmenu-gui-Check-printf-format-in-the-gui_progress_.patch
   42facd577231cf5ffe4c7128fed15b7e7d99cbca gfxmenu/gui: Check printf() format in the gui_progress_bar and gui_label
 * 0148-templates-Disable-the-os-prober-by-default.patch
   e346414725a70e5c74ee87ca14e580c66f517666 templates: Disable the os-prober by default
 * 0149-kern-mm-Fix-grub_debug_calloc-compilation-error.patch
   a9d8de960834f376087856f9d60a214b47c76f61 kern/mm: Fix grub_debug_calloc() compilation error
 * 0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch
   42f4054faf3c7f2cd2cab5b43e63f9d97d81f7a1 Makefile: Make libgrub.pp depend on config-util.h

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ld-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch |   313 -
 ...Make-lexer-fatal-errors-actually-be-fatal.patch |    73 -
 ...d-some-arithmetic-primitives-that-check-f.patch |   128 -
 ...-sure-we-always-have-an-overflow-checking.patch |   246 -
 .../0005-calloc-Use-calloc-at-most-places.patch    |  1840 ---
 ...overflow-checking-primitives-where-we-do-.patch |  1326 --
 ...660-Don-t-leak-memory-on-realloc-failures.patch |    72 -
 ...nt-Do-not-load-more-than-one-NAME-section.patch |    41 -
 ...009-gfxmenu-Fix-double-free-in-load_image.patch |    39 -
 ...ble-free-in-grub_xnu_devprop_add_property.patch |    58 -
 ...Make-sure-we-don-t-dereference-past-array.patch |    55 -
 .../0012-term-Fix-overflow-on-user-inputs.patch    |    69 -
 boot/grub2/0013-udf-Fix-memory-leak.patch          |    59 -
 ...Fix-memory-leak-if-grub_create_loader_cmd.patch |    38 -
 .../0015-tftp-Do-not-use-priority-queue.patch      |   283 -
 ...rotect-grub_relocator_alloc_chunk_addr-in.patch |   153 -
 ...rotect-grub_relocator_alloc_chunk_align-m.patch |   341 -
 ...ve-unused-fields-from-grub_script_functio.patch |    37 -
 ...d-a-use-after-free-when-redefining-a-func.patch |   113 -
 ...ix-grub_relocator_alloc_chunk_align-top-m.patch |    49 -
 .../0021-hfsplus-Fix-two-more-overflows.patch      |    61 -
 ...-more-potential-data-dependent-alloc-over.patch |   116 -
 boot/grub2/0023-emu-Make-grub_free-NULL-safe.patch |    38 -
 ...e-malformed-device-path-arithmetic-errors.patch |   239 -
 ...ader-Propagate-errors-from-copy_file_path.patch |    78 -
 ...fi-Fix-use-after-free-in-halt-reboot-path.patch |   183 -
 ...x-Avoid-overflow-on-initrd-size-calculati.patch |    32 -
 ...integer-overflows-in-initrd-size-handling.patch |   173 -
 ...e-shim_lock-GUID-and-protocol-type-public.patch |    97 -
 ...grub_efi_status_t-from-grub_efi_get_varia.patch |   149 -
 ...unction-to-read-EFI-variables-with-attrib.patch |    78 -
 .../grub2/0032-efi-Add-secure-boot-detection.patch |   541 -
 ...ifiers-Move-verifiers-API-to-kernel-image.patch |  1650 ---
 ...e-the-shim_lock-verifier-to-the-GRUB-core.patch | 13225 -------------------
 boot/grub2/0035-kern-Add-lockdown-support.patch    |   763 --
 ...wn-Set-a-variable-if-the-GRUB-is-locked-d.patch |    57 -
 ...n-the-GRUB-when-the-UEFI-Secure-Boot-is-e.patch |    49 -
 ...b_is_lockdown-instead-of-hardcoding-a-dis.patch |   232 -
 ...register-the-acpi-command-when-locked-dow.patch |    76 -
 ...register-cutmem-and-badram-commands-when-.patch |    70 -
 ...strict-commands-that-can-load-BIOS-or-DT-.patch |   105 -
 ...tpci-Restrict-setpci-command-when-locked-.patch |    37 -
 ...parm-Restrict-hdparm-command-when-locked-.patch |    35 -
 ...-gdb-Restrict-GDB-access-when-locked-down.patch |    62 -
 ...Don-t-allow-loading-extension-and-package.patch |    61 -
 .../0046-docs-Document-the-cutmem-command.patch    |    65 -
 ...ow-unloading-modules-that-are-not-depende.patch |    87 -
 ...ossible-out-of-bound-accesses-caused-by-m.patch |   116 -
 ...mory-leak-when-iterating-over-mapped-memo.patch |    40 -
 ...-possible-dereference-to-of-a-NULL-pointe.patch |    40 -
 ...0051-net-tftp-Fix-dangling-memory-pointer.patch |    34 -
 ...2-kern-parser-Fix-resource-leak-if-argc-0.patch |    51 -
 .../0053-kern-efi-Fix-memory-leak-on-failure.patch |    31 -
 ...-mm-Fix-possible-NULL-pointer-dereference.patch |    66 -
 ...55-gnulib-regexec-Resolve-unused-variable.patch |    90 -
 ...regcomp-Fix-uninitialized-token-structure.patch |    82 -
 ...-help-Fix-dereference-of-a-possibly-NULL-.patch |    82 -
 ...lib-regexec-Fix-possible-null-dereference.patch |    83 -
 ...gnulib-regcomp-Fix-uninitialized-re_token.patch |    88 -
 ...esolve-unnecessary-self-assignment-errors.patch |    42 -
 ...061-zstd-Initialize-seq_t-structure-fully.patch |    35 -
 ...ion-Check-for-NULL-before-dereferencing-i.patch |    44 -
 ...ke-sure-comp-data-is-freed-before-exiting.patch |   129 -
 ...k-ldm-If-failed-then-free-vg-variable-too.patch |    29 -
 ...x-memory-leak-on-uninserted-lv-references.patch |    51 -
 ...cryptodisk-Fix-potential-integer-overflow.patch |    51 -
 ...heck-that-the-volume-name-length-is-valid.patch |    44 -
 ...zfs-Fix-possible-negative-shift-operation.patch |    43 -
 ...ix-resource-leaks-while-constructing-path.patch |   122 -
 .../0070-zfs-Fix-possible-integer-overflows.patch  |    57 -
 ...rrect-a-check-for-error-allocating-memory.patch |    36 -
 boot/grub2/0072-affs-Fix-memory-leaks.patch        |    83 -
 ...pi-Fix-possible-unintended-sign-extension.patch |    50 -
 ...bgcrypt-mpi-Fix-possible-NULL-dereference.patch |    49 -
 ...75-syslinux-Fix-memory-leak-while-parsing.patch |    44 -
 ...letion-Fix-leaking-of-memory-when-process.patch |    53 -
 .../0077-commands-hashsum-Fix-a-memory-leak.patch  |    57 -
 ...op-Remove-unnecessary-return-value-of-gru.patch |    95 -
 ...-fb-fbfill-Fix-potential-integer-overflow.patch |    79 -
 ...b-video_fb-Fix-multiple-integer-overflows.patch |   105 -
 ...fb-video_fb-Fix-possible-integer-overflow.patch |    40 -
 ...rs-jpeg-Test-for-an-invalid-next-marker-r.patch |    39 -
 ..._list-Remove-code-that-coverity-is-flaggi.patch |    35 -
 ...85-loader-bsd-Check-for-NULL-arg-up-front.patch |    48 -
 boot/grub2/0086-loader-xnu-Fix-memory-leak.patch   |    39 -
 ...Free-driverkey-data-when-an-error-is-dete.patch |    78 -
 ...-Check-if-pointer-is-NULL-before-using-it.patch |    43 -
 ...rub-install-Fix-NULL-pointer-dereferences.patch |    42 -
 ...ditenv-Fix-incorrect-casting-of-a-signed-.patch |    47 -
 ...fi-Fix-incorrect-use-of-a-possibly-negati.patch |    51 -
 ...ute-Fix-NULL-dereference-in-grub_script_e.patch |    29 -
 ...-Require-device_name-is-not-NULL-before-p.patch |    34 -
 ...ute-Avoid-crash-when-using-outside-a-func.patch |    38 -
 ...ck-repeated-short-options-that-require-an.patch |    56 -
 ...ute-Don-t-crash-on-a-for-loop-with-no-ite.patch |    40 -
 ...menuentry-Fix-quoting-in-setparams_prefix.patch |    48 -
 ...kern-misc-Always-set-end-in-grub_strtoull.patch |    47 -
 ...rs-jpeg-Catch-files-with-unsupported-quan.patch |    53 -
 ...rs-jpeg-Catch-OOB-reads-writes-in-grub_jp.patch |    48 -
 ...rs-jpeg-Don-t-decode-data-before-start-of.patch |    40 -
 ...m-Don-t-set-up-a-font-with-glyphs-that-ar.patch |    52 -
 ...atch-impermissibly-large-block-sizes-in-r.patch |    47 -
 ...Don-t-fetch-a-key-beyond-the-end-of-the-n.patch |    33 -
 ...Don-t-use-uninitialized-data-on-corrupt-f.patch |   108 -
 .../grub2/0106-fs-hfs-Disable-under-lockdown.patch |    47 -
 ...-fs-sfs-Fix-over-read-of-root-object-name.patch |    50 -
 ...ot-move-to-leaf-level-if-name-length-is-n.patch |    34 -
 ...imit-the-extents-that-getblk-can-consider.patch |    62 -
 .../0110-fs-jfs-Catch-infinite-recursion.patch     |    46 -
 .../0111-fs-nilfs2-Reject-too-large-keys.patch     |    46 -
 ...on-t-search-children-if-provided-number-i.patch |   100 -
 ...roperly-bail-on-errors-in-grub_nilfs2_btr.patch |    68 -
 .../0114-io-gzio-Bail-if-gzio-tl-td-is-NULL.patch  |    67 -
 ...-init_dynamic_block-clean-up-if-unpacking.patch |    67 -
 ...tch-missing-values-in-huft_build-and-bail.patch |    57 -
 ...o-gzio-tl-td-in-init_dynamic_block-if-huf.patch |    42 -
 ...n-t-go-beyond-the-end-of-the-data-we-read.patch |    49 -
 ...n-t-blast-past-the-end-of-the-circular-me.patch |    43 -
 .../0120-disk-lvm-Bail-on-missing-PV-list.patch    |    35 -
 ...-not-crash-if-an-expected-string-is-not-f.patch |    83 -
 .../0122-disk-lvm-Do-not-overread-metadata.patch   |   111 -
 ...anitize-rlocn-offset-to-prevent-wild-read.patch |    41 -
 ...-not-allow-a-LV-to-be-it-s-own-segment-s-.patch |    39 -
 ...lidate-the-number-of-stripes-parities-in-.patch |    33 -
 ...-fs-btrfs-Squash-some-uninitialized-reads.patch |    43 -
 .../grub2/0127-kern-parser-Fix-a-memory-leak.patch |    77 -
 ...kern-parser-Introduce-process_char-helper.patch |   120 -
 ...ern-parser-Introduce-terminate_arg-helper.patch |    66 -
 ...-Refactor-grub_parser_split_cmdline-clean.patch |    92 -
 ...ern-buffer-Add-variable-sized-heap-buffer.patch |  1237 --
 ...2-kern-parser-Fix-a-stack-buffer-overflow.patch |   248 -
 ...dd-initial-stack-protector-implementation.patch |   466 -
 ...age-Remove-unused-code-to-add-BSS-section.patch |    61 -
 ...e-Use-grub_host_to_target32-instead-of-gr.patch |   113 -
 ...e-Always-use-grub_host_to_target32-to-ini.patch |    39 -
 ...e-Unify-more-of-the-PE32-and-PE32-header-.patch |   169 -
 ...e-Reorder-PE-optional-header-fields-set-u.patch |    73 -
 ...image-Improve-data_size-value-calculation.patch |    50 -
 ...ge-Refactor-section-setup-to-use-a-helper.patch |   221 -
 ...e-Add-an-option-to-import-SBAT-metadata-i.patch |   264 -
 .../0142-grub-install-common-Add-sbat-option.patch |    85 -
 ...nly-skip-loading-shim_lock-verifier-with-.patch |   270 -
 ...plit-parse_printf_args-into-format-parsin.patch |    50 -
 ...dd-STRING-type-for-internal-printf-format.patch |    68 -
 ...dd-function-to-check-printf-format-agains.patch |   219 -
 ...-Check-printf-format-in-the-gui_progress_.patch |    62 -
 ...emplates-Disable-the-os-prober-by-default.patch |    87 -
 ...m-Fix-grub_debug_calloc-compilation-error.patch |    33 -
 ...e-Make-libgrub.pp-depend-on-config-util.h.patch |    66 -
 boot/grub2/grub2.hash                              |     6 +-
 boot/grub2/grub2.mk                                |    28 +-
 151 files changed, 5 insertions(+), 32356 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
