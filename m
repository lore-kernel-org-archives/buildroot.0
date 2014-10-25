From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:24:02 +0200
Subject: [Buildroot] [git commit] uclibc: rename patches to follow the new
	name structure
Message-ID: <20141025092426.177B2A5C0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e30c5c2b1cf2c535734a5c1f07b612e830a60b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...patch => 0001-add-bsd-endian-conversions.patch} |    0
 ...fy-init1.patch => 0002-add-inotify-init1.patch} |    0
 ...k-cloexec.patch => 0003-add-sock-cloexec.patch} |    0
 ...rverscmp.patch => 0004-export-strverscmp.patch} |    0
 ...> 0005-fix-daylight-saving-time-handling.patch} |    0
 ...f-8.patch => 0006-fix-error-locale-utf-8.patch} |    0
 ...fix.patch => 0007-linuxthreads-errno-fix.patch} |    0
 ...tch => 0008-more-workarounds-GCC-PR32219.patch} |    0
 ...clibc-0009-unshare.patch => 0009-unshare.patch} |    0
 ...219.patch => 0010-workaround-GCC-PR32219.patch} |    0
 ...ts.patch => 0011-startfiles-Make-targets.patch} |    0
 ...patch => 0012-netlinkaccess-header-types.patch} |    0
 ...eps-add-__kernel_long-and-__kernel_ulong.patch} |    0
 ...=> 0001-bits-time.h-sync-with-glibc-2.16.patch} |    0
 ...3-syscall.patch => 0003-Add-dup3-syscall.patch} |    0
 ...eps-add-__kernel_long-and-__kernel_ulong.patch} |    0
 ...tch => 0005-Patch-from-OpenWRT-for-avr32.patch} |    0
 ...store-stack-pointer-just-after-return-fr.patch} |    0
 ....S-Add-missing-IT-instruction-for-Thumb2.patch} |    0
 ...-arm-move-check-for-BX-to-its-own-header.patch} |    0
 ...terp.patch => 0009-mips64-fix-n64-interp.patch} |    0
 ...010-Rules.mak-fix-breakage-from-603af30d.patch} |    0
 ...1-libc-add-non-standard-execvpe-function.patch} |    0
 ...=> 0012-libc-stdlib-add-mkostemp-helpers.patch} |    0
 ...entfd-Implement-eventfd2-and-fix-eventfd.patch} |    0
 ...vise.c.patch => 0015-add-posix_madvise.c.patch} |    0
 ...tl-sh-fix-race-condition-in-lll_wait_tid.patch} |    0
 ...-SIGCANCEL-to-the-list-of-blocked-signal.patch} |    0
 ...8-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch} |    0
 ...clude-elf.h-update-for-ELFOSABI_-changes.patch} |    0
 ...020-update-ptrace.h-to-latest-from-glibc.patch} |    0
 ...-authnone_marshal-in-multithreading-cont.patch} |    0
 ...-__syscall_error-callers-to-use-a0-for-a.patch} |    0
 ...instead-of-v0-for-__syscall_error-argume.patch} |    0
 ...e-.arm-mode-for-resolver-unconditionally.patch} |    0
 ...-getpid-behave-similar-to-the-common-one.patch} |    0
 ...scalls.h-allow-immediate-values-as-6th-s.patch} |    0
 ...0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch} |    0
 ... => 0029-inet-rpc-fix-build-in-NPTL-case.patch} |    0
 ...lement-assignment-allocation-m-character.patch} |    0
 ...ap-sys_mmap2-do-unsigned-shift-of-offset.patch} |    0
 ....patch => 0033-rpmatch-backport-function.patch} |    0
 ...ze.patch => 0034-statfs-support-f_frsize.patch} |    0
 ...-socket.h-pull-socket_type.h-from-eglibc.patch} |    0
 ...nt.h-update.patch => 0036-mount.h-update.patch} |    0
 ..._bits_syscall_h-do-not-leave-undefined-S.patch} |    0
 ...8-libc-sysdeps-sync-bits-in.h-with-glibc.patch} |    0
 ...reuse-free-slots-at-the-end-of-exit-func.patch} |    0
 ...me-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch} |    0
 ...e.patch => 0041-libc-add-posix_fallocate.patch} |    0
 ...fix-overflow-checking-in-int_add_no_wrap.patch} |    0
 ...dd-missing-SYMBOL_PREFIX-to-symbol-names.patch} |    0
 ...net-do-not-filter-responses-in-res_query.patch} |    0
 ...Remove-pragma-weak-for-undeclared-symbol.patch} |    0
 ...ting-the-nameserver-from-_res-state-afte.patch} |    0
 ...use-fputws_unlocked-S-F-instead-of-fputw.patch} |    0
 ...8-Fix-a-problem-with-scanning-wide-chars.patch} |    0
 ...gileness-in-dlopen-do_dlopen-wrapper-wor.patch} |    0
 ...open-implementation-from-statically-link.patch} |    0
 ...e-fix-backtrace-for-statically-linked-ap.patch} |    0
 ...ibubacktrace-fix-build-due-to-some-typos.patch} |    0
 ...licitly-include-uClibc_page.h-to-make-PA.patch} |    0
 ...e-new-bits-scheme-for-arch-specific-flag.patch} |    0
 ...-siginfo_h-add-a-missing-function-member.patch} |    0
 ..._NSIG-to-128-not-129.-This-matches-glibc.patch} |    0
 ...V_PAD_SIZE-takes-__WORDSIZE-into-account.patch} |    0
 ...tus.h-correctly-interpret-status-0x007f-.patch} |    0
 ...8-test-tls-fix-build-with-newer-binutils.patch} |    0
 ...nfig.patch => 0059-test-cater-for-config.patch} |    0
 ...patch => 0060-test-Fix-math-c-dependency.patch} |    0
 ...rking.patch => 0061-fix-sparc-networking.patch} |    0
 ...bdl-Also-include-dl-tls.h-for-for-SHARED.patch} |    0
 ...ptl-remove-duplicate-vfork-in-libpthread.patch} |    0
 ...rpc-update-ptrace.h-to-latest-from-glibc.patch} |    0
 ...arc-update-ptrace.h-to-latest-from-glibc.patch} |    0
 ...add-missing-.literal_position-directives.patch} |    0
 ...posix_fadvise-Fix-build-breakage-for-LFS.patch} |    0
 77 files changed, 0 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
