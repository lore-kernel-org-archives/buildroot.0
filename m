From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 Jan 2016 00:11:36 +0100
Subject: [Buildroot] [PATCH 6/8] uclibc: remove 0.9.33 version
In-Reply-To: <1453148701-10036-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56A6ABA8.1060708@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
> The upstream project is dead, the 0.9.33 version requires tons of
> patches, and uclibc-ng has now successfully replaced uclibc. It is
> time to get rid of the 0.9.33 version.

For some reason I had some issue to apply the patch with pwclient (too many
lines removed at once ? :p )

There is no legacy handling for BR2_UCLIBC_VERSION_0_9_33.

Best regards,
Romain

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-bits-time.h-sync-with-glibc-2.16.patch    |   37 -
>  .../uclibc/0.9.33.2/0003-Add-dup3-syscall.patch    |   54 -
>  ...deps-add-__kernel_long-and-__kernel_ulong.patch |  381 ------
>  ...estore-stack-pointer-just-after-return-fr.patch |   42 -
>  ...e.S-Add-missing-IT-instruction-for-Thumb2.patch |   29 -
>  ...8-arm-move-check-for-BX-to-its-own-header.patch |  257 ----
>  .../0.9.33.2/0009-mips64-fix-n64-interp.patch      |   51 -
>  ...0010-Rules.mak-fix-breakage-from-603af30d.patch |   31 -
>  ...11-libc-add-non-standard-execvpe-function.patch |  163 ---
>  .../0012-libc-stdlib-add-mkostemp-helpers.patch    |  155 ---
>  ...ventfd-Implement-eventfd2-and-fix-eventfd.patch |   64 -
>  .../uclibc/0.9.33.2/0015-add-posix_madvise.c.patch |   61 -
>  ...ptl-sh-fix-race-condition-in-lll_wait_tid.patch |   38 -
>  ...d-SIGCANCEL-to-the-list-of-blocked-signal.patch |   37 -
>  ...18-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch |   52 -
>  ...nclude-elf.h-update-for-ELFOSABI_-changes.patch |   34 -
>  ...0020-update-ptrace.h-to-latest-from-glibc.patch |  113 --
>  ...x-authnone_marshal-in-multithreading-cont.patch |  128 --
>  ...t-__syscall_error-callers-to-use-a0-for-a.patch |   57 -
>  ...-instead-of-v0-for-__syscall_error-argume.patch |   63 -
>  ...se-.arm-mode-for-resolver-unconditionally.patch |   29 -
>  ...s-getpid-behave-similar-to-the-common-one.patch |   53 -
>  ...yscalls.h-allow-immediate-values-as-6th-s.patch |   33 -
>  .../0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch |   57 -
>  .../0029-inet-rpc-fix-build-in-NPTL-case.patch     |   58 -
>  ...plement-assignment-allocation-m-character.patch |  190 ---
>  ...map-sys_mmap2-do-unsigned-shift-of-offset.patch |   35 -
>  .../0.9.33.2/0033-rpmatch-backport-function.patch  |   78 --
>  .../0.9.33.2/0034-statfs-support-f_frsize.patch    |  189 ---
>  ...5-socket.h-pull-socket_type.h-from-eglibc.patch | 1374 --------------------
>  package/uclibc/0.9.33.2/0036-mount.h-update.patch  |   91 --
>  ...n_bits_syscall_h-do-not-leave-undefined-S.patch |   38 -
>  ...38-libc-sysdeps-sync-bits-in.h-with-glibc.patch |  117 --
>  ...-reuse-free-slots-at-the-end-of-exit-func.patch |   43 -
>  ...ame-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch |  200 ---
>  .../0.9.33.2/0041-libc-add-posix_fallocate.patch   |  337 -----
>  ...-fix-overflow-checking-in-int_add_no_wrap.patch |   44 -
>  ...Add-missing-SYMBOL_PREFIX-to-symbol-names.patch |   86 --
>  ...inet-do-not-filter-responses-in-res_query.patch |   46 -
>  ...-Remove-pragma-weak-for-undeclared-symbol.patch |   39 -
>  ...tting-the-nameserver-from-_res-state-afte.patch |   34 -
>  ...-use-fputws_unlocked-S-F-instead-of-fputw.patch |   30 -
>  ...48-Fix-a-problem-with-scanning-wide-chars.patch |   66 -
>  ...agileness-in-dlopen-do_dlopen-wrapper-wor.patch |   66 -
>  ...lopen-implementation-from-statically-link.patch |   60 -
>  ...ce-fix-backtrace-for-statically-linked-ap.patch |  168 ---
>  ...libubacktrace-fix-build-due-to-some-typos.patch |   39 -
>  ...plicitly-include-uClibc_page.h-to-make-PA.patch |   30 -
>  ...se-new-bits-scheme-for-arch-specific-flag.patch |  284 ----
>  ...5-siginfo_h-add-a-missing-function-member.patch |   66 -
>  ...-_NSIG-to-128-not-129.-This-matches-glibc.patch |   43 -
>  ...EV_PAD_SIZE-takes-__WORDSIZE-into-account.patch |   70 -
>  ...atus.h-correctly-interpret-status-0x007f-.patch |   54 -
>  ...58-test-tls-fix-build-with-newer-binutils.patch |   37 -
>  .../0.9.33.2/0059-test-cater-for-config.patch      |   81 --
>  .../0.9.33.2/0060-test-Fix-math-c-dependency.patch |   30 -
>  .../0.9.33.2/0061-fix-sparc-networking.patch       |   39 -
>  ...ibdl-Also-include-dl-tls.h-for-for-SHARED.patch |   58 -
>  ...nptl-remove-duplicate-vfork-in-libpthread.patch |  691 ----------
>  ...erpc-update-ptrace.h-to-latest-from-glibc.patch |  134 --
>  ...parc-update-ptrace.h-to-latest-from-glibc.patch |  151 ---
>  ...clude-__iconv_codesets-into-iconv-utility.patch |   79 --
>  .../0066-mips-rename-siginfo-_timer-members.patch  |  157 ---
>  ...-guard-tcb-offsets.h-include-with-RESET_P.patch |   31 -
>  ...t-implementations-conditional-compilation.patch |   58 -
>  .../0069-Add-missing-C99-float-ld-wrappers.patch   |  870 -------------
>  ...-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch |   89 --
>  .../0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch  |   56 -
>  package/uclibc/Config.in                           |    9 -
>  package/uclibc/uClibc-0.9.33.config                |  277 ----
>  package/uclibc/uclibc.hash                         |    3 -
>  package/uclibc/uclibc.mk                           |    3 -
>  72 files changed, 8847 deletions(-)
>  delete mode 100644 package/uclibc/0.9.33.2/0001-bits-time.h-sync-with-glibc-2.16.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0003-Add-dup3-syscall.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0008-arm-move-check-for-BX-to-its-own-header.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0009-mips64-fix-n64-interp.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0010-Rules.mak-fix-breakage-from-603af30d.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0011-libc-add-non-standard-execvpe-function.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0012-libc-stdlib-add-mkostemp-helpers.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0013-eventfd-Implement-eventfd2-and-fix-eventfd.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0015-add-posix_madvise.c.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0016-nptl-sh-fix-race-condition-in-lll_wait_tid.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0017-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0018-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0019-include-elf.h-update-for-ELFOSABI_-changes.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0020-update-ptrace.h-to-latest-from-glibc.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0022-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0023-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0024-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0025-ldso-use-.arm-mode-for-resolver-unconditionally.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0026-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0027-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0029-inet-rpc-fix-build-in-NPTL-case.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0030-stdio-implement-assignment-allocation-m-character.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0031-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0033-rpmatch-backport-function.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0034-statfs-support-f_frsize.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0035-socket.h-pull-socket_type.h-from-eglibc.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0036-mount.h-update.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0037-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0038-libc-sysdeps-sync-bits-in.h-with-glibc.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0039-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0040-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0041-libc-add-posix_fallocate.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0042-nice-fix-overflow-checking-in-int_add_no_wrap.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0043-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0044-inet-do-not-filter-responses-in-res_query.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0045-Remove-pragma-weak-for-undeclared-symbol.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0046-inet-fix-getting-the-nameserver-from-_res-state-afte.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0047-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0048-Fix-a-problem-with-scanning-wide-chars.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0049-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0050-libdl-fix-dlopen-implementation-from-statically-link.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0051-libubacktrace-fix-backtrace-for-statically-linked-ap.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0052-libubacktrace-fix-build-due-to-some-typos.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0053-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0055-Use-new-bits-scheme-for-arch-specific-flag.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0055-siginfo_h-add-a-missing-function-member.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0058-test-tls-fix-build-with-newer-binutils.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0059-test-cater-for-config.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0060-test-Fix-math-c-dependency.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0061-fix-sparc-networking.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0062-nptl-remove-duplicate-vfork-in-libpthread.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0063-powerpc-update-ptrace.h-to-latest-from-glibc.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0064-sparc-update-ptrace.h-to-latest-from-glibc.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0065-Do-not-include-__iconv_codesets-into-iconv-utility.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0066-mips-rename-siginfo-_timer-members.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0067-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0068-Fix-getopt-implementations-conditional-compilation.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0069-Add-missing-C99-float-ld-wrappers.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0070-libm-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch
>  delete mode 100644 package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
>  delete mode 100644 package/uclibc/uClibc-0.9.33.config
> 
> diff --git a/package/uclibc/0.9.33.2/0001-bits-time.h-sync-with-glibc-2.16.patch b/package/uclibc/0.9.33.2/0001-bits-time.h-sync-with-glibc-2.16.patch
> deleted file mode 100644
> index d93df6d..0000000
> --- a/package/uclibc/0.9.33.2/0001-bits-time.h-sync-with-glibc-2.16.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From bb08cd16cb0353b3d4116ca8959dbecd2e78f545 Mon Sep 17 00:00:00 2001
> -From: Peter Korsgaard <jacmet@sunsite.dk>
> -Date: Tue, 3 Jul 2012 15:54:57 +0200
> -Subject: [PATCH 1/8] bits/time.h: sync with glibc 2.16
> -
> -CLOCK_MONOTONIC_RAW is available since 2.6.28
> -(2d42244ae71d: clocksource: introduce CLOCK_MONOTONIC_RAW), and
> -CLOCK_*_COARSE since 2.6.32 (da15cfdae033: time: Introduce
> -CLOCK_REALTIME_COARSE).
> -
> -Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - libc/sysdeps/linux/common/bits/time.h | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/libc/sysdeps/linux/common/bits/time.h b/libc/sysdeps/linux/common/bits/time.h
> -index 7ed54bf..c871223 100644
> ---- a/libc/sysdeps/linux/common/bits/time.h
> -+++ b/libc/sysdeps/linux/common/bits/time.h
> -@@ -54,6 +54,12 @@
> - #   define CLOCK_PROCESS_CPUTIME_ID	2
> - /* Thread-specific CPU-time clock.  */
> - #   define CLOCK_THREAD_CPUTIME_ID	3
> -+/* Monotonic system-wide clock, not adjusted for frequency scaling.  */
> -+#   define CLOCK_MONOTONIC_RAW		4
> -+/* Identifier for system-wide realtime clock, updated only on ticks.  */
> -+#   define CLOCK_REALTIME_COARSE	5
> -+/* Monotonic system-wide clock, updated only on ticks.  */
> -+#   define CLOCK_MONOTONIC_COARSE	6
> - 
> - /* Flag to indicate time is absolute.  */
> - #   define TIMER_ABSTIME		1
> --- 
> -1.8.1.2
> -
> diff --git a/package/uclibc/0.9.33.2/0003-Add-dup3-syscall.patch b/package/uclibc/0.9.33.2/0003-Add-dup3-syscall.patch
> deleted file mode 100644
> index 663b0e1..0000000
> --- a/package/uclibc/0.9.33.2/0003-Add-dup3-syscall.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 518bc50ae42540574bba360225c8a65b56b79148 Mon Sep 17 00:00:00 2001
> -From: Jonas Bonn <jonas@southpole.se>
> -Date: Tue, 6 Sep 2011 10:30:40 +0200
> -Subject: [PATCH 3/8] Add dup3 syscall
> -
> -Signed-off-by: Jonas Bonn <jonas@southpole.se>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - include/unistd.h                 |  4 ++++
> - libc/sysdeps/linux/common/dup3.c | 17 +++++++++++++++++
> - 2 files changed, 21 insertions(+)
> - create mode 100644 libc/sysdeps/linux/common/dup3.c
> -
> -diff --git a/include/unistd.h b/include/unistd.h
> -index 1b2fd4d..f7d070b 100644
> ---- a/include/unistd.h
> -+++ b/include/unistd.h
> -@@ -513,6 +513,10 @@ extern int dup (int __fd) __THROW __wur;
> - extern int dup2 (int __fd, int __fd2) __THROW;
> - libc_hidden_proto(dup2)
> - 
> -+/* Duplicate FD to FD2, closing FD2 and making it open on the same file.  */
> -+extern int dup3 (int __fd, int __fd2, int __flags) __THROW;
> -+libc_hidden_proto(dup3)
> -+
> - /* NULL-terminated array of "NAME=VALUE" environment variables.  */
> - extern char **__environ;
> - #ifdef __USE_GNU
> -diff --git a/libc/sysdeps/linux/common/dup3.c b/libc/sysdeps/linux/common/dup3.c
> -new file mode 100644
> -index 0000000..7b57438
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/dup3.c
> -@@ -0,0 +1,17 @@
> -+/* vi: set sw=4 ts=4: */
> -+/*
> -+ * dup3() for uClibc
> -+ *
> -+ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
> -+ *
> -+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> -+ */
> -+
> -+#include <sys/syscall.h>
> -+#include <unistd.h>
> -+
> -+
> -+#ifdef __NR_dup3
> -+_syscall3(int, dup3, int, oldfd, int, newfd, int, flags)
> -+libc_hidden_def(dup3)
> -+#endif
> --- 
> -1.8.1.2
> -
> diff --git a/package/uclibc/0.9.33.2/0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch b/package/uclibc/0.9.33.2/0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
> deleted file mode 100644
> index edd68f1..0000000
> --- a/package/uclibc/0.9.33.2/0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
> +++ /dev/null
> @@ -1,381 +0,0 @@
> -From 7fef6b983456e4c529a5239ea90715050e6f4452 Mon Sep 17 00:00:00 2001
> -From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> -Date: Mon, 1 Oct 2012 18:12:54 +1300
> -Subject: [PATCH 4/8] libc/sysdeps: add __kernel_long and __kernel_ulong
> -
> -Linux 3.4 added __kernel_long_t and __kernel_ulong_t and various
> -exported header files were updated to use these new types. Add the
> -definitions for __kernel_long_t and __kernel_ulong_t to the relevant
> -kernel_types.h headers.
> -
> -This change was automated with the following scriptlet
> -
> -  git grep --name-only 'typedef.*__kernel_old_dev_t' \
> -    | xargs sed -i '/typedef.*__kernel_old_dev_t/ a\
> -  typedef long\t\t__kernel_long_t;\
> -  typedef unsigned long\t__kernel_ulong_t;'
> -
> -Whitespace in arm, hppa, sparc was then manually fixed up.
> -
> -Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> -[yann.morin.1998 at free.fr: remove avr32 bits, now Buildroot no longer
> - supports it]
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> -Here's a cleaned up patch which should get the whitespace right. I'm a
> -bit iffy about the sparc changes they make sense to me but it's not a
> -platform I have access to.
> -
> -I can break this up per arch or per maintainer if requested.
> -
> - libc/sysdeps/linux/alpha/bits/kernel_types.h      |    2 ++
> - libc/sysdeps/linux/arm/bits/kernel_types.h        |    2 ++
> - libc/sysdeps/linux/bfin/bits/kernel_types.h       |    2 ++
> - libc/sysdeps/linux/c6x/bits/kernel_types.h        |    2 ++
> - libc/sysdeps/linux/cris/bits/kernel_types.h       |    2 ++
> - libc/sysdeps/linux/e1/bits/kernel_types.h         |    2 ++
> - libc/sysdeps/linux/h8300/bits/kernel_types.h      |    2 ++
> - libc/sysdeps/linux/hppa/bits/kernel_types.h       |    2 ++
> - libc/sysdeps/linux/i386/bits/kernel_types.h       |    2 ++
> - libc/sysdeps/linux/ia64/bits/kernel_types.h       |    2 ++
> - libc/sysdeps/linux/m68k/bits/kernel_types.h       |    2 ++
> - libc/sysdeps/linux/microblaze/bits/kernel_types.h |    2 ++
> - libc/sysdeps/linux/mips/bits/kernel_types.h       |    4 ++++
> - libc/sysdeps/linux/nios2/bits/kernel_types.h      |    2 ++
> - libc/sysdeps/linux/powerpc/bits/kernel_types.h    |    4 ++++
> - libc/sysdeps/linux/sh/bits/kernel_types.h         |    2 ++
> - libc/sysdeps/linux/sh64/bits/kernel_types.h       |    2 ++
> - libc/sysdeps/linux/sparc/bits/kernel_types.h      |    4 ++++
> - libc/sysdeps/linux/v850/bits/kernel_types.h       |    2 ++
> - libc/sysdeps/linux/x86_64/bits/kernel_types.h     |    2 ++
> - libc/sysdeps/linux/xtensa/bits/kernel_types.h     |    2 ++
> - 22 files changed, 50 insertions(+)
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - libc/sysdeps/linux/alpha/bits/kernel_types.h      | 2 ++
> - libc/sysdeps/linux/arm/bits/kernel_types.h        | 2 ++
> - libc/sysdeps/linux/bfin/bits/kernel_types.h       | 2 ++
> - libc/sysdeps/linux/c6x/bits/kernel_types.h        | 2 ++
> - libc/sysdeps/linux/cris/bits/kernel_types.h       | 2 ++
> - libc/sysdeps/linux/e1/bits/kernel_types.h         | 2 ++
> - libc/sysdeps/linux/h8300/bits/kernel_types.h      | 2 ++
> - libc/sysdeps/linux/hppa/bits/kernel_types.h       | 2 ++
> - libc/sysdeps/linux/i386/bits/kernel_types.h       | 2 ++
> - libc/sysdeps/linux/ia64/bits/kernel_types.h       | 2 ++
> - libc/sysdeps/linux/m68k/bits/kernel_types.h       | 2 ++
> - libc/sysdeps/linux/microblaze/bits/kernel_types.h | 2 ++
> - libc/sysdeps/linux/mips/bits/kernel_types.h       | 4 ++++
> - libc/sysdeps/linux/nios2/bits/kernel_types.h      | 2 ++
> - libc/sysdeps/linux/powerpc/bits/kernel_types.h    | 4 ++++
> - libc/sysdeps/linux/sh/bits/kernel_types.h         | 2 ++
> - libc/sysdeps/linux/sh64/bits/kernel_types.h       | 2 ++
> - libc/sysdeps/linux/sparc/bits/kernel_types.h      | 4 ++++
> - libc/sysdeps/linux/v850/bits/kernel_types.h       | 2 ++
> - libc/sysdeps/linux/x86_64/bits/kernel_types.h     | 2 ++
> - libc/sysdeps/linux/xtensa/bits/kernel_types.h     | 2 ++
> - 22 files changed, 50 insertions(+)
> -
> -diff --git a/libc/sysdeps/linux/alpha/bits/kernel_types.h b/libc/sysdeps/linux/alpha/bits/kernel_types.h
> -index d5574c9..cd59b9d 100644
> ---- a/libc/sysdeps/linux/alpha/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/alpha/bits/kernel_types.h
> -@@ -33,6 +33,8 @@ typedef __kernel_gid_t __kernel_old_gid_t;
> - typedef __kernel_uid_t __kernel_uid32_t;
> - typedef __kernel_gid_t __kernel_gid32_t;
> - typedef __kernel_dev_t __kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - 
> - typedef struct {
> - 	int val[2];
> -diff --git a/libc/sysdeps/linux/arm/bits/kernel_types.h b/libc/sysdeps/linux/arm/bits/kernel_types.h
> -index 766a306..6b36f32 100644
> ---- a/libc/sysdeps/linux/arm/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/arm/bits/kernel_types.h
> -@@ -32,6 +32,8 @@ typedef unsigned short		__kernel_old_uid_t;
> - typedef unsigned short		__kernel_old_gid_t;
> - typedef long long		__kernel_loff_t;
> - typedef __kernel_dev_t		__kernel_old_dev_t;
> -+typedef long			__kernel_long_t;
> -+typedef unsigned long		__kernel_ulong_t;
> - 
> - typedef struct {
> - #ifdef __USE_ALL
> -diff --git a/libc/sysdeps/linux/bfin/bits/kernel_types.h b/libc/sysdeps/linux/bfin/bits/kernel_types.h
> -index d69a875..9fec595 100644
> ---- a/libc/sysdeps/linux/bfin/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/bfin/bits/kernel_types.h
> -@@ -32,6 +32,8 @@ typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef long long	__kernel_loff_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - 
> - typedef struct {
> - #ifdef __USE_ALL
> -diff --git a/libc/sysdeps/linux/c6x/bits/kernel_types.h b/libc/sysdeps/linux/c6x/bits/kernel_types.h
> -index 7557309..2c363a8 100644
> ---- a/libc/sysdeps/linux/c6x/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/c6x/bits/kernel_types.h
> -@@ -22,6 +22,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned int	__kernel_old_uid_t;
> - typedef unsigned int	__kernel_old_gid_t;
> - typedef unsigned int	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef unsigned int	__kernel_size_t;
> - typedef int		__kernel_ssize_t;
> - typedef int		__kernel_ptrdiff_t;
> -diff --git a/libc/sysdeps/linux/cris/bits/kernel_types.h b/libc/sysdeps/linux/cris/bits/kernel_types.h
> -index f122c7f..5d31f7b 100644
> ---- a/libc/sysdeps/linux/cris/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/cris/bits/kernel_types.h
> -@@ -28,6 +28,8 @@ typedef unsigned int    __kernel_gid32_t;
> - typedef unsigned short  __kernel_old_uid_t;
> - typedef unsigned short  __kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - 
> - #ifdef __GNUC__
> - typedef long long	__kernel_loff_t;
> -diff --git a/libc/sysdeps/linux/e1/bits/kernel_types.h b/libc/sysdeps/linux/e1/bits/kernel_types.h
> -index 8017d85..f55a129 100644
> ---- a/libc/sysdeps/linux/e1/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/e1/bits/kernel_types.h
> -@@ -31,6 +31,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long	__kernel_loff_t;
> - 
> - /*
> -diff --git a/libc/sysdeps/linux/h8300/bits/kernel_types.h b/libc/sysdeps/linux/h8300/bits/kernel_types.h
> -index 0570675..4cfd1bf 100644
> ---- a/libc/sysdeps/linux/h8300/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/h8300/bits/kernel_types.h
> -@@ -32,6 +32,8 @@ typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef long long	__kernel_loff_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - 
> - typedef struct {
> - #ifdef __USE_ALL
> -diff --git a/libc/sysdeps/linux/hppa/bits/kernel_types.h b/libc/sysdeps/linux/hppa/bits/kernel_types.h
> -index 4441f9b..6b2e794 100644
> ---- a/libc/sysdeps/linux/hppa/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/hppa/bits/kernel_types.h
> -@@ -45,6 +45,8 @@ typedef long long		__kernel_off64_t;
> - typedef unsigned long long	__kernel_ino64_t;
> - 
> - typedef unsigned int		__kernel_old_dev_t;
> -+typedef long			__kernel_long_t;
> -+typedef unsigned long		__kernel_ulong_t;
> - 
> - typedef struct {
> - #ifdef __USE_ALL
> -diff --git a/libc/sysdeps/linux/i386/bits/kernel_types.h b/libc/sysdeps/linux/i386/bits/kernel_types.h
> -index 9c07c72..59044b8 100644
> ---- a/libc/sysdeps/linux/i386/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/i386/bits/kernel_types.h
> -@@ -40,6 +40,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long	__kernel_loff_t;
> - 
> - typedef struct {
> -diff --git a/libc/sysdeps/linux/ia64/bits/kernel_types.h b/libc/sysdeps/linux/ia64/bits/kernel_types.h
> -index c8ef86d..e31dc65 100644
> ---- a/libc/sysdeps/linux/ia64/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/ia64/bits/kernel_types.h
> -@@ -52,5 +52,7 @@ typedef __kernel_gid_t __kernel_gid32_t;
> - 
> - typedef unsigned int	__kernel_dev_t;
> - typedef unsigned int	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - 
> - #endif /* _ASM_IA64_POSIX_TYPES_H */
> -diff --git a/libc/sysdeps/linux/m68k/bits/kernel_types.h b/libc/sysdeps/linux/m68k/bits/kernel_types.h
> -index 0a77a8f..176b968 100644
> ---- a/libc/sysdeps/linux/m68k/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/m68k/bits/kernel_types.h
> -@@ -32,6 +32,8 @@ typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef long long	__kernel_loff_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - 
> - typedef struct {
> - #ifdef __USE_ALL
> -diff --git a/libc/sysdeps/linux/microblaze/bits/kernel_types.h b/libc/sysdeps/linux/microblaze/bits/kernel_types.h
> -index 2a70575..a9f736b 100644
> ---- a/libc/sysdeps/linux/microblaze/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/microblaze/bits/kernel_types.h
> -@@ -44,6 +44,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned int	__kernel_old_uid_t;
> - typedef unsigned int	__kernel_old_gid_t;
> - typedef unsigned int	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - 
> - #ifdef __GNUC__
> - typedef long long	__kernel_loff_t;
> -diff --git a/libc/sysdeps/linux/mips/bits/kernel_types.h b/libc/sysdeps/linux/mips/bits/kernel_types.h
> -index 9fc3b96..97faeac 100644
> ---- a/libc/sysdeps/linux/mips/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/mips/bits/kernel_types.h
> -@@ -32,6 +32,8 @@ typedef int		__kernel_gid32_t;
> - typedef __kernel_uid_t	__kernel_old_uid_t;
> - typedef __kernel_gid_t	__kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long      __kernel_loff_t;
> - #else
> - typedef unsigned int	__kernel_dev_t;
> -@@ -68,6 +70,8 @@ typedef int		__kernel_gid32_t;
> - typedef __kernel_uid_t	__kernel_old_uid_t;
> - typedef __kernel_gid_t	__kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long      __kernel_loff_t;
> - #endif
> - 
> -diff --git a/libc/sysdeps/linux/nios2/bits/kernel_types.h b/libc/sysdeps/linux/nios2/bits/kernel_types.h
> -index 8b86d79..3c030e7 100644
> ---- a/libc/sysdeps/linux/nios2/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/nios2/bits/kernel_types.h
> -@@ -31,6 +31,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef unsigned short	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long	__kernel_loff_t;
> - 
> - typedef struct {
> -diff --git a/libc/sysdeps/linux/powerpc/bits/kernel_types.h b/libc/sysdeps/linux/powerpc/bits/kernel_types.h
> -index 3f3b933..1167de2 100644
> ---- a/libc/sysdeps/linux/powerpc/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/powerpc/bits/kernel_types.h
> -@@ -36,6 +36,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned int	__kernel_old_uid_t;
> - typedef unsigned int	__kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - #else
> - typedef unsigned int	__kernel_dev_t;
> - typedef unsigned int	__kernel_ino_t;
> -@@ -61,6 +63,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned int	__kernel_old_uid_t;
> - typedef unsigned int	__kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long	__kernel_loff_t;
> - #endif
> - 
> -diff --git a/libc/sysdeps/linux/sh/bits/kernel_types.h b/libc/sysdeps/linux/sh/bits/kernel_types.h
> -index f96e9fa..ac97261 100644
> ---- a/libc/sysdeps/linux/sh/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/sh/bits/kernel_types.h
> -@@ -32,6 +32,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long	__kernel_loff_t;
> - 
> - typedef struct {
> -diff --git a/libc/sysdeps/linux/sh64/bits/kernel_types.h b/libc/sysdeps/linux/sh64/bits/kernel_types.h
> -index 671cc83..8cc6c61 100644
> ---- a/libc/sysdeps/linux/sh64/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/sh64/bits/kernel_types.h
> -@@ -43,6 +43,8 @@ typedef unsigned int    __kernel_gid32_t;
> - typedef unsigned short  __kernel_old_uid_t;
> - typedef unsigned short  __kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long       __kernel_loff_t;
> - 
> - typedef struct {
> -diff --git a/libc/sysdeps/linux/sparc/bits/kernel_types.h b/libc/sysdeps/linux/sparc/bits/kernel_types.h
> -index 0cc4bc2..a10e075 100644
> ---- a/libc/sysdeps/linux/sparc/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/sparc/bits/kernel_types.h
> -@@ -32,6 +32,8 @@ typedef unsigned short	       __kernel_gid16_t;
> - typedef __kernel_uid_t 	       __kernel_old_uid_t;
> - typedef __kernel_gid_t         __kernel_old_gid_t;
> - typedef __kernel_dev_t         __kernel_old_dev_t;
> -+typedef long                   __kernel_long_t;
> -+typedef unsigned long          __kernel_ulong_t;
> - typedef __kernel_uid_t	       __kernel_uid32_t;
> - typedef __kernel_gid_t	       __kernel_gid32_t;
> - typedef int		       __kernel_suseconds_t;
> -@@ -62,6 +64,8 @@ typedef unsigned int	       __kernel_gid32_t;
> - typedef unsigned short	       __kernel_old_uid_t;
> - typedef unsigned short	       __kernel_old_gid_t;
> - typedef __kernel_dev_t         __kernel_old_dev_t;
> -+typedef long                   __kernel_long_t;
> -+typedef unsigned long          __kernel_ulong_t;
> - typedef long long              __kernel_loff_t;
> - #endif
> - 
> -diff --git a/libc/sysdeps/linux/v850/bits/kernel_types.h b/libc/sysdeps/linux/v850/bits/kernel_types.h
> -index 3e851ab..780aa8a 100644
> ---- a/libc/sysdeps/linux/v850/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/v850/bits/kernel_types.h
> -@@ -41,6 +41,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - 
> - typedef struct {
> - #ifdef __USE_ALL
> -diff --git a/libc/sysdeps/linux/x86_64/bits/kernel_types.h b/libc/sysdeps/linux/x86_64/bits/kernel_types.h
> -index de800d7..0cae08c 100644
> ---- a/libc/sysdeps/linux/x86_64/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/x86_64/bits/kernel_types.h
> -@@ -40,6 +40,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef __kernel_dev_t	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long	__kernel_loff_t;
> - 
> - typedef struct {
> -diff --git a/libc/sysdeps/linux/xtensa/bits/kernel_types.h b/libc/sysdeps/linux/xtensa/bits/kernel_types.h
> -index 44f1075..ed38f2e 100644
> ---- a/libc/sysdeps/linux/xtensa/bits/kernel_types.h
> -+++ b/libc/sysdeps/linux/xtensa/bits/kernel_types.h
> -@@ -33,6 +33,8 @@ typedef unsigned int	__kernel_gid32_t;
> - typedef unsigned short	__kernel_old_uid_t;
> - typedef unsigned short	__kernel_old_gid_t;
> - typedef unsigned short	__kernel_old_dev_t;
> -+typedef long		__kernel_long_t;
> -+typedef unsigned long	__kernel_ulong_t;
> - typedef long long	__kernel_loff_t;
> - 
> - /* Beginning in 2.6 kernels, which is the first version that includes the
> --- 
> -1.8.1.2
> -
> diff --git a/package/uclibc/0.9.33.2/0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch b/package/uclibc/0.9.33.2/0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
> deleted file mode 100644
> index de97850..0000000
> --- a/package/uclibc/0.9.33.2/0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 963671276c0ef14458e0a7990107bcd2c075f3cd Mon Sep 17 00:00:00 2001
> -From: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Date: Mon, 10 Dec 2012 09:50:52 +0100
> -Subject: [PATCH 6/8] arm: clone: restore stack pointer just after return from
> - syscall
> -
> -If the syscall returns with an error the stack pointer and r4 register
> -are not restored because the instruction 'ldmnefd sp!, {r4}' is executed
> -after branching to '__error' label.
> -This bug has been spotted out by running './utstest clone 5' from LTP
> -built with -fstack-protector-all compiler flag as log below:
> -
> -root at cortex-a9:/usr/tests/ltp/testcases/bin# ./utstest clone 5
> -stack smashing detected: ./utstest terminated()
> -
> -Regression introduced by commit e58798e107d652644629a1daaa95d76430808d53
> -
> -Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Signed-off-by: Giuseppe Di Giore <giuseppe.di-giore@st.com>
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - libc/sysdeps/linux/arm/clone.S | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libc/sysdeps/linux/arm/clone.S b/libc/sysdeps/linux/arm/clone.S
> -index fdc05b8..e4101ba 100644
> ---- a/libc/sysdeps/linux/arm/clone.S
> -+++ b/libc/sysdeps/linux/arm/clone.S
> -@@ -111,8 +111,8 @@ __clone:
> - 	ldr	r4, [sp, #12]
> - 	DO_CALL (clone)
> - 	movs	a1, a1
> --	blt	__error
> - 	ldmnefd	sp!, {r4}
> -+	blt	__error
> - 	IT(t, ne)
> - #if defined(__USE_BX__)
> - 	bxne	lr
> --- 
> -1.8.1.2
> -
> diff --git a/package/uclibc/0.9.33.2/0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch b/package/uclibc/0.9.33.2/0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
> deleted file mode 100644
> index f4097e9..0000000
> --- a/package/uclibc/0.9.33.2/0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From c12211a2f1832169e31063512b3e2081e503e856 Mon Sep 17 00:00:00 2001
> -From: Will Newton <will.newton@linaro.org>
> -Date: Tue, 2 Apr 2013 13:53:35 +0100
> -Subject: [PATCH 7/8] arm/clone.S: Add missing IT instruction for Thumb2.
> -
> -The conditional load needs to be made part of an IT block on Thumb2
> -cores.
> -
> -Signed-off-by: Will Newton <will.newton@linaro.org>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - libc/sysdeps/linux/arm/clone.S | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libc/sysdeps/linux/arm/clone.S b/libc/sysdeps/linux/arm/clone.S
> -index e4101ba..1f7f09d 100644
> ---- a/libc/sysdeps/linux/arm/clone.S
> -+++ b/libc/sysdeps/linux/arm/clone.S
> -@@ -111,6 +111,7 @@ __clone:
> - 	ldr	r4, [sp, #12]
> - 	DO_CALL (clone)
> - 	movs	a1, a1
> -+	IT(t, ne)
> - 	ldmnefd	sp!, {r4}
> - 	blt	__error
> - 	IT(t, ne)
> --- 
> -1.8.1.2
> -
> diff --git a/package/uclibc/0.9.33.2/0008-arm-move-check-for-BX-to-its-own-header.patch b/package/uclibc/0.9.33.2/0008-arm-move-check-for-BX-to-its-own-header.patch
> deleted file mode 100644
> index c3031b4..0000000
> --- a/package/uclibc/0.9.33.2/0008-arm-move-check-for-BX-to-its-own-header.patch
> +++ /dev/null
> @@ -1,257 +0,0 @@
> -From 06827e81c976d16aa5861a40ac0d780b63a4d470 Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Thu, 11 Apr 2013 23:02:03 +0200
> -Subject: [PATCH 8/8] arm: move check for BX to its own header
> -
> -As Will noticed, the header this check is currently done in
> -is asm-only, and is not meant to be included from C code.
> -This breaks compilation when compiled for a Thumb2-aware CPU.
> -
> -Move the BX check to its own header, and revert 7a246fd.
> -
> -Reported-by: Will Newton <will.newton@gmail.com>
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Cc: Will Newton <will.newton@gmail.com>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - ldso/ldso/arm/dl-startup.h            |  2 +-
> - ldso/ldso/arm/resolve.S               |  1 +
> - libc/string/arm/_memcpy.S             |  1 +
> - libc/string/arm/memcmp.S              |  1 +
> - libc/string/arm/memset.S              |  1 +
> - libc/string/arm/strcmp.S              |  1 +
> - libc/string/arm/strlen.S              |  1 +
> - libc/sysdeps/linux/arm/__longjmp.S    |  2 +-
> - libc/sysdeps/linux/arm/bits/arm_asm.h |  8 --------
> - libc/sysdeps/linux/arm/bits/arm_bx.h  | 34 ++++++++++++++++++++++++++++++++++
> - libc/sysdeps/linux/arm/clone.S        |  1 +
> - libc/sysdeps/linux/arm/mmap64.S       |  1 +
> - libc/sysdeps/linux/arm/syscall-eabi.S |  1 +
> - libc/sysdeps/linux/arm/sysdep.h       |  2 +-
> - libc/sysdeps/linux/arm/vfork.S        |  1 +
> - 15 files changed, 47 insertions(+), 11 deletions(-)
> - create mode 100644 libc/sysdeps/linux/arm/bits/arm_bx.h
> -
> -diff --git a/ldso/ldso/arm/dl-startup.h b/ldso/ldso/arm/dl-startup.h
> -index f7d6052..8d6122b 100644
> ---- a/ldso/ldso/arm/dl-startup.h
> -+++ b/ldso/ldso/arm/dl-startup.h
> -@@ -7,7 +7,7 @@
> -  */
> - 
> - #include <features.h>
> --#include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - #if !defined(__thumb__)
> - __asm__(
> -diff --git a/ldso/ldso/arm/resolve.S b/ldso/ldso/arm/resolve.S
> -index 08889d0..600d3af 100644
> ---- a/ldso/ldso/arm/resolve.S
> -+++ b/ldso/ldso/arm/resolve.S
> -@@ -92,6 +92,7 @@
> - 
> - #include <sys/syscall.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - #include <features.h>
> - 
> -diff --git a/libc/string/arm/_memcpy.S b/libc/string/arm/_memcpy.S
> -index b26080d..c59f5b8 100644
> ---- a/libc/string/arm/_memcpy.S
> -+++ b/libc/string/arm/_memcpy.S
> -@@ -40,6 +40,7 @@
> - #include <features.h>
> - #include <endian.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - #if !defined(THUMB1_ONLY)
> - /*
> -diff --git a/libc/string/arm/memcmp.S b/libc/string/arm/memcmp.S
> -index 65409f4..9f78415 100644
> ---- a/libc/string/arm/memcmp.S
> -+++ b/libc/string/arm/memcmp.S
> -@@ -31,6 +31,7 @@
> - 
> - #include <features.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - .text
> - .global memcmp
> -diff --git a/libc/string/arm/memset.S b/libc/string/arm/memset.S
> -index 66aa603..6f78128 100644
> ---- a/libc/string/arm/memset.S
> -+++ b/libc/string/arm/memset.S
> -@@ -20,6 +20,7 @@
> - #include <features.h>
> - #include <sys/syscall.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - .text
> - .global memset
> -diff --git a/libc/string/arm/strcmp.S b/libc/string/arm/strcmp.S
> -index 97363c1..8b77ab0 100644
> ---- a/libc/string/arm/strcmp.S
> -+++ b/libc/string/arm/strcmp.S
> -@@ -31,6 +31,7 @@
> - 
> - #include <features.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - .text
> - .global strcmp
> -diff --git a/libc/string/arm/strlen.S b/libc/string/arm/strlen.S
> -index 949e918..141f849 100644
> ---- a/libc/string/arm/strlen.S
> -+++ b/libc/string/arm/strlen.S
> -@@ -21,6 +21,7 @@
> - #include <endian.h>
> - #include <sys/syscall.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - /* size_t strlen(const char *S)
> -  * entry: r0 -> string
> -diff --git a/libc/sysdeps/linux/arm/__longjmp.S b/libc/sysdeps/linux/arm/__longjmp.S
> -index 5faf4ec..7418dc2 100644
> ---- a/libc/sysdeps/linux/arm/__longjmp.S
> -+++ b/libc/sysdeps/linux/arm/__longjmp.S
> -@@ -19,11 +19,11 @@
> - 
> - #include <features.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - #define _SETJMP_H
> - #define _ASM
> - #include <bits/setjmp.h>
> - 
> --
> - .global __longjmp
> - .type __longjmp,%function
> - .align 2
> -diff --git a/libc/sysdeps/linux/arm/bits/arm_asm.h b/libc/sysdeps/linux/arm/bits/arm_asm.h
> -index 921c9a3..ff8ea92 100644
> ---- a/libc/sysdeps/linux/arm/bits/arm_asm.h
> -+++ b/libc/sysdeps/linux/arm/bits/arm_asm.h
> -@@ -24,12 +24,4 @@
> - #define THUMB1_ONLY 1
> - #endif
> - 
> --#if defined(__USE_BX__)
> --# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
> --      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
> --     )
> --#  error Use of BX was requested, but is not available on the target processor.
> --# endif /* ARCH level */
> --#endif /* __USE_BX__ */
> --
> - #endif /* _ARM_ASM_H */
> -diff --git a/libc/sysdeps/linux/arm/bits/arm_bx.h b/libc/sysdeps/linux/arm/bits/arm_bx.h
> -new file mode 100644
> -index 0000000..321490e
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/arm/bits/arm_bx.h
> -@@ -0,0 +1,34 @@
> -+/* Copyright (C) 2013 Yann E. MORIN <yann.morin.1998@free.fr>
> -+ *
> -+ * This file is free software; you can redistribute it and/or modify
> -+ * it under the terms of the GNU Lesser General Public License as
> -+ * published by the Free Software Foundation; either version 2.1 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This file is distributed in the hope that it will be useful, but
> -+ * WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+ * Lesser General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU Lesser General Public
> -+ * License along with the GNU C Library; if not, see
> -+ * <http://www.gnu.org/licenses/>.
> -+ */
> -+
> -+#ifndef _ARM_BX_H
> -+#define _ARM_BX_H
> -+
> -+/* We need features.h first */
> -+#if !defined _FEATURES_H
> -+#error Please include features.h first
> -+#endif /* features.h not yet included */
> -+
> -+#if defined(__USE_BX__)
> -+# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
> -+      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
> -+     )
> -+#  error Use of BX was requested, but is not available on the target processor.
> -+# endif /* ARCH level */
> -+#endif /* __USE_BX__ */
> -+
> -+#endif /* _ARM_BX_H */
> -diff --git a/libc/sysdeps/linux/arm/clone.S b/libc/sysdeps/linux/arm/clone.S
> -index 1f7f09d..4d646be 100644
> ---- a/libc/sysdeps/linux/arm/clone.S
> -+++ b/libc/sysdeps/linux/arm/clone.S
> -@@ -25,6 +25,7 @@
> - #include <bits/errno.h>
> - #include <sys/syscall.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - #if defined(__NR_clone)
> - /* int clone(int (*fn)(void *arg), void *child_stack, int flags, void *arg); */
> -diff --git a/libc/sysdeps/linux/arm/mmap64.S b/libc/sysdeps/linux/arm/mmap64.S
> -index 7071541..bd2cfb8 100644
> ---- a/libc/sysdeps/linux/arm/mmap64.S
> -+++ b/libc/sysdeps/linux/arm/mmap64.S
> -@@ -21,6 +21,7 @@
> - #include <bits/errno.h>
> - #include <sys/syscall.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - #if defined __UCLIBC_HAS_LFS__ && defined __NR_mmap2
> - 
> -diff --git a/libc/sysdeps/linux/arm/syscall-eabi.S b/libc/sysdeps/linux/arm/syscall-eabi.S
> -index b931882..019f701 100644
> ---- a/libc/sysdeps/linux/arm/syscall-eabi.S
> -+++ b/libc/sysdeps/linux/arm/syscall-eabi.S
> -@@ -18,6 +18,7 @@
> - 
> - #include <sys/syscall.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - /* In the EABI syscall interface, we don't need a special syscall to
> -    implement syscall().  It won't work reliably with 64-bit arguments
> -diff --git a/libc/sysdeps/linux/arm/sysdep.h b/libc/sysdeps/linux/arm/sysdep.h
> -index e498695..9c1dbca 100644
> ---- a/libc/sysdeps/linux/arm/sysdep.h
> -+++ b/libc/sysdeps/linux/arm/sysdep.h
> -@@ -21,7 +21,7 @@
> - #define _LINUX_ARM_SYSDEP_H 1
> - 
> - #include <common/sysdep.h>
> --#include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - #include <sys/syscall.h>
> - /* For Linux we can use the system call table in the header file
> -diff --git a/libc/sysdeps/linux/arm/vfork.S b/libc/sysdeps/linux/arm/vfork.S
> -index 17d6a4d..6c55d71 100644
> ---- a/libc/sysdeps/linux/arm/vfork.S
> -+++ b/libc/sysdeps/linux/arm/vfork.S
> -@@ -7,6 +7,7 @@
> - 
> - #include <features.h>
> - #include <bits/arm_asm.h>
> -+#include <bits/arm_bx.h>
> - 
> - #define _ERRNO_H
> - #include <bits/errno.h>
> --- 
> -1.8.1.2
> -
> diff --git a/package/uclibc/0.9.33.2/0009-mips64-fix-n64-interp.patch b/package/uclibc/0.9.33.2/0009-mips64-fix-n64-interp.patch
> deleted file mode 100644
> index 7efef78..0000000
> --- a/package/uclibc/0.9.33.2/0009-mips64-fix-n64-interp.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 603af30d6992e94ac30a66b953264076f4f2fd71 Mon Sep 17 00:00:00 2001
> -From: Markos Chandras <markos.chandras@imgtec.com>
> -Date: Thu, 11 Jul 2013 16:59:16 +0000
> -Subject: Rules.mak: MIPS64: Select correct interpreter
> -
> -gcc (eg 4.7.3) hardcodes the MIPS64 interpreters like this:
> -(see gcc/config/linux.h and gcc/config/mips/linux64.h)
> -
> -o32: UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> -n32: UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
> -n64: UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> -
> -The existing check for MIPS64 in uClibc is wrong because it does
> -not respect the selected ABI
> -
> -We fix this by explicitely checking the selected ABI instead of the
> -selected MIPS variant.
> -
> -Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> -Cc: Anthony G. Basile <blueness@gentoo.org>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> -diff --git a/Rules.mak b/Rules.mak
> -index 792b794..889108e 100644
> ---- a/Rules.mak
> -+++ b/Rules.mak
> -@@ -138,13 +138,19 @@ export MAJOR_VERSION MINOR_VERSION SUBLEVEL VERSION ABI_VERSION LC_ALL
> - LIBC := libc
> - SHARED_LIBNAME := $(LIBC).so.$(ABI_VERSION)
> - UBACKTRACE_DSO := libubacktrace.so.$(ABI_VERSION)
> --ifneq ($(findstring  $(TARGET_ARCH) , hppa64 ia64 mips64 powerpc64 s390x sparc64 x86_64 ),)
> -+
> -+UCLIBC_LDSO_NAME := ld-uClibc
> -+ARCH_NATIVE_BIT := 32
> -+ifneq ($(findstring $(TARGET_ARCH),hppa64 ia64 powerpc64 s390x sparc64 x86_64),)
> - UCLIBC_LDSO_NAME := ld64-uClibc
> - ARCH_NATIVE_BIT := 64
> - else
> --UCLIBC_LDSO_NAME := ld-uClibc
> --ARCH_NATIVE_BIT := 32
> -+ifeq ($(CONFIG_MIPS_N64_ABI),y)
> -+UCLIBC_LDSO_NAME := ld64-uClibc
> -+ARCH_NATIVE_BIT := 64
> - endif
> -+endif
> -+
> - UCLIBC_LDSO := $(UCLIBC_LDSO_NAME).so.$(ABI_VERSION)
> - NONSHARED_LIBNAME := uclibc_nonshared.a
> - libc := $(top_builddir)lib/$(SHARED_LIBNAME)
> ---
> -cgit v0.9.1
> diff --git a/package/uclibc/0.9.33.2/0010-Rules.mak-fix-breakage-from-603af30d.patch b/package/uclibc/0.9.33.2/0010-Rules.mak-fix-breakage-from-603af30d.patch
> deleted file mode 100644
> index 61ed439..0000000
> --- a/package/uclibc/0.9.33.2/0010-Rules.mak-fix-breakage-from-603af30d.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From f5017653dc63d62c94cc2884ed3a50a4f93001cd Mon Sep 17 00:00:00 2001
> -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Wed, 24 Jul 2013 12:28:19 -0300
> -Subject: [PATCHv2] Rules.mak: fix breakage from 603af30d
> -
> -Removing the whitespace from findstring for 64 bit architectures has
> -bad consequences since powerpc would be a match in powerpc64 and sparc
> -would also be a match in sparc64.
> -That doesn't make them 64 bits in reality causing general breakage.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ----
> - Rules.mak | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Rules.mak b/Rules.mak
> -index 889108e..be53d81 100644
> ---- a/Rules.mak
> -+++ b/Rules.mak
> -@@ -141,7 +141,7 @@ UBACKTRACE_DSO := libubacktrace.so.$(ABI_VERSION)
> - 
> - UCLIBC_LDSO_NAME := ld-uClibc
> - ARCH_NATIVE_BIT := 32
> --ifneq ($(findstring $(TARGET_ARCH),hppa64 ia64 powerpc64 s390x sparc64 x86_64),)
> -+ifneq ($(findstring  $(TARGET_ARCH) , hppa64 ia64 powerpc64 s390x sparc64 x86_64 ),)
> - UCLIBC_LDSO_NAME := ld64-uClibc
> - ARCH_NATIVE_BIT := 64
> - else
> --- 
> -1.8.1.5
> -
> diff --git a/package/uclibc/0.9.33.2/0011-libc-add-non-standard-execvpe-function.patch b/package/uclibc/0.9.33.2/0011-libc-add-non-standard-execvpe-function.patch
> deleted file mode 100644
> index 8141333..0000000
> --- a/package/uclibc/0.9.33.2/0011-libc-add-non-standard-execvpe-function.patch
> +++ /dev/null
> @@ -1,163 +0,0 @@
> -From 0eb30761a26c46aaf555464114851202ae9c27bd Mon Sep 17 00:00:00 2001
> -From: Henning Heinold <heinold@inf.fu-berlin.de>
> -Date: Sat, 4 Jun 2011 21:23:15 +0200
> -Subject: [PATCH] libc: add non standard execvpe function
> -
> -[Gustavo]: Drop TODO modification to make it compatible
> -Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - include/unistd.h      |  8 ++++++++
> - libc/unistd/exec.c    | 38 +++++++++++++++++++++++++++++++++-----
> - libc/unistd/execvpe.c |  7 +++++++
> - 4 files changed, 52 insertions(+), 5 deletions(-)
> - create mode 100644 libc/unistd/execvpe.c
> -
> -diff --git a/include/unistd.h b/include/unistd.h
> -index feadf93..9479554 100644
> ---- a/include/unistd.h
> -+++ b/include/unistd.h
> -@@ -619,6 +619,14 @@ extern int execlp (const char *__file, const char *__arg, ...)
> -      __THROW __nonnull ((1));
> - libc_hidden_proto(execlp)
> - 
> -+#ifdef __USE_GNU
> -+/* Execute FILE, searching in the `PATH' environment variable if it contains
> -+   no slashes, with arguments ARGV and environment from a pointer */
> -+extern int execvpe (__const char *__file, char *__const __argv[], char *__const __envp[])
> -+     __THROW __nonnull ((1));
> -+libc_hidden_proto(execvpe)
> -+#endif
> -+
> - 
> - #if defined __USE_MISC || defined __USE_XOPEN
> - /* Add INC to priority of the current process.  */
> -diff --git a/libc/unistd/exec.c b/libc/unistd/exec.c
> -index ba92989..8fa42e5 100644
> ---- a/libc/unistd/exec.c
> -+++ b/libc/unistd/exec.c
> -@@ -32,6 +32,8 @@
> - /**********************************************************************/
> - #define EXEC_FUNC_COMMON 0
> - #define EXEC_FUNC_EXECVP 1
> -+#define EXEC_FUNC_EXECVPE 2
> -+
> - #if defined(__ARCH_USE_MMU__)
> - 
> - /* We have an MMU, so use alloca() to grab space for buffers and arg lists. */
> -@@ -58,6 +60,7 @@
> -  *  execle(a) -> execve(-)
> -  *  execv(-)  -> execve(-)
> -  *  execvp(a) -> execve(-)
> -+ *  execvpe(a) -> execve(-)
> -  */
> - 
> - # define EXEC_ALLOC_SIZE(VAR)      /* nothing to do */
> -@@ -219,15 +222,18 @@ libc_hidden_def(execlp)
> - 
> - #endif
> - /**********************************************************************/
> --#ifdef L_execvp
> -+#if defined (L_execvp) || defined(L_execvpe)
> - 
> - 
> - /* Use a default path that matches glibc behavior, since SUSv3 says
> -  * this is implementation-defined.  The default is current working dir,
> -  * /bin, and then /usr/bin. */
> - static const char default_path[] = ":/bin:/usr/bin";
> --
> -+#if defined (L_execvp)
> - int execvp(const char *path, char *const argv[])
> -+#elif defined (L_execvpe)
> -+int execvpe(const char *path, char *const argv[], char *const envp[])
> -+#endif
> - {
> - 	char *buf = NULL;
> - 	char *p;
> -@@ -245,7 +251,11 @@ int execvp(const char *path, char *const argv[])
> - 	}
> - 
> - 	if (strchr(path, '/')) {
> -+#if defined (L_execvp)
> - 		execve(path, argv, __environ);
> -+#elif defined (L_execvpe)
> -+		execve(path, argv, envp);
> -+#endif
> - 		if (errno == ENOEXEC) {
> - 			char **nargv;
> - 			EXEC_ALLOC_SIZE(size2) /* Do NOT add a semicolon! */
> -@@ -254,11 +264,19 @@ int execvp(const char *path, char *const argv[])
> - 			/* Need the dimension - 1.  We omit counting the trailing
> - 			 * NULL but we actually omit the first entry. */
> - 			for (n=0 ; argv[n] ; n++) {}
> -+#if defined (L_execvp)
> - 			nargv = (char **) EXEC_ALLOC((n+2) * sizeof(char *), size2, EXEC_FUNC_EXECVP);
> -+#elif defined (L_execvpe)
> -+			nargv = (char **) EXEC_ALLOC((n+2) * sizeof(char *), size2, EXEC_FUNC_EXECVPE);
> -+#endif
> - 			nargv[0] = argv[0];
> - 			nargv[1] = (char *)path;
> - 			memcpy(nargv+2, argv+1, n*sizeof(char *));
> -+#if defined (L_execvp)
> - 			execve("/bin/sh", nargv, __environ);
> -+#elif defined (L_execvpe)
> -+			execve("/bin/sh", nargv, envp);
> -+#endif
> - 			EXEC_FREE(nargv, size2);
> - 		}
> - 	} else {
> -@@ -277,8 +295,11 @@ int execvp(const char *path, char *const argv[])
> - 			return -1;
> - 		}
> - 		len = (FILENAME_MAX - 1) - plen;
> --
> -+#if defined (L_execvp)
> - 		buf = EXEC_ALLOC(FILENAME_MAX, size, EXEC_FUNC_EXECVP);
> -+#elif defined (L_execvpe)
> -+		buf = EXEC_ALLOC(FILENAME_MAX, size, EXEC_FUNC_EXECVPE);
> -+#endif
> - 		{
> - 			int seen_small = 0;
> - 			s0 = buf + len;
> -@@ -300,8 +321,11 @@ int execvp(const char *path, char *const argv[])
> - 					s[plen-1] = '/';
> - 				}
> - 
> -+#if defined (L_execvp)
> - 				execve(s, argv, __environ);
> --
> -+#elif defined (L_execvpe)
> -+				execve(s, argv, envp);
> -+#endif
> - 				seen_small = 1;
> - 
> - 				if (errno == ENOEXEC) {
> -@@ -325,7 +349,11 @@ int execvp(const char *path, char *const argv[])
> - 
> - 	return -1;
> - }
> -+#if defined (L_execvp)
> - libc_hidden_def(execvp)
> --
> -+#elif defined (L_execvpe)
> -+libc_hidden_def(execvpe)
> - #endif
> -+
> -+#endif /* #if defined (L_execvp) || defined(L_execvpe) */
> - /**********************************************************************/
> -diff --git a/libc/unistd/execvpe.c b/libc/unistd/execvpe.c
> -new file mode 100644
> -index 0000000..c3c1e43
> ---- /dev/null
> -+++ b/libc/unistd/execvpe.c
> -@@ -0,0 +1,7 @@
> -+/* Copyright (C) 2011-2013 Hennning Heinold <heinold@inf.fu-berlin.de>
> -+ *
> -+ * Licensed under the LGPL v2.1 or later, see the file COPYING.LIB in this tarball.
> -+ */
> -+
> -+#define L_execvpe
> -+#include "exec.c"
> --- 
> -1.8.1.5
> -
> diff --git a/package/uclibc/0.9.33.2/0012-libc-stdlib-add-mkostemp-helpers.patch b/package/uclibc/0.9.33.2/0012-libc-stdlib-add-mkostemp-helpers.patch
> deleted file mode 100644
> index 8002240..0000000
> --- a/package/uclibc/0.9.33.2/0012-libc-stdlib-add-mkostemp-helpers.patch
> +++ /dev/null
> @@ -1,155 +0,0 @@
> -From 42d1b23fc0f3748b8bf474e456d6c44aa7e563fd Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Wed, 14 Nov 2012 00:30:54 -0500
> -Subject: [PATCH] libc/stdlib: add mkostemp helpers
> -
> -Some projects (like udev) are starting to use this.
> -
> -Imported from glibc.
> -
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - include/stdlib.h         | 23 +++++++++++++++++++++++
> - libc/stdlib/Makefile.in  |  4 ++--
> - libc/stdlib/mkostemp.c   | 32 ++++++++++++++++++++++++++++++++
> - libc/stdlib/mkostemp64.c | 33 +++++++++++++++++++++++++++++++++
> - 4 files changed, 90 insertions(+), 2 deletions(-)
> - create mode 100644 libc/stdlib/mkostemp.c
> - create mode 100644 libc/stdlib/mkostemp64.c
> -
> -diff --git a/include/stdlib.h b/include/stdlib.h
> -index 354fc66..79ccc55 100644
> ---- a/include/stdlib.h
> -+++ b/include/stdlib.h
> -@@ -652,6 +652,29 @@ extern int mkstemp64 (char *__template) __nonnull ((1)) __wur;
> - extern char *mkdtemp (char *__template) __THROW __nonnull ((1)) __wur;
> - #endif
> - 
> -+#ifdef __USE_GNU
> -+/* Generate a unique temporary file name from TEMPLATE similar to
> -+   mkstemp.  But allow the caller to pass additional flags which are
> -+   used in the open call to create the file..
> -+
> -+   This function is a possible cancellation point and therefore not
> -+   marked with __THROW.  */
> -+# ifndef __USE_FILE_OFFSET64
> -+extern int mkostemp (char *__template, int __flags) __nonnull ((1)) __wur;
> -+# else
> -+#  ifdef __REDIRECT
> -+extern int __REDIRECT (mkostemp, (char *__template, int __flags), mkostemp64)
> -+     __nonnull ((1)) __wur;
> -+#  else
> -+#   define mkostemp mkostemp64
> -+#  endif
> -+# endif
> -+# ifdef __USE_LARGEFILE64
> -+extern int mkostemp64 (char *__template, int __flags) __nonnull ((1)) __wur;
> -+# endif
> -+
> -+#endif
> -+
> - 
> - __BEGIN_NAMESPACE_STD
> - /* Execute the given line as a shell command.
> -diff --git a/libc/stdlib/Makefile.in b/libc/stdlib/Makefile.in
> -index 3166b8e..b92f7ce 100644
> ---- a/libc/stdlib/Makefile.in
> -+++ b/libc/stdlib/Makefile.in
> -@@ -12,7 +12,7 @@ include $(top_srcdir)libc/stdlib/malloc-simple/Makefile.in
> - include $(top_srcdir)libc/stdlib/malloc-standard/Makefile.in
> - 
> - CSRC-y := \
> --	abort.c getenv.c mkdtemp.c realpath.c canonicalize.c mkstemp.c \
> -+	abort.c getenv.c mkdtemp.c realpath.c canonicalize.c mkstemp.c mkostemp.c \
> - 	rand.c random.c random_r.c setenv.c div.c ldiv.c lldiv.c \
> - 	getpt.c drand48-iter.c jrand48.c \
> - 	jrand48_r.c lcong48.c lrand48.c lrand48_r.c mrand48.c mrand48_r.c nrand48.c \
> -@@ -21,7 +21,7 @@ CSRC-y := \
> - CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_memalign.c
> - CSRC-$(UCLIBC_HAS_PTY) += grantpt.c unlockpt.c ptsname.c
> - CSRC-$(UCLIBC_HAS_ARC4RANDOM) += arc4random.c
> --CSRC-$(UCLIBC_HAS_LFS) += mkstemp64.c
> -+CSRC-$(UCLIBC_HAS_LFS) += mkstemp64.c mkostemp64.c
> - CSRC-$(UCLIBC_HAS_FLOATS) += drand48.c drand48_r.c erand48.c erand48_r.c
> - CSRC-$(if $(findstring yy,$(UCLIBC_HAS_FLOATS)$(UCLIBC_SUSV3_LEGACY)),y) += \
> - 	gcvt.c
> -diff --git a/libc/stdlib/mkostemp.c b/libc/stdlib/mkostemp.c
> -new file mode 100644
> -index 0000000..93b50fc
> ---- /dev/null
> -+++ b/libc/stdlib/mkostemp.c
> -@@ -0,0 +1,32 @@
> -+/* Copyright (C) 1998-2012 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include "../misc/internals/tempname.h"
> -+
> -+/* Generate a unique temporary file name from TEMPLATE.
> -+   The last six characters of TEMPLATE must be "XXXXXX";
> -+   they are replaced with a string that makes the filename unique.
> -+   Then open the file and return a fd. */
> -+int
> -+mkostemp (template, flags)
> -+     char *template;
> -+     int flags;
> -+{
> -+  return __gen_tempname (template, __GT_FILE, flags);
> -+}
> -diff --git a/libc/stdlib/mkostemp64.c b/libc/stdlib/mkostemp64.c
> -new file mode 100644
> -index 0000000..5509d8c
> ---- /dev/null
> -+++ b/libc/stdlib/mkostemp64.c
> -@@ -0,0 +1,33 @@
> -+/* Copyright (C) 2000-2012 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#include <fcntl.h>
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include "../misc/internals/tempname.h"
> -+
> -+/* Generate a unique temporary file name from TEMPLATE.
> -+   The last six characters of TEMPLATE must be "XXXXXX";
> -+   they are replaced with a string that makes the filename unique.
> -+   Then open the file and return a fd. */
> -+int
> -+mkostemp64 (template, flags)
> -+     char *template;
> -+     int flags;
> -+{
> -+  return __gen_tempname (template, __GT_BIGFILE, flags | O_LARGEFILE);
> -+}
> --- 
> -1.8.1.5
> -
> diff --git a/package/uclibc/0.9.33.2/0013-eventfd-Implement-eventfd2-and-fix-eventfd.patch b/package/uclibc/0.9.33.2/0013-eventfd-Implement-eventfd2-and-fix-eventfd.patch
> deleted file mode 100644
> index fea8ccd..0000000
> --- a/package/uclibc/0.9.33.2/0013-eventfd-Implement-eventfd2-and-fix-eventfd.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 7810e4f8027b5c4c8ceec6fefec4eb779362ebb5 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 10 Jun 2012 09:36:23 -0700
> -Subject: [PATCH] eventfd: Implement eventfd2 and fix eventfd
> -
> -eventfd: evntfd assumes to take two arguments instead it
> -should be one evntfd expects two therefore implement both syscalls with
> -correct parameters
> -
> -Thanks Eugene Rudoy for reporting it and also providing the patch
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libc/sysdeps/linux/common/eventfd.c |   16 ++++++++++++++--
> - libc/sysdeps/linux/common/stubs.c   |    2 +-
> - 2 files changed, 15 insertions(+), 3 deletions(-)
> -
> -diff --git a/libc/sysdeps/linux/common/eventfd.c b/libc/sysdeps/linux/common/eventfd.c
> -index cc3f3f0..96597ab 100644
> ---- a/libc/sysdeps/linux/common/eventfd.c
> -+++ b/libc/sysdeps/linux/common/eventfd.c
> -@@ -7,12 +7,24 @@
> -  * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> -  */
> - 
> -+#include <errno.h>
> - #include <sys/syscall.h>
> - #include <sys/eventfd.h>
> - 
> - /*
> -  * eventfd()
> -  */
> --#ifdef __NR_eventfd
> --_syscall2(int, eventfd, int, count, int, flags)
> -+#if defined __NR_eventfd || defined __NR_eventfd2
> -+int eventfd (int count, int flags)
> -+{
> -+#if defined __NR_eventfd2
> -+  return INLINE_SYSCALL (eventfd2, 2, count, flags);
> -+#elif defined __NR_eventfd
> -+  if (flags != 0) {
> -+     __set_errno (EINVAL);
> -+    return -1;
> -+  }
> -+  return INLINE_SYSCALL (eventfd, 1, count);
> -+#endif
> -+}
> - #endif
> -diff --git a/libc/sysdeps/linux/common/stubs.c b/libc/sysdeps/linux/common/stubs.c
> -index 4d1e26c..7af14c1 100644
> ---- a/libc/sysdeps/linux/common/stubs.c
> -+++ b/libc/sysdeps/linux/common/stubs.c
> -@@ -93,7 +93,7 @@ make_stub(epoll_ctl)
> - make_stub(epoll_wait)
> - #endif
> - 
> --#if !defined __NR_eventfd && defined __UCLIBC_LINUX_SPECIFIC__
> -+#if !defined __NR_eventfd && !defined __NR_eventfd2 && defined __UCLIBC_LINUX_SPECIFIC__
> - make_stub(eventfd)
> - #endif
> - 
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0015-add-posix_madvise.c.patch b/package/uclibc/0.9.33.2/0015-add-posix_madvise.c.patch
> deleted file mode 100644
> index 097f8fc..0000000
> --- a/package/uclibc/0.9.33.2/0015-add-posix_madvise.c.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 93b8ce8886e30986be31c1403b606b6367dc258a Mon Sep 17 00:00:00 2001
> -From: "Peter S. Mazinger" <ps.m@gmx.net>
> -Date: Tue, 26 Apr 2011 23:03:44 +0200
> -Subject: [PATCH] add posix_madvise.c
> -
> -Signed-off-by: Peter S. Mazinger <ps.m@gmx.net>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - libc/sysdeps/linux/common/Makefile.in     |    2 +-
> - libc/sysdeps/linux/common/posix_madvise.c |   25 +++++++++++++++++++++++++
> - 2 files changed, 26 insertions(+), 1 deletion(-)
> - create mode 100644 libc/sysdeps/linux/common/posix_madvise.c
> -
> -diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
> -index 3b5763c..b39082b 100644
> ---- a/libc/sysdeps/linux/common/Makefile.in
> -+++ b/libc/sysdeps/linux/common/Makefile.in
> -@@ -81,7 +81,7 @@ CSRC-$(UCLIBC_HAS_REALTIME) += clock_getres.c clock_gettime.c clock_settime.c \
> - 	sched_get_priority_max.c sched_get_priority_min.c sched_getscheduler.c \
> - 	sched_rr_get_interval.c sched_setparam.c sched_setscheduler.c sigqueue.c
> - # clock_getcpuclockid|clock_nanosleep|mq_timedreceive|mq_timedsend|posix_fadvise|posix_fallocate|posix_madvise|posix_memalign|posix_mem_offset|posix_spawnattr_destroy|posix_spawnattr_init|posix_spawnattr_getflags|posix_spawnattr_setflags|posix_spawnattr_getpgroup|posix_spawnattr_setpgroup|posix_spawnattr_getschedparam|posix_spawnattr_setschedparam|posix_spawnattr_getschedpolicy|posix_spawnattr_setschedpolicy|posix_spawnattr_getsigdefault|posix_spawnattr_setsigdefault|posix_spawnattr_getsigmask|posix_spawnattr_setsigmask|posix_spawnattr_init|posix_spawnattr_setflags|posix_spawnattr_setpgroup|posix_spawnattr_setschedparam|posix_spawnattr_setschedpolicy|posix_spawnattr_setsigdefault|posix_spawnattr_setsigmask|posix_spawn_file_actions_addclose|posix_spawn_file_actions_addopen|posix_spawn_file_actions_adddup2|posix_spawn_file_actions_addopen|posix_spawn_file_actions_destroy|posix_spawn_file_actions_init|posix_spawn_file_actions_init|posix_spawn|posix_spawnp|posix_spawnp|posix_
 ty
>  ped_mem_
>  get_info|pthread_mutex_timedlock|sem_timedwait
> --CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c
> -+CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c posix_madvise.c
> - CSRC-$(UCLIBC_SUSV4_LEGACY) += utime.c
> - CSRC-$(UCLIBC_HAS_EPOLL) += epoll.c
> - CSRC-$(UCLIBC_HAS_XATTR) += xattr.c
> -diff --git a/libc/sysdeps/linux/common/posix_madvise.c b/libc/sysdeps/linux/common/posix_madvise.c
> -new file mode 100644
> -index 0000000..2f95bcb
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/posix_madvise.c
> -@@ -0,0 +1,25 @@
> -+/* vi: set sw=4 ts=4: */
> -+/* Licensed under the LGPL v2.1, see the file LICENSE in this tarball. */
> -+
> -+#include <sys/mman.h>
> -+#include <sys/syscall.h>
> -+
> -+#if defined __NR_madvise && defined __USE_XOPEN2K && defined __UCLIBC_HAS_ADVANCED_REALTIME__
> -+int posix_madvise(void *addr, size_t len, int advice)
> -+{
> -+	int result;
> -+	/* We have one problem: the kernel's MADV_DONTNEED does not
> -+	 * correspond to POSIX's POSIX_MADV_DONTNEED.  The former simply
> -+	 * discards changes made to the memory without writing it back to
> -+	 * disk, if this would be necessary.  The POSIX behaviour does not
> -+	 * allow this.  There is no functionality mapping for the POSIX
> -+	 * behaviour so far so we ignore that advice for now. */
> -+	if (advice == POSIX_MADV_DONTNEED)
> -+		return 0;
> -+
> -+	/* this part might use madvise function */
> -+	INTERNAL_SYSCALL_DECL (err);
> -+	result = INTERNAL_SYSCALL (madvise, err, 3, addr, len, advice);
> -+	return INTERNAL_SYSCALL_ERRNO (result, err);
> -+}
> -+#endif
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0016-nptl-sh-fix-race-condition-in-lll_wait_tid.patch b/package/uclibc/0.9.33.2/0016-nptl-sh-fix-race-condition-in-lll_wait_tid.patch
> deleted file mode 100644
> index 233f2be..0000000
> --- a/package/uclibc/0.9.33.2/0016-nptl-sh-fix-race-condition-in-lll_wait_tid.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From ffd9e147b120e9c2bf30ba4861860f1bc59362c5 Mon Sep 17 00:00:00 2001
> -From: Stas Sergeev <stsp@users.sourceforge.net>
> -Date: Thu, 14 Jun 2012 01:00:02 +0200
> -Subject: [PATCH] nptl: sh: fix race condition in lll_wait_tid
> -
> -Make a local copy of the tid value to avoid a race condition,
> -as the value could have been changed to 0, thus using a pointer
> -it would have been passed to the lll_futex_wait modified.
> -
> -Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> -(cherry picked from commit 0dcc13bf7a61b1d0708e5dd103d5515e0ffec79a)
> -
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> ----
> - libpthread/nptl/sysdeps/unix/sysv/linux/sh/lowlevellock.h |    6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/sh/lowlevellock.h b/libpthread/nptl/sysdeps/unix/sysv/linux/sh/lowlevellock.h
> -index d10cd61..b83d863 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/sh/lowlevellock.h
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/sh/lowlevellock.h
> -@@ -396,9 +396,9 @@ extern int __lll_unlock_wake (int *__futex, int private) attribute_hidden;
> - 
> - #define lll_wait_tid(tid) \
> -   do {									      \
> --    __typeof (tid) *__tid = &(tid);					      \
> --    while (*__tid != 0)							      \
> --      lll_futex_wait (__tid, *__tid, LLL_SHARED);			      \
> -+    __typeof (tid) __tid;						      \
> -+    while ((__tid = (tid)) != 0)						      \
> -+      lll_futex_wait (&(tid), __tid, LLL_SHARED);			      \
> -   } while (0)
> - 
> - extern int __lll_timedwait_tid (int *tid, const struct timespec *abstime)
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0017-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch b/package/uclibc/0.9.33.2/0017-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch
> deleted file mode 100644
> index 9a263f8..0000000
> --- a/package/uclibc/0.9.33.2/0017-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From fec308fdfaf9f557ef5fb17c308c48259012b825 Mon Sep 17 00:00:00 2001
> -From: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Date: Thu, 12 Jul 2012 09:24:39 +0200
> -Subject: [PATCH] librt: re-add SIGCANCEL to the list of blocked signal in
> - helper thread
> -
> -Indeed if the libpthread is before the libc in the library look up
> -the SIGCANCEL is removed from the list of the blocked signal by
> -sigfillset func, this can produce the handler not properly called.
> -This commit revert what Denys modified in commit
> -162cfaea20d807f0ae329efe39292a9b22593b41.
> -
> -Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> -(cherry picked from commit cb43f2afba0633400387fa7c55dda3396517f58a)
> -
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> ----
> - libpthread/nptl/sysdeps/unix/sysv/linux/timer_routines.c |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/timer_routines.c b/libpthread/nptl/sysdeps/unix/sysv/linux/timer_routines.c
> -index 4319d8d..2681961 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/timer_routines.c
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/timer_routines.c
> -@@ -175,7 +175,7 @@ __start_helper_thread (void)
> -   sigset_t ss;
> -   sigset_t oss;
> -   sigfillset (&ss);
> --  /*__sigaddset (&ss, SIGCANCEL); - already done by sigfillset */
> -+  __sigaddset (&ss, SIGCANCEL);
> -   INTERNAL_SYSCALL_DECL (err);
> -   INTERNAL_SYSCALL (rt_sigprocmask, err, 4, SIG_SETMASK, &ss, &oss, _NSIG / 8);
> - 
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0018-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch b/package/uclibc/0.9.33.2/0018-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch
> deleted file mode 100644
> index 37fb913..0000000
> --- a/package/uclibc/0.9.33.2/0018-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 2f09c67232cebca62f3afa4fc296c83aa813427c Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Sun, 18 Nov 2012 04:41:06 -0500
> -Subject: [PATCH] ldso: include dlfcn.h for RTLD_NODELETE
> -
> -Building with NPTL enabled and shared library support disabled we hit:
> -In file included from libpthread/nptl/sysdeps/generic/dl-tls.c:30:0:
> -./ldso/include/dl-elf.h: In function '__dl_parse_dynamic_info':
> -./ldso/include/dl-elf.h:173:20: error: 'RTLD_NODELETE' undeclared (first use in this function)
> -./ldso/include/dl-elf.h:173:20: note: each undeclared identifier is reported only once for each function it appears in
> -make: *** [libpthread/nptl/sysdeps/generic/dl-tls.os] Error 1
> -
> -A previous commit (f26c5f6952ce9bf8edec9c1571c47addb1bcc442) touched
> -on a similar issue, but added the include to the incorrect location.
> -
> -Reported-by: Christophe Lyon <christophe.lyon@st.com> [arm nommu]
> -Reported-by: Daniel Beecham <daniel@lunix.se> [static x86_64]
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> ----
> - ldso/include/dl-elf.h |    2 ++
> - ldso/include/ldso.h   |    1 -
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/ldso/include/dl-elf.h b/ldso/include/dl-elf.h
> -index 29d1a00..e1185f7 100644
> ---- a/ldso/include/dl-elf.h
> -+++ b/ldso/include/dl-elf.h
> -@@ -18,6 +18,8 @@ struct elf_resolve;
> - struct r_scope_elem;
> - 
> - #include <dl-defs.h>
> -+#include <dlfcn.h>
> -+
> - #ifdef __LDSO_CACHE_SUPPORT__
> - extern int _dl_map_cache(void);
> - extern int _dl_unmap_cache(void);
> -diff --git a/ldso/include/ldso.h b/ldso/include/ldso.h
> -index 6f3b728..e250e30 100644
> ---- a/ldso/include/ldso.h
> -+++ b/ldso/include/ldso.h
> -@@ -42,7 +42,6 @@
> - #ifndef __ARCH_HAS_NO_SHARED__
> - #include <dl-syscall.h>
> - #include <dl-string.h>
> --#include <dlfcn.h>
> - /* Now the ldso specific headers */
> - #include <dl-elf.h>
> - #ifdef __UCLIBC_HAS_TLS__
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0019-include-elf.h-update-for-ELFOSABI_-changes.patch b/package/uclibc/0.9.33.2/0019-include-elf.h-update-for-ELFOSABI_-changes.patch
> deleted file mode 100644
> index b3507af..0000000
> --- a/package/uclibc/0.9.33.2/0019-include-elf.h-update-for-ELFOSABI_-changes.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 788d9ca73b7ed1262c83580ccc62fb3625e603c3 Mon Sep 17 00:00:00 2001
> -From: Thomas Schwinge <thomas@codesourcery.com>
> -Date: Wed, 31 Oct 2012 20:41:50 +0100
> -Subject: [PATCH] include/elf.h: update for ELFOSABI_* changes.
> -
> -ELFOSABI_GNU replaces ELFOSABI_LINUX, the latter is kept as a compatibility
> -alias, and ELFOSABI_HURD is removed.  See the table on
> -<http://www.sco.com/developers/gabi/latest/ch4.eheader.html#osabi> for
> -reference.
> -
> -Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - include/elf.h |    4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/include/elf.h b/include/elf.h
> -index ba3e804..470046e 100644
> ---- a/include/elf.h
> -+++ b/include/elf.h
> -@@ -148,8 +148,8 @@ typedef struct
> - #define ELFOSABI_SYSV		0	/* Alias.  */
> - #define ELFOSABI_HPUX		1	/* HP-UX */
> - #define ELFOSABI_NETBSD		2	/* NetBSD.  */
> --#define ELFOSABI_LINUX		3	/* Linux.  */
> --#define ELFOSABI_HURD		4	/* GNU/Hurd */
> -+#define ELFOSABI_GNU		3	/* Object uses GNU ELF extensions.  */
> -+#define ELFOSABI_LINUX		ELFOSABI_GNU	/* Compatibility alias.  */
> - #define ELFOSABI_SOLARIS	6	/* Sun Solaris.  */
> - #define ELFOSABI_AIX		7	/* IBM AIX.  */
> - #define ELFOSABI_IRIX		8	/* SGI Irix.  */
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0020-update-ptrace.h-to-latest-from-glibc.patch b/package/uclibc/0.9.33.2/0020-update-ptrace.h-to-latest-from-glibc.patch
> deleted file mode 100644
> index a46af7e..0000000
> --- a/package/uclibc/0.9.33.2/0020-update-ptrace.h-to-latest-from-glibc.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -From 2d0c3a704afe6bdc7be129e9f9217ec1369c1bc8 Mon Sep 17 00:00:00 2001
> -From: James Hogan <james.hogan@imgtec.com>
> -Date: Fri, 30 Nov 2012 10:08:13 +0000
> -Subject: [PATCH] update ptrace.h to latest from glibc
> -
> -Update libc/sysdeps/linux/common/sys/ptrace.h to latest from glibc's
> -sysdeps/unix/sysv/linux/sys/ptrace.h.
> -
> -This adds definitions for operations:
> - - PTRACE_GETREGSET
> - - PTRACE_SETREGSET
> - - PTRACE_SEIZE
> - - PTRACE_INTERRUPT
> - - PTRACE_LISTEN
> -
> -And adds flags:
> - - PTRACE_SEIZE_DEVEL
> -
> -And adds event codes:
> - - PTRACE_EVENT_SECCOMP
> -
> -This is to allow access to the generic interface for accessing
> -architecture specific regsets using the corresponding NT_* types,
> -required for new Linux kernel architecture ports.
> -
> -Signed-off-by: James Hogan <james.hogan@imgtec.com>
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/sysdeps/linux/common/sys/ptrace.h |   42 +++++++++++++++++++++++++++-----
> - 1 file changed, 36 insertions(+), 6 deletions(-)
> -
> -diff --git a/libc/sysdeps/linux/common/sys/ptrace.h b/libc/sysdeps/linux/common/sys/ptrace.h
> -index 08658f9..95b3fdf 100644
> ---- a/libc/sysdeps/linux/common/sys/ptrace.h
> -+++ b/libc/sysdeps/linux/common/sys/ptrace.h
> -@@ -1,5 +1,5 @@
> - /* `ptrace' debugger support interface.  Linux version.
> --   Copyright (C) 1996-1999,2000,2006,2007 Free Software Foundation, Inc.
> -+   Copyright (C) 1996-2012 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> - 
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -125,13 +125,40 @@ enum __ptrace_request
> - #define PT_GETSIGINFO PTRACE_GETSIGINFO
> - 
> -   /* Set new siginfo for process.  */
> --  PTRACE_SETSIGINFO = 0x4203
> -+  PTRACE_SETSIGINFO = 0x4203,
> - #define PT_SETSIGINFO PTRACE_SETSIGINFO
> -+
> -+  /* Get register content.  */
> -+  PTRACE_GETREGSET = 0x4204,
> -+#define PTRACE_GETREGSET PTRACE_GETREGSET
> -+
> -+  /* Set register content.  */
> -+  PTRACE_SETREGSET = 0x4205,
> -+#define PTRACE_SETREGSET PTRACE_SETREGSET
> -+
> -+  /* Like PTRACE_ATTACH, but do not force tracee to trap and do not affect
> -+     signal or group stop state.  */
> -+  PTRACE_SEIZE = 0x4206,
> -+#define PTRACE_SEIZE PTRACE_SEIZE
> -+
> -+  /* Trap seized tracee.  */
> -+  PTRACE_INTERRUPT = 0x4207,
> -+#define PTRACE_INTERRUPT PTRACE_INTERRUPT
> -+
> -+  /* Wait for next group event.  */
> -+  PTRACE_LISTEN = 0x4208
> - };
> - 
> - 
> -+/* Flag for PTRACE_LISTEN.  */
> -+enum __ptrace_flags
> -+{
> -+  PTRACE_SEIZE_DEVEL = 0x80000000
> -+};
> -+
> - /* Options set using PTRACE_SETOPTIONS.  */
> --enum __ptrace_setoptions {
> -+enum __ptrace_setoptions
> -+{
> -   PTRACE_O_TRACESYSGOOD	= 0x00000001,
> -   PTRACE_O_TRACEFORK	= 0x00000002,
> -   PTRACE_O_TRACEVFORK   = 0x00000004,
> -@@ -139,17 +166,20 @@ enum __ptrace_setoptions {
> -   PTRACE_O_TRACEEXEC	= 0x00000010,
> -   PTRACE_O_TRACEVFORKDONE = 0x00000020,
> -   PTRACE_O_TRACEEXIT	= 0x00000040,
> --  PTRACE_O_MASK		= 0x0000007f
> -+  PTRACE_O_TRACESECCOMP = 0x00000080,
> -+  PTRACE_O_MASK		= 0x000000ff
> - };
> - 
> - /* Wait extended result codes for the above trace options.  */
> --enum __ptrace_eventcodes {
> -+enum __ptrace_eventcodes
> -+{
> -   PTRACE_EVENT_FORK	= 1,
> -   PTRACE_EVENT_VFORK	= 2,
> -   PTRACE_EVENT_CLONE	= 3,
> -   PTRACE_EVENT_EXEC	= 4,
> -   PTRACE_EVENT_VFORK_DONE = 5,
> --  PTRACE_EVENT_EXIT	= 6
> -+  PTRACE_EVENT_EXIT	= 6,
> -+  PTRAVE_EVENT_SECCOMP  = 7
> - };
> - 
> - /* Perform process tracing functions.  REQUEST is one of the values
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0022-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch b/package/uclibc/0.9.33.2/0022-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch
> deleted file mode 100644
> index 6d8e2b2..0000000
> --- a/package/uclibc/0.9.33.2/0022-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch
> +++ /dev/null
> @@ -1,128 +0,0 @@
> -From 5c797a24a7d6337b5e654079a8d815199b1e8364 Mon Sep 17 00:00:00 2001
> -From: Carmelo Amoroso <carmelo.amoroso@st.com>
> -Date: Thu, 2 Feb 2012 18:22:36 +0100
> -Subject: [PATCH] inet:rpc: fix authnone_marshal in multithreading context
> -
> -This is a port of glibc's fix by Zack Weinberg as reported
> -in http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=142312,
> -and discussed in http://sourceware.org/ml/libc-alpha/2002-04/msg00069.html
> -and following.
> -
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> ----
> - libc/inet/rpc/auth_none.c   |   59 +++++++++++++++++++++----------------------
> - libc/inet/rpc/rpc_private.h |    2 --
> - libc/inet/rpc/rpc_thread.c  |    1 -
> - 3 files changed, 29 insertions(+), 33 deletions(-)
> -
> -diff --git a/libc/inet/rpc/auth_none.c b/libc/inet/rpc/auth_none.c
> -index c48bbfe..d066f6b 100644
> ---- a/libc/inet/rpc/auth_none.c
> -+++ b/libc/inet/rpc/auth_none.c
> -@@ -66,49 +66,48 @@ struct authnone_private_s {
> -   char marshalled_client[MAX_MARSHAL_SIZE];
> -   u_int mcnt;
> - };
> --#ifdef __UCLIBC_HAS_THREADS__
> --#define authnone_private (*(struct authnone_private_s **)&RPC_THREAD_VARIABLE(authnone_private_s))
> --#else
> --static struct authnone_private_s *authnone_private;
> --#endif
> - 
> --AUTH *
> --authnone_create (void)
> -+static struct authnone_private_s authnone_private;
> -+__libc_once_define(static, authnone_private_guard);
> -+
> -+static void authnone_create_once (void);
> -+
> -+static void
> -+authnone_create_once (void)
> - {
> -   struct authnone_private_s *ap;
> -   XDR xdr_stream;
> -   XDR *xdrs;
> - 
> --  ap = (struct authnone_private_s *) authnone_private;
> --  if (ap == NULL)
> --    {
> --      ap = (struct authnone_private_s *) calloc (1, sizeof (*ap));
> --      if (ap == NULL)
> --	return NULL;
> --      authnone_private = ap;
> --    }
> --  if (!ap->mcnt)
> --    {
> --      ap->no_client.ah_cred = ap->no_client.ah_verf = _null_auth;
> --      ap->no_client.ah_ops = (struct auth_ops *)&ops;
> --      xdrs = &xdr_stream;
> --      xdrmem_create (xdrs, ap->marshalled_client, (u_int) MAX_MARSHAL_SIZE,
> --		     XDR_ENCODE);
> --      (void) xdr_opaque_auth (xdrs, &ap->no_client.ah_cred);
> --      (void) xdr_opaque_auth (xdrs, &ap->no_client.ah_verf);
> --      ap->mcnt = XDR_GETPOS (xdrs);
> --      XDR_DESTROY (xdrs);
> --    }
> --  return (&ap->no_client);
> -+  ap = &authnone_private;
> -+
> -+  ap->no_client.ah_cred = ap->no_client.ah_verf = _null_auth;
> -+  ap->no_client.ah_ops = (struct auth_ops *) &ops;
> -+  xdrs = &xdr_stream;
> -+  xdrmem_create(xdrs, ap->marshalled_client,
> -+			 (u_int) MAX_MARSHAL_SIZE, XDR_ENCODE);
> -+  (void) xdr_opaque_auth(xdrs, &ap->no_client.ah_cred);
> -+  (void) xdr_opaque_auth(xdrs, &ap->no_client.ah_verf);
> -+  ap->mcnt = XDR_GETPOS (xdrs);
> -+  XDR_DESTROY (xdrs);
> -+}
> -+
> -+AUTH *
> -+authnone_create (void)
> -+{
> -+  __libc_once (authnone_private_guard, authnone_create_once);
> -+  return &authnone_private.no_client;
> - }
> - libc_hidden_def(authnone_create)
> - 
> - static bool_t
> --authnone_marshal (AUTH *client attribute_unused, XDR *xdrs)
> -+authnone_marshal (AUTH *client, XDR *xdrs)
> - {
> -   struct authnone_private_s *ap;
> - 
> --  ap = authnone_private;
> -+  /* authnone_create returned authnone_private->no_client, which is
> -+     the first field of struct authnone_private_s.  */
> -+  ap = (struct authnone_private_s *) client;
> -   if (ap == NULL)
> -     return FALSE;
> -   return (*xdrs->x_ops->x_putbytes) (xdrs, ap->marshalled_client, ap->mcnt);
> -diff --git a/libc/inet/rpc/rpc_private.h b/libc/inet/rpc/rpc_private.h
> -index ede3ddf..e1214d2 100644
> ---- a/libc/inet/rpc/rpc_private.h
> -+++ b/libc/inet/rpc/rpc_private.h
> -@@ -18,8 +18,6 @@ struct rpc_thread_variables {
> - 	struct pollfd	*svc_pollfd_s;		/* Global, rpc_common.c */
> - 	int		svc_max_pollfd_s;	/* Global, rpc_common.c */
> - 
> --	void		*authnone_private_s;	/* auth_none.c */
> --
> - 	void		*clnt_perr_buf_s;	/* clnt_perr.c */
> - 
> - 	void		*clntraw_private_s;	/* clnt_raw.c */
> -diff --git a/libc/inet/rpc/rpc_thread.c b/libc/inet/rpc/rpc_thread.c
> -index 71303b2..3367659 100644
> ---- a/libc/inet/rpc/rpc_thread.c
> -+++ b/libc/inet/rpc/rpc_thread.c
> -@@ -32,7 +32,6 @@ __rpc_thread_destroy (void)
> - 		__rpc_thread_svc_cleanup ();
> - 		__rpc_thread_clnt_cleanup ();
> - 		/*__rpc_thread_key_cleanup (); */
> --		free (tvp->authnone_private_s);
> - 		free (tvp->clnt_perr_buf_s);
> - 		free (tvp->clntraw_private_s);
> - 		free (tvp->svcraw_private_s);
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0023-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch b/package/uclibc/0.9.33.2/0023-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch
> deleted file mode 100644
> index 7103f59..0000000
> --- a/package/uclibc/0.9.33.2/0023-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 6e2dbd7387bc2381e08aa85d6d33bb2d2d140843 Mon Sep 17 00:00:00 2001
> -From: Kevin Cernekee <cernekee@gmail.com>
> -Date: Tue, 5 Jun 2012 15:05:19 -0700
> -Subject: [PATCH] MIPS: Convert __syscall_error() callers to use $a0 for
> - argument
> -
> -Some callers passed the first argument in $v0, while others used $a0.
> -Change the callers to use $a0 consistently.
> -
> -Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/sysdeps/linux/mips/vfork.S                                      |    1 +
> - .../linuxthreads/sysdeps/unix/sysv/linux/mips/mips64/sysdep-cancel.h |    2 +-
> - libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/vfork.S         |    1 +
> - 3 files changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/libc/sysdeps/linux/mips/vfork.S b/libc/sysdeps/linux/mips/vfork.S
> -index b307447..00cc675 100644
> ---- a/libc/sysdeps/linux/mips/vfork.S
> -+++ b/libc/sysdeps/linux/mips/vfork.S
> -@@ -84,6 +84,7 @@ NESTED(__vfork,FRAMESZ,sp)
> - 
> - 	/* Something bad happened -- no child created.  */
> - L(error):
> -+	move	a0, v0
> - #ifdef __PIC__
> - 	PTR_LA		t9, __syscall_error
> - 	RESTORE_GP64
> -diff --git a/libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/mips64/sysdep-cancel.h b/libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/mips64/sysdep-cancel.h
> -index fc51774..4d2c405 100644
> ---- a/libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/mips64/sysdep-cancel.h
> -+++ b/libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/mips64/sysdep-cancel.h
> -@@ -31,7 +31,7 @@
> - # undef PSEUDO
> - # define PSEUDO(name, syscall_name, args)				      \
> -   .align 2;								      \
> --  99:									      \
> -+  99: move a0, v0; 							      \
> -   PTR_LA t9,__syscall_error;					 	      \
> -   /* manual cpreturn.  */						      \
> -   REG_L gp, STKOFF_GP(sp);						      \
> -diff --git a/libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/vfork.S b/libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/vfork.S
> -index 7bbab5c..238d798 100644
> ---- a/libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/vfork.S
> -+++ b/libpthread/linuxthreads/sysdeps/unix/sysv/linux/mips/vfork.S
> -@@ -80,6 +80,7 @@ NESTED(__vfork,FRAMESZ,sp)
> - 
> - 	/* Something bad happened -- no child created.  */
> - L(error):
> -+	move		a0, v0
> - #ifdef __PIC__
> - 	PTR_LA		t9, __syscall_error
> - 	RESTORE_GP64
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0024-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch b/package/uclibc/0.9.33.2/0024-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch
> deleted file mode 100644
> index f48b9ae..0000000
> --- a/package/uclibc/0.9.33.2/0024-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From c8f9e946bc2a0a42e84b5f97f272932de6485b54 Mon Sep 17 00:00:00 2001
> -From: Kevin Cernekee <cernekee@gmail.com>
> -Date: Tue, 5 Jun 2012 15:05:20 -0700
> -Subject: [PATCH] MIPS: Use $a0 instead of $v0 for __syscall_error() argument
> -
> -$a0 is saved across _dl_runtime_resolve(); $v0 is not.  Unfortunately,
> -__syscall_error() uses $v0 for its argument, not $a0 as is the MIPS ABI
> -standard.  This means that if lazy binding was used for __syscall_error(),
> -the errno value in $v0 could get corrupted.
> -
> -The problem can be easily seen in testcases where syscalls in librt fail;
> -when librt tries to call __syscall_error() in libc, the argument gets
> -lost and errno gets set to a bogus value:
> -
> -    # ./tst-mqueue1 ; echo $?
> -    mq_receive on O_WRONLY mqd_t did not fail with EBADF: Unknown error 2004684208
> -    1
> -    # ./tst-mqueue2 ; echo $?
> -    mq_timedreceive with too small msg_len did not fail with EMSGSIZE: Unknown error 1997360560
> -    1
> -    # ./tst-mqueue4 ; echo $?
> -    mq_timedsend did not fail with ETIMEDOUT: Unknown error 2008747440
> -    1
> -
> -When _dl_runtime_resolve() was taken out of the equation, the same test
> -cases passed:
> -
> -    # LD_BIND_NOW=y ./tst-mqueue1 ; echo $?
> -    0
> -    # LD_BIND_NOW=y ./tst-mqueue2 ; echo $?
> -    0
> -    # LD_BIND_NOW=y ./tst-mqueue4 ; echo $?
> -    0
> -
> -Changing __syscall_error() to look at $a0 instead of $v0 fixed the
> -problem.
> -
> -(Note that there is also a "__syscall_error.c" file which presumably
> -uses the standard C calling conventions, but I do not think it is used
> -on MIPS.)
> -
> -Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/sysdeps/linux/mips/syscall_error.S |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libc/sysdeps/linux/mips/syscall_error.S b/libc/sysdeps/linux/mips/syscall_error.S
> -index 51a8efa..0cc20da 100644
> ---- a/libc/sysdeps/linux/mips/syscall_error.S
> -+++ b/libc/sysdeps/linux/mips/syscall_error.S
> -@@ -43,7 +43,7 @@ ENTRY(__syscall_error)
> - #ifdef __PIC__
> - 	SAVE_GP(GPOFF)
> - #endif
> --	REG_S	v0, V0OFF(sp)
> -+	REG_S	a0, V0OFF(sp)
> - 	REG_S	ra, RAOFF(sp)
> - 
> - 	/* Find our per-thread errno address  */
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0025-ldso-use-.arm-mode-for-resolver-unconditionally.patch b/package/uclibc/0.9.33.2/0025-ldso-use-.arm-mode-for-resolver-unconditionally.patch
> deleted file mode 100644
> index d33a0cd..0000000
> --- a/package/uclibc/0.9.33.2/0025-ldso-use-.arm-mode-for-resolver-unconditionally.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 753e4e4cd9177f25981e81f82cd9fe8612a95ba6 Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Fri, 15 Jun 2012 13:44:35 +0200
> -Subject: [PATCH] ldso: use .arm mode for resolver unconditionally
> -
> -as per comment in the file.
> -Fixes runtime with __THUMB_INTERWORK__ enabled.
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - ldso/ldso/arm/resolve.S |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/ldso/ldso/arm/resolve.S b/ldso/ldso/arm/resolve.S
> -index 08889d0..b0907f7 100644
> ---- a/ldso/ldso/arm/resolve.S
> -+++ b/ldso/ldso/arm/resolve.S
> -@@ -101,7 +101,7 @@
> - 
> -  .text
> -  .align 4      @ 16 byte boundary and there are 32 bytes below (arm case)
> -- #if !defined(__thumb__) || defined(__thumb2__)
> -+#if 1 /*(!defined(__thumb__) || defined __THUMB_INTERWORK__) || defined(__thumb2__)*/
> -  .arm
> -  .globl _dl_linux_resolve
> -  .type _dl_linux_resolve,%function
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0026-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch b/package/uclibc/0.9.33.2/0026-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch
> deleted file mode 100644
> index 11f7e2e..0000000
> --- a/package/uclibc/0.9.33.2/0026-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 8a2b550a510cf2a1a0989fc0a665a6a42c83efd4 Mon Sep 17 00:00:00 2001
> -From: "Peter S. Mazinger" <ps.m@gmx.net>
> -Date: Fri, 22 Apr 2011 00:52:22 +0200
> -Subject: [PATCH] make NPTL's getpid behave similar to the common one
> -
> -make __getpid static
> -provide getppid alias if needed
> -remove unneeded libc_hidden_proto
> -
> -Signed-off-by: Peter S. Mazinger <ps.m@gmx.net>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libpthread/nptl/sysdeps/unix/sysv/linux/getpid.c |   11 ++++++++---
> - 1 file changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/getpid.c b/libpthread/nptl/sysdeps/unix/sysv/linux/getpid.c
> -index d4de3cd..d2b3384 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/getpid.c
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/getpid.c
> -@@ -21,6 +21,10 @@
> - #include <tls.h>
> - #include <sysdep.h>
> - 
> -+#ifdef __NR_getxpid
> -+# undef __NR_getpid
> -+# define __NR_getpid __NR_getxpid
> -+#endif
> - 
> - #ifndef NOT_IN_libc
> - static inline __attribute__((always_inline)) pid_t really_getpid (pid_t oldval);
> -@@ -46,8 +50,7 @@ really_getpid (pid_t oldval)
> - }
> - #endif
> - 
> --extern __typeof(getpid) __getpid;
> --pid_t
> -+static pid_t
> - __getpid (void)
> - {
> - #ifdef NOT_IN_libc
> -@@ -60,6 +63,8 @@ __getpid (void)
> - #endif
> -   return result;
> - }
> --libc_hidden_proto(getpid)
> - weak_alias(__getpid, getpid)
> - libc_hidden_weak(getpid)
> -+#if !defined NOT_IN_libc && !defined __NR_getppid
> -+strong_alias(getpid,getppid)
> -+#endif
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0027-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch b/package/uclibc/0.9.33.2/0027-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch
> deleted file mode 100644
> index 5df42ea..0000000
> --- a/package/uclibc/0.9.33.2/0027-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 576983880a0ab5d27a4f530d2cef36239b617e78 Mon Sep 17 00:00:00 2001
> -From: Natanael Copa <natanael.copa@gmail.com>
> -Date: Thu, 5 Jul 2012 11:55:19 +0000
> -Subject: [PATCH] i386/bits/syscalls.h: allow immediate values as 6th syscall
> - arg
> -
> -Allow use of immedate values as the 6th syscall argument. Otherwise we must
> -store the arg on memory. This gives gcc more options to optimize better.
> -
> -This also works around an issue with posix_fallocate.
> -
> -Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/sysdeps/linux/i386/bits/syscalls.h |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libc/sysdeps/linux/i386/bits/syscalls.h b/libc/sysdeps/linux/i386/bits/syscalls.h
> -index 9fb4f35..566b5ac 100644
> ---- a/libc/sysdeps/linux/i386/bits/syscalls.h
> -+++ b/libc/sysdeps/linux/i386/bits/syscalls.h
> -@@ -136,7 +136,7 @@ __asm__ (
> - #define ASMFMT_5(arg1, arg2, arg3, arg4, arg5) \
> - 	, "a" (arg1), "c" (arg2), "d" (arg3), "S" (arg4), "D" (arg5)
> - #define ASMFMT_6(arg1, arg2, arg3, arg4, arg5, arg6) \
> --	, "a" (arg1), "c" (arg2), "d" (arg3), "S" (arg4), "D" (arg5), "m" (arg6)
> -+	, "a" (arg1), "c" (arg2), "d" (arg3), "S" (arg4), "D" (arg5), "g" (arg6)
> - 
> - #else /* !PIC */
> - 
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch b/package/uclibc/0.9.33.2/0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch
> deleted file mode 100644
> index 3741367..0000000
> --- a/package/uclibc/0.9.33.2/0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From f5108ce0c0f72a285e4cb198426e477295c84517 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Timo=20Ter=C3=A4s?= <timo.teras@iki.fi>
> -Date: Tue, 8 Jan 2013 11:55:26 +0200
> -Subject: [PATCH] dl: fix dlsym lookups with RTLD_NEXT
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The current code for dlsym() when invoked with RTLD_NEXT lookup
> -searches for the module where it's being called from, and executes the
> -_dl_find_hash only for the next module in the chain. However, if the
> -looked symbol is not there, the rest of the modules are not checked.
> -
> -Generally this is not a problem as symbols are merged for the parent
> -modules; so this affects only RTLD_NEXT.
> -
> -This patch adds a loop iterating through all the following modules.
> -
> -Signed-off-by: Timo Ter?s <timo.teras@iki.fi>
> -Reviewed-by: Filippo ARCIDIACONO <filippo.arcidiacono@st.com>
> -Tested-by: Florian Fainelli <florian@openwrt.org>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - ldso/libdl/libdl.c |   10 ++++++++--
> - 1 file changed, 8 insertions(+), 2 deletions(-)
> -
> -diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
> -index 51bcf7d..71ade1f 100644
> ---- a/ldso/libdl/libdl.c
> -+++ b/ldso/libdl/libdl.c
> -@@ -671,7 +671,7 @@ static void *do_dlsym(void *vhandle, const char *name, void *caller_address)
> - {
> - 	struct elf_resolve *tpnt, *tfrom;
> - 	struct dyn_elf *handle;
> --	ElfW(Addr) from;
> -+	ElfW(Addr) from = 0;
> - 	struct dyn_elf *rpnt;
> - 	void *ret;
> - 	struct symbol_ref sym_ref = { NULL, NULL };
> -@@ -729,7 +729,13 @@ static void *do_dlsym(void *vhandle, const char *name, void *caller_address)
> - 	tpnt = NULL;
> - 	if (handle == _dl_symbol_tables)
> - 		tpnt = handle->dyn; /* Only search RTLD_GLOBAL objs if global object */
> --	ret = _dl_find_hash(name2, &handle->dyn->symbol_scope, tpnt, ELF_RTYPE_CLASS_DLSYM, &sym_ref);
> -+
> -+	do {
> -+		ret = _dl_find_hash(name2, &handle->dyn->symbol_scope, tpnt, ELF_RTYPE_CLASS_DLSYM, &sym_ref);
> -+		if (ret != NULL)
> -+			break;
> -+		handle = handle->next;
> -+	} while (from && handle);
> - 
> - #if defined(USE_TLS) && USE_TLS && defined SHARED
> - 	if (sym_ref.sym && (ELF_ST_TYPE(sym_ref.sym->st_info) == STT_TLS) && (sym_ref.tpnt)) {
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0029-inet-rpc-fix-build-in-NPTL-case.patch b/package/uclibc/0.9.33.2/0029-inet-rpc-fix-build-in-NPTL-case.patch
> deleted file mode 100644
> index 716052a..0000000
> --- a/package/uclibc/0.9.33.2/0029-inet-rpc-fix-build-in-NPTL-case.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 3a732cacd650bd39d86ac13ba0f57eee0df82d5a Mon Sep 17 00:00:00 2001
> -From: Carmelo Amoroso <carmelo.amoroso@st.com>
> -Date: Wed, 14 Mar 2012 15:21:36 +0100
> -Subject: [PATCH] inet:rpc: fix build in !NPTL case
> -
> -__libc_once is not available / needed when multithreading support
> -is not enabled, so authnone_create() calls authnone_create_once()
> -directly.
> -When LT.{old,new} is used instead of NPTL, it needs to explicitly
> -include <bits/libc-lock.h> to get __libc_once to be visible.
> -
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> ----
> - libc/inet/rpc/auth_none.c   |    6 ++++++
> - libc/inet/rpc/rpc_private.h |    1 +
> - 2 files changed, 7 insertions(+)
> -
> -diff --git a/libc/inet/rpc/auth_none.c b/libc/inet/rpc/auth_none.c
> -index d066f6b..70bee5b 100644
> ---- a/libc/inet/rpc/auth_none.c
> -+++ b/libc/inet/rpc/auth_none.c
> -@@ -68,7 +68,9 @@ struct authnone_private_s {
> - };
> - 
> - static struct authnone_private_s authnone_private;
> -+#ifdef __UCLIBC_HAS_THREADS__
> - __libc_once_define(static, authnone_private_guard);
> -+#endif
> - 
> - static void authnone_create_once (void);
> - 
> -@@ -95,7 +97,11 @@ authnone_create_once (void)
> - AUTH *
> - authnone_create (void)
> - {
> -+#ifdef __UCLIBC_HAS_THREADS__
> -   __libc_once (authnone_private_guard, authnone_create_once);
> -+#else
> -+  authnone_create_once();
> -+#endif
> -   return &authnone_private.no_client;
> - }
> - libc_hidden_def(authnone_create)
> -diff --git a/libc/inet/rpc/rpc_private.h b/libc/inet/rpc/rpc_private.h
> -index e1214d2..38ade1c 100644
> ---- a/libc/inet/rpc/rpc_private.h
> -+++ b/libc/inet/rpc/rpc_private.h
> -@@ -12,6 +12,7 @@ extern u_long _create_xid (void) attribute_hidden;
> -  */
> - #ifdef __UCLIBC_HAS_THREADS__
> - #include <pthread.h>
> -+#include <bits/libc-lock.h>
> - struct rpc_thread_variables {
> - 	fd_set		svc_fdset_s;		/* Global, rpc_common.c */
> - 	struct rpc_createerr rpc_createerr_s;	/* Global, rpc_common.c */
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0030-stdio-implement-assignment-allocation-m-character.patch b/package/uclibc/0.9.33.2/0030-stdio-implement-assignment-allocation-m-character.patch
> deleted file mode 100644
> index 42a2737..0000000
> --- a/package/uclibc/0.9.33.2/0030-stdio-implement-assignment-allocation-m-character.patch
> +++ /dev/null
> @@ -1,190 +0,0 @@
> -From 050cd6971f92c2337bc506043dfcf1395dd5d622 Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Sun, 6 May 2012 03:50:44 -0400
> -Subject: [PATCH] stdio: implement assignment-allocation "m" character
> -
> -The latest POSIX spec introduces a "m" character to allocate buffers for
> -the user when using scanf type functions.  This is like the old glibc "a"
> -flag, but now standardized.  With packages starting to use these, we need
> -to implement it.
> -
> -for example:
> -	char *s;
> -	sscanf("foo", "%ms", &s);
> -	printf("%s\n", s);
> -	free(s);
> -This will automatically allocate storage for "s", read in "foo" to it,
> -and then display it.
> -
> -I'm not terribly familiar with the stdio layer, so this could be wrong.
> -But it seems to work for me.
> -
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - extra/Configs/Config.in |   13 ---------
> - libc/stdio/_scanf.c     |   68 +++++++++++++++++++++++++++--------------------
> - 2 files changed, 39 insertions(+), 42 deletions(-)
> -
> -diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
> -index 1060729..c2f2fc7 100644
> ---- a/extra/Configs/Config.in
> -+++ b/extra/Configs/Config.in
> -@@ -1590,19 +1590,6 @@ config UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS
> - 
> - 	  Most people will answer 9.
> - 
> --
> --config UCLIBC_HAS_SCANF_GLIBC_A_FLAG
> --	bool "Support glibc's 'a' flag for scanf string conversions (not implemented)"
> --	help
> --	  NOTE!!!  Currently Not Implemented!!! Just A Place Holder!!  NOTE!!!
> --	  NOTE!!!  Conflicts with an ANSI/ISO C99 scanf flag!!         NOTE!!!
> --
> --	  Answer Y to enable support for glibc's 'a' flag for the scanf string
> --	  conversions '%s', '%[', '%ls', '%l[', and '%S'.  This is used to
> --	  auto-allocate sufficient memory to hold the data retrieved.
> --
> --	  Most people will answer N.
> --
> - choice
> - 	prompt "Stdio buffer size"
> - 	default UCLIBC_HAS_STDIO_BUFSIZ_4096
> -diff --git a/libc/stdio/_scanf.c b/libc/stdio/_scanf.c
> -index f38e72b..952853c 100644
> ---- a/libc/stdio/_scanf.c
> -+++ b/libc/stdio/_scanf.c
> -@@ -77,14 +77,6 @@
> - #include <bits/uClibc_fpmax.h>
> - #endif /* __UCLIBC_HAS_FLOATS__ */
> - 
> --#ifdef __UCLIBC_HAS_SCANF_GLIBC_A_FLAG__
> --#ifdef L_vfscanf
> --/* only emit this once */
> --#warning Forcing undef of __UCLIBC_HAS_SCANF_GLIBC_A_FLAG__ until implemented!
> --#endif
> --#undef __UCLIBC_HAS_SCANF_GLIBC_A_FLAG__
> --#endif
> --
> - #undef __STDIO_HAS_VSSCANF
> - #if defined(__STDIO_BUFFERS) || !defined(__UCLIBC_HAS_WCHAR__) || defined(__UCLIBC_HAS_GLIBC_CUSTOM_STREAMS__)
> - #define __STDIO_HAS_VSSCANF 1
> -@@ -433,8 +425,9 @@ libc_hidden_def(vswscanf)
> - 
> - 
> - /* float layout          0123456789012345678901  repeat n for "l[" */
> --#define SPEC_CHARS		"npxXoudifFeEgGaACSncs["
> --/*                       npxXoudif eEgG  CS cs[ */
> -+#define SPEC_CHARS		"npxXoudifFeEgGaACSnmcs["
> -+/*                       npxXoudif eEgG  CS  cs[ */
> -+/* NOTE: the 'm' flag must come before any convs that support it */
> - 
> - /* NOTE: Ordering is important!  In particular, CONV_LEFTBRACKET
> -  * must immediately precede CONV_c. */
> -@@ -444,7 +437,7 @@ enum {
> - 	CONV_p,
> - 	CONV_x, CONV_X,	CONV_o,	CONV_u,	CONV_d,	CONV_i,
> - 	CONV_f, CONV_F, CONV_e, CONV_E, CONV_g, CONV_G, CONV_a, CONV_A,
> --	CONV_C, CONV_S, CONV_LEFTBRACKET, CONV_c, CONV_s, CONV_leftbracket,
> -+	CONV_C, CONV_S, CONV_LEFTBRACKET, CONV_m, CONV_c, CONV_s, CONV_leftbracket,
> - 	CONV_percent, CONV_whitespace /* not in SPEC_* and no flags */
> - };
> - 
> -@@ -474,7 +467,7 @@ enum {
> - 	FLAG_SURPRESS   =   0x10,	/* MUST BE 1ST!!  See DO_FLAGS. */
> - 	FLAG_THOUSANDS	=	0x20,
> - 	FLAG_I18N		=	0x40,	/* only works for d, i, u */
> --	FLAG_MALLOC     =   0x80,	/* only works for s, S, and [ (and l[)*/
> -+	FLAG_MALLOC     =   0x80,	/* only works for c, s, S, and [ (and l[)*/
> - };
> - 
> - 
> -@@ -491,7 +484,7 @@ enum {
> - 	/* fFeEgGaA */	(0x0c|FLAG_SURPRESS|FLAG_THOUSANDS|FLAG_I18N), \
> - 	/* C */			(   0|FLAG_SURPRESS), \
> - 	/* S and l[ */	(   0|FLAG_SURPRESS|FLAG_MALLOC), \
> --	/* c */			(0x04|FLAG_SURPRESS), \
> -+	/* c */			(0x04|FLAG_SURPRESS|FLAG_MALLOC), \
> - 	/* s and [ */	(0x04|FLAG_SURPRESS|FLAG_MALLOC), \
> - }
> - 
> -@@ -904,17 +897,17 @@ int attribute_hidden __psfs_parse_spec(register psfs_t *psfs)
> - 		if (*psfs->fmt == *p) {
> - 			int p_m_spec_chars = p - spec_chars;
> - 
> --#ifdef __UCLIBC_HAS_SCANF_GLIBC_A_FLAG__
> --#error implement gnu a flag
> --			if ((*p == 'a')
> --				&& ((psfs->fmt[1] == '[') || ((psfs->fmt[1]|0x20) == 's'))
> --				) {		/* Assumes ascii for 's' and 'S' test. */
> --				psfs->flags |= FLAG_MALLOC;
> -+			if (*p == 'm' &&
> -+				(psfs->fmt[1] == '[' || psfs->fmt[1] == 'c' ||
> -+				 /* Assumes ascii for 's' and 'S' test. */
> -+				 (psfs->fmt[1] | 0x20) == 's'))
> -+			{
> -+				if (psfs->store)
> -+					psfs->flags |= FLAG_MALLOC;
> - 				++psfs->fmt;
> - 				++p;
> --				continue; /* The related conversions follow 'a'. */
> -+				continue; /* The related conversions follow 'm'. */
> - 			}
> --#endif /* __UCLIBC_HAS_SCANF_GLIBC_A_FLAG__ */
> - 
> - 			for (p = spec_ranges; p_m_spec_chars > *p ; ++p) {}
> - 			if (((psfs->dataargtype >> 8) | psfs->flags)
> -@@ -1265,12 +1258,6 @@ int VFSCANF (FILE *__restrict fp, const Wchar *__restrict format, va_list arg)
> - 				while (*wf && __isascii(*wf) && (b < buf + sizeof(buf) - 1)) {
> - 					*b++ = *wf++;
> - 				}
> --#ifdef __UCLIBC_HAS_SCANF_GLIBC_A_FLAG__
> --#error this is wrong... we need to ched in __psfs_parse_spec instead since this checks last char in buffer and conversion my have stopped before it.
> --				if ((*b == 'a') && ((*wf == '[') || ((*wf|0x20) == 's'))) {
> --					goto DONE;	/* Spec was excessively long. */
> --				}
> --#endif /* __UCLIBC_HAS_SCANF_GLIBC_A_FLAG__ */
> - 				*b = 0;
> - 				if (b == buf) { /* Bad conversion specifier! */
> - 					goto DONE;
> -@@ -1390,13 +1377,36 @@ int VFSCANF (FILE *__restrict fp, const Wchar *__restrict format, va_list arg)
> - 				}
> - 
> - 				if (psfs.conv_num == CONV_s) {
> -+					/* We might have to handle the allocation ourselves */
> -+					int len;
> -+					/* With 'm', we actually got a pointer to a pointer */
> -+					unsigned char **ptr = (void *)b;
> -+
> -+					i = 0;
> -+					if (psfs.flags & FLAG_MALLOC) {
> -+						len = 0;
> -+						b = NULL;
> -+					} else
> -+						len = -1;
> -+
> - 					/* Yes, believe it or not, a %s conversion can store nuls. */
> - 					while ((__scan_getc(&sc) >= 0) && !isspace(sc.cc)) {
> - 						zero_conversions = 0;
> --						*b = sc.cc;
> --						b += psfs.store;
> -+						if (i == len) {
> -+							/* Pick a size that won't trigger a lot of
> -+							 * mallocs early on ... */
> -+							len += 256;
> -+							b = realloc(b, len + 1);
> -+						}
> -+						b[i] = sc.cc;
> -+						i += psfs.store;
> - 						fail = 0;
> - 					}
> -+
> -+					if (psfs.flags & FLAG_MALLOC)
> -+						*ptr = b;
> -+					/* The code below takes care of terminating NUL */
> -+					b += i;
> - 				} else {
> - #ifdef __UCLIBC_HAS_WCHAR__
> - 					assert((psfs.conv_num == CONV_LEFTBRACKET) || \
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0031-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch b/package/uclibc/0.9.33.2/0031-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch
> deleted file mode 100644
> index 475dcfd..0000000
> --- a/package/uclibc/0.9.33.2/0031-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 569d1423ac2b585b5cb38bee545b5e0ae2bd7f67 Mon Sep 17 00:00:00 2001
> -From: James Hogan <james.hogan@imgtec.com>
> -Date: Thu, 17 May 2012 12:42:54 +0100
> -Subject: [PATCH] mmap()->sys_mmap2: do unsigned shift of offset
> -
> -Fix the implementation of mmap based on the mmap2 system call, to
> -construct pgoffset from offset with an unsigned shift rather than a
> -signed (off_t) shift. The mmap2 test in the testsuite catches this case
> -by mmap'ing with a large offset (with the sign bit set). The signed
> -shift repeats the sign bit making the page shift way out of range. This
> -is already fixed similarly in mmap64().
> -
> -Signed-off-by: James Hogan <james.hogan@imgtec.com>
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - libc/sysdeps/linux/common/mmap.c |    3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/libc/sysdeps/linux/common/mmap.c b/libc/sysdeps/linux/common/mmap.c
> -index 8995898..d53eabb 100644
> ---- a/libc/sysdeps/linux/common/mmap.c
> -+++ b/libc/sysdeps/linux/common/mmap.c
> -@@ -63,7 +63,8 @@ __ptr_t mmap(__ptr_t addr, size_t len, int prot, int flags, int fd, __off_t offs
> - 		__set_errno(EINVAL);
> - 		return MAP_FAILED;
> - 	}
> --	return __syscall_mmap2(addr, len, prot, flags, fd, offset >> MMAP2_PAGE_SHIFT);
> -+	return __syscall_mmap2(addr, len, prot, flags,
> -+	                       fd, ((__u_long) offset >> MMAP2_PAGE_SHIFT));
> - }
> - 
> - libc_hidden_def(mmap)
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0033-rpmatch-backport-function.patch b/package/uclibc/0.9.33.2/0033-rpmatch-backport-function.patch
> deleted file mode 100644
> index 6a74d78..0000000
> --- a/package/uclibc/0.9.33.2/0033-rpmatch-backport-function.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From 929b1a121c5ff0daa33b2107b4c1a68b650d93ee Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Mon, 30 Apr 2012 00:40:49 -0400
> -Subject: [PATCH] rpmatch: backport function
> -
> -rpmatch will match ^[Yy] and ^[Nn] regardless of locale
> -
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - include/stdlib.h        |    2 +-
> - libc/stdlib/Makefile.in |    2 +-
> - libc/stdlib/rpmatch.c   |    7 +++++++
> - libc/stdlib/stdlib.c    |    8 ++++++++
> - 4 files changed, 17 insertions(+), 2 deletions(-)
> - create mode 100644 libc/stdlib/rpmatch.c
> -
> -diff --git a/include/stdlib.h b/include/stdlib.h
> -index 4aa1227..42b585c 100644
> ---- a/include/stdlib.h
> -+++ b/include/stdlib.h
> -@@ -851,7 +851,7 @@ __END_NAMESPACE_STD
> - #endif /* __UCLIBC_HAS_WCHAR__ */
> - 
> - 
> --#if 0 /*def __USE_SVID*/
> -+#ifdef __USE_SVID
> - /* Determine whether the string value of RESPONSE matches the affirmation
> -    or negative response expression as specified by the LC_MESSAGES category
> -    in the program's current locale.  Returns 1 if affirmative, 0 if
> -diff --git a/libc/stdlib/Makefile.in b/libc/stdlib/Makefile.in
> -index f219d21..e802441 100644
> ---- a/libc/stdlib/Makefile.in
> -+++ b/libc/stdlib/Makefile.in
> -@@ -33,7 +33,7 @@ endif
> - 
> - # multi source stdlib.c
> - CSRC-y += abs.c labs.c atoi.c atol.c strtol.c strtoul.c _stdlib_strto_l.c \
> --	qsort.c qsort_r.c bsearch.c \
> -+	qsort.c qsort_r.c bsearch.c rpmatch.c \
> - 	llabs.c atoll.c strtoll.c strtoull.c _stdlib_strto_ll.c
> - # (aliases) strtoq.o strtouq.o
> - CSRC-$(UCLIBC_HAS_FLOATS) += atof.c
> -diff --git a/libc/stdlib/rpmatch.c b/libc/stdlib/rpmatch.c
> -new file mode 100644
> -index 0000000..dce06b6
> ---- /dev/null
> -+++ b/libc/stdlib/rpmatch.c
> -@@ -0,0 +1,7 @@
> -+/* Copyright (C) 2012 Bernhard Reutner-Fischer <uclibc@uclibc.org>
> -+ *
> -+ * Licensed under the LGPL v2.1+, see the file COPYING.LIB in this tarball.
> -+ */
> -+
> -+#define L_rpmatch
> -+#include "stdlib.c"
> -diff --git a/libc/stdlib/stdlib.c b/libc/stdlib/stdlib.c
> -index 9e8c347..de8f084 100644
> ---- a/libc/stdlib/stdlib.c
> -+++ b/libc/stdlib/stdlib.c
> -@@ -318,6 +318,14 @@ long long atoll(const char *nptr)
> - 
> - #endif
> - /**********************************************************************/
> -+#ifdef L_rpmatch
> -+int rpmatch (__const char *__response)
> -+{
> -+	return (__response[0] == 'y' || __response[0] == 'Y') ? 1 :
> -+		(__response[0] == 'n' || __response[0] == 'N') ? 0 : -1;
> -+}
> -+#endif
> -+/**********************************************************************/
> - #if defined(L_strtol) || defined(L_strtol_l)
> - 
> - libc_hidden_proto(__XL_NPP(strtol))
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0034-statfs-support-f_frsize.patch b/package/uclibc/0.9.33.2/0034-statfs-support-f_frsize.patch
> deleted file mode 100644
> index 102c5e8..0000000
> --- a/package/uclibc/0.9.33.2/0034-statfs-support-f_frsize.patch
> +++ /dev/null
> @@ -1,189 +0,0 @@
> -From 479f8407c4822d2b872afb8bb14e5ab596714744 Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Thu, 17 Jan 2013 22:44:00 +0100
> -Subject: [PATCH] statfs: support f_frsize
> -
> -closes bugzilla #5834
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/misc/statfs/fstatfs64.c        |    3 +++
> - libc/misc/statfs/internal_statvfs.c |    8 ++++++--
> - libc/misc/statfs/statfs64.c         |    3 +++
> - test/.gitignore                     |    3 +++
> - test/misc/Makefile.in               |    6 ++++++
> - test/misc/tst-statfs.c              |   33 +++++++++++++++++++++++++++++++++
> - test/misc/tst-statvfs.c             |   28 ++++++++++++++++++++++++++++
> - 7 files changed, 82 insertions(+), 2 deletions(-)
> - create mode 100644 test/misc/tst-statfs.c
> - create mode 100644 test/misc/tst-statvfs.c
> -
> -diff --git a/libc/misc/statfs/fstatfs64.c b/libc/misc/statfs/fstatfs64.c
> -index 27bb8d6..42df1ae 100644
> ---- a/libc/misc/statfs/fstatfs64.c
> -+++ b/libc/misc/statfs/fstatfs64.c
> -@@ -43,6 +43,9 @@ int fstatfs64 (int fd, struct statfs64 *buf)
> -     buf->f_files = buf32.f_files;
> -     buf->f_ffree = buf32.f_ffree;
> -     buf->f_fsid = buf32.f_fsid;
> -+#ifdef _STATFS_F_FRSIZE
> -+    buf->f_frsize = buf32.f_frsize;
> -+#endif
> -     buf->f_namelen = buf32.f_namelen;
> -     memcpy (buf->f_spare, buf32.f_spare, sizeof (buf32.f_spare));
> - 
> -diff --git a/libc/misc/statfs/internal_statvfs.c b/libc/misc/statfs/internal_statvfs.c
> -index 6075e9c..c1862b5 100644
> ---- a/libc/misc/statfs/internal_statvfs.c
> -+++ b/libc/misc/statfs/internal_statvfs.c
> -@@ -19,8 +19,12 @@
> - 
> -   /* Now fill in the fields we have information for.  */
> -   buf->f_bsize = fsbuf.f_bsize;
> --  /* Linux does not support f_frsize, so set it to the full block size.  */
> -+#ifdef _STATFS_F_FRSIZE
> -+  buf->f_frsize = fsbuf.f_frsize;
> -+#else
> -+  /* No support for f_frsize so set it to the full block size.  */
> -   buf->f_frsize = fsbuf.f_bsize;
> -+#endif
> -   buf->f_blocks = fsbuf.f_blocks;
> -   buf->f_bfree = fsbuf.f_bfree;
> -   buf->f_bavail = fsbuf.f_bavail;
> -@@ -39,7 +43,7 @@
> -   buf->__f_unused = 0;
> - #endif
> -   buf->f_namemax = fsbuf.f_namelen;
> --  memset (buf->__f_spare, '\0', 6 * sizeof (int));
> -+  memset (buf->__f_spare, '\0', sizeof(buf->__f_spare));
> - 
> -   /* What remains to do is to fill the fields f_favail and f_flag.  */
> - 
> -diff --git a/libc/misc/statfs/statfs64.c b/libc/misc/statfs/statfs64.c
> -index 0cc8595..35329bd 100644
> ---- a/libc/misc/statfs/statfs64.c
> -+++ b/libc/misc/statfs/statfs64.c
> -@@ -42,6 +42,9 @@ int statfs64 (const char *file, struct statfs64 *buf)
> -     buf->f_ffree = buf32.f_ffree;
> -     buf->f_fsid = buf32.f_fsid;
> -     buf->f_namelen = buf32.f_namelen;
> -+#ifdef _STATFS_F_FRSIZE
> -+    buf->f_frsize = buf32.f_frsize;
> -+#endif
> -     memcpy (buf->f_spare, buf32.f_spare, sizeof (buf32.f_spare));
> - 
> -     return 0;
> -diff --git a/test/.gitignore b/test/.gitignore
> -index c892816..7234c48 100644
> ---- a/test/.gitignore
> -+++ b/test/.gitignore
> -@@ -148,6 +148,8 @@ misc/sem
> - misc/stdarg
> - misc/tst-scandir
> - misc/tst-seekdir
> -+misc/tst-statfs
> -+misc/tst-statvfs
> - misc/tst-utmp
> - mmap/mmap
> - mmap/mmap2
> -@@ -254,6 +256,7 @@ stdio/64bit
> - stdio/fclose-loop
> - stdlib/ptytest
> - stdlib/qsort
> -+stdlib/testarc4random
> - stdlib/testatexit
> - stdlib/test-canon
> - stdlib/test-canon2
> -diff --git a/test/misc/Makefile.in b/test/misc/Makefile.in
> -index 2263211..9b74d22 100644
> ---- a/test/misc/Makefile.in
> -+++ b/test/misc/Makefile.in
> -@@ -9,6 +9,12 @@ CFLAGS_dirent64 := -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS
> - 
> - DODIFF_dirent    := 1
> - DODIFF_dirent64  := 1
> -+DODIFF_tst-statfs := 1
> -+DODIFF_tst-statvfs := 1
> - 
> - OPTS_bug-glob1   := $(PWD)
> - OPTS_tst-fnmatch := < tst-fnmatch.input
> -+
> -+MNTENTS = $(shell mount | while read dev on mp rest; do echo $$mp; done)
> -+OPTS_tst-statfs := $(MNTENTS)
> -+OPTS_tst-statvfs := $(MNTENTS)
> -diff --git a/test/misc/tst-statfs.c b/test/misc/tst-statfs.c
> -new file mode 100644
> -index 0000000..44ab3aa
> ---- /dev/null
> -+++ b/test/misc/tst-statfs.c
> -@@ -0,0 +1,33 @@
> -+#define _FILE_OFFSET_BITS 64
> -+
> -+#include <sys/vfs.h>
> -+#include <errno.h>
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+
> -+int
> -+main(int argc, char* argv[])
> -+{
> -+	struct statfs s;
> -+	int ret = 0, i;
> -+
> -+	for (i = 1; i < argc; i++) {
> -+		if (statfs(argv[i], &s) != 0) {
> -+			fprintf(stderr, "%s: %s: statfs failed. %s\n",
> -+				*argv, argv[i], strerror(errno));
> -+			exit(EXIT_FAILURE);
> -+		}
> -+		++ret;
> -+		printf("statfs %s:\n\tblocks=%lld\n\tblkfree=%lld\n\tbsize=%d\n",
> -+			argv[i], s.f_blocks, s.f_bfree, s.f_bsize);
> -+#ifdef _STATFS_F_FRSIZE
> -+		printf("\tfrsize=%lld\n", s.f_frsize);
> -+#elif defined __mips__
> -+		printf("\tfrsize=mips, unsupported?\n");
> -+#else
> -+# error no _STATFS_F_FRSIZE
> -+#endif
> -+	}
> -+	exit(ret ? EXIT_SUCCESS : EXIT_FAILURE);
> -+}
> -diff --git a/test/misc/tst-statvfs.c b/test/misc/tst-statvfs.c
> -new file mode 100644
> -index 0000000..c1e8fde
> ---- /dev/null
> -+++ b/test/misc/tst-statvfs.c
> -@@ -0,0 +1,28 @@
> -+#define _FILE_OFFSET_BITS 64
> -+
> -+#include <sys/statvfs.h>
> -+#include <errno.h>
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+
> -+int
> -+main(int argc, char* argv[])
> -+{
> -+	struct statvfs s;
> -+	int i;
> -+
> -+	for (i = 1; i < argc; i++) {
> -+		if (statvfs(argv[i], &s) != 0) {
> -+			fprintf(stderr, "%s: %s: statvfs failed. %s\n",
> -+				*argv, argv[i], strerror(errno));
> -+			exit(EXIT_FAILURE);
> -+		}
> -+		printf("statvfs %s:\n\tblocks=%lld\n\tblkfree=%lld\n\tbsize=%d\n",
> -+			argv[i], s.f_blocks, s.f_bfree, s.f_bsize);
> -+#if 1 // def _STATFS_F_FRSIZE
> -+		printf("\tfrsize=%lld\n", s.f_frsize);
> -+#endif
> -+	}
> -+	exit(EXIT_SUCCESS);
> -+}
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0035-socket.h-pull-socket_type.h-from-eglibc.patch b/package/uclibc/0.9.33.2/0035-socket.h-pull-socket_type.h-from-eglibc.patch
> deleted file mode 100644
> index 1bea7fb..0000000
> --- a/package/uclibc/0.9.33.2/0035-socket.h-pull-socket_type.h-from-eglibc.patch
> +++ /dev/null
> @@ -1,1374 +0,0 @@
> -From 8eccce991d08960d135b97066621c8d3248a79b7 Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Thu, 17 Jan 2013 19:29:22 +0100
> -Subject: [PATCH] socket.h: pull socket_type.h from eglibc
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - Makefile.in                                      |    2 +-
> - libc/inet/opensock.c                             |    9 +-
> - libc/sysdeps/linux/alpha/bits/socket_type.h      |   54 ++++
> - libc/sysdeps/linux/common/bits/kernel-features.h |   10 +-
> - libc/sysdeps/linux/common/bits/socket.h          |  104 +++---
> - libc/sysdeps/linux/common/bits/socket_type.h     |   54 ++++
> - libc/sysdeps/linux/common/cmsg_nxthdr.c          |    1 +
> - libc/sysdeps/linux/hppa/bits/socket_type.h       |   54 ++++
> - libc/sysdeps/linux/mips/bits/socket.h            |  369 ---------------------
> - libc/sysdeps/linux/mips/bits/socket_type.h       |   55 ++++
> - libc/sysdeps/linux/sparc/bits/socket.h           |  376 ----------------------
> - libc/sysdeps/linux/sparc/bits/socket_type.h      |   54 ++++
> - 12 files changed, 325 insertions(+), 817 deletions(-)
> - create mode 100644 libc/sysdeps/linux/alpha/bits/socket_type.h
> - create mode 100644 libc/sysdeps/linux/common/bits/socket_type.h
> - create mode 100644 libc/sysdeps/linux/hppa/bits/socket_type.h
> - delete mode 100644 libc/sysdeps/linux/mips/bits/socket.h
> - create mode 100644 libc/sysdeps/linux/mips/bits/socket_type.h
> - delete mode 100644 libc/sysdeps/linux/sparc/bits/socket.h
> - create mode 100644 libc/sysdeps/linux/sparc/bits/socket_type.h
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 87b8e4b..69abfaf 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -255,7 +255,7 @@ HEADERS_RM-$(UCLIBC_HAS_REALTIME)            += mqueue.h bits/mqueue.h sched.h \
> - HEADERS_RM-$(UCLIBC_HAS_REGEX)               += regex.h regexp.h
> - HEADERS_RM-$(UCLIBC_HAS_RPC)                 += rpc
> - HEADERS_RM-$(UCLIBC_HAS_SHADOW)              += shadow.h
> --HEADERS_RM-$(UCLIBC_HAS_SOCKET)              += sys/socket.h bits/socket.h sys/socketvar.h
> -+HEADERS_RM-$(UCLIBC_HAS_SOCKET)              += sys/socket.h bits/socket.h sys/socketvar.h bits/socket_type.h
> - HEADERS_RM-$(UCLIBC_HAS_SYSLOG)              += syslog.h sys/syslog.h bits/syslog*.h
> - HEADERS_RM-$(UCLIBC_HAS_THREADS)             += *thread*.h semaphore.h \
> - 	bits/*thread*.h \
> -diff --git a/libc/inet/opensock.c b/libc/inet/opensock.c
> -index 86f8c59..da5858f 100644
> ---- a/libc/inet/opensock.c
> -+++ b/libc/inet/opensock.c
> -@@ -16,14 +16,11 @@
> -    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -    02111-1307 USA.  */
> - 
> --#include <assert.h>
> --#include <errno.h>
> --#include <stdio.h>
> --#include <string.h>
> --#include <unistd.h>
> --#include <sys/socket.h>
> -+
> - #include <features.h>
> - #include <libc-internal.h>
> -+#include <sys/socket.h>
> -+#include <bits/kernel-features.h>
> - 
> - /* Return a socket of any type.  The socket can be used in subsequent
> -    ioctl calls to talk to the kernel.  */
> -diff --git a/libc/sysdeps/linux/alpha/bits/socket_type.h b/libc/sysdeps/linux/alpha/bits/socket_type.h
> -new file mode 100644
> -index 0000000..ee55d66
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/alpha/bits/socket_type.h
> -@@ -0,0 +1,54 @@
> -+/* Define enum __socket_type for Linux/Alpha.
> -+   Copyright (C) 1991-2012 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library.  If not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef _SYS_SOCKET_H
> -+# error "Never include <bits/socket_type.h> directly; use <sys/socket.h> instead."
> -+#endif
> -+
> -+/* Types of sockets.  */
> -+enum __socket_type
> -+{
> -+  SOCK_STREAM = 1,		/* Sequenced, reliable, connection-based
> -+				   byte streams.  */
> -+#define SOCK_STREAM SOCK_STREAM
> -+  SOCK_DGRAM = 2,		/* Connectionless, unreliable datagrams
> -+				   of fixed maximum length.  */
> -+#define SOCK_DGRAM SOCK_DGRAM
> -+  SOCK_RAW = 3,			/* Raw protocol interface.  */
> -+#define SOCK_RAW SOCK_RAW
> -+  SOCK_RDM = 4,			/* Reliably-delivered messages.  */
> -+#define SOCK_RDM SOCK_RDM
> -+  SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
> -+				   datagrams of fixed maximum length.  */
> -+#define SOCK_SEQPACKET SOCK_SEQPACKET
> -+  SOCK_DCCP = 6,		/* Datagram Congestion Control Protocol.  */
> -+#define SOCK_DCCP SOCK_DCCP
> -+  SOCK_PACKET = 10,		/* Linux specific way of getting packets
> -+				   at the dev level.  For writing rarp and
> -+				   other similar things on the user level. */
> -+#define SOCK_PACKET SOCK_PACKET
> -+
> -+  /* Flags to be ORed into the type parameter of socket and socketpair.  */
> -+
> -+  SOCK_CLOEXEC = 010000000,	/* Atomically set close-on-exec flag for the
> -+				   new descriptor(s).  */
> -+#define SOCK_CLOEXEC SOCK_CLOEXEC
> -+  SOCK_NONBLOCK = 0x40000000	/* Atomically mark descriptor(s) as
> -+				   non-blocking.  */
> -+#define SOCK_NONBLOCK SOCK_NONBLOCK
> -+};
> -diff --git a/libc/sysdeps/linux/common/bits/kernel-features.h b/libc/sysdeps/linux/common/bits/kernel-features.h
> -index 5ea85d2..5665e24 100644
> ---- a/libc/sysdeps/linux/common/bits/kernel-features.h
> -+++ b/libc/sysdeps/linux/common/bits/kernel-features.h
> -@@ -311,17 +311,19 @@
> - 
> - /* Support for various CLOEXEC and NONBLOCK flags was added for x86,
> -  *    x86-64, PPC, IA-64, and SPARC in 2.6.27.  */
> --#if __LINUX_KERNEL_VERSION >= 0x02061b \
> --    && (defined __i386__ || defined __x86_64__ || defined __powerpc__ \
> --        || defined __ia64__ || defined __sparc__ || defined __s390__)
> -+#if (__LINUX_KERNEL_VERSION >= 0x02061b \
> -+     && (defined __i386__ || defined __x86_64__ || defined __powerpc__ \
> -+         || defined __ia64__ || defined __sparc__ || defined __s390__) \
> -+	) || (__LINUX_KERNEL_VERSION >= 0x020621 && defined __alpha__) \
> -+	|| defined __aarch64__ || defined __tile__
> - /* # define __ASSUME_SOCK_CLOEXEC  1 */
> - /* # define __ASSUME_IN_NONBLOCK   1 */
> - # define __ASSUME_PIPE2         1
> - /* # define __ASSUME_EVENTFD2      1 */
> - /* # define __ASSUME_SIGNALFD4     1 */
> -+/* # define __ASSUME_DUP3		1 */
> - #endif
> - 
> --
> - /* These features were surely available with 2.4.12.  */
> - #if __LINUX_KERNEL_VERSION >= 132108 && defined __mc68000__
> - # define __ASSUME_MMAP2_SYSCALL		1
> -diff --git a/libc/sysdeps/linux/common/bits/socket.h b/libc/sysdeps/linux/common/bits/socket.h
> -index 7e12733..6a89340 100644
> ---- a/libc/sysdeps/linux/common/bits/socket.h
> -+++ b/libc/sysdeps/linux/common/bits/socket.h
> -@@ -1,5 +1,6 @@
> - /* System-specific socket constants and types.  Linux version.
> --   Copyright (C) 1991,1992,1994-2001,2004,2006 Free Software Foundation, Inc.
> -+   Copyright (C) 1991,1992,1994-2001,2004,2006-2012
> -+   Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> - 
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -20,12 +21,11 @@
> - #ifndef __BITS_SOCKET_H
> - #define __BITS_SOCKET_H
> - 
> --#if !defined _SYS_SOCKET_H && !defined _NETINET_IN_H
> -+#ifndef _SYS_SOCKET_H
> - # error "Never include <bits/socket.h> directly; use <sys/socket.h> instead."
> - #endif
> - 
> - #define	__need_size_t
> --#define __need_NULL
> - #include <stddef.h>
> - 
> - #include <limits.h>
> -@@ -37,37 +37,8 @@ typedef __socklen_t socklen_t;
> - # define __socklen_t_defined
> - #endif
> - 
> --/* Types of sockets.  */
> --enum __socket_type
> --{
> --  SOCK_STREAM = 1,		/* Sequenced, reliable, connection-based
> --				   byte streams.  */
> --#define SOCK_STREAM SOCK_STREAM
> --  SOCK_DGRAM = 2,		/* Connectionless, unreliable datagrams
> --				   of fixed maximum length.  */
> --#define SOCK_DGRAM SOCK_DGRAM
> --  SOCK_RAW = 3,			/* Raw protocol interface.  */
> --#define SOCK_RAW SOCK_RAW
> --  SOCK_RDM = 4,			/* Reliably-delivered messages.  */
> --#define SOCK_RDM SOCK_RDM
> --  SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
> --				   datagrams of fixed maximum length.  */
> --#define SOCK_SEQPACKET SOCK_SEQPACKET
> --  SOCK_PACKET = 10,		/* Linux specific way of getting packets
> --				   at the dev level.  For writing rarp and
> --				   other similar things on the user level. */
> --#define SOCK_PACKET SOCK_PACKET
> --
> --  /* Flags to be ORed into the type parameter of socket and socketpair and
> --     used for the flags parameter of paccept.  */
> --
> --  SOCK_CLOEXEC = 02000000,	/* Atomically set close-on-exec flag for the
> --				   new descriptor(s).  */
> --#define SOCK_CLOEXEC SOCK_CLOEXEC
> --  SOCK_NONBLOCK = 04000		/* Atomically mark descriptor(s) as
> --				   non-blocking.  */
> --#define SOCK_NONBLOCK SOCK_NONBLOCK
> --};
> -+/* Get the architecture-dependent definition of enum __socket_type.  */
> -+#include <bits/socket_type.h>
> - 
> - /* Protocol families.  */
> - #define	PF_UNSPEC	0	/* Unspecified.  */
> -@@ -94,22 +65,24 @@ enum __socket_type
> - #define	PF_ASH		18	/* Ash.  */
> - #define	PF_ECONET	19	/* Acorn Econet.  */
> - #define	PF_ATMSVC	20	/* ATM SVCs.  */
> -+#define PF_RDS		21	/* RDS sockets.  */
> - #define	PF_SNA		22	/* Linux SNA Project */
> - #define	PF_IRDA		23	/* IRDA sockets.  */
> - #define	PF_PPPOX	24	/* PPPoX sockets.  */
> - #define	PF_WANPIPE	25	/* Wanpipe API sockets.  */
> --#define	PF_LLC		26	/* Linux LLC.  */
> --#define	PF_CAN		29	/* Controller Area Network.  */
> --#define	PF_TIPC		30	/* TIPC sockets.  */
> -+#define PF_LLC		26	/* Linux LLC.  */
> -+#define PF_CAN		29	/* Controller Area Network.  */
> -+#define PF_TIPC		30	/* TIPC sockets.  */
> - #define	PF_BLUETOOTH	31	/* Bluetooth sockets.  */
> - #define	PF_IUCV		32	/* IUCV sockets.  */
> --#define	PF_RXRPC	33	/* RxRPC sockets.  */
> --#define	PF_ISDN		34	/* mISDN sockets.  */
> --#define	PF_PHONET	35	/* Phonet sockets.  */
> --#define	PF_IEEE802154	36	/* IEEE 802.15.4 sockets.  */
> --#define	PF_CAIF		37	/* CAIF sockets.  */
> --#define	PF_ALG		38	/* Algorithm sockets.  */
> --#define	PF_MAX		39	/* For now..  */
> -+#define PF_RXRPC	33	/* RxRPC sockets.  */
> -+#define PF_ISDN		34	/* mISDN sockets.  */
> -+#define PF_PHONET	35	/* Phonet sockets.  */
> -+#define PF_IEEE802154	36	/* IEEE 802.15.4 sockets.  */
> -+#define PF_CAIF		37	/* CAIF sockets.  */
> -+#define PF_ALG		38	/* Algorithm sockets.  */
> -+#define PF_NFC		39	/* NFC sockets.  */
> -+#define	PF_MAX		40	/* For now..  */
> - 
> - /* Address families.  */
> - #define	AF_UNSPEC	PF_UNSPEC
> -@@ -136,21 +109,23 @@ enum __socket_type
> - #define	AF_ASH		PF_ASH
> - #define	AF_ECONET	PF_ECONET
> - #define	AF_ATMSVC	PF_ATMSVC
> -+#define AF_RDS		PF_RDS
> - #define	AF_SNA		PF_SNA
> - #define	AF_IRDA		PF_IRDA
> - #define	AF_PPPOX	PF_PPPOX
> - #define	AF_WANPIPE	PF_WANPIPE
> --#define	AF_LLC		PF_LLC
> --#define	AF_CAN		PF_CAN
> --#define	AF_TIPC		PF_TIPC
> -+#define AF_LLC		PF_LLC
> -+#define AF_CAN		PF_CAN
> -+#define AF_TIPC		PF_TIPC
> - #define	AF_BLUETOOTH	PF_BLUETOOTH
> --#define	AF_IUCV		PF_IUCV
> --#define	AF_RXRPC	PF_RXRPC
> --#define	AF_ISDN		PF_ISDN
> --#define	AF_PHONET	PF_PHONET
> --#define	AF_IEEE802154	PF_IEEE802154
> --#define	AF_CAIF		PF_CAIF
> --#define	AF_ALG		PF_ALG
> -+#define AF_IUCV		PF_IUCV
> -+#define AF_RXRPC	PF_RXRPC
> -+#define AF_ISDN		PF_ISDN
> -+#define AF_PHONET	PF_PHONET
> -+#define AF_IEEE802154	PF_IEEE802154
> -+#define AF_CAIF		PF_CAIF
> -+#define AF_ALG		PF_ALG
> -+#define AF_NFC		PF_NFC
> - #define	AF_MAX		PF_MAX
> - 
> - /* Socket level values.  Others are defined in the appropriate headers.
> -@@ -235,8 +210,14 @@ enum
> - #define	MSG_ERRQUEUE	MSG_ERRQUEUE
> -     MSG_NOSIGNAL	= 0x4000, /* Do not generate SIGPIPE.  */
> - #define	MSG_NOSIGNAL	MSG_NOSIGNAL
> --    MSG_MORE		= 0x8000  /* Sender will send more.  */
> -+    MSG_MORE		= 0x8000,  /* Sender will send more.  */
> - #define	MSG_MORE	MSG_MORE
> -+    MSG_WAITFORONE	= 0x10000, /* Wait for at least one packet to return.*/
> -+#define MSG_WAITFORONE	MSG_WAITFORONE
> -+    MSG_CMSG_CLOEXEC	= 0x40000000	/* Set close_on_exit for file
> -+					   descriptor received through
> -+					   SCM_RIGHTS.  */
> -+#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
> -   };
> - 
> - 
> -@@ -290,7 +271,7 @@ struct cmsghdr
> - #define CMSG_NXTHDR(mhdr, cmsg) __cmsg_nxthdr (mhdr, cmsg)
> - #define CMSG_FIRSTHDR(mhdr) \
> -   ((size_t) (mhdr)->msg_controllen >= sizeof (struct cmsghdr)		      \
> --   ? (struct cmsghdr *) (mhdr)->msg_control : (struct cmsghdr *) NULL)
> -+   ? (struct cmsghdr *) (mhdr)->msg_control : (struct cmsghdr *) 0)
> - #define CMSG_ALIGN(len) (((len) + sizeof (size_t) - 1) \
> - 			 & (size_t) ~(sizeof (size_t) - 1))
> - #define CMSG_SPACE(len) (CMSG_ALIGN (len) \
> -@@ -302,14 +283,14 @@ extern struct cmsghdr *__cmsg_nxthdr (struct msghdr *__mhdr,
> - libc_hidden_proto(__cmsg_nxthdr)
> - #ifdef __USE_EXTERN_INLINES
> - # ifndef _EXTERN_INLINE
> --#  define _EXTERN_INLINE extern __inline
> -+#  define _EXTERN_INLINE __extern_inline
> - # endif
> - _EXTERN_INLINE struct cmsghdr *
> - __NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
> - {
> -   if ((size_t) __cmsg->cmsg_len < sizeof (struct cmsghdr))
> -     /* The kernel header does this so there may be a reason.  */
> --    return 0;
> -+    return (struct cmsghdr *) 0;
> - 
> -   __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
> - 			       + CMSG_ALIGN (__cmsg->cmsg_len));
> -@@ -318,7 +299,7 @@ __NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
> -       || ((unsigned char *) __cmsg + CMSG_ALIGN (__cmsg->cmsg_len)
> - 	  > ((unsigned char *) __mhdr->msg_control + __mhdr->msg_controllen)))
> -     /* No more entries.  */
> --    return 0;
> -+    return (struct cmsghdr *) 0;
> -   return __cmsg;
> - }
> - #endif	/* Use `extern inline'.  */
> -@@ -329,20 +310,21 @@ enum
> -   {
> -     SCM_RIGHTS = 0x01		/* Transfer file descriptors.  */
> - #define SCM_RIGHTS SCM_RIGHTS
> --#ifdef __USE_BSD
> -+#ifdef __USE_GNU
> -     , SCM_CREDENTIALS = 0x02	/* Credentials passing.  */
> - # define SCM_CREDENTIALS SCM_CREDENTIALS
> - #endif
> -   };
> - 
> -+#ifdef __USE_GNU
> - /* User visible structure for SCM_CREDENTIALS message */
> --
> - struct ucred
> - {
> -   pid_t pid;			/* PID of sending process.  */
> -   uid_t uid;			/* UID of sending process.  */
> -   gid_t gid;			/* GID of sending process.  */
> - };
> -+#endif
> - 
> - /* Get socket manipulation related informations from kernel headers.  */
> - #ifndef __GLIBC__
> -diff --git a/libc/sysdeps/linux/common/bits/socket_type.h b/libc/sysdeps/linux/common/bits/socket_type.h
> -new file mode 100644
> -index 0000000..65436b0
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/bits/socket_type.h
> -@@ -0,0 +1,54 @@
> -+/* Define enum __socket_type for generic Linux.
> -+   Copyright (C) 1991-2012 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef _SYS_SOCKET_H
> -+# error "Never include <bits/socket_type.h> directly; use <sys/socket.h> instead."
> -+#endif
> -+
> -+/* Types of sockets.  */
> -+enum __socket_type
> -+{
> -+  SOCK_STREAM = 1,		/* Sequenced, reliable, connection-based
> -+				   byte streams.  */
> -+#define SOCK_STREAM SOCK_STREAM
> -+  SOCK_DGRAM = 2,		/* Connectionless, unreliable datagrams
> -+				   of fixed maximum length.  */
> -+#define SOCK_DGRAM SOCK_DGRAM
> -+  SOCK_RAW = 3,			/* Raw protocol interface.  */
> -+#define SOCK_RAW SOCK_RAW
> -+  SOCK_RDM = 4,			/* Reliably-delivered messages.  */
> -+#define SOCK_RDM SOCK_RDM
> -+  SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
> -+				   datagrams of fixed maximum length.  */
> -+#define SOCK_SEQPACKET SOCK_SEQPACKET
> -+  SOCK_DCCP = 6,		/* Datagram Congestion Control Protocol.  */
> -+#define SOCK_DCCP SOCK_DCCP
> -+  SOCK_PACKET = 10,		/* Linux specific way of getting packets
> -+				   at the dev level.  For writing rarp and
> -+				   other similar things on the user level. */
> -+#define SOCK_PACKET SOCK_PACKET
> -+
> -+  /* Flags to be ORed into the type parameter of socket and socketpair.  */
> -+
> -+  SOCK_CLOEXEC = 02000000,	/* Atomically set close-on-exec flag for the
> -+				   new descriptor(s).  */
> -+#define SOCK_CLOEXEC SOCK_CLOEXEC
> -+  SOCK_NONBLOCK = 00004000	/* Atomically mark descriptor(s) as
> -+				   non-blocking.  */
> -+#define SOCK_NONBLOCK SOCK_NONBLOCK
> -+};
> -diff --git a/libc/sysdeps/linux/common/cmsg_nxthdr.c b/libc/sysdeps/linux/common/cmsg_nxthdr.c
> -index 0360b47..9c21190 100644
> ---- a/libc/sysdeps/linux/common/cmsg_nxthdr.c
> -+++ b/libc/sysdeps/linux/common/cmsg_nxthdr.c
> -@@ -19,6 +19,7 @@
> - 
> - #define __FORCE_GLIBC
> - #include <features.h>
> -+#include <stddef.h>
> - /* Prevent math.h from defining a colliding inline */
> - #undef __USE_EXTERN_INLINES
> - #include <sys/socket.h>
> -diff --git a/libc/sysdeps/linux/hppa/bits/socket_type.h b/libc/sysdeps/linux/hppa/bits/socket_type.h
> -new file mode 100644
> -index 0000000..c6df6c3
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/hppa/bits/socket_type.h
> -@@ -0,0 +1,54 @@
> -+/* Define enum __socket_type for Linux/HP-PARISC.
> -+   Copyright (C) 2012 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef _SYS_SOCKET_H
> -+# error "Never include <bits/socket_type.h> directly; use <sys/socket.h> instead."
> -+#endif
> -+
> -+/* Types of sockets.  */
> -+enum __socket_type
> -+{
> -+  SOCK_STREAM = 1,		/* Sequenced, reliable, connection-based
> -+				   byte streams.  */
> -+#define SOCK_STREAM SOCK_STREAM
> -+  SOCK_DGRAM = 2,		/* Connectionless, unreliable datagrams
> -+				   of fixed maximum length.  */
> -+#define SOCK_DGRAM SOCK_DGRAM
> -+  SOCK_RAW = 3,			/* Raw protocol interface.  */
> -+#define SOCK_RAW SOCK_RAW
> -+  SOCK_RDM = 4,			/* Reliably-delivered messages.  */
> -+#define SOCK_RDM SOCK_RDM
> -+  SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
> -+				   datagrams of fixed maximum length.  */
> -+#define SOCK_SEQPACKET SOCK_SEQPACKET
> -+  SOCK_DCCP = 6,		/* Datagram Congestion Control Protocol.  */
> -+#define SOCK_DCCP SOCK_DCCP
> -+  SOCK_PACKET = 10,		/* Linux specific way of getting packets
> -+				   at the dev level.  For writing rarp and
> -+				   other similar things on the user level. */
> -+#define SOCK_PACKET SOCK_PACKET
> -+
> -+  /* Flags to be ORed into the type parameter of socket and socketpair.  */
> -+
> -+  SOCK_CLOEXEC = 010000000,	/* Atomically set close-on-exec flag for the
> -+				   new descriptor(s).  */
> -+#define SOCK_CLOEXEC SOCK_CLOEXEC
> -+  SOCK_NONBLOCK = 0x40000000	/* Atomically mark descriptor(s) as
> -+				   non-blocking.  */
> -+#define SOCK_NONBLOCK SOCK_NONBLOCK
> -+};
> -diff --git a/libc/sysdeps/linux/mips/bits/socket.h b/libc/sysdeps/linux/mips/bits/socket.h
> -deleted file mode 100644
> -index 27ceafa..0000000
> ---- a/libc/sysdeps/linux/mips/bits/socket.h
> -+++ /dev/null
> -@@ -1,369 +0,0 @@
> --/* System-specific socket constants and types.  Linux/MIPS version.
> --   Copyright (C) 1991, 92, 1994-1999, 2000, 2001, 2004, 2005, 2006
> --   Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#ifndef __BITS_SOCKET_H
> --#define __BITS_SOCKET_H
> --
> --#if !defined _SYS_SOCKET_H && !defined _NETINET_IN_H
> --# error "Never include <bits/socket.h> directly; use <sys/socket.h> instead."
> --#endif
> --
> --#define	__need_size_t
> --#define __need_NULL
> --#include <stddef.h>
> --
> --#include <limits.h>
> --#include <sys/types.h>
> --
> --/* Type for length arguments in socket calls.  */
> --#ifndef __socklen_t_defined
> --typedef __socklen_t socklen_t;
> --# define __socklen_t_defined
> --#endif
> --
> --/* Types of sockets.  */
> --enum __socket_type
> --{
> --  SOCK_DGRAM = 1,		/* Connectionless, unreliable datagrams
> --				   of fixed maximum length.  */
> --#define SOCK_DGRAM SOCK_DGRAM
> --  SOCK_STREAM = 2,		/* Sequenced, reliable, connection-based
> --				   byte streams.  */
> --#define SOCK_STREAM SOCK_STREAM
> --  SOCK_RAW = 3,			/* Raw protocol interface.  */
> --#define SOCK_RAW SOCK_RAW
> --  SOCK_RDM = 4,			/* Reliably-delivered messages.  */
> --#define SOCK_RDM SOCK_RDM
> --  SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
> --				   datagrams of fixed maximum length.  */
> --#define SOCK_SEQPACKET SOCK_SEQPACKET
> --  SOCK_DCCP = 6,
> --#define SOCK_DCCP SOCK_DCCP	/* Datagram Congestion Control Protocol.  */
> --  SOCK_PACKET = 10,		/* Linux specific way of getting packets
> --				   at the dev level.  For writing rarp and
> --				   other similar things on the user level. */
> --#define SOCK_PACKET SOCK_PACKET
> --  /* Flags to be ORed into the type parameter of socket and socketpair and
> --     used for the flags parameter of paccept.  */
> --
> --  SOCK_CLOEXEC = 02000000,	/* Atomically set close-on-exec flag for the
> --                                   new descriptor(s).  */
> --#define SOCK_CLOEXEC SOCK_CLOEXEC
> --  SOCK_NONBLOCK = 0200		/* Atomically mark descriptor(s) as
> --				   non-blocking.  */
> --#define SOCK_NONBLOCK SOCK_NONBLOCK
> --};
> --
> --/* Protocol families.  */
> --#define	PF_UNSPEC	0	/* Unspecified.  */
> --#define	PF_LOCAL	1	/* Local to host (pipes and file-domain).  */
> --#define	PF_UNIX		PF_LOCAL /* Old BSD name for PF_LOCAL.  */
> --#define	PF_FILE		PF_LOCAL /* Another non-standard name for PF_LOCAL.  */
> --#define	PF_INET		2	/* IP protocol family.  */
> --#define	PF_AX25		3	/* Amateur Radio AX.25.  */
> --#define	PF_IPX		4	/* Novell Internet Protocol.  */
> --#define	PF_APPLETALK	5	/* Appletalk DDP.  */
> --#define	PF_NETROM	6	/* Amateur radio NetROM.  */
> --#define	PF_BRIDGE	7	/* Multiprotocol bridge.  */
> --#define	PF_ATMPVC	8	/* ATM PVCs.  */
> --#define	PF_X25		9	/* Reserved for X.25 project.  */
> --#define	PF_INET6	10	/* IP version 6.  */
> --#define	PF_ROSE		11	/* Amateur Radio X.25 PLP.  */
> --#define	PF_DECnet	12	/* Reserved for DECnet project.  */
> --#define	PF_NETBEUI	13	/* Reserved for 802.2LLC project.  */
> --#define	PF_SECURITY	14	/* Security callback pseudo AF.  */
> --#define	PF_KEY		15	/* PF_KEY key management API.  */
> --#define	PF_NETLINK	16
> --#define	PF_ROUTE	PF_NETLINK /* Alias to emulate 4.4BSD.  */
> --#define	PF_PACKET	17	/* Packet family.  */
> --#define	PF_ASH		18	/* Ash.  */
> --#define	PF_ECONET	19	/* Acorn Econet.  */
> --#define	PF_ATMSVC	20	/* ATM SVCs.  */
> --#define	PF_SNA		22	/* Linux SNA Project */
> --#define	PF_IRDA		23	/* IRDA sockets.  */
> --#define	PF_PPPOX	24	/* PPPoX sockets.  */
> --#define	PF_WANPIPE	25	/* Wanpipe API sockets.  */
> --#define	PF_LLC		26	/* Linux LLC.  */
> --#define	PF_CAN		29	/* Controller Area Network.  */
> --#define	PF_TIPC		30	/* TIPC sockets.  */
> --#define	PF_BLUETOOTH	31	/* Bluetooth sockets.  */
> --#define	PF_IUCV		32	/* IUCV sockets.  */
> --#define	PF_RXRPC	33	/* RxRPC sockets.  */
> --#define	PF_ISDN		34	/* mISDN sockets.  */
> --#define	PF_PHONET	35	/* Phonet sockets.  */
> --#define	PF_IEEE802154	36	/* IEEE 802.15.4 sockets.  */
> --#define	PF_CAIF		37	/* CAIF sockets.  */
> --#define	PF_ALG		38	/* Algorithm sockets.  */
> --#define	PF_MAX		39	/* For now..  */
> --
> --/* Address families.  */
> --#define	AF_UNSPEC	PF_UNSPEC
> --#define	AF_LOCAL	PF_LOCAL
> --#define	AF_UNIX		PF_UNIX
> --#define	AF_FILE		PF_FILE
> --#define	AF_INET		PF_INET
> --#define	AF_AX25		PF_AX25
> --#define	AF_IPX		PF_IPX
> --#define	AF_APPLETALK	PF_APPLETALK
> --#define	AF_NETROM	PF_NETROM
> --#define	AF_BRIDGE	PF_BRIDGE
> --#define	AF_ATMPVC	PF_ATMPVC
> --#define	AF_X25		PF_X25
> --#define	AF_INET6	PF_INET6
> --#define	AF_ROSE		PF_ROSE
> --#define	AF_DECnet	PF_DECnet
> --#define	AF_NETBEUI	PF_NETBEUI
> --#define	AF_SECURITY	PF_SECURITY
> --#define	AF_KEY		PF_KEY
> --#define	AF_NETLINK	PF_NETLINK
> --#define	AF_ROUTE	PF_ROUTE
> --#define	AF_PACKET	PF_PACKET
> --#define	AF_ASH		PF_ASH
> --#define	AF_ECONET	PF_ECONET
> --#define	AF_ATMSVC	PF_ATMSVC
> --#define	AF_SNA		PF_SNA
> --#define	AF_IRDA		PF_IRDA
> --#define	AF_PPPOX	PF_PPPOX
> --#define	AF_WANPIPE	PF_WANPIPE
> --#define	AF_LLC		PF_LLC
> --#define	AF_CAN		PF_CAN
> --#define	AF_TIPC		PF_TIPC
> --#define	AF_BLUETOOTH	PF_BLUETOOTH
> --#define	AF_IUCV		PF_IUCV
> --#define	AF_RXRPC	PF_RXRPC
> --#define	AF_ISDN		PF_ISDN
> --#define	AF_PHONET	PF_PHONET
> --#define	AF_IEEE802154	PF_IEEE802154
> --#define	AF_CAIF		PF_CAIF
> --#define	AF_ALG		PF_ALG
> --#define	AF_MAX		PF_MAX
> --
> --/* Socket level values.  Others are defined in the appropriate headers.
> --
> --   XXX These definitions also should go into the appropriate headers as
> --   far as they are available.  */
> --#define SOL_RAW		255
> --#define SOL_DECNET      261
> --#define SOL_X25         262
> --#define SOL_PACKET	263
> --#define SOL_ATM		264	/* ATM layer (cell level).  */
> --#define SOL_AAL		265	/* ATM Adaption Layer (packet level).  */
> --#define SOL_IRDA	266
> --
> --/* Maximum queue length specifiable by listen.  */
> --#define SOMAXCONN	128
> --
> --/* Get the definition of the macro to define the common sockaddr members.  */
> --#include <bits/sockaddr.h>
> --
> --/* Structure describing a generic socket address.  */
> --struct sockaddr
> --  {
> --    __SOCKADDR_COMMON (sa_);	/* Common data: address family and length.  */
> --    char sa_data[14];		/* Address data.  */
> --  };
> --
> --
> --/* Structure large enough to hold any socket address (with the historical
> --   exception of AF_UNIX).  We reserve 128 bytes.  */
> --#define __ss_aligntype	unsigned long int
> --#define _SS_SIZE	128
> --#define _SS_PADSIZE	(_SS_SIZE - (2 * sizeof (__ss_aligntype)))
> --
> --struct sockaddr_storage
> --  {
> --    __SOCKADDR_COMMON (ss_);	/* Address family, etc.  */
> --    __ss_aligntype __ss_align;	/* Force desired alignment.  */
> --    char __ss_padding[_SS_PADSIZE];
> --  };
> --
> --
> --/* Bits in the FLAGS argument to `send', `recv', et al.  */
> --enum
> --  {
> --    MSG_OOB		= 0x01,	/* Process out-of-band data.  */
> --#define MSG_OOB		MSG_OOB
> --    MSG_PEEK		= 0x02,	/* Peek at incoming messages.  */
> --#define MSG_PEEK	MSG_PEEK
> --    MSG_DONTROUTE	= 0x04,	/* Don't use local routing.  */
> --#define MSG_DONTROUTE	MSG_DONTROUTE
> --#ifdef __USE_GNU
> --    /* DECnet uses a different name.  */
> --    MSG_TRYHARD		= MSG_DONTROUTE,
> --# define MSG_TRYHARD	MSG_DONTROUTE
> --#endif
> --    MSG_CTRUNC		= 0x08,	/* Control data lost before delivery.  */
> --#define MSG_CTRUNC	MSG_CTRUNC
> --    MSG_PROXY		= 0x10,	/* Supply or ask second address.  */
> --#define MSG_PROXY	MSG_PROXY
> --    MSG_TRUNC		= 0x20,
> --#define	MSG_TRUNC	MSG_TRUNC
> --    MSG_DONTWAIT	= 0x40, /* Nonblocking IO.  */
> --#define	MSG_DONTWAIT	MSG_DONTWAIT
> --    MSG_EOR		= 0x80, /* End of record.  */
> --#define	MSG_EOR		MSG_EOR
> --    MSG_WAITALL		= 0x100, /* Wait for a full request.  */
> --#define	MSG_WAITALL	MSG_WAITALL
> --    MSG_FIN		= 0x200,
> --#define	MSG_FIN		MSG_FIN
> --    MSG_SYN		= 0x400,
> --#define	MSG_SYN		MSG_SYN
> --    MSG_CONFIRM		= 0x800, /* Confirm path validity.  */
> --#define	MSG_CONFIRM	MSG_CONFIRM
> --    MSG_RST		= 0x1000,
> --#define	MSG_RST		MSG_RST
> --    MSG_ERRQUEUE	= 0x2000, /* Fetch message from error queue.  */
> --#define	MSG_ERRQUEUE	MSG_ERRQUEUE
> --    MSG_NOSIGNAL	= 0x4000, /* Do not generate SIGPIPE.  */
> --#define	MSG_NOSIGNAL	MSG_NOSIGNAL
> --    MSG_MORE		= 0x8000, /* Sender will send more.  */
> --#define	MSG_MORE	MSG_MORE
> --    MSG_WAITFORONE      = 0x10000, /* Wait for at least one packet to return.*/
> --#define MSG_WAITFORONE  MSG_WAITFORONE
> --
> --    MSG_CMSG_CLOEXEC    = 0x40000000    /* Set close_on_exit for file
> --					   descriptor received through
> --					   SCM_RIGHTS.  */
> --#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
> --  };
> --
> --
> --/* Structure describing messages sent by
> --   `sendmsg' and received by `recvmsg'.  */
> --/* Note: do not change these members to match glibc; these match the
> --   SuSv3 spec already (e.g. msg_iovlen/msg_controllen).
> --   http://www.opengroup.org/onlinepubs/009695399/basedefs/sys/socket.h.html */
> --/* Note: linux kernel uses __kernel_size_t (which is 8bytes on 64bit
> --   platforms, and 4bytes on 32bit platforms) for msg_iovlen/msg_controllen */
> --struct msghdr
> --  {
> --    void *msg_name;		/* Address to send to/receive from.  */
> --    socklen_t msg_namelen;	/* Length of address data.  */
> --
> --    struct iovec *msg_iov;	/* Vector of data to send/receive into.  */
> --#if __WORDSIZE == 32
> --    int msg_iovlen;		/* Number of elements in the vector.  */
> --#else
> --    size_t msg_iovlen;		/* Number of elements in the vector.  */
> --#endif
> --
> --    void *msg_control;		/* Ancillary data (eg BSD filedesc passing). */
> --#if __WORDSIZE == 32
> --    socklen_t msg_controllen;	/* Ancillary data buffer length.  */
> --#else
> --    size_t msg_controllen;	/* Ancillary data buffer length.  */
> --#endif
> --
> --    int msg_flags;		/* Flags on received message.  */
> --  };
> --
> --/* Structure used for storage of ancillary data object information.  */
> --struct cmsghdr
> --  {
> --    size_t cmsg_len;		/* Length of data in cmsg_data plus length
> --				   of cmsghdr structure.  */
> --    int cmsg_level;		/* Originating protocol.  */
> --    int cmsg_type;		/* Protocol specific type.  */
> --#if (!defined __STRICT_ANSI__ && __GNUC__ >= 2) || __STDC_VERSION__ >= 199901L
> --    __extension__ unsigned char __cmsg_data __flexarr; /* Ancillary data.  */
> --#endif
> --  };
> --
> --/* Ancillary data object manipulation macros.  */
> --#if (!defined __STRICT_ANSI__ && __GNUC__ >= 2) || __STDC_VERSION__ >= 199901L
> --# define CMSG_DATA(cmsg) ((cmsg)->__cmsg_data)
> --#else
> --# define CMSG_DATA(cmsg) ((unsigned char *) ((struct cmsghdr *) (cmsg) + 1))
> --#endif
> --#define CMSG_NXTHDR(mhdr, cmsg) __cmsg_nxthdr (mhdr, cmsg)
> --#define CMSG_FIRSTHDR(mhdr) \
> --  ((size_t) (mhdr)->msg_controllen >= sizeof (struct cmsghdr)		      \
> --   ? (struct cmsghdr *) (mhdr)->msg_control : (struct cmsghdr *) NULL)
> --#define CMSG_ALIGN(len) (((len) + sizeof (size_t) - 1) \
> --			 & (size_t) ~(sizeof (size_t) - 1))
> --#define CMSG_SPACE(len) (CMSG_ALIGN (len) \
> --			 + CMSG_ALIGN (sizeof (struct cmsghdr)))
> --#define CMSG_LEN(len)   (CMSG_ALIGN (sizeof (struct cmsghdr)) + (len))
> --
> --extern struct cmsghdr *__cmsg_nxthdr (struct msghdr *__mhdr,
> --				      struct cmsghdr *__cmsg) __THROW;
> --libc_hidden_proto(__cmsg_nxthdr)
> --#ifdef __USE_EXTERN_INLINES
> --# ifndef _EXTERN_INLINE
> --#  define _EXTERN_INLINE extern __inline
> --# endif
> --_EXTERN_INLINE struct cmsghdr *
> --__NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
> --{
> --  if ((size_t) __cmsg->cmsg_len < sizeof (struct cmsghdr))
> --    /* The kernel header does this so there may be a reason.  */
> --    return 0;
> --
> --  __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
> --			       + CMSG_ALIGN (__cmsg->cmsg_len));
> --  if ((unsigned char *) (__cmsg + 1) > ((unsigned char *) __mhdr->msg_control
> --					+ __mhdr->msg_controllen)
> --      || ((unsigned char *) __cmsg + CMSG_ALIGN (__cmsg->cmsg_len)
> --	  > ((unsigned char *) __mhdr->msg_control + __mhdr->msg_controllen)))
> --    /* No more entries.  */
> --    return 0;
> --  return __cmsg;
> --}
> --#endif	/* Use `extern inline'.  */
> --
> --/* Socket level message types.  This must match the definitions in
> --   <linux/socket.h>.  */
> --enum
> --  {
> --    SCM_RIGHTS = 0x01		/* Transfer file descriptors.  */
> --#define SCM_RIGHTS SCM_RIGHTS
> --#ifdef __USE_BSD
> --    , SCM_CREDENTIALS = 0x02	/* Credentials passing.  */
> --# define SCM_CREDENTIALS SCM_CREDENTIALS
> --#endif
> --  };
> --
> --/* User visible structure for SCM_CREDENTIALS message */
> --
> --struct ucred
> --{
> --  pid_t pid;			/* PID of sending process.  */
> --  uid_t uid;			/* UID of sending process.  */
> --  gid_t gid;			/* GID of sending process.  */
> --};
> --
> --/* Get socket manipulation related informations from kernel headers.  */
> --#ifndef __GLIBC__
> --#define __GLIBC__ 2
> --#include <asm/socket.h>
> --#undef __GLIBC__
> --#else
> --#include <asm/socket.h>
> --#endif
> --
> --
> --/* Structure used to manipulate the SO_LINGER option.  */
> --struct linger
> --  {
> --    int l_onoff;		/* Nonzero to linger on close.  */
> --    int l_linger;		/* Time to linger.  */
> --  };
> --
> --#endif	/* bits/socket.h */
> -diff --git a/libc/sysdeps/linux/mips/bits/socket_type.h b/libc/sysdeps/linux/mips/bits/socket_type.h
> -new file mode 100644
> -index 0000000..20d2732
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/mips/bits/socket_type.h
> -@@ -0,0 +1,55 @@
> -+/* System-specific socket constants and types.  Linux/MIPS version.
> -+   Copyright (C) 1991, 92, 1994-1999, 2000, 2001, 2004, 2005, 2006
> -+   Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef _SYS_SOCKET_H
> -+# error "Never include <bits/socket_type.h> directly; use <sys/socket.h> instead."
> -+#endif
> -+
> -+/* Types of sockets.  */
> -+enum __socket_type
> -+{
> -+  SOCK_DGRAM = 1,		/* Connectionless, unreliable datagrams
> -+				   of fixed maximum length.  */
> -+#define SOCK_DGRAM SOCK_DGRAM
> -+  SOCK_STREAM = 2,		/* Sequenced, reliable, connection-based
> -+				   byte streams.  */
> -+#define SOCK_STREAM SOCK_STREAM
> -+  SOCK_RAW = 3,			/* Raw protocol interface.  */
> -+#define SOCK_RAW SOCK_RAW
> -+  SOCK_RDM = 4,			/* Reliably-delivered messages.  */
> -+#define SOCK_RDM SOCK_RDM
> -+  SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
> -+				   datagrams of fixed maximum length.  */
> -+#define SOCK_SEQPACKET SOCK_SEQPACKET
> -+  SOCK_DCCP = 6,
> -+#define SOCK_DCCP SOCK_DCCP	/* Datagram Congestion Control Protocol.  */
> -+  SOCK_PACKET = 10,		/* Linux specific way of getting packets
> -+				   at the dev level.  For writing rarp and
> -+				   other similar things on the user level. */
> -+#define SOCK_PACKET SOCK_PACKET
> -+
> -+  /* Flags to be ORed into the type parameter of socket and socketpair.  */
> -+
> -+  SOCK_CLOEXEC = 02000000,	/* Atomically set close-on-exec flag for the
> -+				   new descriptor(s).  */
> -+#define SOCK_CLOEXEC SOCK_CLOEXEC
> -+  SOCK_NONBLOCK = 00000200	/* Atomically mark descriptor(s) as
> -+				   non-blocking.  */
> -+#define SOCK_NONBLOCK SOCK_NONBLOCK
> -+};
> -diff --git a/libc/sysdeps/linux/sparc/bits/socket.h b/libc/sysdeps/linux/sparc/bits/socket.h
> -deleted file mode 100644
> -index 64973e2..0000000
> ---- a/libc/sysdeps/linux/sparc/bits/socket.h
> -+++ /dev/null
> -@@ -1,376 +0,0 @@
> --/* System-specific socket constants and types.  Linux version.
> --   Copyright (C) 1991,1992,1994-2001,2004,2006 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#ifndef __BITS_SOCKET_H
> --#define __BITS_SOCKET_H
> --
> --#if !defined _SYS_SOCKET_H && !defined _NETINET_IN_H
> --# error "Never include <bits/socket.h> directly; use <sys/socket.h> instead."
> --#endif
> --
> --#define	__need_size_t
> --#define __need_NULL
> --#include <stddef.h>
> --
> --#include <limits.h>
> --#include <sys/types.h>
> --
> --/* Type for length arguments in socket calls.  */
> --#ifndef __socklen_t_defined
> --typedef __socklen_t socklen_t;
> --# define __socklen_t_defined
> --#endif
> --
> --/* Types of sockets.  */
> --enum __socket_type
> --{
> --  SOCK_STREAM = 1,		/* Sequenced, reliable, connection-based
> --				   byte streams.  */
> --#define SOCK_STREAM SOCK_STREAM
> --  SOCK_DGRAM = 2,		/* Connectionless, unreliable datagrams
> --				   of fixed maximum length.  */
> --#define SOCK_DGRAM SOCK_DGRAM
> --  SOCK_RAW = 3,			/* Raw protocol interface.  */
> --#define SOCK_RAW SOCK_RAW
> --  SOCK_RDM = 4,			/* Reliably-delivered messages.  */
> --#define SOCK_RDM SOCK_RDM
> --  SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
> --				   datagrams of fixed maximum length.  */
> --#define SOCK_SEQPACKET SOCK_SEQPACKET
> --  SOCK_PACKET = 10		/* Linux specific way of getting packets
> --				   at the dev level.  For writing rarp and
> --				   other similar things on the user level. */
> --#define SOCK_PACKET SOCK_PACKET
> --};
> --
> --/* Protocol families.  */
> --#define	PF_UNSPEC	0	/* Unspecified.  */
> --#define	PF_LOCAL	1	/* Local to host (pipes and file-domain).  */
> --#define	PF_UNIX		PF_LOCAL /* Old BSD name for PF_LOCAL.  */
> --#define	PF_FILE		PF_LOCAL /* Another non-standard name for PF_LOCAL.  */
> --#define	PF_INET		2	/* IP protocol family.  */
> --#define	PF_AX25		3	/* Amateur Radio AX.25.  */
> --#define	PF_IPX		4	/* Novell Internet Protocol.  */
> --#define	PF_APPLETALK	5	/* Appletalk DDP.  */
> --#define	PF_NETROM	6	/* Amateur radio NetROM.  */
> --#define	PF_BRIDGE	7	/* Multiprotocol bridge.  */
> --#define	PF_ATMPVC	8	/* ATM PVCs.  */
> --#define	PF_X25		9	/* Reserved for X.25 project.  */
> --#define	PF_INET6	10	/* IP version 6.  */
> --#define	PF_ROSE		11	/* Amateur Radio X.25 PLP.  */
> --#define	PF_DECnet	12	/* Reserved for DECnet project.  */
> --#define	PF_NETBEUI	13	/* Reserved for 802.2LLC project.  */
> --#define	PF_SECURITY	14	/* Security callback pseudo AF.  */
> --#define	PF_KEY		15	/* PF_KEY key management API.  */
> --#define	PF_NETLINK	16
> --#define	PF_ROUTE	PF_NETLINK /* Alias to emulate 4.4BSD.  */
> --#define	PF_PACKET	17	/* Packet family.  */
> --#define	PF_ASH		18	/* Ash.  */
> --#define	PF_ECONET	19	/* Acorn Econet.  */
> --#define	PF_ATMSVC	20	/* ATM SVCs.  */
> --#define	PF_SNA		22	/* Linux SNA Project */
> --#define	PF_IRDA		23	/* IRDA sockets.  */
> --#define	PF_PPPOX	24	/* PPPoX sockets.  */
> --#define	PF_WANPIPE	25	/* Wanpipe API sockets.  */
> --#define	PF_LLC		26	/* Linux LLC.  */
> --#define	PF_CAN		29	/* Controller Area Network.  */
> --#define	PF_TIPC		30	/* TIPC sockets.  */
> --#define	PF_BLUETOOTH	31	/* Bluetooth sockets.  */
> --#define	PF_IUCV		32	/* IUCV sockets.  */
> --#define	PF_RXRPC	33	/* RxRPC sockets.  */
> --#define	PF_ISDN		34	/* mISDN sockets.  */
> --#define	PF_PHONET	35	/* Phonet sockets.  */
> --#define	PF_IEEE802154	36	/* IEEE 802.15.4 sockets.  */
> --#define	PF_CAIF		37	/* CAIF sockets.  */
> --#define	PF_ALG		38	/* Algorithm sockets.  */
> --#define	PF_MAX		39	/* For now..  */
> --
> --/* Address families.  */
> --#define	AF_UNSPEC	PF_UNSPEC
> --#define	AF_LOCAL	PF_LOCAL
> --#define	AF_UNIX		PF_UNIX
> --#define	AF_FILE		PF_FILE
> --#define	AF_INET		PF_INET
> --#define	AF_AX25		PF_AX25
> --#define	AF_IPX		PF_IPX
> --#define	AF_APPLETALK	PF_APPLETALK
> --#define	AF_NETROM	PF_NETROM
> --#define	AF_BRIDGE	PF_BRIDGE
> --#define	AF_ATMPVC	PF_ATMPVC
> --#define	AF_X25		PF_X25
> --#define	AF_INET6	PF_INET6
> --#define	AF_ROSE		PF_ROSE
> --#define	AF_DECnet	PF_DECnet
> --#define	AF_NETBEUI	PF_NETBEUI
> --#define	AF_SECURITY	PF_SECURITY
> --#define	AF_KEY		PF_KEY
> --#define	AF_NETLINK	PF_NETLINK
> --#define	AF_ROUTE	PF_ROUTE
> --#define	AF_PACKET	PF_PACKET
> --#define	AF_ASH		PF_ASH
> --#define	AF_ECONET	PF_ECONET
> --#define	AF_ATMSVC	PF_ATMSVC
> --#define	AF_SNA		PF_SNA
> --#define	AF_IRDA		PF_IRDA
> --#define	AF_PPPOX	PF_PPPOX
> --#define	AF_WANPIPE	PF_WANPIPE
> --#define	AF_LLC		PF_LLC
> --#define	AF_CAN		PF_CAN
> --#define	AF_TIPC		PF_TIPC
> --#define	AF_BLUETOOTH	PF_BLUETOOTH
> --#define	AF_IUCV		PF_IUCV
> --#define	AF_RXRPC	PF_RXRPC
> --#define	AF_ISDN		PF_ISDN
> --#define	AF_PHONET	PF_PHONET
> --#define	AF_IEEE802154	PF_IEEE802154
> --#define	AF_CAIF		PF_CAIF
> --#define	AF_ALG		PF_ALG
> --#define	AF_MAX		PF_MAX
> --
> --/* Socket level values.  Others are defined in the appropriate headers.
> --
> --   XXX These definitions also should go into the appropriate headers as
> --   far as they are available.  */
> --#define SOL_RAW		255
> --#define SOL_DECNET      261
> --#define SOL_X25         262
> --#define SOL_PACKET	263
> --#define SOL_ATM		264	/* ATM layer (cell level).  */
> --#define SOL_AAL		265	/* ATM Adaption Layer (packet level).  */
> --#define SOL_IRDA	266
> --
> --/* Maximum queue length specifiable by listen.  */
> --#define SOMAXCONN	128
> --
> --/* Get the definition of the macro to define the common sockaddr members.  */
> --#include <bits/sockaddr.h>
> --
> --/* Structure describing a generic socket address.  */
> --struct sockaddr
> --  {
> --    __SOCKADDR_COMMON (sa_);	/* Common data: address family and length.  */
> --    char sa_data[14];		/* Address data.  */
> --  };
> --
> --
> --/* Structure large enough to hold any socket address (with the historical
> --   exception of AF_UNIX).  We reserve 128 bytes.  */
> --#if ULONG_MAX > 0xffffffff
> --# define __ss_aligntype	__uint64_t
> --#else
> --# define __ss_aligntype	__uint32_t
> --#endif
> --#define _SS_SIZE	128
> --#define _SS_PADSIZE	(_SS_SIZE - (2 * sizeof (__ss_aligntype)))
> --
> --struct sockaddr_storage
> --  {
> --    __SOCKADDR_COMMON (ss_);	/* Address family, etc.  */
> --    __ss_aligntype __ss_align;	/* Force desired alignment.  */
> --    char __ss_padding[_SS_PADSIZE];
> --  };
> --
> --
> --/* Bits in the FLAGS argument to `send', `recv', et al.  */
> --enum
> --  {
> --    MSG_OOB		= 0x01,	/* Process out-of-band data.  */
> --#define MSG_OOB		MSG_OOB
> --    MSG_PEEK		= 0x02,	/* Peek at incoming messages.  */
> --#define MSG_PEEK	MSG_PEEK
> --    MSG_DONTROUTE	= 0x04,	/* Don't use local routing.  */
> --#define MSG_DONTROUTE	MSG_DONTROUTE
> --#ifdef __USE_GNU
> --    /* DECnet uses a different name.  */
> --    MSG_TRYHARD		= MSG_DONTROUTE,
> --# define MSG_TRYHARD	MSG_DONTROUTE
> --#endif
> --    MSG_CTRUNC		= 0x08,	/* Control data lost before delivery.  */
> --#define MSG_CTRUNC	MSG_CTRUNC
> --    MSG_PROXY		= 0x10,	/* Supply or ask second address.  */
> --#define MSG_PROXY	MSG_PROXY
> --    MSG_TRUNC		= 0x20,
> --#define	MSG_TRUNC	MSG_TRUNC
> --    MSG_DONTWAIT	= 0x40, /* Nonblocking IO.  */
> --#define	MSG_DONTWAIT	MSG_DONTWAIT
> --    MSG_EOR		= 0x80, /* End of record.  */
> --#define	MSG_EOR		MSG_EOR
> --    MSG_WAITALL		= 0x100, /* Wait for a full request.  */
> --#define	MSG_WAITALL	MSG_WAITALL
> --    MSG_FIN		= 0x200,
> --#define	MSG_FIN		MSG_FIN
> --    MSG_SYN		= 0x400,
> --#define	MSG_SYN		MSG_SYN
> --    MSG_CONFIRM		= 0x800, /* Confirm path validity.  */
> --#define	MSG_CONFIRM	MSG_CONFIRM
> --    MSG_RST		= 0x1000,
> --#define	MSG_RST		MSG_RST
> --    MSG_ERRQUEUE	= 0x2000, /* Fetch message from error queue.  */
> --#define	MSG_ERRQUEUE	MSG_ERRQUEUE
> --    MSG_NOSIGNAL	= 0x4000, /* Do not generate SIGPIPE.  */
> --#define	MSG_NOSIGNAL	MSG_NOSIGNAL
> --    MSG_MORE		= 0x8000  /* Sender will send more.  */
> --#define	MSG_MORE	MSG_MORE
> --  };
> --
> --
> --/* Structure describing messages sent by
> --   `sendmsg' and received by `recvmsg'.  */
> --/* Note: do not change these members to match glibc; these match the
> --   SuSv3 spec already (e.g. msg_iovlen/msg_controllen).
> --   http://www.opengroup.org/onlinepubs/009695399/basedefs/sys/socket.h.html */
> --/* Note: linux kernel uses __kernel_size_t (which is 8bytes on 64bit
> --   platforms, and 4bytes on 32bit platforms) for msg_iovlen/msg_controllen */
> --struct msghdr
> --  {
> --    void *msg_name;		/* Address to send to/receive from.  */
> --    socklen_t msg_namelen;	/* Length of address data.  */
> --
> --    struct iovec *msg_iov;	/* Vector of data to send/receive into.  */
> --#if __WORDSIZE == 32
> --    int msg_iovlen;		/* Number of elements in the vector.  */
> --#else
> --    size_t msg_iovlen;		/* Number of elements in the vector.  */
> --#endif
> --
> --    void *msg_control;		/* Ancillary data (eg BSD filedesc passing). */
> --#if __WORDSIZE == 32
> --    socklen_t msg_controllen;	/* Ancillary data buffer length.  */
> --#else
> --    size_t msg_controllen;	/* Ancillary data buffer length.  */
> --#endif
> --
> --    int msg_flags;		/* Flags on received message.  */
> --  };
> --
> --/* Structure used for storage of ancillary data object information.  */
> --struct cmsghdr
> --  {
> --    size_t cmsg_len;		/* Length of data in cmsg_data plus length
> --				   of cmsghdr structure.  */
> --    int cmsg_level;		/* Originating protocol.  */
> --    int cmsg_type;		/* Protocol specific type.  */
> --#if (!defined __STRICT_ANSI__ && __GNUC__ >= 2) || __STDC_VERSION__ >= 199901L
> --    __extension__ unsigned char __cmsg_data __flexarr; /* Ancillary data.  */
> --#endif
> --  };
> --
> --/* Ancillary data object manipulation macros.  */
> --#if (!defined __STRICT_ANSI__ && __GNUC__ >= 2) || __STDC_VERSION__ >= 199901L
> --# define CMSG_DATA(cmsg) ((cmsg)->__cmsg_data)
> --#else
> --# define CMSG_DATA(cmsg) ((unsigned char *) ((struct cmsghdr *) (cmsg) + 1))
> --#endif
> --#define CMSG_NXTHDR(mhdr, cmsg) __cmsg_nxthdr (mhdr, cmsg)
> --#define CMSG_FIRSTHDR(mhdr) \
> --  ((size_t) (mhdr)->msg_controllen >= sizeof (struct cmsghdr)		      \
> --   ? (struct cmsghdr *) (mhdr)->msg_control : (struct cmsghdr *) NULL)
> --#define CMSG_ALIGN(len) (((len) + sizeof (size_t) - 1) \
> --			 & (size_t) ~(sizeof (size_t) - 1))
> --#define CMSG_SPACE(len) (CMSG_ALIGN (len) \
> --			 + CMSG_ALIGN (sizeof (struct cmsghdr)))
> --#define CMSG_LEN(len)   (CMSG_ALIGN (sizeof (struct cmsghdr)) + (len))
> --
> --extern struct cmsghdr *__cmsg_nxthdr (struct msghdr *__mhdr,
> --				      struct cmsghdr *__cmsg) __THROW;
> --libc_hidden_proto(__cmsg_nxthdr)
> --#ifdef __USE_EXTERN_INLINES
> --# ifndef _EXTERN_INLINE
> --#  define _EXTERN_INLINE extern __inline
> --# endif
> --_EXTERN_INLINE struct cmsghdr *
> --__NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
> --{
> --  if ((size_t) __cmsg->cmsg_len < sizeof (struct cmsghdr))
> --    /* The kernel header does this so there may be a reason.  */
> --    return 0;
> --
> --  __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
> --			       + CMSG_ALIGN (__cmsg->cmsg_len));
> --  if ((unsigned char *) (__cmsg + 1) > ((unsigned char *) __mhdr->msg_control
> --					+ __mhdr->msg_controllen)
> --      || ((unsigned char *) __cmsg + CMSG_ALIGN (__cmsg->cmsg_len)
> --	  > ((unsigned char *) __mhdr->msg_control + __mhdr->msg_controllen)))
> --    /* No more entries.  */
> --    return 0;
> --  return __cmsg;
> --}
> --#endif	/* Use `extern inline'.  */
> --
> --/* Socket level message types.  This must match the definitions in
> --   <linux/socket.h>.  */
> --enum
> --  {
> --    SCM_RIGHTS = 0x01		/* Transfer file descriptors.  */
> --#define SCM_RIGHTS SCM_RIGHTS
> --#ifdef __USE_BSD
> --    , SCM_CREDENTIALS = 0x02	/* Credentials passing.  */
> --# define SCM_CREDENTIALS SCM_CREDENTIALS
> --#endif
> --  };
> --
> --/* User visible structure for SCM_CREDENTIALS message */
> --
> --struct ucred
> --{
> --  pid_t pid;			/* PID of sending process.  */
> --  uid_t uid;			/* UID of sending process.  */
> --  gid_t gid;			/* GID of sending process.  */
> --};
> --
> --/* Get socket manipulation related informations from kernel headers.  */
> --#ifndef __GLIBC__
> --#define __GLIBC__ 2
> --#include <asm/socket.h>
> --#undef __GLIBC__
> --#else
> --#include <asm/socket.h>
> --#endif
> --
> --
> --/* Structure used to manipulate the SO_LINGER option.  */
> --struct linger
> --  {
> --    int l_onoff;		/* Nonzero to linger on close.  */
> --    int l_linger;		/* Time to linger.  */
> --  };
> --
> --/* Prefer socketcall over all these for sparc32, 
> --   since it only has socketcall */
> --#ifndef __arch64__
> -- #undef __NR_accept
> -- #undef __NR_bind
> -- #undef __NR_connect
> -- #undef __NR_getpeername
> -- #undef __NR_getsockname
> -- #undef __NR_getsockopt
> -- #undef __NR_listen
> -- #undef __NR_recv
> -- #undef __NR_recvfrom
> -- #undef __NR_recvmsg
> -- #undef __NR_send
> -- #undef __NR_sendmsg
> -- #undef __NR_sendto
> -- #undef __NR_setsockopt
> -- #undef __NR_shutdown
> -- #undef __NR_socket
> -- #undef __NR_socketpair
> --#endif
> --
> --#endif	/* bits/socket.h */
> -diff --git a/libc/sysdeps/linux/sparc/bits/socket_type.h b/libc/sysdeps/linux/sparc/bits/socket_type.h
> -new file mode 100644
> -index 0000000..494655f
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/sparc/bits/socket_type.h
> -@@ -0,0 +1,54 @@
> -+/* System-specific socket constants and types.  Linux version.
> -+   Copyright (C) 1991,1992,1994-2001,2004,2006 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef _SYS_SOCKET_H
> -+# error "Never include <bits/socket_type.h> directly; use <sys/socket.h> instead."
> -+#endif
> -+
> -+/* Types of sockets.  */
> -+enum __socket_type
> -+{
> -+  SOCK_STREAM = 1,		/* Sequenced, reliable, connection-based
> -+				   byte streams.  */
> -+#define SOCK_STREAM SOCK_STREAM
> -+  SOCK_DGRAM = 2,		/* Connectionless, unreliable datagrams
> -+				   of fixed maximum length.  */
> -+#define SOCK_DGRAM SOCK_DGRAM
> -+  SOCK_RAW = 3,			/* Raw protocol interface.  */
> -+#define SOCK_RAW SOCK_RAW
> -+  SOCK_RDM = 4,			/* Reliably-delivered messages.  */
> -+#define SOCK_RDM SOCK_RDM
> -+  SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
> -+				   datagrams of fixed maximum length.  */
> -+#define SOCK_SEQPACKET SOCK_SEQPACKET
> -+  SOCK_DCCP = 6,		/* Datagram Congestion Control Protocol.  */
> -+#define SOCK_DCCP SOCK_DCCP
> -+  SOCK_PACKET = 10,		/* Linux specific way of getting packets
> -+				   at the dev level.  For writing rarp and
> -+				   other similar things on the user level. */
> -+#define SOCK_PACKET SOCK_PACKET
> -+
> -+  /* Flags to be ORed into the type parameter of socket and socketpair.  */
> -+
> -+  SOCK_CLOEXEC = 0x400000,	/* Atomically set close-on-exec flag for the
> -+				   new descriptor(s).  */
> -+#define SOCK_CLOEXEC SOCK_CLOEXEC
> -+  SOCK_NONBLOCK = 0x004000	/* Atomically mark descriptor(s) as
> -+				   non-blocking.  */
> -+#define SOCK_NONBLOCK SOCK_NONBLOCK
> -+};
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0036-mount.h-update.patch b/package/uclibc/0.9.33.2/0036-mount.h-update.patch
> deleted file mode 100644
> index 4c9826c..0000000
> --- a/package/uclibc/0.9.33.2/0036-mount.h-update.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -From 641a5356a021f90ee922229bd8e1aa6eafe152bc Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Fri, 18 Jan 2013 11:12:49 +0100
> -Subject: [PATCH] mount.h: update
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - include/sys/mount.h |   45 +++++++++++++++++++++++++++++++++++----------
> - 1 file changed, 35 insertions(+), 10 deletions(-)
> -
> -diff --git a/include/sys/mount.h b/include/sys/mount.h
> -index 57d440f..9eecc5a 100644
> ---- a/include/sys/mount.h
> -+++ b/include/sys/mount.h
> -@@ -1,5 +1,5 @@
> - /* Header file for mounting/unmount Linux filesystems.
> --   Copyright (C) 1996,1997,1998,1999,2000,2004 Free Software Foundation, Inc.
> -+   Copyright (C) 1996-2000, 2004, 2010, 2012 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> - 
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -47,23 +47,46 @@ enum
> - #define MS_REMOUNT	MS_REMOUNT
> -   MS_MANDLOCK = 64,		/* Allow mandatory locks on an FS.  */
> - #define MS_MANDLOCK	MS_MANDLOCK
> --  S_WRITE = 128,		/* Write on file/directory/symlink.  */
> --#define S_WRITE		S_WRITE
> --  S_APPEND = 256,		/* Append-only file.  */
> --#define S_APPEND	S_APPEND
> --  S_IMMUTABLE = 512,		/* Immutable file.  */
> --#define S_IMMUTABLE	S_IMMUTABLE
> -+  MS_DIRSYNC = 128,		/* Directory modifications are synchronous.  */
> -+#define MS_DIRSYNC	MS_DIRSYNC
> -   MS_NOATIME = 1024,		/* Do not update access times.  */
> - #define MS_NOATIME	MS_NOATIME
> -   MS_NODIRATIME = 2048,		/* Do not update directory access times.  */
> - #define MS_NODIRATIME	MS_NODIRATIME
> -   MS_BIND = 4096,		/* Bind directory at different place.  */
> - #define MS_BIND		MS_BIND
> -+  MS_MOVE = 8192,
> -+#define MS_MOVE		MS_MOVE
> -+  MS_REC = 16384,
> -+#define MS_REC		MS_REC
> -+  MS_SILENT = 32768,
> -+#define MS_SILENT	MS_SILENT
> -+  MS_POSIXACL = 1 << 16,	/* VFS does not apply the umask.  */
> -+#define MS_POSIXACL	MS_POSIXACL
> -+  MS_UNBINDABLE = 1 << 17,	/* Change to unbindable.  */
> -+#define MS_UNBINDABLE	MS_UNBINDABLE
> -+  MS_PRIVATE = 1 << 18,		/* Change to private.  */
> -+#define MS_PRIVATE	MS_PRIVATE
> -+  MS_SLAVE = 1 << 19,		/* Change to slave.  */
> -+#define MS_SLAVE	MS_SLAVE
> -+  MS_SHARED = 1 << 20,		/* Change to shared.  */
> -+#define MS_SHARED	MS_SHARED
> -+  MS_RELATIME = 1 << 21,	/* Update atime relative to mtime/ctime.  */
> -+#define MS_RELATIME	MS_RELATIME
> -+  MS_KERNMOUNT = 1 << 22,	/* This is a kern_mount call.  */
> -+#define MS_KERNMOUNT	MS_KERNMOUNT
> -+  MS_I_VERSION =  1 << 23,	/* Update inode I_version field.  */
> -+#define MS_I_VERSION	MS_I_VERSION
> -+  MS_STRICTATIME = 1 << 24,	/* Always perform atime updates.  */
> -+#define MS_STRICTATIME	MS_STRICTATIME
> -+  MS_ACTIVE = 1 << 30,
> -+#define MS_ACTIVE	MS_ACTIVE
> -+  MS_NOUSER = 1 << 31
> -+#define MS_NOUSER	MS_NOUSER
> - };
> - 
> - /* Flags that can be altered by MS_REMOUNT  */
> --#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_NOATIME \
> --		     |MS_NODIRATIME)
> -+#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_I_VERSION)
> - 
> - 
> - /* Magic mount flag number. Has to be or-ed to the flag values.  */
> -@@ -100,8 +123,10 @@ enum
> - #define MNT_FORCE MNT_FORCE
> -   MNT_DETACH = 2,		/* Just detach from the tree.  */
> - #define MNT_DETACH MNT_DETACH
> --  MNT_EXPIRE = 4		/* Mark for expiry.  */
> -+  MNT_EXPIRE = 4,		/* Mark for expiry.  */
> - #define MNT_EXPIRE MNT_EXPIRE
> -+  UMOUNT_NOFOLLOW = 8		/* Don't follow symlink on umount.  */
> -+#define UMOUNT_NOFOLLOW UMOUNT_NOFOLLOW
> - };
> - 
> - 
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0037-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch b/package/uclibc/0.9.33.2/0037-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch
> deleted file mode 100644
> index c310725..0000000
> --- a/package/uclibc/0.9.33.2/0037-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 29411db7b6cf872e73b5560c46dd941f91e704cd Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Sat, 26 Jan 2013 14:13:12 -0500
> -Subject: [PATCH] buildsys: gen_bits_syscall_h: do not leave undefined SYS_xxx
> - around
> -
> -If we end up doing '#undef __NR_xxx', we don't want to leave the
> -corresponding SYS_xxx symbol defined.  So undef it too.
> -
> -For example, with the ARM EABI layer, we have a bunch of legacy
> -syscalls that we define early on and then later undefine (such
> -as __NR_utime).  But we left SYS_utime defined so code that tests
> -for that define before using it would be broken (since it'd be
> -defined to a non-existent symbol).
> -
> -URL: https://bugs.gentoo.org/425006
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - extra/scripts/gen_bits_syscall_h.sh |    3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/extra/scripts/gen_bits_syscall_h.sh b/extra/scripts/gen_bits_syscall_h.sh
> -index f6353ba..fd141f0 100755
> ---- a/extra/scripts/gen_bits_syscall_h.sh
> -+++ b/extra/scripts/gen_bits_syscall_h.sh
> -@@ -40,7 +40,8 @@ $CC -E $INCLUDE_OPTS - |
> -   sed -ne 's/^UCLIBC\(__ARM_NR_\|__NR_\)\([A-Za-z0-9_]*\) *\(.*\)/#undef \1\2\
> - #define \1\2 \3\
> - #define SYS_\2 \1\2/gp' \
> --     -e 's/^UNDEFUCLIBC\(__ARM_NR_\|__NR_\)\([A-Za-z0-9_]*\).*/#undef \1\2/gp'
> -+     -e 's/^UNDEFUCLIBC\(__ARM_NR_\|__NR_\)\([A-Za-z0-9_]*\).*/#undef \1\2\
> -+#undef SYS_\2/gp'
> -   echo ;
> -   echo "#endif" ;
> - )
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0038-libc-sysdeps-sync-bits-in.h-with-glibc.patch b/package/uclibc/0.9.33.2/0038-libc-sysdeps-sync-bits-in.h-with-glibc.patch
> deleted file mode 100644
> index 6f42468..0000000
> --- a/package/uclibc/0.9.33.2/0038-libc-sysdeps-sync-bits-in.h-with-glibc.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -From 4b7f3716b8678c9ff423445f41e6ffb47fd295cd Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Sat, 26 Jan 2013 17:40:24 -0500
> -Subject: [PATCH] libc/sysdeps: sync bits/in.h with glibc
> -
> -URL: https://bugs.busybox.net/show_bug.cgi?id=5888
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - libc/sysdeps/linux/common/bits/in.h |   61 +++++++++++++++++++++++------------
> - 1 file changed, 41 insertions(+), 20 deletions(-)
> -
> -diff --git a/libc/sysdeps/linux/common/bits/in.h b/libc/sysdeps/linux/common/bits/in.h
> -index 1f2b817..d9c5e2b 100644
> ---- a/libc/sysdeps/linux/common/bits/in.h
> -+++ b/libc/sysdeps/linux/common/bits/in.h
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 1991-1999, 2000, 2004 Free Software Foundation, Inc.
> -+/* Copyright (C) 1991-2013 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> - 
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -43,31 +43,49 @@
> - #define IP_ADD_SOURCE_MEMBERSHIP 39 /* ip_mreq_source: join source group */
> - #define IP_DROP_SOURCE_MEMBERSHIP 40 /* ip_mreq_source: leave source group */
> - #define IP_MSFILTER 41
> --#define MCAST_JOIN_GROUP 42	/* group_req: join any-source group */
> --#define MCAST_BLOCK_SOURCE 43	/* group_source_req: block from given group */
> --#define MCAST_UNBLOCK_SOURCE 44	/* group_source_req: unblock from given group*/
> --#define MCAST_LEAVE_GROUP 45	/* group_req: leave any-source group */
> --#define MCAST_JOIN_SOURCE_GROUP 46 /* group_source_req: join source-spec gr */
> --#define MCAST_LEAVE_SOURCE_GROUP 47 /* group_source_req: leave source-spec gr*/
> --#define MCAST_MSFILTER 48
> --
> --#define MCAST_EXCLUDE   0
> --#define MCAST_INCLUDE   1
> --
> --#define IP_ROUTER_ALERT    5	/* bool */
> --#define IP_PKTINFO         8	/* bool */
> --#define IP_PKTOPTIONS      9
> --#define IP_PMTUDISC        10	/* obsolete name? */
> --#define IP_MTU_DISCOVER    10	/* int; see below */
> --#define IP_RECVERR         11	/* bool */
> --#define IP_RECVTTL         12	/* bool */
> --#define IP_RECVTOS         13	/* bool */
> -+#if defined __USE_MISC || defined __USE_GNU
> -+# define MCAST_JOIN_GROUP 42	/* group_req: join any-source group */
> -+# define MCAST_BLOCK_SOURCE 43	/* group_source_req: block from given group */
> -+# define MCAST_UNBLOCK_SOURCE 44 /* group_source_req: unblock from given group*/
> -+# define MCAST_LEAVE_GROUP 45	/* group_req: leave any-source group */
> -+# define MCAST_JOIN_SOURCE_GROUP 46 /* group_source_req: join source-spec gr */
> -+# define MCAST_LEAVE_SOURCE_GROUP 47 /* group_source_req: leave source-spec gr*/
> -+# define MCAST_MSFILTER 48
> -+# define IP_MULTICAST_ALL 49
> -+# define IP_UNICAST_IF 50
> -+
> -+# define MCAST_EXCLUDE   0
> -+# define MCAST_INCLUDE   1
> -+#endif
> -+
> -+#define IP_ROUTER_ALERT	5	/* bool */
> -+#define IP_PKTINFO	8	/* bool */
> -+#define IP_PKTOPTIONS	9
> -+#define IP_PMTUDISC	10	/* obsolete name? */
> -+#define IP_MTU_DISCOVER	10	/* int; see below */
> -+#define IP_RECVERR	11	/* bool */
> -+#define IP_RECVTTL	12	/* bool */
> -+#define IP_RECVTOS	13	/* bool */
> -+#define IP_MTU		14	/* int */
> -+#define IP_FREEBIND	15
> -+#define IP_IPSEC_POLICY 16
> -+#define IP_XFRM_POLICY	17
> -+#define IP_PASSSEC	18
> -+#define IP_TRANSPARENT	19
> -+#define IP_MULTICAST_ALL 49	/* bool */
> -+
> -+/* TProxy original addresses */
> -+#define IP_ORIGDSTADDR       20
> -+#define IP_RECVORIGDSTADDR   IP_ORIGDSTADDR
> -+
> -+#define IP_MINTTL       21
> - 
> - 
> - /* IP_MTU_DISCOVER arguments.  */
> - #define IP_PMTUDISC_DONT   0	/* Never send DF frames.  */
> - #define IP_PMTUDISC_WANT   1	/* Use per route hints.  */
> - #define IP_PMTUDISC_DO     2	/* Always DF.  */
> -+#define IP_PMTUDISC_PROBE  3	/* Ignore dst pmtu.  */
> - 
> - /* To select the IP level.  */
> - #define SOL_IP	0
> -@@ -76,6 +94,7 @@
> - #define IP_DEFAULT_MULTICAST_LOOP       1
> - #define IP_MAX_MEMBERSHIPS              20
> - 
> -+#if defined __USE_MISC || defined __USE_GNU
> - /* Structure used to describe IP options for IP_OPTIONS and IP_RETOPTS.
> -    The `ip_dst' field is used for the first-hop gateway when using a
> -    source route (this gets put into the header proper).  */
> -@@ -100,6 +119,7 @@ struct in_pktinfo
> -     struct in_addr ipi_spec_dst;	/* Routing destination address  */
> -     struct in_addr ipi_addr;		/* Header destination address  */
> -   };
> -+#endif
> - 
> - #ifdef __UCLIBC_HAS_IPV6__
> - /* Options for use with `getsockopt' and `setsockopt' at the IPv6 level.
> -@@ -159,6 +179,7 @@ struct in_pktinfo
> - #define IPV6_PMTUDISC_DONT	0	/* Never send DF frames.  */
> - #define IPV6_PMTUDISC_WANT	1	/* Use per route hints.  */
> - #define IPV6_PMTUDISC_DO	2	/* Always DF.  */
> -+#define IPV6_PMTUDISC_PROBE	3	/* Ignore dst pmtu.  */
> - 
> - /* Socket level values for IPv6.  */
> - #define SOL_IPV6        41
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0039-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch b/package/uclibc/0.9.33.2/0039-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch
> deleted file mode 100644
> index ac9022c..0000000
> --- a/package/uclibc/0.9.33.2/0039-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 893d4fb45bb0811bcc939054e60e37a47a1786c5 Mon Sep 17 00:00:00 2001
> -From: Ronald Wahl <ronald.wahl@raritan.com>
> -Date: Mon, 4 Feb 2013 14:51:46 +0100
> -Subject: [PATCH] libc: atexit: reuse free slots at the end of exit functions
> - table
> -
> -Continuosly dlopen and dlclose of shared object will cause a memory leak
> -in atexit function. This fix reuse free slots at the end of the list.
> -
> -For further detail see https://bugs.busybox.net/show_bug.cgi?id=2455
> -
> -Signed-off-by: Ronald Wahl <ronald.wahl@raritan.com>
> -Tested-by: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> -(cherry picked from commit 389cd96704f21549cafc0b5bdcd0ef762b98bc08)
> ----
> - libc/stdlib/_atexit.c |   10 ++++++++++
> - 1 file changed, 10 insertions(+)
> -
> -diff --git a/libc/stdlib/_atexit.c b/libc/stdlib/_atexit.c
> -index 48b97ff..0af8c57 100644
> ---- a/libc/stdlib/_atexit.c
> -+++ b/libc/stdlib/_atexit.c
> -@@ -240,6 +240,16 @@ struct exit_function attribute_hidden *__new_exitfn(void)
> - 
> -     __UCLIBC_MUTEX_LOCK(__atexit_lock);
> - 
> -+	/*
> -+	 * Reuse free slots at the end of the list.
> -+	 * This avoids eating memory when dlopen and dlclose modules multiple times.
> -+	*/
> -+	while (__exit_count > 0) {
> -+		if (__exit_function_table[__exit_count-1].type == ef_free) {
> -+			--__exit_count;
> -+		} else break;
> -+	}
> -+
> - #ifdef __UCLIBC_DYNAMIC_ATEXIT__
> -     /* If we are out of function table slots, make some more */
> -     if (__exit_slots < __exit_count+1) {
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0040-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch b/package/uclibc/0.9.33.2/0040-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch
> deleted file mode 100644
> index 4319694..0000000
> --- a/package/uclibc/0.9.33.2/0040-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch
> +++ /dev/null
> @@ -1,200 +0,0 @@
> -From fb1b8fc191bffd6b3bc6db6bfa824b2d41e18485 Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Tue, 5 Feb 2013 19:13:06 +0100
> -Subject: [PATCH] mman: rename MAP_UNINITIALIZE to MAP_UNINITIALIZED
> -
> -The name was changed to include a trailing 'D' when it went into the
> -kernel.
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - ldso/ldso/dl-elf.c                           |    2 +-
> - ldso/ldso/ldso.c                             |    2 +-
> - libc/stdlib/malloc-simple/alloc.c            |    4 ++--
> - libc/stdlib/malloc-standard/malloc.h         |    6 +++---
> - libc/stdlib/malloc/malloc.c                  |    2 +-
> - libc/sysdeps/linux/alpha/bits/mman.h         |    2 +-
> - libc/sysdeps/linux/common/bits/mman-common.h |    2 +-
> - libc/sysdeps/linux/hppa/bits/mman.h          |    2 +-
> - libc/sysdeps/linux/mips/bits/mman.h          |    2 +-
> - libc/sysdeps/linux/powerpc/bits/mman.h       |    2 +-
> - libc/sysdeps/linux/sparc/bits/mman.h         |    2 +-
> - libc/sysdeps/linux/xtensa/bits/mman.h        |    2 +-
> - 12 files changed, 15 insertions(+), 15 deletions(-)
> -
> -diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
> -index 9e2a12c..0e6d2cd 100644
> ---- a/ldso/ldso/dl-elf.c
> -+++ b/ldso/ldso/dl-elf.c
> -@@ -500,7 +500,7 @@ struct elf_resolve *_dl_load_elf_shared_library(unsigned rflags,
> - 		return NULL;
> - 	}
> - 	header = _dl_mmap((void *) 0, _dl_pagesize, PROT_READ | PROT_WRITE,
> --			MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZE, -1, 0);
> -+			MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZED, -1, 0);
> - 	if (_dl_mmap_check_error(header)) {
> - 		_dl_dprintf(2, "%s:%i: can't map '%s'\n", _dl_progname, __LINE__, libname);
> - 		_dl_internal_error_number = LD_ERROR_MMAP_FAILED;
> -diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
> -index 85d27a3..df46e24 100644
> ---- a/ldso/ldso/ldso.c
> -+++ b/ldso/ldso/ldso.c
> -@@ -245,7 +245,7 @@ void *_dl_malloc(size_t size)
> - 
> - 		_dl_debug_early("mmapping more memory\n");
> - 		_dl_mmap_zero = _dl_malloc_addr = _dl_mmap((void *) 0, rounded_size,
> --				PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZE, -1, 0);
> -+				PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZED, -1, 0);
> - 		if (_dl_mmap_check_error(_dl_mmap_zero)) {
> - 			_dl_dprintf(_dl_debug_file, "%s: mmap of a spare page failed!\n", _dl_progname);
> - 			_dl_exit(20);
> -diff --git a/libc/stdlib/malloc-simple/alloc.c b/libc/stdlib/malloc-simple/alloc.c
> -index 914c89d..ec49781 100644
> ---- a/libc/stdlib/malloc-simple/alloc.c
> -+++ b/libc/stdlib/malloc-simple/alloc.c
> -@@ -36,7 +36,7 @@ void *malloc(size_t size)
> - #ifdef __ARCH_USE_MMU__
> - # define MMAP_FLAGS MAP_PRIVATE | MAP_ANONYMOUS
> - #else
> --# define MMAP_FLAGS MAP_SHARED | MAP_ANONYMOUS | MAP_UNINITIALIZE
> -+# define MMAP_FLAGS MAP_SHARED | MAP_ANONYMOUS | MAP_UNINITIALIZED
> - #endif
> - 
> - 	result = mmap((void *) 0, size + sizeof(size_t), PROT_READ | PROT_WRITE,
> -@@ -63,7 +63,7 @@ void * calloc(size_t nmemb, size_t lsize)
> - 	result = malloc(size);
> - 
> - #ifndef __ARCH_USE_MMU__
> --	/* mmap'd with MAP_UNINITIALIZE, we have to blank memory ourselves */
> -+	/* mmap'd with MAP_UNINITIALIZED, we have to blank memory ourselves */
> - 	if (result != NULL) {
> - 		memset(result, 0, size);
> - 	}
> -diff --git a/libc/stdlib/malloc-standard/malloc.h b/libc/stdlib/malloc-standard/malloc.h
> -index 73d4b12..e6ae544 100644
> ---- a/libc/stdlib/malloc-standard/malloc.h
> -+++ b/libc/stdlib/malloc-standard/malloc.h
> -@@ -349,13 +349,13 @@ __UCLIBC_MUTEX_EXTERN(__malloc_lock);
> - #endif
> - 
> - #ifdef __ARCH_USE_MMU__
> --# define _MAP_UNINITIALIZE 0
> -+# define _MAP_UNINITIALIZED 0
> - #else
> --# define _MAP_UNINITIALIZE MAP_UNINITIALIZE
> -+# define _MAP_UNINITIALIZED MAP_UNINITIALIZED
> - #endif
> - 
> - #define MMAP(addr, size, prot) \
> -- (mmap((addr), (size), (prot), MAP_PRIVATE|MAP_ANONYMOUS|_MAP_UNINITIALIZE, 0, 0))
> -+ (mmap((addr), (size), (prot), MAP_PRIVATE|MAP_ANONYMOUS|_MAP_UNINITIALIZED, 0, 0))
> - 
> - 
> - /* -----------------------  Chunk representations ----------------------- */
> -diff --git a/libc/stdlib/malloc/malloc.c b/libc/stdlib/malloc/malloc.c
> -index d58a7d0..2b47077 100644
> ---- a/libc/stdlib/malloc/malloc.c
> -+++ b/libc/stdlib/malloc/malloc.c
> -@@ -124,7 +124,7 @@ __malloc_from_heap (size_t size, struct heap_free_area **heap
> - 		    MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
> - #else
> -       block = mmap ((void *)0, block_size, PROT_READ | PROT_WRITE,
> --		    MAP_SHARED | MAP_ANONYMOUS | MAP_UNINITIALIZE, 0, 0);
> -+		    MAP_SHARED | MAP_ANONYMOUS | MAP_UNINITIALIZED, 0, 0);
> - #endif
> - 
> - #endif /* MALLOC_USE_SBRK */
> -diff --git a/libc/sysdeps/linux/alpha/bits/mman.h b/libc/sysdeps/linux/alpha/bits/mman.h
> -index cafad4a..31327ed 100644
> ---- a/libc/sysdeps/linux/alpha/bits/mman.h
> -+++ b/libc/sysdeps/linux/alpha/bits/mman.h
> -@@ -71,7 +71,7 @@
> - # define MAP_NORESERVE	  0x10000	/* Don't check for reservations.  */
> - # define MAP_POPULATE	  0x20000	/* Populate (prefault) pagetables.  */
> - # define MAP_NONBLOCK	  0x40000	/* Do not block on IO.  */
> --# define MAP_UNINITIALIZE 0x4000000     /* For anonymous mmap, memory could
> -+# define MAP_UNINITIALIZED 0x4000000    /* For anonymous mmap, memory could
> - 					   be uninitialized. */
> - #endif
> - 
> -diff --git a/libc/sysdeps/linux/common/bits/mman-common.h b/libc/sysdeps/linux/common/bits/mman-common.h
> -index f00cb1a..c733a87 100644
> ---- a/libc/sysdeps/linux/common/bits/mman-common.h
> -+++ b/libc/sysdeps/linux/common/bits/mman-common.h
> -@@ -64,7 +64,7 @@
> - # define MAP_POPULATE	0x08000		/* Populate (prefault) pagetables.  */
> - # define MAP_NONBLOCK	0x10000		/* Do not block on IO.  */
> - # define MAP_STACK	0x20000		/* Allocation is for a stack.  */
> --# define MAP_UNINITIALIZE 0x4000000     /* For anonymous mmap, memory could
> -+# define MAP_UNINITIALIZED 0x4000000    /* For anonymous mmap, memory could
> - 					   be uninitialized. */
> - #endif
> - 
> -diff --git a/libc/sysdeps/linux/hppa/bits/mman.h b/libc/sysdeps/linux/hppa/bits/mman.h
> -index 7f9bf4e..fc73c91 100644
> ---- a/libc/sysdeps/linux/hppa/bits/mman.h
> -+++ b/libc/sysdeps/linux/hppa/bits/mman.h
> -@@ -45,7 +45,7 @@
> - #define MAP_GROWSDOWN	0x8000		/* stack-like segment */
> - #define MAP_POPULATE	0x10000		/* populate (prefault) pagetables */
> - #define MAP_NONBLOCK	0x20000		/* do not block on IO */
> --#define MAP_UNINITIALIZE 0x4000000     /* For anonymous mmap, memory could
> -+#define MAP_UNINITIALIZED 0x4000000     /* For anonymous mmap, memory could
> - 					  be uninitialized. */
> - 
> - #define MS_SYNC		1		/* synchronous memory sync */
> -diff --git a/libc/sysdeps/linux/mips/bits/mman.h b/libc/sysdeps/linux/mips/bits/mman.h
> -index c480be4..f9a8128 100644
> ---- a/libc/sysdeps/linux/mips/bits/mman.h
> -+++ b/libc/sysdeps/linux/mips/bits/mman.h
> -@@ -66,7 +66,7 @@
> - # define MAP_LOCKED	0x8000		/* pages are locked */
> - # define MAP_POPULATE   0x10000         /* populate (prefault) pagetables */
> - # define MAP_NONBLOCK   0x20000         /* do not block on IO */
> --# define MAP_UNINITIALIZE 0x4000000     /* For anonymous mmap, memory could
> -+# define MAP_UNINITIALIZED 0x4000000    /* For anonymous mmap, memory could
> - 					   be uninitialized. */
> - #endif
> - 
> -diff --git a/libc/sysdeps/linux/powerpc/bits/mman.h b/libc/sysdeps/linux/powerpc/bits/mman.h
> -index 2d234c5..b766cb6 100644
> ---- a/libc/sysdeps/linux/powerpc/bits/mman.h
> -+++ b/libc/sysdeps/linux/powerpc/bits/mman.h
> -@@ -63,7 +63,7 @@
> - # define MAP_NORESERVE	0x00040		/* Don't check for reservations.  */
> - # define MAP_POPULATE	0x08000		/* Populate (prefault) pagetables.  */
> - # define MAP_NONBLOCK	0x10000		/* Do not block on IO.  */
> --# define MAP_UNINITIALIZE 0x4000000     /* For anonymous mmap, memory could
> -+# define MAP_UNINITIALIZED 0x4000000    /* For anonymous mmap, memory could
> - 					   be uninitialized. */
> - #endif
> - 
> -diff --git a/libc/sysdeps/linux/sparc/bits/mman.h b/libc/sysdeps/linux/sparc/bits/mman.h
> -index 74921e4..2463e7d 100644
> ---- a/libc/sysdeps/linux/sparc/bits/mman.h
> -+++ b/libc/sysdeps/linux/sparc/bits/mman.h
> -@@ -65,7 +65,7 @@
> - # define _MAP_NEW	0x80000000	/* Binary compatibility with SunOS.  */
> - # define MAP_POPULATE	0x8000		/* Populate (prefault) pagetables.  */
> - # define MAP_NONBLOCK	0x10000		/* Do not block on IO.  */
> --# define MAP_UNINITIALIZE 0x4000000     /* For anonymous mmap, memory could
> -+# define MAP_UNINITIALIZED 0x4000000    /* For anonymous mmap, memory could
> - 					   be uninitialized. */
> - #endif
> - 
> -diff --git a/libc/sysdeps/linux/xtensa/bits/mman.h b/libc/sysdeps/linux/xtensa/bits/mman.h
> -index fead3ac..dfd9e4c 100644
> ---- a/libc/sysdeps/linux/xtensa/bits/mman.h
> -+++ b/libc/sysdeps/linux/xtensa/bits/mman.h
> -@@ -64,7 +64,7 @@
> - # define MAP_NORESERVE	0x0400		/* Don't check for reservations.  */
> - # define MAP_POPULATE	0x10000		/* Populate (prefault) pagetables.  */
> - # define MAP_NONBLOCK	0x20000		/* Do not block on IO.  */
> --# define MAP_UNINITIALIZE 0x4000000     /* For anonymous mmap, memory could
> -+# define MAP_UNINITIALIZED 0x4000000    /* For anonymous mmap, memory could
> - 					   be uninitialized. */
> - #endif
> - 
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0041-libc-add-posix_fallocate.patch b/package/uclibc/0.9.33.2/0041-libc-add-posix_fallocate.patch
> deleted file mode 100644
> index 64fb43d..0000000
> --- a/package/uclibc/0.9.33.2/0041-libc-add-posix_fallocate.patch
> +++ /dev/null
> @@ -1,337 +0,0 @@
> -From 8fc83b7f3fd7425aa4e96c870a7d46df1d81c16c Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Tue, 17 Apr 2012 09:30:15 +0200
> -Subject: [PATCH] libc: add posix_fallocate()
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - include/fcntl.h                                  |    4 +-
> - libc/sysdeps/linux/common/Makefile.in            |    3 +-
> - libc/sysdeps/linux/common/bits/kernel-features.h |    8 ++
> - libc/sysdeps/linux/common/posix_fallocate.c      |   43 ++++++++
> - libc/sysdeps/linux/common/posix_fallocate64.c    |   39 +++++++
> - test/.gitignore                                  |    2 +
> - test/unistd/Makefile.in                          |    5 +-
> - test/unistd/tst-posix_fallocate.c                |  127 ++++++++++++++++++++++
> - test/unistd/tst-posix_fallocate64.c              |    2 +
> - 9 files changed, 228 insertions(+), 5 deletions(-)
> - create mode 100644 libc/sysdeps/linux/common/posix_fallocate.c
> - create mode 100644 libc/sysdeps/linux/common/posix_fallocate64.c
> - create mode 100644 test/unistd/tst-posix_fallocate.c
> - create mode 100644 test/unistd/tst-posix_fallocate64.c
> -
> -diff --git a/include/fcntl.h b/include/fcntl.h
> -index 26ad1fe..c4a47af 100644
> ---- a/include/fcntl.h
> -+++ b/include/fcntl.h
> -@@ -210,9 +210,7 @@ extern int posix_fadvise64 (int __fd, __off64_t __offset, __off64_t __len,
> - 
> - #endif
> - 
> --#if 0 /* && defined __UCLIBC_HAS_ADVANCED_REALTIME__ */
> --
> --/* FIXME -- uClibc should probably implement these... */
> -+#if defined __UCLIBC_HAS_ADVANCED_REALTIME__
> - 
> - /* Reserve storage for the data of the file associated with FD.
> - 
> -diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
> -index e9baa47..e4ac4ff 100644
> ---- a/libc/sysdeps/linux/common/Makefile.in
> -+++ b/libc/sysdeps/linux/common/Makefile.in
> -@@ -82,7 +82,8 @@ CSRC-$(UCLIBC_HAS_REALTIME) += clock_getres.c clock_gettime.c clock_settime.c \
> - 	sched_get_priority_max.c sched_get_priority_min.c sched_getscheduler.c \
> - 	sched_rr_get_interval.c sched_setparam.c sched_setscheduler.c sigqueue.c
> - # clock_getcpuclockid|clock_nanosleep|mq_timedreceive|mq_timedsend|posix_fadvise|posix_fallocate|posix_madvise|posix_memalign|posix_mem_offset|posix_spawnattr_destroy|posix_spawnattr_init|posix_spawnattr_getflags|posix_spawnattr_setflags|posix_spawnattr_getpgroup|posix_spawnattr_setpgroup|posix_spawnattr_getschedparam|posix_spawnattr_setschedparam|posix_spawnattr_getschedpolicy|posix_spawnattr_setschedpolicy|posix_spawnattr_getsigdefault|posix_spawnattr_setsigdefault|posix_spawnattr_getsigmask|posix_spawnattr_setsigmask|posix_spawnattr_init|posix_spawnattr_setflags|posix_spawnattr_setpgroup|posix_spawnattr_setschedparam|posix_spawnattr_setschedpolicy|posix_spawnattr_setsigdefault|posix_spawnattr_setsigmask|posix_spawn_file_actions_addclose|posix_spawn_file_actions_addopen|posix_spawn_file_actions_adddup2|posix_spawn_file_actions_addopen|posix_spawn_file_actions_destroy|posix_spawn_file_actions_init|posix_spawn_file_actions_init|posix_spawn|posix_spawnp|posix_spawnp|posix_
 ty
>  ped_mem_
>  get_info|pthread_mutex_timedlock|sem_timedwait
> --CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c posix_madvise.c
> -+CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c posix_madvise.c \
> -+	posix_fallocate.c posix_fallocate64.c
> - CSRC-$(UCLIBC_SUSV4_LEGACY) += utime.c
> - CSRC-$(UCLIBC_HAS_EPOLL) += epoll.c
> - CSRC-$(UCLIBC_HAS_XATTR) += xattr.c
> -diff --git a/libc/sysdeps/linux/common/bits/kernel-features.h b/libc/sysdeps/linux/common/bits/kernel-features.h
> -index 5665e24..13c7a63 100644
> ---- a/libc/sysdeps/linux/common/bits/kernel-features.h
> -+++ b/libc/sysdeps/linux/common/bits/kernel-features.h
> -@@ -496,6 +496,14 @@
> - # define __ASSUME_PRIVATE_FUTEX	1
> - #endif
> - 
> -+/* Support for fallocate was added in 2.6.23,
> -+   on s390 only after 2.6.23-rc1, on alpha only after 2.6.33-rc1.  */
> -+#if __LINUX_KERNEL_VERSION >= 0x020617 \
> -+    && (!defined __s390__ || __LINUX_KERNEL_VERSION >= 0x020618) \
> -+    && (!defined __alpha__ || __LINUX_KERNEL_VERSION >= 0x020621)
> -+# define __ASSUME_FALLOCATE 1
> -+#endif
> -+
> - /* getcpu is a syscall for x86-64 since 3.1.  */
> - #if defined __x86_64__ && __LINUX_KERNEL_VERSION >= 0x030100
> - # define __ASSUME_GETCPU_SYSCALL        1
> -diff --git a/libc/sysdeps/linux/common/posix_fallocate.c b/libc/sysdeps/linux/common/posix_fallocate.c
> -new file mode 100644
> -index 0000000..9aaa6ce
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/posix_fallocate.c
> -@@ -0,0 +1,43 @@
> -+/* vi: set sw=4 ts=4: */
> -+/*
> -+ * posix_fallocate() for uClibc
> -+ * http://www.opengroup.org/onlinepubs/9699919799/functions/posix_fallocate.html
> -+ *
> -+ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
> -+ *
> -+ * Licensed under the LGPL v2.1 or later, see the file COPYING.LIB in this tarball.
> -+ */
> -+
> -+#include <sys/syscall.h>
> -+#include <fcntl.h>
> -+#include <bits/kernel-features.h>
> -+#include <stdint.h>
> -+
> -+#if defined __NR_fallocate
> -+int posix_fallocate(int fd, __off_t offset, __off_t len)
> -+{
> -+	int ret;
> -+
> -+# if __WORDSIZE == 32
> -+	uint32_t off_low = offset;
> -+	uint32_t len_low = len;
> -+	/* may assert that these >>31 are 0 */
> -+	uint32_t zero = 0;
> -+	INTERNAL_SYSCALL_DECL(err);
> -+	ret = (int) (INTERNAL_SYSCALL(fallocate, err, 6, fd, 0,
> -+		__LONG_LONG_PAIR (zero, off_low),
> -+		__LONG_LONG_PAIR (zero, len_low)));
> -+# elif __WORDSIZE == 64
> -+	INTERNAL_SYSCALL_DECL(err);
> -+	ret = (int) (INTERNAL_SYSCALL(fallocate, err, 4, fd, 0, offset, len));
> -+# else
> -+# error your machine is neither 32 bit or 64 bit ... it must be magical
> -+#endif
> -+    if (unlikely(INTERNAL_SYSCALL_ERROR_P (ret, err)))
> -+      return INTERNAL_SYSCALL_ERRNO (ret, err);
> -+    return 0;
> -+}
> -+# if defined __UCLIBC_HAS_LFS__ && __WORDSIZE == 64
> -+strong_alias(posix_fallocate,posix_fallocate64)
> -+# endif
> -+#endif
> -diff --git a/libc/sysdeps/linux/common/posix_fallocate64.c b/libc/sysdeps/linux/common/posix_fallocate64.c
> -new file mode 100644
> -index 0000000..818d868
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/posix_fallocate64.c
> -@@ -0,0 +1,39 @@
> -+/* vi: set sw=4 ts=4: */
> -+/*
> -+ * posix_fallocate() for uClibc
> -+ * http://www.opengroup.org/onlinepubs/9699919799/functions/posix_fallocate.html
> -+ *
> -+ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
> -+ *
> -+ * Licensed under the LGPL v2.1 or later, see the file COPYING.LIB in this tarball.
> -+ */
> -+
> -+#include <sys/syscall.h>
> -+#include <fcntl.h>
> -+#include <bits/kernel-features.h>
> -+#include <stdint.h>
> -+
> -+#if defined __NR_fallocate
> -+
> -+# if __WORDSIZE == 64
> -+/* Can use normal posix_fallocate() */
> -+# elif __WORDSIZE == 32
> -+int posix_fallocate64(int fd, __off64_t offset, __off64_t len)
> -+{
> -+	int ret;
> -+	uint32_t off_low = offset & 0xffffffff;
> -+	uint32_t off_high = offset >> 32;
> -+	uint32_t len_low = len & 0xffffffff;
> -+	uint32_t len_high = len >> 32;
> -+	INTERNAL_SYSCALL_DECL(err);
> -+	ret = (int) (INTERNAL_SYSCALL(fallocate, err, 6, fd, 0,
> -+		__LONG_LONG_PAIR (off_high, off_low),
> -+		__LONG_LONG_PAIR (len_high, len_low)));
> -+    if (unlikely(INTERNAL_SYSCALL_ERROR_P (ret, err)))
> -+      return INTERNAL_SYSCALL_ERRNO (ret, err);
> -+    return 0;
> -+}
> -+# else
> -+# error your machine is neither 32 bit or 64 bit ... it must be magical
> -+# endif
> -+#endif
> -diff --git a/test/.gitignore b/test/.gitignore
> -index 7234c48..ef152e9 100644
> ---- a/test/.gitignore
> -+++ b/test/.gitignore
> -@@ -305,6 +305,8 @@ unistd/getcwd
> - unistd/getopt
> - unistd/getopt_long
> - unistd/tstgetopt
> -+unistd/tst-posix_fallocate
> -+unistd/tst-posix_fallocate64
> - unistd/tst-preadwrite
> - unistd/tst-preadwrite64
> - unistd/vfork
> -diff --git a/test/unistd/Makefile.in b/test/unistd/Makefile.in
> -index c542f98..24b9a37 100644
> ---- a/test/unistd/Makefile.in
> -+++ b/test/unistd/Makefile.in
> -@@ -2,7 +2,10 @@
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - 
> - ifeq ($(UCLIBC_HAS_LFS),)
> --TESTS_DISABLED := tst-preadwrite64
> -+TESTS_DISABLED := tst-preadwrite64 tst-posix_fallocate64
> -+endif
> -+ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),)
> -+TESTS_DISABLED := tst-posix_fallocate
> - endif
> - OPTS_getopt      := -abcXXX -9
> - OPTS_getopt_long := --add XXX --delete YYY --verbose
> -diff --git a/test/unistd/tst-posix_fallocate.c b/test/unistd/tst-posix_fallocate.c
> -new file mode 100644
> -index 0000000..d41c604
> ---- /dev/null
> -+++ b/test/unistd/tst-posix_fallocate.c
> -@@ -0,0 +1,127 @@
> -+#include <fcntl.h>
> -+#include <sys/stat.h>
> -+
> -+#ifndef TST_POSIX_FALLOCATE64
> -+# define stat64 stat
> -+# define fstat64 fstat
> -+# else
> -+# ifndef O_LARGEFILE
> -+#  error no O_LARGEFILE but you want to test with LFS enabled
> -+# endif
> -+#endif
> -+
> -+static void do_prepare (void);
> -+#define PREPARE(argc, argv) do_prepare ()
> -+static int do_test (void);
> -+#define TEST_FUNCTION do_test ()
> -+#include <test-skeleton.c>
> -+
> -+static int fd;
> -+static void
> -+do_prepare (void)
> -+{
> -+  fd = create_temp_file ("tst-posix_fallocate.", NULL);
> -+  if (fd == -1)
> -+    {
> -+      printf ("cannot create temporary file: %m\n");
> -+      exit (1);
> -+    }
> -+}
> -+
> -+
> -+static int
> -+do_test (void)
> -+{
> -+  struct stat64 st;
> -+
> -+  if (fstat64 (fd, &st) != 0)
> -+    {
> -+      puts ("1st fstat failed");
> -+      return 1;
> -+    }
> -+
> -+  if (st.st_size != 0)
> -+    {
> -+      puts ("file not created with size 0");
> -+      return 1;
> -+    }
> -+
> -+  if (posix_fallocate (fd, 512, 768) != 0)
> -+    {
> -+      puts ("1st posix_fallocate call failed");
> -+      return 1;
> -+    }
> -+
> -+  if (fstat64 (fd, &st) != 0)
> -+    {
> -+      puts ("2nd fstat failed");
> -+      return 1;
> -+    }
> -+
> -+  if (st.st_size != 512 + 768)
> -+    {
> -+      printf ("file size after 1st posix_fallocate call is %llu, expected %u\n",
> -+	      (unsigned long long int) st.st_size, 512u + 768u);
> -+      return 1;
> -+    }
> -+
> -+  if (posix_fallocate (fd, 0, 1024) != 0)
> -+    {
> -+      puts ("2nd posix_fallocate call failed");
> -+      return 1;
> -+    }
> -+
> -+  if (fstat64 (fd, &st) != 0)
> -+    {
> -+      puts ("3rd fstat failed");
> -+      return 1;
> -+    }
> -+
> -+  if (st.st_size != 512 + 768)
> -+    {
> -+      puts ("file size changed in 2nd posix_fallocate");
> -+      return 1;
> -+    }
> -+
> -+  if (posix_fallocate (fd, 2048, 64) != 0)
> -+    {
> -+      puts ("3rd posix_fallocate call failed");
> -+      return 1;
> -+    }
> -+
> -+  if (fstat64 (fd, &st) != 0)
> -+    {
> -+      puts ("4th fstat failed");
> -+      return 1;
> -+    }
> -+
> -+  if (st.st_size != 2048 + 64)
> -+    {
> -+      printf ("file size after 3rd posix_fallocate call is %llu, expected %u\n",
> -+	      (unsigned long long int) st.st_size, 2048u + 64u);
> -+      return 1;
> -+    }
> -+#ifdef TST_POSIX_FALLOCATE64
> -+  if (posix_fallocate64 (fd, 4097ULL, 4294967295ULL + 2ULL) != 0)
> -+    {
> -+      puts ("4th posix_fallocate call failed");
> -+      return 1;
> -+    }
> -+
> -+  if (fstat64 (fd, &st) != 0)
> -+    {
> -+      puts ("5th fstat failed");
> -+      return 1;
> -+    }
> -+
> -+  if (st.st_size != 4097ULL + 4294967295ULL + 2ULL)
> -+    {
> -+      printf ("file size after 4th posix_fallocate call is %llu, expected %llu\n",
> -+	      (unsigned long long int) st.st_size, 4097ULL + 4294967295ULL + 2ULL);
> -+      return 1;
> -+    }
> -+#endif
> -+  close (fd);
> -+
> -+  return 0;
> -+}
> -diff --git a/test/unistd/tst-posix_fallocate64.c b/test/unistd/tst-posix_fallocate64.c
> -new file mode 100644
> -index 0000000..b1ee0ff
> ---- /dev/null
> -+++ b/test/unistd/tst-posix_fallocate64.c
> -@@ -0,0 +1,2 @@
> -+#define TST_POSIX_FALLOCATE64
> -+#include "tst-posix_fallocate.c"
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0042-nice-fix-overflow-checking-in-int_add_no_wrap.patch b/package/uclibc/0.9.33.2/0042-nice-fix-overflow-checking-in-int_add_no_wrap.patch
> deleted file mode 100644
> index a6e6349..0000000
> --- a/package/uclibc/0.9.33.2/0042-nice-fix-overflow-checking-in-int_add_no_wrap.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From e6735556ed0a5e791ea81a015a90c130a0eea060 Mon Sep 17 00:00:00 2001
> -From: Xi Wang <xi@mit.edu>
> -Date: Wed, 20 Feb 2013 12:45:45 -0500
> -Subject: [PATCH] nice: fix overflow checking in int_add_no_wrap()
> -
> -In C, signed integer overflow is undefined behavior.  Many compilers
> -optimize away checks like `a + b < a'.
> -
> -Use safe precondition testing instead.
> -
> -Signed-off-by: Xi Wang <xi@mit.edu>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/sysdeps/linux/common/nice.c |   10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/libc/sysdeps/linux/common/nice.c b/libc/sysdeps/linux/common/nice.c
> -index 3694db8..ed39946 100644
> ---- a/libc/sysdeps/linux/common/nice.c
> -+++ b/libc/sysdeps/linux/common/nice.c
> -@@ -25,15 +25,15 @@ static __inline__ _syscall1(int, __syscall_nice, int, incr)
> - 
> - static __inline__ int int_add_no_wrap(int a, int b)
> - {
> --	int s = a + b;
> --
> - 	if (b < 0) {
> --		if (s > a) s = INT_MIN;
> -+		if (a < INT_MIN - b)
> -+			return INT_MIN;
> - 	} else {
> --		if (s < a) s = INT_MAX;
> -+		if (a > INT_MAX - b)
> -+			return INT_MAX;
> - 	}
> - 
> --	return s;
> -+	return a + b;
> - }
> - 
> - static __inline__ int __syscall_nice(int incr)
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0043-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch b/package/uclibc/0.9.33.2/0043-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch
> deleted file mode 100644
> index 06fe662..0000000
> --- a/package/uclibc/0.9.33.2/0043-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -From 0600966321c011c31edbb60945bbdca3fa34b7cb Mon Sep 17 00:00:00 2001
> -From: Markos Chandras <markos.chandras@imgtec.com>
> -Date: Mon, 25 Feb 2013 09:41:25 +0000
> -Subject: [PATCH] buildsys: Add missing $(SYMBOL_PREFIX) to symbol names
> -
> -Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - Makerules                   |    2 +-
> - ldso/ldso/Makefile.in       |    2 +-
> - ldso/ldso/bfin/dl-startup.h |    5 +----
> - ldso/libdl/Makefile.in      |    2 +-
> - libpthread/nptl/Makefile.in |    2 +-
> - 5 files changed, 5 insertions(+), 8 deletions(-)
> -
> -diff --git a/Makerules b/Makerules
> -index 60acaa8..28bbdef 100644
> ---- a/Makerules
> -+++ b/Makerules
> -@@ -300,7 +300,7 @@ define create-lds
> - 	-Wl,-z,relro -Wl,--hash-style=gnu -Wl,-z,defs \
> - 	-Wl,--verbose 2>&1 | LC_ALL=C \
> - 	sed -e '/^=========/,/^=========/!d;/^=========/d' \
> --	-e 's/\. = .* + SIZEOF_HEADERS;/& _begin = . - SIZEOF_HEADERS;/' > $@.lds
> -+	-e 's/\. = .* + SIZEOF_HEADERS;/& $(SYMBOL_PREFIX)_begin = . - SIZEOF_HEADERS;/' > $@.lds
> - endef
> - 
> - define link.so
> -diff --git a/ldso/ldso/Makefile.in b/ldso/ldso/Makefile.in
> -index eb1570a..91165c6 100644
> ---- a/ldso/ldso/Makefile.in
> -+++ b/ldso/ldso/Makefile.in
> -@@ -36,7 +36,7 @@ LDFLAGS-$(UCLIBC_LDSO_NAME).so := $(LDFLAGS)
> - else
> - LDFLAGS-$(UCLIBC_LDSO_NAME).so := $(LDFLAGS_NOSTRIP) -Wl,-z,defs
> - endif
> --LDFLAGS-$(UCLIBC_LDSO_NAME).so += -Wl,-e,_start -Wl,-z,now -Wl,-Bsymbolic \
> -+LDFLAGS-$(UCLIBC_LDSO_NAME).so += -Wl,-e,$(SYMBOL_PREFIX)_start -Wl,-z,now -Wl,-Bsymbolic \
> - 	-Wl,--export-dynamic $(CFLAG_-Wl--sort-common) -Wl,--discard-locals \
> - 	$(CFLAG_-Wl--discard-all) -Wl,--no-undefined
> - 
> -diff --git a/ldso/ldso/bfin/dl-startup.h b/ldso/ldso/bfin/dl-startup.h
> -index 76ae150..860b7c6 100644
> ---- a/ldso/ldso/bfin/dl-startup.h
> -+++ b/ldso/ldso/bfin/dl-startup.h
> -@@ -40,10 +40,7 @@ __asm__(
> - 	"	.text\n"
> - 	"	.global	__start\n"
> - 	"	.type	__start, at function\n"
> --	/* Build system expects a "_start" for the entry point;
> --	   provide it as it's free to do so with aliases.  */
> --	"	.set	_start, __start\n"
> --	"	.global	_start\n"
> -+	"	.hidden	__start\n"
> - 	"__start:\n"
> - 	"	call	.Lcall\n"
> - 	".Lcall:\n"
> -diff --git a/ldso/libdl/Makefile.in b/ldso/libdl/Makefile.in
> -index be236c8..edf95a6 100644
> ---- a/ldso/libdl/Makefile.in
> -+++ b/ldso/libdl/Makefile.in
> -@@ -23,7 +23,7 @@ LDFLAGS-$(UCLIBC_FORMAT_DSBT_ELF)-libdl.so := -Wl,--dsbt-index=3
> - LDFLAGS-libdl.so := $(LDFLAGS)
> - 
> - ifeq ($(LDSO_NO_CLEANUP),)
> --LDFLAGS-libdl.so += -Wl,-fini,dl_cleanup
> -+LDFLAGS-libdl.so += -Wl,-fini,$(SYMBOL_PREFIX)dl_cleanup
> - endif
> - 
> - LIBS-libdl.so := $(LIBS) $(ldso)
> -diff --git a/libpthread/nptl/Makefile.in b/libpthread/nptl/Makefile.in
> -index 158bcae..0008822 100644
> ---- a/libpthread/nptl/Makefile.in
> -+++ b/libpthread/nptl/Makefile.in
> -@@ -145,7 +145,7 @@ LDFLAGS-libpthread.so += $(LDFLAGS)
> - endif
> - 
> - LDFLAGS-libpthread.so += $(top_builddir)lib/$(UCLIBC_LDSO_NAME)-$(VERSION).so $(top_builddir)lib/libdl-$(VERSION).so \
> --	-Wl,-z,nodelete,-z,initfirst,-init=__pthread_initialize_minimal_internal
> -+	-Wl,-z,nodelete,-z,initfirst,-init=$(SYMBOL_PREFIX)__pthread_initialize_minimal_internal
> - 
> - LIBS-libpthread.so := $(LIBS)
> - 
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0044-inet-do-not-filter-responses-in-res_query.patch b/package/uclibc/0.9.33.2/0044-inet-do-not-filter-responses-in-res_query.patch
> deleted file mode 100644
> index 0a8c94b..0000000
> --- a/package/uclibc/0.9.33.2/0044-inet-do-not-filter-responses-in-res_query.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 5e40582d549b4a186de2fea9efafadd06904424c Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Timo=20Ter=C3=A4s?= <timo.teras@iki.fi>
> -Date: Thu, 18 Jun 2009 06:55:46 +0000
> -Subject: [PATCH] inet: do not filter responses in res_query
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Fixes bug #5342
> -
> -res_query was silently rejecting responses against T_ANY DNS
> -questions.
> -
> -Remove the type-filtering from res_query altogether.
> -__dns_lookup is supposed to return the proper stuff that you asked
> -for (and only that).
> -
> -Signed-off-by: Timo Ter?s <timo.teras@iki.fi>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/inet/resolv.c |    9 ++++-----
> - 1 file changed, 4 insertions(+), 5 deletions(-)
> -
> -diff --git a/libc/inet/resolv.c b/libc/inet/resolv.c
> -index e738098..7bd634c 100644
> ---- a/libc/inet/resolv.c
> -+++ b/libc/inet/resolv.c
> -@@ -3740,11 +3740,10 @@ int res_query(const char *dname, int class, int type,
> - 
> - 	free(a.dotted);
> - 
> --	if (a.atype == type) { /* CNAME */
> --		if (i > anslen)
> --			i = anslen;
> --		memcpy(answer, packet, i);
> --	}
> -+	if (i > anslen)
> -+		i = anslen;
> -+	memcpy(answer, packet, i);
> -+
> - 	free(packet);
> - 	return i;
> - }
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0045-Remove-pragma-weak-for-undeclared-symbol.patch b/package/uclibc/0.9.33.2/0045-Remove-pragma-weak-for-undeclared-symbol.patch
> deleted file mode 100644
> index 19a0647..0000000
> --- a/package/uclibc/0.9.33.2/0045-Remove-pragma-weak-for-undeclared-symbol.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 9a7b71facfcaee5f3a45429358c55fcd5377c509 Mon Sep 17 00:00:00 2001
> -From: Bernd Schmidt <bernds@codesourcery.com>
> -Date: Tue, 24 Jul 2012 15:39:48 +0200
> -Subject: [PATCH] Remove pragma weak for undeclared symbol
> -
> -pthread_initialize is a static function and should not be mentioned in a
> -header.  The #pragma weak for it appears to confuse gcc-4.7.
> -
> -see gcc PR middle-end/36282
> -
> -Signed-off-by: Bernd Schmidt <bernds@codesourcery.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-lock.h |    2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-lock.h b/libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-lock.h
> -index 78593ac..f41375b 100644
> ---- a/libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-lock.h
> -+++ b/libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-lock.h
> -@@ -375,7 +375,6 @@ weak_extern (BP_SYM (__pthread_key_create))
> - weak_extern (BP_SYM (__pthread_setspecific))
> - weak_extern (BP_SYM (__pthread_getspecific))
> - weak_extern (BP_SYM (__pthread_once))
> --weak_extern (__pthread_initialize)
> - weak_extern (__pthread_atfork)
> - weak_extern (BP_SYM (_pthread_cleanup_push))
> - weak_extern (BP_SYM (_pthread_cleanup_pop))
> -@@ -400,7 +399,6 @@ weak_extern (BP_SYM (_pthread_cleanup_pop_restore))
> - #  pragma weak __pthread_setspecific
> - #  pragma weak __pthread_getspecific
> - #  pragma weak __pthread_once
> --#  pragma weak __pthread_initialize
> - #  pragma weak __pthread_atfork
> - #  pragma weak _pthread_cleanup_push_defer
> - #  pragma weak _pthread_cleanup_pop_restore
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0046-inet-fix-getting-the-nameserver-from-_res-state-afte.patch b/package/uclibc/0.9.33.2/0046-inet-fix-getting-the-nameserver-from-_res-state-afte.patch
> deleted file mode 100644
> index c294a46..0000000
> --- a/package/uclibc/0.9.33.2/0046-inet-fix-getting-the-nameserver-from-_res-state-afte.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 41063cebafa7b90427837757db00cdbfe2690f82 Mon Sep 17 00:00:00 2001
> -From: Felix Fietkau <nbd@openwrt.org>
> -Date: Fri, 21 Sep 2012 17:29:12 +0200
> -Subject: [PATCH] inet: fix getting the nameserver from _res state after
> - res_init.
> -
> -Fixes displaying the nameserver in busybox nslookup.
> -
> -Signed-off-by: Felix Fietkau <nbd@openwrt.org>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/inet/resolv.c |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libc/inet/resolv.c b/libc/inet/resolv.c
> -index 7bd634c..6f58260 100644
> ---- a/libc/inet/resolv.c
> -+++ b/libc/inet/resolv.c
> -@@ -3653,11 +3653,11 @@ res_init(void)
> - 	 */
> - 	if (!_res.id)
> - 		_res.id = res_randomid();
> --	__res_sync = res_sync_func;
> - 
> - 	__UCLIBC_MUTEX_UNLOCK(__resolv_lock);
> - 
> - 	__res_vinit(&_res, 1);
> -+	__res_sync = res_sync_func;
> - 
> - 	return 0;
> - }
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0047-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch b/package/uclibc/0.9.33.2/0047-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch
> deleted file mode 100644
> index 4268350..0000000
> --- a/package/uclibc/0.9.33.2/0047-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 543460903545b59903bc83221a6cea02afd0e04f Mon Sep 17 00:00:00 2001
> -From: Mirko Vogt <dev@nanl.de>
> -Date: Fri, 21 Sep 2012 17:29:15 +0200
> -Subject: [PATCH] _vfprintf.c: use 'fputws_unlocked(S, F)' instead of
> - 'fputws(S, F)'
> -
> -This eliminates a source of reproduceable freezes
> -
> -Signed-off-by: Mirko Vogt <dev@nanl.de>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/stdio/_vfprintf.c |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libc/stdio/_vfprintf.c b/libc/stdio/_vfprintf.c
> -index 3db8cdf..069db16 100644
> ---- a/libc/stdio/_vfprintf.c
> -+++ b/libc/stdio/_vfprintf.c
> -@@ -1229,7 +1229,7 @@ static size_t _fp_out_narrow(FILE *fp, intptr_t type, intptr_t len, intptr_t buf
> - #define STRLEN  wcslen
> - #define _PPFS_init _ppwfs_init
> - /* Pulls in fseek: */
> --#define OUTPUT(F,S)			fputws(S,F)
> -+#define OUTPUT(F,S)			fputws_unlocked(S,F)
> - /* TODO: #define OUTPUT(F,S)		_wstdio_fwrite((S),wcslen(S),(F)) */
> - #define _outnwcs(stream, wstring, len)	_wstdio_fwrite((const wchar_t *)(wstring), len, stream)
> - #define FP_OUT _fp_out_wide
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0048-Fix-a-problem-with-scanning-wide-chars.patch b/package/uclibc/0.9.33.2/0048-Fix-a-problem-with-scanning-wide-chars.patch
> deleted file mode 100644
> index 4baf859..0000000
> --- a/package/uclibc/0.9.33.2/0048-Fix-a-problem-with-scanning-wide-chars.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From 12846e741d925630a4079ac02290b28c6f00b887 Mon Sep 17 00:00:00 2001
> -From: Nathan Sidwell <nathan@codesourcery.com>
> -Date: Fri, 22 Mar 2013 17:46:52 +0100
> -Subject: [PATCH] Fix a problem with scanning wide chars.
> -
> -We found that the testcase
> -
> -int
> -main (void)
> -{
> -  wchar_t s[10];
> -  memset (s, 0, sizeof (s));
> -  int r = sscanf ("s", "%ls", s);
> -  printf ("%d\n", r);
> -  printf ("%ls\n", s);
> -  return 0;
> -}
> -
> -printed
> -0
> -<blankline>
> -
> -rather than the expected
> -1
> -s
> -
> -The problem was the enum in _scanf.c, which has had a 'CONV_m' value
> -inserted. The attached patch fixes the problem in __psfs_parse_spec by
> -not presuming a particular displacement between the two sets of
> -char-like conversion values. With this patch the above program produces
> -the expected output.
> -
> -Signed-off-by: Nathan Sidwell <nathan@codesourcery.com>
> -Signed-off-by: Bernd Schmidt <bernds@codesourcery.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/stdio/_scanf.c |    6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/libc/stdio/_scanf.c b/libc/stdio/_scanf.c
> -index 952853c..3848a09 100644
> ---- a/libc/stdio/_scanf.c
> -+++ b/libc/stdio/_scanf.c
> -@@ -429,8 +429,8 @@ libc_hidden_def(vswscanf)
> - /*                       npxXoudif eEgG  CS  cs[ */
> - /* NOTE: the 'm' flag must come before any convs that support it */
> - 
> --/* NOTE: Ordering is important!  In particular, CONV_LEFTBRACKET
> -- * must immediately precede CONV_c. */
> -+/* NOTE: Ordering is important!  The CONV_{C,S,LEFTBRACKET} must map
> -+   simply to their lowercase equivalents.  */
> - 
> - enum {
> - 	CONV_n = 0,
> -@@ -921,7 +921,7 @@ int attribute_hidden __psfs_parse_spec(register psfs_t *psfs)
> - 				psfs->dataargtype = PA_FLAG_LONG;
> - 			} else if ((p_m_spec_chars >= CONV_c)
> - 				&& (psfs->dataargtype & PA_FLAG_LONG)) {
> --				p_m_spec_chars -= 3; /* lc -> C, ls -> S, l[ -> ?? */
> -+				p_m_spec_chars -= CONV_c - CONV_C; /* lc -> C, ls -> S, l[ -> ?? */
> - 			}
> - 
> - 			psfs->conv_num = p_m_spec_chars;
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0049-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch b/package/uclibc/0.9.33.2/0049-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch
> deleted file mode 100644
> index 1c220db..0000000
> --- a/package/uclibc/0.9.33.2/0049-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From 2f0580cece3ab2baaf9214f434c7146e389566a4 Mon Sep 17 00:00:00 2001
> -From: Nathan Sidwell <nathan@codesourcery.com>
> -Date: Fri, 22 Mar 2013 17:48:51 +0100
> -Subject: [PATCH] Fix some fragileness in dlopen/do_dlopen wrapper & worker
> - pair.
> -
> -do_dlopen contains __builtin_return_address to determine from
> -whence it was called, and uses that to determine which dynamic
> -object's data it should use to start the search.  (In the bug I was
> -tracking, this related to whether the application's RPATH was used or
> -not.)  For that to work, it has to have been inlined into the wrapper
> -function.
> -
> -As it happens, it wasn't being inlined.  That's an unfortunate compiler
> -behaviour, but it isn't wrong and shouldn't have caused dlopen to fail.
> -
> -This patch changes things so the wrapper function determines the
> -return address, and passes it to the worker.  If the worker's inlined,
> -the generated code should be exactly the same as before.
> -
> -Signed-off-by: Nathan Sidwell <nathan@codesourcery.com>
> -Signed-off-by: Bernd Schmidt <bernds@codesourcery.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - ldso/libdl/libdl.c |    8 +++-----
> - 1 file changed, 3 insertions(+), 5 deletions(-)
> -
> -diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
> -index 71ade1f..018c720 100644
> ---- a/ldso/libdl/libdl.c
> -+++ b/ldso/libdl/libdl.c
> -@@ -296,11 +296,10 @@ static ptrdiff_t _dl_build_local_scope (struct elf_resolve **list,
> - 	return p - list;
> - }
> - 
> --static void *do_dlopen(const char *libname, int flag)
> -+static void *do_dlopen(const char *libname, int flag, ElfW(Addr) from)
> - {
> - 	struct elf_resolve *tpnt, *tfrom;
> - 	struct dyn_elf *dyn_chain, *rpnt = NULL, *dyn_ptr, *relro_ptr, *handle;
> --	ElfW(Addr) from;
> - 	struct elf_resolve *tpnt1;
> - 	void (*dl_brk) (void);
> - 	int now_flag;
> -@@ -320,8 +319,6 @@ static void *do_dlopen(const char *libname, int flag)
> - 		return NULL;
> - 	}
> - 
> --	from = (ElfW(Addr)) __builtin_return_address(0);
> --
> - 	if (!_dl_init) {
> - 		_dl_init = true;
> - 		_dl_malloc_function = malloc;
> -@@ -661,7 +658,8 @@ void *dlopen(const char *libname, int flag)
> - 	void *ret;
> - 
> - 	__UCLIBC_MUTEX_CONDITIONAL_LOCK(_dl_mutex, 1);
> --	ret = do_dlopen(libname, flag);
> -+	ret = do_dlopen(libname, flag,
> -+			(ElfW(Addr)) __builtin_return_address(0));
> - 	__UCLIBC_MUTEX_CONDITIONAL_UNLOCK(_dl_mutex, 1);
> - 
> - 	return ret;
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0050-libdl-fix-dlopen-implementation-from-statically-link.patch b/package/uclibc/0.9.33.2/0050-libdl-fix-dlopen-implementation-from-statically-link.patch
> deleted file mode 100644
> index 87a852b..0000000
> --- a/package/uclibc/0.9.33.2/0050-libdl-fix-dlopen-implementation-from-statically-link.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 7f82a682a730899d30d8640b6af5178919339837 Mon Sep 17 00:00:00 2001
> -From: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Date: Thu, 9 May 2013 09:04:20 +0200
> -Subject: [PATCH] libdl: fix dlopen implementation from statically linked
> - application
> -
> -Calling dlopen from statically linked application is actually broken,
> -because _dl_find_hash enters into an infinite loop when trying to
> -resolve symbols. In this case it doesn't need to extend the global
> -scope, it is readyto be used as it is, because _dl_loaded_modules already points
> -to the dlopened library.
> -
> -The patch also fixesi a typo in __LDSO_LD_LIBRARY_PATH__ macro, that was
> -preventing to get the actual value of the LD_LIBRARY_PATH.
> -
> -Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> -(cherry picked from commit 231e4a9b4b972662a6832f714a05525a3754892d)
> -
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> ----
> - ldso/libdl/libdl.c |   11 +++++++++--
> - 1 file changed, 9 insertions(+), 2 deletions(-)
> -
> -diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
> -index 018c720..49711a8 100644
> ---- a/ldso/libdl/libdl.c
> -+++ b/ldso/libdl/libdl.c
> -@@ -374,7 +374,7 @@ static void *do_dlopen(const char *libname, int flag, ElfW(Addr) from)
> - 	if (getenv("LD_BIND_NOW"))
> - 		now_flag = RTLD_NOW;
> - 
> --#if !defined SHARED && defined __LDSO_LIBRARY_PATH__
> -+#if !defined SHARED && defined __LDSO_LD_LIBRARY_PATH__
> - 	/* When statically linked, the _dl_library_path is not yet initialized */
> - 	_dl_library_path = getenv("LD_LIBRARY_PATH");
> - #endif
> -@@ -541,11 +541,18 @@ static void *do_dlopen(const char *libname, int flag, ElfW(Addr) from)
> - 	 * to the GOT tables.  We need to do this in reverse order so that COPY
> - 	 * directives work correctly */
> - 
> --	/* Get the tail of the list */
> -+#ifdef SHARED
> -+	/*
> -+	 * Get the tail of the list.
> -+	 * In the static case doesn't need to extend the global scope, it is
> -+	 * ready to be used as it is, because _dl_loaded_modules already points
> -+	 * to the dlopened library.
> -+	 */
> - 	for (ls = &_dl_loaded_modules->symbol_scope; ls && ls->next; ls = ls->next);
> - 
> - 	/* Extend the global scope by adding the local scope of the dlopened DSO. */
> - 	ls->next = &dyn_chain->dyn->symbol_scope;
> -+#endif
> - #ifdef __mips__
> - 	/*
> - 	 * Relocation of the GOT entries for MIPS have to be done
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0051-libubacktrace-fix-backtrace-for-statically-linked-ap.patch b/package/uclibc/0.9.33.2/0051-libubacktrace-fix-backtrace-for-statically-linked-ap.patch
> deleted file mode 100644
> index b208484..0000000
> --- a/package/uclibc/0.9.33.2/0051-libubacktrace-fix-backtrace-for-statically-linked-ap.patch
> +++ /dev/null
> @@ -1,168 +0,0 @@
> -From 6b2250a1a39362abe53e78a45897caecf65ec73f Mon Sep 17 00:00:00 2001
> -From: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Date: Thu, 9 May 2013 11:42:23 +0200
> -Subject: [PATCH] libubacktrace: fix backtrace for statically linked
> - application
> -
> -libgcc_s.so's unwinder could not access unwind tables of statically
> -linked binaries, so we really want to use _Unwind_* stuff from
> -libgcc_eh.a.
> -It required to build backtrace.c differentiating between shared and
> -static case.
> -
> -Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> -(cherry picked from commit 71c10c484e7dc113396cccb7e503befb759c6346)
> -
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> ----
> - libubacktrace/Makefile.in       |   23 ++++++++++++++---------
> - libubacktrace/arm/Makefile.arch |    2 +-
> - libubacktrace/arm/backtrace.c   |    7 +++++++
> - libubacktrace/backtrace.c       |    7 +++++++
> - 4 files changed, 29 insertions(+), 10 deletions(-)
> -
> -diff --git a/libubacktrace/Makefile.in b/libubacktrace/Makefile.in
> -index 8a4b081..612bf2d 100644
> ---- a/libubacktrace/Makefile.in
> -+++ b/libubacktrace/Makefile.in
> -@@ -25,11 +25,13 @@ libubacktrace_ARCH_OUT:=$(libubacktrace_OUT)/$(TARGET_ARCH)
> - -include $(libubacktrace_ARCH_DIR)/Makefile.arch
> - 
> - libubacktrace_SRC-y :=
> --libubacktrace_SRC-$(UCLIBC_HAS_BACKTRACE) := backtrace.c backtracesyms.c backtracesymsfd.c
> -+libubacktrace_SRC-$(UCLIBC_HAS_BACKTRACE) := backtracesyms.c backtracesymsfd.c
> -+libubacktrace_SRC_SHARED-$(UCLIBC_HAS_BACKTRACE) := backtrace.c
> - 
> - # remove generic sources, if arch specific version is present
> - ifneq ($(strip $(libubacktrace_ARCH_SRC-y)),)
> - libubacktrace_SRC-y := $(filter-out $(notdir $(libubacktrace_ARCH_SRC-y)),$(libubacktrace_SRC-y))
> -+libubacktrace_SRC_SHARED-y := $(filter-out $(notdir $(libubacktrace_ARCH_SRC-y)),$(libubacktrace_SRC_SHARED-y))
> - endif
> - 
> - # -fasynchronous-unwind-tables is required for backtrace to work using dwarf2
> -@@ -43,12 +45,19 @@ endif
> - libubacktrace_SRCS := $(patsubst %.c,$(libubacktrace_DIR)/%.c,$(libubacktrace_SRC-y))
> - libubacktrace_OBJS := $(patsubst $(libubacktrace_DIR)/%.c,$(libubacktrace_OUT)/%.o,$(libubacktrace_SRCS))
> - 
> -+libubacktrace_SHARED_SRCS := $(patsubst %.c,$(libubacktrace_DIR)/%.c,$(libubacktrace_SHARED_SRC-y))
> -+libubacktrace_SHARED_OBJS := $(patsubst $(libubacktrace_DIR)/%.c,$(libubacktrace_OUT)/%.s,$(libubacktrace_SHARED_SRCS))
> -+
> -+libubacktrace-shared-y	:= $(libubacktrace_SHARED_OBJS:.os=.oS)
> -+libubacktrace-static-y	:= $(libubacktrace_SHARED_OBJS)
> -+
> - ifeq ($(DOPIC),y)
> --libubacktrace-a-y += $(libubacktrace_OBJS:.o=.os)
> -+libubacktrace-a-y += $(libubacktrace_OBJS:.o=.os) $(libubacktrace-static-y:.o=.os)
> - else
> --libubacktrace-a-y += $(libubacktrace_OBJS)
> -+libubacktrace-a-y += $(libubacktrace_OBJS) $(libubacktrace-static-y)
> - endif
> --libubacktrace-so-y += $(libubacktrace_OBJS:.o=.os)
> -+libubacktrace-so-y += $(libubacktrace_OBJS:.o=.os) $(libubacktrace-shared-y)
> -+
> - 
> - lib-a-$(UCLIBC_HAS_BACKTRACE) += $(top_builddir)lib/libubacktrace.a
> - lib-so-$(UCLIBC_HAS_BACKTRACE) += $(top_builddir)lib/libubacktrace.so
> -@@ -56,11 +65,7 @@ lib-so-$(UCLIBC_HAS_BACKTRACE) += $(top_builddir)lib/libubacktrace.so
> - objclean-y += CLEAN_libubacktrace
> - 
> - ifeq ($(DOMULTI),n)
> --ifeq ($(DOPIC),y)
> --$(top_builddir)lib/libubacktrace.so: $(top_builddir)lib/libubacktrace.a $(libdl.depend)
> --else
> - $(top_builddir)lib/libubacktrace.so: $(libubacktrace_OUT)/libubacktrace_so.a $(libdl.depend)
> --endif
> - 	$(call link.so,$(libubacktrace_FULL_NAME),$(ABI_VERSION))
> - else
> - $(top_builddir)lib/libubacktrace.so: $(libubacktrace_OUT)/libubacktrace.oS | $(libdl.depend)
> -@@ -71,7 +76,7 @@ $(libubacktrace_OUT)/libubacktrace_so.a: $(libubacktrace-so-y)
> - 	$(Q)$(RM) $@
> - 	$(do_ar)
> - 
> --$(libubacktrace_OUT)/libubacktrace.oS: $(libubacktrace_SRCS) $(libubacktrace_ARCH_SRCS)
> -+$(libubacktrace_OUT)/libubacktrace.oS: $(libubacktrace_SRCS) $(libubacktrace_ARCH_SRCS) $(libubacktrace_SHARED_SRCS)
> - 	$(Q)$(RM) $@
> - 	$(compile-m)
> - 
> -diff --git a/libubacktrace/arm/Makefile.arch b/libubacktrace/arm/Makefile.arch
> -index 53b8c0e..b3fb500 100644
> ---- a/libubacktrace/arm/Makefile.arch
> -+++ b/libubacktrace/arm/Makefile.arch
> -@@ -14,4 +14,4 @@ libubacktrace-a-y+=$(libubacktrace_ARCH_OBJS:.o=.os)
> - else
> - libubacktrace-a-y+=$(libubacktrace_ARCH_OBJS)
> - endif
> --libubacktrace-so-y+=$(libubacktrace_ARCH_OBJS:.o=.os)
> -+libubacktrace-so-y+=$(libubacktrace_ARCH_OBJS:.o=.oS)
> -diff --git a/libubacktrace/arm/backtrace.c b/libubacktrace/arm/backtrace.c
> -index d4eca32..5955189 100644
> ---- a/libubacktrace/arm/backtrace.c
> -+++ b/libubacktrace/arm/backtrace.c
> -@@ -25,6 +25,7 @@ struct trace_arg
> -   int cnt, size;
> - };
> - 
> -+#ifdef SHARED
> - static _Unwind_Reason_Code (*unwind_backtrace) (_Unwind_Trace_Fn, void *);
> - static _Unwind_VRS_Result (*unwind_vrs_get) (_Unwind_Context *,
> - 					     _Unwind_VRS_RegClass,
> -@@ -42,6 +43,10 @@ static void backtrace_init (void)
> - 		abort();
> - 	}
> - }
> -+#else
> -+# define unwind_backtrace _Unwind_Backtrace
> -+# define unwind_vrs_get _Unwind_VRS_Get
> -+#endif
> - /* This function is identical to "_Unwind_GetGR", except that it uses
> -    "unwind_vrs_get" instead of "_Unwind_VRS_Get".  */
> - static inline _Unwind_Word
> -@@ -80,8 +85,10 @@ int backtrace (void **array, int size)
> - {
> - 	struct trace_arg arg = { .array = array, .size = size, .cnt = -1 };
> - 
> -+#ifdef SHARED
> - 	if (unwind_backtrace == NULL)
> - 		backtrace_init();
> -+#endif
> - 
> - 	if (size >= 1)
> - 		unwind_backtrace (backtrace_helper, &arg);
> -diff --git a/libubacktrace/backtrace.c b/libubacktrace/backtrace.c
> -index fdd5981..1e0a0ec 100644
> ---- a/libubacktrace/backtrace.c
> -+++ b/libubacktrace/backtrace.c
> -@@ -33,6 +33,7 @@ struct trace_arg
> -   int cnt, size;
> - };
> - 
> -+#ifdef SHARED
> - static _Unwind_Reason_Code (*unwind_backtrace) (_Unwind_Trace_Fn, void *);
> - static _Unwind_Ptr (*unwind_getip) (struct _Unwind_Context *);
> - 
> -@@ -47,6 +48,10 @@ static void backtrace_init (void)
> - 		abort();
> - 	}
> - }
> -+#else
> -+# define unwind_backtrace _Unwind_Backtrace
> -+# define unwind_getip _Unwind_GetIP
> -+#endif
> - 
> - static _Unwind_Reason_Code
> - backtrace_helper (struct _Unwind_Context *ctx, void *a)
> -@@ -71,8 +76,10 @@ int backtrace (void **array, int size)
> - {
> - 	struct trace_arg arg = { .array = array, .size = size, .cnt = -1 };
> - 
> -+#ifdef SHARED
> - 	if (unwind_backtrace == NULL)
> - 		backtrace_init();
> -+#endif
> - 
> - 	if (size >= 1)
> - 		unwind_backtrace (backtrace_helper, &arg);
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0052-libubacktrace-fix-build-due-to-some-typos.patch b/package/uclibc/0.9.33.2/0052-libubacktrace-fix-build-due-to-some-typos.patch
> deleted file mode 100644
> index 42105cf..0000000
> --- a/package/uclibc/0.9.33.2/0052-libubacktrace-fix-build-due-to-some-typos.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From bcfb096af20bac667381c1601e54c78bcbb09d42 Mon Sep 17 00:00:00 2001
> -From: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Date: Mon, 13 May 2013 14:06:11 +0200
> -Subject: [PATCH] libubacktrace: fix build due to some typos
> -
> -Commit 71c10c484e7dc113396cccb7e503befb759c6346 broke libubactrace build
> -due to some typos, so that backtrace.o[sS] were not built.
> -This definetively fixes this problem.
> -
> -Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> -(cherry picked from commit e19afed1bd3af6bf8976912517c0677d238309f8)
> -
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> ----
> - libubacktrace/Makefile.in |    6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/libubacktrace/Makefile.in b/libubacktrace/Makefile.in
> -index 612bf2d..1cd5f83 100644
> ---- a/libubacktrace/Makefile.in
> -+++ b/libubacktrace/Makefile.in
> -@@ -45,10 +45,10 @@ endif
> - libubacktrace_SRCS := $(patsubst %.c,$(libubacktrace_DIR)/%.c,$(libubacktrace_SRC-y))
> - libubacktrace_OBJS := $(patsubst $(libubacktrace_DIR)/%.c,$(libubacktrace_OUT)/%.o,$(libubacktrace_SRCS))
> - 
> --libubacktrace_SHARED_SRCS := $(patsubst %.c,$(libubacktrace_DIR)/%.c,$(libubacktrace_SHARED_SRC-y))
> --libubacktrace_SHARED_OBJS := $(patsubst $(libubacktrace_DIR)/%.c,$(libubacktrace_OUT)/%.s,$(libubacktrace_SHARED_SRCS))
> -+libubacktrace_SHARED_SRCS := $(patsubst %.c,$(libubacktrace_DIR)/%.c,$(libubacktrace_SRC_SHARED-y))
> -+libubacktrace_SHARED_OBJS := $(patsubst $(libubacktrace_DIR)/%.c,$(libubacktrace_OUT)/%.o,$(libubacktrace_SHARED_SRCS))
> - 
> --libubacktrace-shared-y	:= $(libubacktrace_SHARED_OBJS:.os=.oS)
> -+libubacktrace-shared-y	:= $(libubacktrace_SHARED_OBJS:.o=.oS)
> - libubacktrace-static-y	:= $(libubacktrace_SHARED_OBJS)
> - 
> - ifeq ($(DOPIC),y)
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0053-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch b/package/uclibc/0.9.33.2/0053-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch
> deleted file mode 100644
> index 3197a21..0000000
> --- a/package/uclibc/0.9.33.2/0053-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From b8fb56dcd9686d1bdaf02c2f4f395bb185c093d7 Mon Sep 17 00:00:00 2001
> -From: Carmelo Amoroso <carmelo.amoroso@st.com>
> -Date: Mon, 27 May 2013 16:30:36 +0200
> -Subject: [PATCH] libc: elf: explicitly include uClibc_page.h to make
> - PAGE_SIZE visible
> -
> -Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono@st.com>
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> -(cherry picked from commit 215c2868aca096364a4725a42c3ffb46dc4e8b39)
> -
> -Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> ----
> - libc/misc/elf/dl-support.c |    1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libc/misc/elf/dl-support.c b/libc/misc/elf/dl-support.c
> -index f194692..908fb06 100644
> ---- a/libc/misc/elf/dl-support.c
> -+++ b/libc/misc/elf/dl-support.c
> -@@ -19,6 +19,7 @@
> - #include <ldsodefs.h>
> - #include <string.h>
> - #endif
> -+#include <bits/uClibc_page.h>
> - 
> - #if defined(USE_TLS) && USE_TLS
> - 
> --- 
> -1.7.10.4
> -
> diff --git a/package/uclibc/0.9.33.2/0055-Use-new-bits-scheme-for-arch-specific-flag.patch b/package/uclibc/0.9.33.2/0055-Use-new-bits-scheme-for-arch-specific-flag.patch
> deleted file mode 100644
> index 3d966ff..0000000
> --- a/package/uclibc/0.9.33.2/0055-Use-new-bits-scheme-for-arch-specific-flag.patch
> +++ /dev/null
> @@ -1,284 +0,0 @@
> -From c1a78badec59b1ebd303ace8257ca86fa1e14acb Mon Sep 17 00:00:00 2001
> -From: Hiroaki KAWAI <kawai@stratosphere.co.jp>
> -Date: Fri, 19 Apr 2013 10:09:35 +0900
> -Subject: [PATCH-0.9.33] eventfd.h: Use new "bits/" scheme for arch-specific flags
> -
> -As in timerfd.h, eventfd.h needs arch-specific definition files.
> -alpha, mips and sparc needs separate file, all the other arch
> -will use common definition.
> -
> -This problem is already fixed in glibc.
> -
> -Also sanitize and provide bits for hppa.
> -Make sure not to install the new bits/eventfd unless eventfd support is
> -enabled.
> -
> -Signed-off-by: Hiroaki KAWAI <kawai@stratosphere.co.jp>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - Makefile.in                              |  1 +
> - libc/sysdeps/linux/alpha/bits/eventfd.h  | 31 +++++++++++++++++++++++++++++++
> - libc/sysdeps/linux/common/bits/eventfd.h | 31 +++++++++++++++++++++++++++++++
> - libc/sysdeps/linux/common/sys/eventfd.h  | 25 +++++++++++++------------
> - libc/sysdeps/linux/hppa/bits/eventfd.h   | 32 ++++++++++++++++++++++++++++++++
> - libc/sysdeps/linux/mips/bits/eventfd.h   | 31 +++++++++++++++++++++++++++++++
> - libc/sysdeps/linux/sparc/bits/eventfd.h  | 31 +++++++++++++++++++++++++++++++
> - 7 files changed, 170 insertions(+), 12 deletions(-)
> - create mode 100644 libc/sysdeps/linux/alpha/bits/eventfd.h
> - create mode 100644 libc/sysdeps/linux/common/bits/eventfd.h
> - create mode 100644 libc/sysdeps/linux/hppa/bits/eventfd.h
> - create mode 100644 libc/sysdeps/linux/mips/bits/eventfd.h
> - create mode 100644 libc/sysdeps/linux/sparc/bits/eventfd.h
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 9ba590d..633358f 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -271,6 +271,7 @@ HEADERS_RM-$(UCLIBC_HAS_WORDEXP)             += wordexp.h
> - HEADERS_RM-$(UCLIBC_HAS_XATTR)               += sys/xattr.h
> - HEADERS_RM-$(UCLIBC_HAS_XLOCALE)             += xlocale.h
> - HEADERS_RM-$(UCLIBC_LINUX_SPECIFIC)          += sys/eventfd.h sys/fsuid.h \
> -+	bits/eventfd.h \
> - 	bits/inotify.h \
> - 	sys/inotify.h \
> - 	sys/kdaemon.h \
> -diff --git a/libc/sysdeps/linux/alpha/bits/eventfd.h b/libc/sysdeps/linux/alpha/bits/eventfd.h
> -new file mode 100644
> -index 0000000..b5a7e41
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/alpha/bits/eventfd.h
> -@@ -0,0 +1,31 @@
> -+/* Copyright (C) 2007-2013 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef	_SYS_EVENTFD_H
> -+# error "Never use <bits/eventfd.h> directly; include <sys/eventfd.h> instead."
> -+#endif
> -+
> -+/* Flags for eventfd.  */
> -+enum
> -+  {
> -+    EFD_SEMAPHORE = 000000001,
> -+#define EFD_SEMAPHORE EFD_SEMAPHORE
> -+    EFD_CLOEXEC   = 010000000,
> -+#define EFD_CLOEXEC EFD_CLOEXEC
> -+    EFD_NONBLOCK  = 000000004
> -+#define EFD_NONBLOCK EFD_NONBLOCK
> -+  };
> -diff --git a/libc/sysdeps/linux/common/bits/eventfd.h b/libc/sysdeps/linux/common/bits/eventfd.h
> -new file mode 100644
> -index 0000000..ef49c61
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/common/bits/eventfd.h
> -@@ -0,0 +1,31 @@
> -+/* Copyright (C) 2007-2013 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef	_SYS_EVENTFD_H
> -+# error "Never use <bits/eventfd.h> directly; include <sys/eventfd.h> instead."
> -+#endif
> -+
> -+/* Flags for eventfd.  */
> -+enum
> -+  {
> -+    EFD_SEMAPHORE = 00000001,
> -+#define EFD_SEMAPHORE EFD_SEMAPHORE
> -+    EFD_CLOEXEC = 02000000,
> -+#define EFD_CLOEXEC EFD_CLOEXEC
> -+    EFD_NONBLOCK = 00004000
> -+#define EFD_NONBLOCK EFD_NONBLOCK
> -+  };
> -diff --git a/libc/sysdeps/linux/common/sys/eventfd.h b/libc/sysdeps/linux/common/sys/eventfd.h
> -index 311f803..8686355 100644
> ---- a/libc/sysdeps/linux/common/sys/eventfd.h
> -+++ b/libc/sysdeps/linux/common/sys/eventfd.h
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 2007, 2008, 2009 Free Software Foundation, Inc.
> -+/* Copyright (C) 2007-2013 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> - 
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -21,21 +21,12 @@
> - 
> - #include <stdint.h>
> - 
> -+/* Get the platform-dependent flags.  */
> -+#include <bits/eventfd.h>
> - 
> - /* Type for event counter.  */
> - typedef uint64_t eventfd_t;
> - 
> --/* Flags for signalfd.  */
> --enum
> --  {
> --    EFD_SEMAPHORE = 1,
> --#define EFD_SEMAPHORE EFD_SEMAPHORE
> --    EFD_CLOEXEC = 02000000,
> --#define EFD_CLOEXEC EFD_CLOEXEC
> --    EFD_NONBLOCK = 04000
> --#define EFD_NONBLOCK EFD_NONBLOCK
> --  };
> --
> - 
> - __BEGIN_DECLS
> - 
> -@@ -43,6 +34,16 @@ __BEGIN_DECLS
> -    value to COUNT.  */
> - extern int eventfd (int __count, int __flags) __THROW;
> - 
> -+#if 0 /* not (yet) implemented in uClibc */
> -+
> -+/* Read event counter and possibly wait for events.  */
> -+extern int eventfd_read (int __fd, eventfd_t *__value);
> -+
> -+/* Increment event counter.  */
> -+extern int eventfd_write (int __fd, eventfd_t __value);
> -+
> -+#endif
> -+
> - __END_DECLS
> - 
> - #endif /* sys/eventfd.h */
> -diff --git a/libc/sysdeps/linux/hppa/bits/eventfd.h b/libc/sysdeps/linux/hppa/bits/eventfd.h
> -new file mode 100644
> -index 0000000..6182c07
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/hppa/bits/eventfd.h
> -@@ -0,0 +1,32 @@
> -+/* Copyright (C) 2007-2013 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library.  If not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef	_SYS_EVENTFD_H
> -+# error "Never use <bits/eventfd.h> directly; include <sys/eventfd.h> instead."
> -+#endif
> -+
> -+/* Flags for signalfd.  */
> -+enum
> -+  {
> -+    EFD_SEMAPHORE = 000000001,
> -+#define EFD_SEMAPHORE EFD_SEMAPHORE
> -+    EFD_CLOEXEC   = 010000000,
> -+#define EFD_CLOEXEC EFD_CLOEXEC
> -+/* the below value looks suspicious, should be 000200004 for consistency */
> -+    EFD_NONBLOCK  = 00200004 /* HPUX has separate NDELAY & NONBLOCK */
> -+#define EFD_NONBLOCK EFD_NONBLOCK
> -+  };
> -diff --git a/libc/sysdeps/linux/mips/bits/eventfd.h b/libc/sysdeps/linux/mips/bits/eventfd.h
> -new file mode 100644
> -index 0000000..17b2f46
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/mips/bits/eventfd.h
> -@@ -0,0 +1,31 @@
> -+/* Copyright (C) 2007-2013 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef	_SYS_EVENTFD_H
> -+# error "Never use <bits/eventfd.h> directly; include <sys/eventfd.h> instead."
> -+#endif
> -+
> -+/* Flags for eventfd.  */
> -+enum
> -+  {
> -+    EFD_SEMAPHORE = 00000001,
> -+#define EFD_SEMAPHORE EFD_SEMAPHORE
> -+    EFD_CLOEXEC = 02000000,
> -+#define EFD_CLOEXEC EFD_CLOEXEC
> -+    EFD_NONBLOCK = 00000200
> -+#define EFD_NONBLOCK EFD_NONBLOCK
> -+  };
> -diff --git a/libc/sysdeps/linux/sparc/bits/eventfd.h b/libc/sysdeps/linux/sparc/bits/eventfd.h
> -new file mode 100644
> -index 0000000..bed9f09
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/sparc/bits/eventfd.h
> -@@ -0,0 +1,31 @@
> -+/* Copyright (C) 2007-2013 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+#ifndef	_SYS_EVENTFD_H
> -+# error "Never use <bits/eventfd.h> directly; include <sys/eventfd.h> instead."
> -+#endif
> -+
> -+/* Flags for eventfd.  */
> -+enum
> -+  {
> -+    EFD_SEMAPHORE = 1,
> -+#define EFD_SEMAPHORE EFD_SEMAPHORE
> -+    EFD_CLOEXEC = 0x400000,
> -+#define EFD_CLOEXEC EFD_CLOEXEC
> -+    EFD_NONBLOCK = 0x004000
> -+#define EFD_NONBLOCK EFD_NONBLOCK
> -+  };
> --- 
> -1.8.1.2
> -
> diff --git a/package/uclibc/0.9.33.2/0055-siginfo_h-add-a-missing-function-member.patch b/package/uclibc/0.9.33.2/0055-siginfo_h-add-a-missing-function-member.patch
> deleted file mode 100644
> index 1a837bb..0000000
> --- a/package/uclibc/0.9.33.2/0055-siginfo_h-add-a-missing-function-member.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -siginfo.h: add a missing function member on ia64, mips and sparc arches
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -From b4e6e61e2f7c6fb4bf59f66efaa74591a2112912 Mon Sep 17 00:00:00 2001
> -From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -Date: Thu, 02 Jan 2014 15:02:11 +0000
> -Subject: siginfo.h: add a missing function member on ia64, mips and sparc arches
> -
> -Add "__pid_t _tid" member which is used for some packages, like rt-test
> -for instance, which fails with an error like this one:
> -
> -src/cyclictest/cyclictest.c:638:9: error: 'union <anonymous>' has no
> -member named '_tid'
> -
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> -(limited to 'libc/sysdeps/linux')
> -
> -diff --git a/libc/sysdeps/linux/ia64/bits/siginfo.h b/libc/sysdeps/linux/ia64/bits/siginfo.h
> -index f571f46..82cc73f 100644
> ---- a/libc/sysdeps/linux/ia64/bits/siginfo.h
> -+++ b/libc/sysdeps/linux/ia64/bits/siginfo.h
> -@@ -309,6 +309,10 @@ typedef struct sigevent
> -       {
> - 	int _pad[__SIGEV_PAD_SIZE];
> - 
> -+	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
> -+	   thread to receive the signal.  */
> -+	__pid_t _tid;
> -+
> - 	struct
> - 	  {
> - 	    void (*_function) (sigval_t);	/* Function to start.  */
> -diff --git a/libc/sysdeps/linux/mips/bits/siginfo.h b/libc/sysdeps/linux/mips/bits/siginfo.h
> -index 79fb15a..84b08ca 100644
> ---- a/libc/sysdeps/linux/mips/bits/siginfo.h
> -+++ b/libc/sysdeps/linux/mips/bits/siginfo.h
> -@@ -281,6 +281,10 @@ typedef struct sigevent
> -       {
> - 	int _pad[__SIGEV_PAD_SIZE];
> - 
> -+	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
> -+	   thread to receive the signal.  */
> -+	__pid_t _tid;
> -+
> - 	struct
> - 	  {
> - 	    void (*_function) (sigval_t);	/* Function to start.  */
> -diff --git a/libc/sysdeps/linux/sparc/bits/siginfo.h b/libc/sysdeps/linux/sparc/bits/siginfo.h
> -index 6f2d035..3ffeb6d 100644
> ---- a/libc/sysdeps/linux/sparc/bits/siginfo.h
> -+++ b/libc/sysdeps/linux/sparc/bits/siginfo.h
> -@@ -288,6 +288,10 @@ typedef struct sigevent
> -       {
> - 	int _pad[__SIGEV_PAD_SIZE];
> - 
> -+	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
> -+	   thread to receive the signal.  */
> -+	__pid_t _tid;
> -+
> - 	struct
> - 	  {
> - 	    void (*_function) (sigval_t);	/* Function to start.  */
> ---
> -cgit v0.9.1
> diff --git a/package/uclibc/0.9.33.2/0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch b/package/uclibc/0.9.33.2/0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
> deleted file mode 100644
> index c6bd051..0000000
> --- a/package/uclibc/0.9.33.2/0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 2da958760f798224065508431787e3a83b7fe2ae Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Fri, 28 Jun 2013 21:59:54 +0200
> -Subject: [PATCH-0.9.33] MIPS: set _NSIG to 128, not 129. This matches glibc.
> -
> -Prompted by lkml discussion of a MIPS bug where sending
> -signal 128 was found to be able to crash the machine :/
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> ----
> - libc/sysdeps/linux/mips/bits/signum.h | 17 +++++++++++++++--
> - 1 file changed, 15 insertions(+), 2 deletions(-)
> -
> -diff --git a/libc/sysdeps/linux/mips/bits/signum.h b/libc/sysdeps/linux/mips/bits/signum.h
> -index cf9b834..e83250e 100644
> ---- a/libc/sysdeps/linux/mips/bits/signum.h
> -+++ b/libc/sysdeps/linux/mips/bits/signum.h
> -@@ -53,7 +53,20 @@
> - #define SIGXCPU		30	/* CPU limit exceeded (4.2 BSD).  */
> - #define SIGXFSZ		31	/* File size limit exceeded (4.2 BSD).  */
> - 
> --/* Biggest signal number + 1 (including real-time signals).  */
> --#define _NSIG		129
> -+/* MIPS is special by having 128 signals.
> -+ * All (?) other architectures have at most 64 signals.
> -+ * Having 128 signals is problematic because signal nos are 1-based
> -+ * and last signal number is then 128.
> -+ * This plays havoc with WIFSIGNALED and WCOREDUMP in waitpid status word,
> -+ * when process dies from signal 128.
> -+ * Linux kernel 3.9 accepts signal 128, with awful results :/
> -+ * It is being fixed.
> -+ *
> -+ * glibc (accidentally?) papers over this issue by declaring _NSIG to be 128,
> -+ * not 129 (despite claiming that _NSIG is "biggest signal number + 1"
> -+ * in the comment above that definition). We follow suit.
> -+ * Note that this results in __SIGRTMAX == 127. It is intended.
> -+ */
> -+#define _NSIG		128
> - 
> - #endif	/* <signal.h> included.  */
> --- 
> -1.8.1.2
> -
> diff --git a/package/uclibc/0.9.33.2/0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch b/package/uclibc/0.9.33.2/0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
> deleted file mode 100644
> index 1ad84c5..0000000
> --- a/package/uclibc/0.9.33.2/0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -siginfo.h: __SIGEV_PAD_SIZE takes __WORDSIZE into account
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -From b97b4b698b023f75b54f987859c856ab4861ea00 Mon Sep 17 00:00:00 2001
> -From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -Date: Thu, 02 Jan 2014 15:02:12 +0000
> -Subject: siginfo.h: __SIGEV_PAD_SIZE takes __WORDSIZE into account
> -
> -Make __SIGEV_PAD_SIZE to take __WORDSIZE into account for alpha, mips
> -and ia64 arches.
> -
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> -(limited to 'libc/sysdeps/linux')
> -
> -diff --git a/libc/sysdeps/linux/alpha/bits/siginfo.h b/libc/sysdeps/linux/alpha/bits/siginfo.h
> -index 9993f66..0a37ad0 100644
> ---- a/libc/sysdeps/linux/alpha/bits/siginfo.h
> -+++ b/libc/sysdeps/linux/alpha/bits/siginfo.h
> -@@ -257,7 +257,11 @@ enum
> - 
> - /* Structure to transport application-defined values with signals.  */
> - # define __SIGEV_MAX_SIZE	64
> --# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
> -+# if __WORDSIZE == 64
> -+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
> -+# else
> -+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
> -+# endif
> - 
> - typedef struct sigevent
> -   {
> -diff --git a/libc/sysdeps/linux/ia64/bits/siginfo.h b/libc/sysdeps/linux/ia64/bits/siginfo.h
> -index 82cc73f..3ac988b 100644
> ---- a/libc/sysdeps/linux/ia64/bits/siginfo.h
> -+++ b/libc/sysdeps/linux/ia64/bits/siginfo.h
> -@@ -297,7 +297,11 @@ enum
> - 
> - /* Structure to transport application-defined values with signals.  */
> - # define __SIGEV_MAX_SIZE	64
> --# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
> -+# if __WORDSIZE == 64
> -+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
> -+# else
> -+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
> -+# endif
> - 
> - typedef struct sigevent
> -   {
> -diff --git a/libc/sysdeps/linux/mips/bits/siginfo.h b/libc/sysdeps/linux/mips/bits/siginfo.h
> -index 84b08ca..a6e4135 100644
> ---- a/libc/sysdeps/linux/mips/bits/siginfo.h
> -+++ b/libc/sysdeps/linux/mips/bits/siginfo.h
> -@@ -264,8 +264,11 @@ enum
> - 
> - /* Structure to transport application-defined values with signals.  */
> - # define __SIGEV_MAX_SIZE	64
> --# define __SIGEV_HEAD_SIZE	(sizeof(long) + 2*sizeof(int))
> --# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE - __SIGEV_HEAD_SIZE) / sizeof (int))
> -+# if __WORDSIZE == 64
> -+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
> -+# else
> -+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
> -+# endif
> - 
> - /* Forward declaration of the `pthread_attr_t' type.  */
> - struct __pthread_attr_s;
> ---
> -cgit v0.9.1
> diff --git a/package/uclibc/0.9.33.2/0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch b/package/uclibc/0.9.33.2/0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch
> deleted file mode 100644
> index d5922f6..0000000
> --- a/package/uclibc/0.9.33.2/0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 4a96b948687166da26a6c327e6c6733ad2336c5c Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Thu, 18 Jul 2013 21:57:06 +0200
> -Subject: [PATCH-0.9.33] bits/waitstatus.h: correctly interpret status 0x007f on
> - MIPS
> -
> -On other architectures exit status of 0x007f is not possible,
> -they don't have signal 127.
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> ----
> - libc/sysdeps/linux/common/bits/waitstatus.h | 16 ++++++++++++----
> - 1 file changed, 12 insertions(+), 4 deletions(-)
> -
> -diff --git a/libc/sysdeps/linux/common/bits/waitstatus.h b/libc/sysdeps/linux/common/bits/waitstatus.h
> -index 45d0fd3..33f39a8 100644
> ---- a/libc/sysdeps/linux/common/bits/waitstatus.h
> -+++ b/libc/sysdeps/linux/common/bits/waitstatus.h
> -@@ -24,7 +24,7 @@
> - /* Everything extant so far uses these same bits.  */
> - 
> - 
> --/* If WIFEXITED(STATUS), the low-order 8 bits of the status.  */
> -+/* If WIFEXITED(STATUS), the low-order 8 bits of exit(N).  */
> - #define	__WEXITSTATUS(status)	(((status) & 0xff00) >> 8)
> - 
> - /* If WIFSIGNALED(STATUS), the terminating signal.  */
> -@@ -36,12 +36,20 @@
> - /* Nonzero if STATUS indicates normal termination.  */
> - #define	__WIFEXITED(status)	(__WTERMSIG(status) == 0)
> - 
> --/* Nonzero if STATUS indicates termination by a signal.  */
> --#define __WIFSIGNALED(status) \
> --  (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)
> -+/* Nonzero if STATUS indicates termination by a signal.
> -+ * Note that status 0x007f is "died from signal 127", not "stopped by signal 0".
> -+ * This does happen on MIPS.
> -+ * The comparison is "< 0xff", not "< 0x7f", because WCOREDUMP bit (0x80)
> -+ * can be set too.
> -+ */
> -+#define	__WIFSIGNALED(status)	(((unsigned)((status) & 0xffff) - 1U) < 0xffU)
> - 
> - /* Nonzero if STATUS indicates the child is stopped.  */
> -+#if !defined(__mips__)
> - #define	__WIFSTOPPED(status)	(((status) & 0xff) == 0x7f)
> -+#else
> -+#define	__WIFSTOPPED(status)	(((status) & 0xff) == 0x7f && ((status) & 0xff00))
> -+#endif
> - 
> - /* Nonzero if STATUS indicates the child continued after a stop.  We only
> -    define this if <bits/waitflags.h> provides the WCONTINUED flag bit.  */
> --- 
> -1.8.1.2
> -
> diff --git a/package/uclibc/0.9.33.2/0058-test-tls-fix-build-with-newer-binutils.patch b/package/uclibc/0.9.33.2/0058-test-tls-fix-build-with-newer-binutils.patch
> deleted file mode 100644
> index 04dfb1e..0000000
> --- a/package/uclibc/0.9.33.2/0058-test-tls-fix-build-with-newer-binutils.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 931e8391565323ed2e589c83b83a7345813a5514 Mon Sep 17 00:00:00 2001
> -From: Baruch Siach <baruch@tkos.co.il>
> -Date: Wed, 02 Oct 2013 07:08:29 +0000
> -Subject: test: tls: fix build with newer binutils
> -
> -Fix the following build failures:
> -
> -ld: tst-tls10.o: undefined reference to symbol 'f2a'
> -ld: tst-tls12.o: undefined reference to symbol 'a1'
> -
> -binutils ld defaults to --no-copy-dt-needed-entries since version 2.22. Add
> -library dependencies explicitly.
> -
> -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> -(limited to 'test')
> -
> -diff --git a/test/tls/Makefile.in b/test/tls/Makefile.in
> -index 875c607..7ab4e2a 100644
> ---- a/test/tls/Makefile.in
> -+++ b/test/tls/Makefile.in
> -@@ -102,9 +102,9 @@ LDFLAGS_tst-tls6 := -ldl
> - LDFLAGS_tst-tls7 := -ldl
> - LDFLAGS_tst-tls8 := -ldl
> - LDFLAGS_tst-tls9 := -ldl
> --LDFLAGS_tst-tls10 := -Wl,-rpath-link=. tst-tlsmod8.so
> --LDFLAGS_tst-tls11 := -Wl,-rpath-link=. tst-tlsmod10.so
> --LDFLAGS_tst-tls12 := -Wl,-rpath-link=. tst-tlsmod12.so
> -+LDFLAGS_tst-tls10 := -Wl,-rpath-link=. tst-tlsmod8.so tst-tlsmod7.so
> -+LDFLAGS_tst-tls11 := -Wl,-rpath-link=. tst-tlsmod9.so tst-tlsmod10.so
> -+LDFLAGS_tst-tls12 := -Wl,-rpath-link=. tst-tlsmod11.so tst-tlsmod12.so
> - LDFLAGS_tst-tls13 := -ldl -Wl,-rpath-link=.
> - LDFLAGS_tst-tls14 := -ldl -Wl,-rpath-link=. tst-tlsmod14a.so
> - LDFLAGS_tst-tls15 := -ldl -Wl,-rpath-link=.
> ---
> -cgit v0.9.1
> diff --git a/package/uclibc/0.9.33.2/0059-test-cater-for-config.patch b/package/uclibc/0.9.33.2/0059-test-cater-for-config.patch
> deleted file mode 100644
> index f44c92c..0000000
> --- a/package/uclibc/0.9.33.2/0059-test-cater-for-config.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From 7598eeaa1defa2884adaa890bb115c493d69cc35 Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Sat, 23 Feb 2013 06:39:41 +0000
> -Subject: test: cater for config
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> -(limited to 'test')
> -
> -diff --git a/test/math/Makefile.in b/test/math/Makefile.in
> -index e76cbdb..beef650 100644
> ---- a/test/math/Makefile.in
> -+++ b/test/math/Makefile.in
> -@@ -1,14 +1,16 @@
> - # uClibc math tests
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - 
> --TESTS := basic-test tst-definitions test-fpucw test-float test-ifloat test-double test-idouble \
> --    rint signgam ilogb
> - # gamma (removed from TESTS, need to add "small errors are ok" machinery there)
> --ifeq ($(UCLIBC_HAS_LONG_DOUBLE_MATH),y)
> --TESTS += test-ldouble test-ildoubl compile_test c99_test
> -+TESTS_DISABLED := gamma
> -+ifeq ($(UCLIBC_HAS_LONG_DOUBLE_MATH),)
> -+TESTS_DISABLED += test-ldouble test-ildoubl compile_test c99_test
> - else
> - CFLAGS_basic-test := -DNO_LONG_DOUBLE
> - endif
> -+ifeq ($(DO_C99_MATH),)
> -+TESTS_DISABLED += test-float test-ifloat test-double test-idouble rint signgam ilogb
> -+endif
> - 
> - DODIFF_rint     := 1
> - DODIFF_signgam  := 1
> -diff --git a/test/misc/Makefile.in b/test/misc/Makefile.in
> -index 9b74d22..52a3e71 100644
> ---- a/test/misc/Makefile.in
> -+++ b/test/misc/Makefile.in
> -@@ -4,6 +4,7 @@
> - TESTS_DISABLED := outb tst-fnmatch bug-glob1 tst-gnuglob
> - ifeq  ($(UCLIBC_HAS_LFS),)
> - TESTS_DISABLED += dirent64
> -+TESTS_DISABLED += tst-statfs # assuming host has LFS on
> - endif
> - CFLAGS_dirent64 := -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> - 
> -diff --git a/test/misc/tst-statfs.c b/test/misc/tst-statfs.c
> -index 44ab3aa..b8b4229 100644
> ---- a/test/misc/tst-statfs.c
> -+++ b/test/misc/tst-statfs.c
> -@@ -1,5 +1,3 @@
> --#define _FILE_OFFSET_BITS 64
> --
> - #include <sys/vfs.h>
> - #include <errno.h>
> - #include <stdio.h>
> -diff --git a/test/misc/tst-statvfs.c b/test/misc/tst-statvfs.c
> -index c1e8fde..4b67719 100644
> ---- a/test/misc/tst-statvfs.c
> -+++ b/test/misc/tst-statvfs.c
> -@@ -1,5 +1,3 @@
> --#define _FILE_OFFSET_BITS 64
> --
> - #include <sys/statvfs.h>
> - #include <errno.h>
> - #include <stdio.h>
> -diff --git a/test/unistd/Makefile.in b/test/unistd/Makefile.in
> -index 24b9a37..cfef22e 100644
> ---- a/test/unistd/Makefile.in
> -+++ b/test/unistd/Makefile.in
> -@@ -5,7 +5,7 @@ ifeq ($(UCLIBC_HAS_LFS),)
> - TESTS_DISABLED := tst-preadwrite64 tst-posix_fallocate64
> - endif
> - ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),)
> --TESTS_DISABLED := tst-posix_fallocate
> -+TESTS_DISABLED += tst-posix_fallocate
> - endif
> - OPTS_getopt      := -abcXXX -9
> - OPTS_getopt_long := --add XXX --delete YYY --verbose
> ---
> -cgit v0.9.1
> diff --git a/package/uclibc/0.9.33.2/0060-test-Fix-math-c-dependency.patch b/package/uclibc/0.9.33.2/0060-test-Fix-math-c-dependency.patch
> deleted file mode 100644
> index c6ee47d..0000000
> --- a/package/uclibc/0.9.33.2/0060-test-Fix-math-c-dependency.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From a20a91ad7c042c46e4a2adee6d03315f857f9985 Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Tue, 18 Feb 2014 23:30:28 +0100
> -Subject: [PATCH] test: Fix math .c dependency
> -
> -When explicitly running the compile target we were missing a dependency
> -to generate the libm-test.c.
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - test/math/Makefile.in | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/test/math/Makefile.in b/test/math/Makefile.in
> -index beef650..0285b66 100644
> ---- a/test/math/Makefile.in
> -+++ b/test/math/Makefile.in
> -@@ -25,7 +25,8 @@ EXTRA_LDFLAGS   := -lm
> - 
> - PERL := /usr/bin/perl
> - 
> --$(TESTS): libm-test.c
> -+MDEPS := $(wildcard test-*.c)
> -+$(MDEPS): libm-test.c
> - 
> - libm-test.c: libm-test-ulps-$(TARGET_ARCH) libm-test.inc gen-libm-test.pl
> - 	$(Q)$(PERL) ./gen-libm-test.pl -u libm-test-ulps-$(TARGET_ARCH) ./libm-test.inc -o "." 2>&1 > /dev/null
> --- 
> -1.9.3
> -
> diff --git a/package/uclibc/0.9.33.2/0061-fix-sparc-networking.patch b/package/uclibc/0.9.33.2/0061-fix-sparc-networking.patch
> deleted file mode 100644
> index 1272950..0000000
> --- a/package/uclibc/0.9.33.2/0061-fix-sparc-networking.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -
> -Bug introduced by uclibc-0035-socket.h-pull-socket_type.h-from-eglibc.patch
> -Sent upstream: http://lists.uclibc.org/pipermail/uclibc/2014-July/048438.html
> -
> -diff -Nur uClibc-0.9.33.2.orig/libc/inet/socketcalls.c uClibc-0.9.33.2/libc/inet/socketcalls.c
> ---- uClibc-0.9.33.2.orig/libc/inet/socketcalls.c	2012-05-15 09:20:09.000000000 +0200
> -+++ uClibc-0.9.33.2/libc/inet/socketcalls.c	2014-07-28 14:50:52.477479493 +0200
> -@@ -34,6 +34,30 @@
> - #define SYS_ACCEPT4     18
> - #endif
> - 
> -+/* for sparc: __NR_socket and others are defined, but syscalls are not implemen
> -+/* see http://lists.busybox.net/pipermail/uclibc/2004-March/029424.html */
> -+#ifdef __sparc__
> -+#undef __NR_accept
> -+#undef __NR_accept4
> -+#undef __NR_bind
> -+#undef __NR_connect
> -+#undef __NR_getpeername
> -+#undef __NR_getsockname
> -+#undef __NR_getsockopt
> -+#undef __NR_listen
> -+#undef __NR_recv
> -+#undef __NR_recvfrom
> -+#undef __NR_recvmsg
> -+#undef __NR_send
> -+#undef __NR_sendmsg
> -+#undef __NR_sendto
> -+#undef __NR_setsockopt
> -+#undef __NR_shutdown
> -+#undef __NR_socket
> -+#undef __NR_socketpair
> -+#endif
> -+
> -+
> - #ifdef __UCLIBC_HAS_THREADS_NATIVE__
> - #include <sysdep-cancel.h>
> - #include <pthreadP.h>
> diff --git a/package/uclibc/0.9.33.2/0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch b/package/uclibc/0.9.33.2/0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch
> deleted file mode 100644
> index 30ac71a..0000000
> --- a/package/uclibc/0.9.33.2/0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -uClibc: ldso/libdl: Also include dl-tls.h for for !SHARED.
> -
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -From b57e9640db53166c88cdac66b79a046e46b8d728 Mon Sep 17 00:00:00 2001
> -From: Gregory Fong <gregory.0xf0@gmail.com>
> -Date: Mon, 3 Jun 2013 13:32:55 -0700
> -Subject: [PATCH] ldso/libdl: Also include dl-tls.h for for !SHARED.
> -
> -On MIPS, several relocations that were original only resolved by the
> -dynamic linker were reused as static relocations.  Consequently the
> -macros TLS_DTPREL_VALUE and TLS_TPREL_VALUE defined in
> -libpthread/nptl/sysdeps/mips/dl-tls.h need to be available even for
> -!SHARED.
> -
> -Relevant: http://www.linux-mips.org/wiki/NPTL#History
> -
> -Original patch by Vincent Wen <wenvincent@gmail.com>:
> -http://lists.uclibc.org/pipermail/uclibc/2013-April/047707.html
> -
> -When build statically linked applications for MIPS platform,
> -sometimes the linker fails with following errors:
> -undefined reference to TLS_DTPREL_VALUE
> -undefined reference to TLS_TPREL_VALUE
> -The include of dl-tls.h is only in code guarded by SHARED,
> -Removing the SHARED compilation option to cover static link too.
> -
> -Signed-off-by: Vincent Wen <wenvincent90@gmail.com>
> -
> -Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - ldso/libdl/libdl.c |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
> -index 3a78696..ed4e735 100644
> ---- a/ldso/libdl/libdl.c
> -+++ b/ldso/libdl/libdl.c
> -@@ -42,6 +42,7 @@
> - 
> - #if defined(USE_TLS) && USE_TLS
> - #include <ldsodefs.h>
> -+#include <dl-tls.h>
> - extern void _dl_add_to_slotinfo(struct link_map  *l);
> - #endif
> - 
> -@@ -51,7 +52,6 @@ __UCLIBC_MUTEX_STATIC(_dl_mutex, PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP);
> - 
> - #ifdef SHARED
> - # if defined(USE_TLS) && USE_TLS
> --# include <dl-tls.h>
> - extern struct link_map *_dl_update_slotinfo(unsigned long int req_modid);
> - # endif
> - 
> --- 
> -1.7.1
> -
> diff --git a/package/uclibc/0.9.33.2/0062-nptl-remove-duplicate-vfork-in-libpthread.patch b/package/uclibc/0.9.33.2/0062-nptl-remove-duplicate-vfork-in-libpthread.patch
> deleted file mode 100644
> index 4ab737f..0000000
> --- a/package/uclibc/0.9.33.2/0062-nptl-remove-duplicate-vfork-in-libpthread.patch
> +++ /dev/null
> @@ -1,691 +0,0 @@
> -nptl: remove duplicate vfork() in libpthread
> -
> -Automatic patching via two oneliners by Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
> -sed -i -e 's/[[:space:]]pt-vfork\.[csS]//' $(git grep -l pt-vfork libpthread/nptl/sysdeps)
> -find libpthread/nptl -name "*pt-vfork*" -exec git rm {} \;
> -
> -Reported-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ----
> - .../nptl/sysdeps/unix/sysv/linux/alpha/pt-vfork.S  | 43 --------------
> - .../nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch |  2 +-
> - .../nptl/sysdeps/unix/sysv/linux/arm/pt-vfork.S    | 38 ------------
> - .../sysdeps/unix/sysv/linux/i386/Makefile.arch     |  2 +-
> - .../nptl/sysdeps/unix/sysv/linux/i386/pt-vfork.S   | 68 ----------------------
> - .../sysdeps/unix/sysv/linux/mips/Makefile.arch     |  2 +-
> - .../nptl/sysdeps/unix/sysv/linux/mips/pt-vfork.S   | 38 ------------
> - .../sysdeps/unix/sysv/linux/powerpc/Makefile.arch  |  2 +-
> - .../unix/sysv/linux/powerpc/powerpc32/pt-vfork.S   | 49 ----------------
> - .../unix/sysv/linux/powerpc/powerpc64/pt-vfork.S   | 49 ----------------
> - .../sysdeps/unix/sysv/linux/powerpc/pt-vfork.S     |  5 --
> - .../nptl/sysdeps/unix/sysv/linux/sh/Makefile.arch  |  2 +-
> - .../nptl/sysdeps/unix/sysv/linux/sh/pt-vfork.S     | 65 ---------------------
> - .../sysdeps/unix/sysv/linux/sparc/Makefile.arch    |  2 +-
> - .../nptl/sysdeps/unix/sysv/linux/sparc/pt-vfork.S  |  5 --
> - .../unix/sysv/linux/sparc/sparc32/pt-vfork.S       | 45 --------------
> - .../unix/sysv/linux/sparc/sparc64/pt-vfork.S       | 45 --------------
> - .../sysdeps/unix/sysv/linux/x86_64/Makefile.arch   |  2 +-
> - .../nptl/sysdeps/unix/sysv/linux/x86_64/pt-vfork.S | 33 -----------
> - 19 files changed, 7 insertions(+), 490 deletions(-)
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/alpha/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/arm/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/i386/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/mips/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/powerpc64/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/sh/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/sparc/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/sparc/sparc32/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/sparc/sparc64/pt-vfork.S
> - delete mode 100644 libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/pt-vfork.S
> -
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/alpha/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/alpha/pt-vfork.S
> -deleted file mode 100644
> -index ec5d175..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/alpha/pt-vfork.S
> -+++ /dev/null
> -@@ -1,43 +0,0 @@
> --/* Copyright (C) 2003, 2004 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <sysdep.h>
> --#include <tcb-offsets.h>
> --
> --#undef PSEUDO_PREPARE_ARGS
> --#define PSEUDO_PREPARE_ARGS						\
> --	/* Load the current cached pid value across the vfork.  */	\
> --	rduniq;								\
> --	ldl	a2, PID_OFFSET(v0);					\
> --	mov	v0, a1;							\
> --	/* Write back its negation, to indicate that the pid value is	\
> --	   uninitialized in the the child, and in the window between	\
> --	   here and the point at which we restore the value.  */	\
> --	negl	a2, t0;							\
> --	stl	t0, PID_OFFSET(v0);
> --
> --PSEUDO (__vfork, vfork, 0)
> --
> --	/* If we're back in the parent, restore the saved pid.  */
> --	beq	v0, 1f
> --	stl	a2, PID_OFFSET(a1)
> --1:	ret
> --
> --PSEUDO_END (__vfork)
> --
> --weak_alias (__vfork, vfork)
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
> -index 329d8a9..1b0282d 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
> -@@ -5,7 +5,7 @@
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - #
> - 
> --libpthread_linux_arch_SSRC = pt-vfork.S
> -+libpthread_linux_arch_SSRC =
> - libpthread_linux_arch_CSRC = pthread_once.c \
> - 	pt-__syscall_rt_sigaction.c pt-__syscall_error.c \
> - 	lowlevellock.c
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/pt-vfork.S
> -deleted file mode 100644
> -index 9764e9e..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/pt-vfork.S
> -+++ /dev/null
> -@@ -1,38 +0,0 @@
> --/* Copyright (C) 2005 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <tcb-offsets.h>
> --
> --/* Save the PID value.  */
> --#define SAVE_PID \
> --	str	lr, [sp, #-4]!;		/* Save LR.  */			\
> --	mov	r0, #0xffff0fff;	/* Point to the high page.  */	\
> --	mov	lr, pc;			/* Save our return address.  */	\
> --	sub	pc, r0, #31;		/* Jump to the TLS entry.  */	\
> --	ldr	lr, [sp], #4;		/* Restore LR.  */		\
> --	mov	r2, r0;			/* Save the TLS addr in r2.  */	\
> --	ldr	r3, [r2, #PID_OFFSET];	/* Load the saved PID.  */	\
> --	rsb	r0, r3, #0;		/* Negate it.  */		\
> --	str	r0, [r2, #PID_OFFSET]	/* Store the temporary PID.  */
> --
> --/* Restore the old PID value in the parent.  */
> --#define RESTORE_PID \
> --	cmp	r0, #0;			/* If we are the parent... */	\
> --	strne	r3, [r2, #PID_OFFSET]	/* ... restore the saved PID.  */
> --
> --#INCLUDE <../../../../../../../LIBC/SYSDEPS/LINUX/ARM/VFORK.S>
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/i386/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/i386/Makefile.arch
> -index 9a34595..98e2ae7 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/i386/Makefile.arch
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/i386/Makefile.arch
> -@@ -5,7 +5,7 @@
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - #
> - 
> --libpthread_linux_arch_SSRC = pt-vfork.S clone.S pthread_spin_unlock.S pthread_once.S
> -+libpthread_linux_arch_SSRC = clone.S pthread_spin_unlock.S pthread_once.S
> - libpthread_linux_arch_CSRC = pthread_spin_init.c pt-__syscall_error.c
> - 
> - libc_linux_arch_CSRC = fork.c
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/i386/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/i386/pt-vfork.S
> -deleted file mode 100644
> -index aff926a..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/i386/pt-vfork.S
> -+++ /dev/null
> -@@ -1,68 +0,0 @@
> --/* Copyright (C) 1999, 2002, 2004 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --   Contributed by Andreas Schwab <schwab@gnu.org>.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <sysdep.h>
> --#define _ERRNO_H	1
> --#include <bits/errno.h>
> --#include <bits/kernel-features.h>
> --#include <tcb-offsets.h>
> --
> --/* Save the PID value.  */
> --#define SAVE_PID \
> --	movl	%gs:PID, %edx; 						      \
> --	movl	%edx, %eax;						      \
> --	negl	%eax;							      \
> --	movl	%eax, %gs:PID
> --
> --/* Restore the old PID value in the parent.  */
> --#define RESTORE_PID \
> --	testl	%eax, %eax;						      \
> --	je	1f;							      \
> --	movl	%edx, %gs:PID;						      \
> --1:
> --
> --/* Clone the calling process, but without copying the whole address space.
> --   The calling process is suspended until the new process exits or is
> --   replaced by a call to `execve'.  Return -1 for errors, 0 to the new process,
> --   and the process ID of the new process to the old process.  */
> --
> --ENTRY (__vfork)
> --	/* Pop the return PC value into ECX.  */
> --	popl	%ecx
> --
> --	SAVE_PID
> --
> --	/* Stuff the syscall number in EAX and enter into the kernel.  */
> --	movl	$SYS_ify (vfork), %eax
> --	int	$0x80
> --
> --	RESTORE_PID
> --
> --	/* Jump to the return PC.  Don't jump directly since this
> --	   disturbs the branch target cache.  Instead push the return
> --	   address back on the stack.  */
> --	pushl	%ecx
> --
> --	cmpl	$-4095, %eax
> --	jae	SYSCALL_ERROR_LABEL	/* Branch forward if it failed.  */
> --L(pseudo_end):
> --	ret
> --PSEUDO_END (__vfork)
> --
> --weak_alias (__vfork, vfork)
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/mips/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/mips/Makefile.arch
> -index fc26a8e..cfe2861 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/mips/Makefile.arch
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/mips/Makefile.arch
> -@@ -5,7 +5,7 @@
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - #
> - 
> --libpthread_linux_arch_SSRC = pt-vfork.S clone.S
> -+libpthread_linux_arch_SSRC = clone.S
> - libpthread_linux_arch_CSRC = pthread_once.c pt-__syscall_rt_sigaction.c
> - 
> - libc_linux_arch_CSRC = fork.c
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/mips/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/mips/pt-vfork.S
> -deleted file mode 100644
> -index c02ffca..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/mips/pt-vfork.S
> -+++ /dev/null
> -@@ -1,38 +0,0 @@
> --/* Copyright (C) 2005 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <features.h>
> --#include <tls.h>
> --
> --/* Save the PID value.  */
> --#define SAVE_PID \
> --	READ_THREAD_POINTER(v1);	/* Get the thread pointer.  */	\
> --	lw	a2, PID_OFFSET(v1);	/* Load the saved PID.  */	\
> --	subu	a2, $0, a2;		/* Negate it.  */		\
> --	sw	a2, PID_OFFSET(v1);	/* Store the temporary PID.  */
> --
> --/* Restore the old PID value in the parent.  */
> --#define RESTORE_PID \
> --	beqz	v0, 1f;			/* If we are the parent... */	\
> --	READ_THREAD_POINTER(v1);	/* Get the thread pointer.  */	\
> --	lw	a2, PID_OFFSET(v1);	/* Load the saved PID.  */	\
> --	subu	a2, $0, a2;		/* Re-negate it.  */		\
> --	sw	a2, PID_OFFSET(v1);	/* Restore the PID.  */		\
> --1:
> --
> --#include <../../../../../../../libc/sysdeps/linux/mips/vfork.S>
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/Makefile.arch
> -index 8581aea..0aa285e 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/Makefile.arch
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/Makefile.arch
> -@@ -5,7 +5,7 @@
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - #
> - 
> --libpthread_linux_arch_SSRC = pt-vfork.S
> -+libpthread_linux_arch_SSRC =
> - libpthread_linux_arch_CSRC = pthread_once.c pt-__syscall_error.c
> - 
> - libc_linux_arch_CSRC = fork.c
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32/pt-vfork.S
> -deleted file mode 100644
> -index 61651fd..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32/pt-vfork.S
> -+++ /dev/null
> -@@ -1,49 +0,0 @@
> --/* Copyright (C) 2004 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --   Contributed by Jakub Jelinek <jakub@redhat.com>, 2004.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <sysdep.h>
> --#define _ERRNO_H	1
> --#include <bits/errno.h>
> --#include <bits/kernel-features.h>
> --#include <tcb-offsets.h>
> --
> --/* Clone the calling process, but without copying the whole address space.
> --   The calling process is suspended until the new process exits or is
> --   replaced by a call to `execve'.  Return -1 for errors, 0 to the new process,
> --   and the process ID of the new process to the old process.  */
> --
> --ENTRY (__vfork)
> --	lwz	0,PID(2)
> --	neg	0,0
> --	stw	0,PID(2)
> --
> --	DO_CALL (SYS_ify (vfork))
> --
> --	cmpwi	1,3,0
> --	beqlr-	1
> --
> --	lwz	0,PID(2)
> --	neg	0,0
> --	stw	0,PID(2)
> --
> --	PSEUDO_RET
> --
> --PSEUDO_END (__vfork)
> --
> --weak_alias (__vfork, vfork)
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/powerpc64/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/powerpc64/pt-vfork.S
> -deleted file mode 100644
> -index e5b7b53..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/powerpc64/pt-vfork.S
> -+++ /dev/null
> -@@ -1,49 +0,0 @@
> --/* Copyright (C) 2004 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --   Contributed by Jakub Jelinek <jakub@redhat.com>, 2004.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <sysdep.h>
> --#define _ERRNO_H	1
> --#include <bits/errno.h>
> --#include <bits/kernel-features.h>
> --#include <tcb-offsets.h>
> --
> --/* Clone the calling process, but without copying the whole address space.
> --   The calling process is suspended until the new process exits or is
> --   replaced by a call to `execve'.  Return -1 for errors, 0 to the new process,
> --   and the process ID of the new process to the old process.  */
> --
> --ENTRY (__vfork)
> --	lwz	0,PID(13)
> --	neg	0,0
> --	stw	0,PID(13)
> --
> --	DO_CALL (SYS_ify (vfork))
> --
> --	cmpwi	1,3,0
> --	beqlr-	1
> --
> --	lwz	0,PID(13)
> --	neg	0,0
> --	stw	0,PID(13)
> --
> --	PSEUDO_RET
> --
> --PSEUDO_END (__vfork)
> --
> --weak_alias (__vfork, vfork)
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/pt-vfork.S
> -deleted file mode 100644
> -index 0225219..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/powerpc/pt-vfork.S
> -+++ /dev/null
> -@@ -1,5 +0,0 @@
> --#if defined __powerpc64__
> --# include "powerpc64/pt-vfork.S"
> --#else
> --# include "powerpc32/pt-vfork.S"
> --#endif
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/sh/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/sh/Makefile.arch
> -index a8249e0..a0c008b 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/sh/Makefile.arch
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/sh/Makefile.arch
> -@@ -5,7 +5,7 @@
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - #
> - 
> --libpthread_linux_arch_SSRC = pt-vfork.S pthread_once.S pthread_rwlock_wrlock.S \
> -+libpthread_linux_arch_SSRC = pthread_once.S pthread_rwlock_wrlock.S \
> - 			pthread_rwlock_rdlock.S pthread_rwlock_unlock.S \
> - 			lowlevellock.S lowlevelrobustlock.S pthread_barrier_wait.S \
> - 			pthread_cond_broadcast.S pthread_cond_signal.S \
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/sh/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/sh/pt-vfork.S
> -deleted file mode 100644
> -index 54f2281..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/sh/pt-vfork.S
> -+++ /dev/null
> -@@ -1,65 +0,0 @@
> --/* Copyright (C) 2003, 2004 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <sysdep.h>
> --#define _ERRNO_H	1
> --#include <bits/errno.h>
> --#include <tcb-offsets.h>
> --
> --/* Clone the calling process, but without copying the whole address space.
> --   The calling process is suspended until the new process exits or is
> --   replaced by a call to `execve'.  Return -1 for errors, 0 to the new process,
> --   and the process ID of the new process to the old process.  */
> --
> --ENTRY (__vfork)
> --	/* Save the PID value.  */
> --	stc	gbr, r2
> --	mov.w	.L2, r0
> --	mov.l	@(r0,r2), r4
> --	neg	r4, r1
> --	mov.l	r1, @(r0,r2)
> --
> --	mov.w	.L1, r3
> --	trapa	#0x10
> --	mov     r0, r1
> --
> --	/* Restore the old PID value in the parent.  */
> --	tst	r0, r0
> --	bt/s	2f
> --	 stc	gbr, r2
> --	mov.w	.L2, r0
> --	mov.l	r4, @(r0,r2)
> --	mov	r1, r0
> --2:
> --	mov	#-12, r2
> --	shad	r2, r1
> --	not	r1, r1			// r1=0 means r0 = -1 to -4095
> --	tst	r1, r1			// i.e. error in linux
> --	bf	.Lpseudo_end
> --	SYSCALL_ERROR_HANDLER
> --.Lpseudo_end:
> --	rts
> --	 nop
> --.L1:
> --	.word	__NR_vfork
> --.L2:
> --	.word	PID - TLS_PRE_TCB_SIZE
> --
> --PSEUDO_END (__vfork)
> --
> --weak_alias (__vfork, vfork)
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/Makefile.arch
> -index 102c0da..8329885 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/Makefile.arch
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/Makefile.arch
> -@@ -5,7 +5,7 @@
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - #
> - 
> --libpthread_linux_arch_SSRC = pt-vfork.S clone.S
> -+libpthread_linux_arch_SSRC = clone.S
> - libpthread_linux_arch_CSRC = pthread_once.c lowlevellock.c \
> - 	pthread_barrier_init.c pthread_barrier_wait.c pthread_barrier_destroy.c \
> - 	pt-__syscall_error.c
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/pt-vfork.S
> -deleted file mode 100644
> -index e8705c5..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/pt-vfork.S
> -+++ /dev/null
> -@@ -1,5 +0,0 @@
> --#if defined(__arch64__)
> --#include "sparc64/pt-vfork.S"
> --#else
> --#include "sparc32/pt-vfork.S"
> --#endif
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/sparc32/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/sparc32/pt-vfork.S
> -deleted file mode 100644
> -index fb01242..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/sparc32/pt-vfork.S
> -+++ /dev/null
> -@@ -1,45 +0,0 @@
> --/* Copyright (C) 2004 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --   Contributed by Jakub Jelinek <jakub@redhat.com>, 2004.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <sysdep.h>
> --#include <tcb-offsets.h>
> --
> --	.text
> --	.globl		__syscall_error
> --ENTRY(__vfork)
> --	ld	[%g7 + PID], %o5
> --	sub	%g0, %o5, %o4
> --	st	%o4, [%g7 + PID]
> --
> --	LOADSYSCALL(vfork)
> --	ta	0x10
> --	bcc	2f
> --	 mov	%o7, %g1
> --	st	%o5, [%g7 + PID]
> --	call	__syscall_error
> --	 mov	%g1, %o7
> --2:	sub	%o1, 1, %o1
> --	andcc	%o0, %o1, %o0
> --	bne,a	1f
> --	 st	%o5, [%g7 + PID]
> --1:	retl
> --	 nop
> --END(__vfork)
> --
> --weak_alias (__vfork, vfork)
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/sparc64/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/sparc64/pt-vfork.S
> -deleted file mode 100644
> -index 8941043..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/sparc/sparc64/pt-vfork.S
> -+++ /dev/null
> -@@ -1,45 +0,0 @@
> --/* Copyright (C) 2004 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --   Contributed by Jakub Jelinek <jakub@redhat.com>, 2004.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <sysdep.h>
> --#include <tcb-offsets.h>
> --
> --	.text
> --	.globl	__syscall_error
> --ENTRY(__vfork)
> --	ld	[%g7 + PID], %o5
> --	sub	%g0, %o5, %o4
> --	st	%o4, [%g7 + PID]
> --
> --	LOADSYSCALL(vfork)
> --	ta	0x6d
> --	bcc,pt	%xcc, 2f
> --	 mov	%o7, %g1
> --	st	%o5, [%g7 + PID]
> --	call	__syscall_error
> --	 mov	%g1, %o7
> --2:	sub	%o1, 1, %o1
> --	andcc	%o0, %o1, %o0
> --	bne,a,pt %icc, 1f
> --	 st	%o5, [%g7 + PID]
> --1:	retl
> --	 nop
> --END(__vfork)
> --
> --weak_alias (__vfork, vfork)
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/Makefile.arch
> -index 71df986..10fa3cf 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/Makefile.arch
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/Makefile.arch
> -@@ -5,7 +5,7 @@
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - #
> - 
> --libpthread_linux_arch_SSRC = pt-vfork.S clone.S pthread_once.S \
> -+libpthread_linux_arch_SSRC = clone.S pthread_once.S \
> - 	lowlevellock.S pthread_barrier_wait.S pthread_cond_signal.S pthread_cond_broadcast.S \
> - 	sem_post.S sem_timedwait.S lowlevelrobustlock.S \
> - 	sem_trywait.S sem_wait.S pthread_rwlock_rdlock.S pthread_rwlock_wrlock.S \
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/pt-vfork.S b/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/pt-vfork.S
> -deleted file mode 100644
> -index df49496..0000000
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/x86_64/pt-vfork.S
> -+++ /dev/null
> -@@ -1,33 +0,0 @@
> --/* Copyright (C) 2004 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, write to the Free
> --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> --   02111-1307 USA.  */
> --
> --#include <tcb-offsets.h>
> --
> --#define SAVE_PID \
> --	movl	%fs:PID, %esi;						      \
> --	movl	%esi, %edx;						      \
> --	negl	%edx;							      \
> --	movl	%edx, %fs:PID
> --
> --#define RESTORE_PID \
> --	testq	%rax, %rax;						      \
> --	je	1f;							      \
> --	movl	%esi, %fs:PID;						      \
> --1:
> --
> --#include <../../../../../../../libc/sysdeps/linux/x86_64/vfork.S>
> --- 
> -1.8.5.2 (Apple Git-48)
> -
> diff --git a/package/uclibc/0.9.33.2/0063-powerpc-update-ptrace.h-to-latest-from-glibc.patch b/package/uclibc/0.9.33.2/0063-powerpc-update-ptrace.h-to-latest-from-glibc.patch
> deleted file mode 100644
> index 58e4b91..0000000
> --- a/package/uclibc/0.9.33.2/0063-powerpc-update-ptrace.h-to-latest-from-glibc.patch
> +++ /dev/null
> @@ -1,134 +0,0 @@
> -From 56824024e4f3fa8b5c6f696934c51fbc86946a80 Mon Sep 17 00:00:00 2001
> -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Sun, 7 Sep 2014 12:01:33 -0300
> -Subject: [PATCH] powerpc: update ptrace.h to latest from glibc
> -
> -Update sys/ptrace.h to latest glibc release for a lot of missing
> -definitions.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/sysdeps/linux/powerpc/sys/ptrace.h | 93 ++++++++++++++++++++++++++++++++-
> - 1 file changed, 91 insertions(+), 2 deletions(-)
> -
> -diff --git a/libc/sysdeps/linux/powerpc/sys/ptrace.h b/libc/sysdeps/linux/powerpc/sys/ptrace.h
> -index 02c303c..dd81efc 100644
> ---- a/libc/sysdeps/linux/powerpc/sys/ptrace.h
> -+++ b/libc/sysdeps/linux/powerpc/sys/ptrace.h
> -@@ -1,5 +1,5 @@
> - /* `ptrace' debugger support interface.  Linux version.
> --   Copyright (C) 2001 Free Software Foundation, Inc.
> -+   Copyright (C) 2001-2014 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> - 
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -20,6 +20,7 @@
> - #define _SYS_PTRACE_H	1
> - 
> - #include <features.h>
> -+#include <bits/types.h>
> - 
> - __BEGIN_DECLS
> - 
> -@@ -78,8 +79,96 @@ enum __ptrace_request
> - #define PT_DETACH PTRACE_DETACH
> - 
> -   /* Continue and stop at the next (return from) syscall.  */
> --  PTRACE_SYSCALL = 24
> -+  PTRACE_SYSCALL = 24,
> - #define PT_SYSCALL PTRACE_SYSCALL
> -+
> -+  /* Set ptrace filter options.  */
> -+  PTRACE_SETOPTIONS = 0x4200,
> -+#define PT_SETOPTIONS PTRACE_SETOPTIONS
> -+
> -+  /* Get last ptrace message.  */
> -+  PTRACE_GETEVENTMSG = 0x4201,
> -+#define PT_GETEVENTMSG PTRACE_GETEVENTMSG
> -+
> -+  /* Get siginfo for process.  */
> -+  PTRACE_GETSIGINFO = 0x4202,
> -+#define PT_GETSIGINFO PTRACE_GETSIGINFO
> -+
> -+  /* Set new siginfo for process.  */
> -+  PTRACE_SETSIGINFO = 0x4203,
> -+#define PT_SETSIGINFO PTRACE_SETSIGINFO
> -+
> -+  /* Get register content.  */
> -+  PTRACE_GETREGSET = 0x4204,
> -+#define PTRACE_GETREGSET PTRACE_GETREGSET
> -+
> -+  /* Set register content.  */
> -+  PTRACE_SETREGSET = 0x4205,
> -+#define PTRACE_SETREGSET PTRACE_SETREGSET
> -+
> -+  /* Like PTRACE_ATTACH, but do not force tracee to trap and do not affect
> -+     signal or group stop state.  */
> -+  PTRACE_SEIZE = 0x4206,
> -+#define PTRACE_SEIZE PTRACE_SEIZE
> -+
> -+  /* Trap seized tracee.  */
> -+  PTRACE_INTERRUPT = 0x4207,
> -+#define PTRACE_INTERRUPT PTRACE_INTERRUPT
> -+
> -+  /* Wait for next group event.  */
> -+  PTRACE_LISTEN = 0x4208,
> -+#define PTRACE_LISTEN PTRACE_LISTEN
> -+
> -+  PTRACE_PEEKSIGINFO = 0x4209
> -+#define PTRACE_PEEKSIGINFO PTRACE_PEEKSIGINFO
> -+};
> -+
> -+
> -+/* Flag for PTRACE_LISTEN.  */
> -+enum __ptrace_flags
> -+{
> -+  PTRACE_SEIZE_DEVEL = 0x80000000
> -+};
> -+
> -+/* Options set using PTRACE_SETOPTIONS.  */
> -+enum __ptrace_setoptions
> -+{
> -+  PTRACE_O_TRACESYSGOOD	= 0x00000001,
> -+  PTRACE_O_TRACEFORK	= 0x00000002,
> -+  PTRACE_O_TRACEVFORK   = 0x00000004,
> -+  PTRACE_O_TRACECLONE	= 0x00000008,
> -+  PTRACE_O_TRACEEXEC	= 0x00000010,
> -+  PTRACE_O_TRACEVFORKDONE = 0x00000020,
> -+  PTRACE_O_TRACEEXIT	= 0x00000040,
> -+  PTRACE_O_TRACESECCOMP = 0x00000080,
> -+  PTRACE_O_EXITKILL	= 0x00100000,
> -+  PTRACE_O_MASK		= 0x001000ff
> -+};
> -+
> -+/* Wait extended result codes for the above trace options.  */
> -+enum __ptrace_eventcodes
> -+{
> -+  PTRACE_EVENT_FORK	= 1,
> -+  PTRACE_EVENT_VFORK	= 2,
> -+  PTRACE_EVENT_CLONE	= 3,
> -+  PTRACE_EVENT_EXEC	= 4,
> -+  PTRACE_EVENT_VFORK_DONE = 5,
> -+  PTRACE_EVENT_EXIT	= 6,
> -+  PTRACE_EVENT_SECCOMP  = 7
> -+};
> -+
> -+/* Arguments for PTRACE_PEEKSIGINFO.  */
> -+struct __ptrace_peeksiginfo_args
> -+{
> -+  __uint64_t off;	/* From which siginfo to start.  */
> -+  __uint32_t flags;	/* Flags for peeksiginfo.  */
> -+  __int32_t nr;		/* How many siginfos to take.  */
> -+};
> -+
> -+enum __ptrace_peeksiginfo_flags
> -+{
> -+  /* Read signals from a shared (process wide) queue.  */
> -+  PTRACE_PEEKSIGINFO_SHARED = (1 << 0)
> - };
> - 
> - /* Perform process tracing functions.  REQUEST is one of the values
> --- 
> -2.0.4
> -
> diff --git a/package/uclibc/0.9.33.2/0064-sparc-update-ptrace.h-to-latest-from-glibc.patch b/package/uclibc/0.9.33.2/0064-sparc-update-ptrace.h-to-latest-from-glibc.patch
> deleted file mode 100644
> index 77b2c2e..0000000
> --- a/package/uclibc/0.9.33.2/0064-sparc-update-ptrace.h-to-latest-from-glibc.patch
> +++ /dev/null
> @@ -1,151 +0,0 @@
> -From 085465e5c507822b25daec6c0fc1a78da48bff9e Mon Sep 17 00:00:00 2001
> -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Sun, 7 Sep 2014 12:01:34 -0300
> -Subject: [PATCH] sparc: update ptrace.h to latest from glibc
> -
> -Update sys/ptrace.h to latest glibc release for a lot of missing
> -definitions.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/sysdeps/linux/sparc/sys/ptrace.h | 97 +++++++++++++++++++++++++++++++++--
> - 1 file changed, 92 insertions(+), 5 deletions(-)
> -
> -diff --git a/libc/sysdeps/linux/sparc/sys/ptrace.h b/libc/sysdeps/linux/sparc/sys/ptrace.h
> -index 26fa4b3..0f6c2cc 100644
> ---- a/libc/sysdeps/linux/sparc/sys/ptrace.h
> -+++ b/libc/sysdeps/linux/sparc/sys/ptrace.h
> -@@ -1,5 +1,5 @@
> - /* `ptrace' debugger support interface.  Linux/SPARC version.
> --   Copyright (C) 1996, 1997, 1998, 1999, 2000 Free Software Foundation, Inc.
> -+   Copyright (C) 1996-2014 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> - 
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -20,7 +20,7 @@
> - #define _SYS_PTRACE_H	1
> - 
> - #include <features.h>
> --
> -+#include <bits/types.h>
> - #include <bits/wordsize.h>
> - 
> - /* Linux/SPARC kernels up to 2.3.18 do not care much
> -@@ -147,12 +147,11 @@ enum __ptrace_request
> - #endif
> - 
> -   /* Continue and stop at the next (return from) syscall.  */
> --  PTRACE_SYSCALL = 24
> -+  PTRACE_SYSCALL = 24,
> - #define PTRACE_SYSCALL PTRACE_SYSCALL
> - 
> - #if __WORDSIZE == 64
> - 
> --  ,
> -   /* Get all floating point registers used by a processes.
> -      This is not supported on all machines.  */
> -    PTRACE_GETFPREGS = 25,
> -@@ -160,10 +159,98 @@ enum __ptrace_request
> - 
> -   /* Set all floating point registers used by a processes.
> -      This is not supported on all machines.  */
> --   PTRACE_SETFPREGS = 26
> -+   PTRACE_SETFPREGS = 26,
> - #define PT_SETFPREGS PTRACE_SETFPREGS
> - 
> - #endif
> -+
> -+  /* Set ptrace filter options.  */
> -+  PTRACE_SETOPTIONS = 0x4200,
> -+#define PT_SETOPTIONS PTRACE_SETOPTIONS
> -+
> -+  /* Get last ptrace message.  */
> -+  PTRACE_GETEVENTMSG = 0x4201,
> -+#define PT_GETEVENTMSG PTRACE_GETEVENTMSG
> -+
> -+  /* Get siginfo for process.  */
> -+  PTRACE_GETSIGINFO = 0x4202,
> -+#define PT_GETSIGINFO PTRACE_GETSIGINFO
> -+
> -+  /* Set new siginfo for process.  */
> -+  PTRACE_SETSIGINFO = 0x4203,
> -+#define PT_SETSIGINFO PTRACE_SETSIGINFO
> -+
> -+  /* Get register content.  */
> -+  PTRACE_GETREGSET = 0x4204,
> -+#define PTRACE_GETREGSET PTRACE_GETREGSET
> -+
> -+  /* Set register content.  */
> -+  PTRACE_SETREGSET = 0x4205,
> -+#define PTRACE_SETREGSET PTRACE_SETREGSET
> -+
> -+  /* Like PTRACE_ATTACH, but do not force tracee to trap and do not affect
> -+     signal or group stop state.  */
> -+  PTRACE_SEIZE = 0x4206,
> -+#define PTRACE_SEIZE PTRACE_SEIZE
> -+
> -+  /* Trap seized tracee.  */
> -+  PTRACE_INTERRUPT = 0x4207,
> -+#define PTRACE_INTERRUPT PTRACE_INTERRUPT
> -+
> -+  /* Wait for next group event.  */
> -+  PTRACE_LISTEN = 0x4208,
> -+#define PTRACE_LISTEN PTRACE_LISTEN
> -+
> -+  PTRACE_PEEKSIGINFO = 0x4209
> -+#define PTRACE_PEEKSIGINFO PTRACE_PEEKSIGINFO
> -+};
> -+
> -+
> -+/* Flag for PTRACE_LISTEN.  */
> -+enum __ptrace_flags
> -+{
> -+  PTRACE_SEIZE_DEVEL = 0x80000000
> -+};
> -+
> -+/* Options set using PTRACE_SETOPTIONS.  */
> -+enum __ptrace_setoptions
> -+{
> -+  PTRACE_O_TRACESYSGOOD	= 0x00000001,
> -+  PTRACE_O_TRACEFORK	= 0x00000002,
> -+  PTRACE_O_TRACEVFORK   = 0x00000004,
> -+  PTRACE_O_TRACECLONE	= 0x00000008,
> -+  PTRACE_O_TRACEEXEC	= 0x00000010,
> -+  PTRACE_O_TRACEVFORKDONE = 0x00000020,
> -+  PTRACE_O_TRACEEXIT	= 0x00000040,
> -+  PTRACE_O_TRACESECCOMP = 0x00000080,
> -+  PTRACE_O_EXITKILL	= 0x00100000,
> -+  PTRACE_O_MASK		= 0x001000ff
> -+};
> -+
> -+/* Wait extended result codes for the above trace options.  */
> -+enum __ptrace_eventcodes
> -+{
> -+  PTRACE_EVENT_FORK	= 1,
> -+  PTRACE_EVENT_VFORK	= 2,
> -+  PTRACE_EVENT_CLONE	= 3,
> -+  PTRACE_EVENT_EXEC	= 4,
> -+  PTRACE_EVENT_VFORK_DONE = 5,
> -+  PTRACE_EVENT_EXIT	= 6,
> -+  PTRACE_EVENT_SECCOMP  = 7
> -+};
> -+
> -+/* Arguments for PTRACE_PEEKSIGINFO.  */
> -+struct __ptrace_peeksiginfo_args
> -+{
> -+  __uint64_t off;	/* From which siginfo to start.  */
> -+  __uint32_t flags;	/* Flags for peeksiginfo.  */
> -+  __int32_t nr;		/* How many siginfos to take.  */
> -+};
> -+
> -+enum __ptrace_peeksiginfo_flags
> -+{
> -+  /* Read signals from a shared (process wide) queue.  */
> -+  PTRACE_PEEKSIGINFO_SHARED = (1 << 0)
> - };
> - 
> - /* Perform process tracing functions.  REQUEST is one of the values
> --- 
> -2.0.4
> -
> diff --git a/package/uclibc/0.9.33.2/0065-Do-not-include-__iconv_codesets-into-iconv-utility.patch b/package/uclibc/0.9.33.2/0065-Do-not-include-__iconv_codesets-into-iconv-utility.patch
> deleted file mode 100644
> index a6b5b5e..0000000
> --- a/package/uclibc/0.9.33.2/0065-Do-not-include-__iconv_codesets-into-iconv-utility.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -uclibc: Do not include __iconv_codesets into iconv utility
> -
> -Backporting an upstream patch to fix a problem in the install step:
> -
> -make[1]: Entering directory `/br/output/build/uclibc-0.9.33.2'
> -make[2]: Nothing to be done for `locale_headers'.
> -	CC utils/getconf
> -	STRIP -x -R .note -R .comment ../utils/getconf
> -	CC utils/iconv
> -../lib/libc.a(iconv.os):(.rodata+0x18): multiple definition of
> -`__iconv_codesets'
> -/tmp/ccVmV8Lq.o:(.rodata+0x18): first defined here
> -collect2: error: ld returned 1 exit status
> -
> -Upstream commit:
> -	http://git.uclibc.org/uClibc/commit/?id=d46dc8bc88e38251bfa3712efe7abf62933f5419
> -
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -From d46dc8bc88e38251bfa3712efe7abf62933f5419 Mon Sep 17 00:00:00 2001
> -From: Peter S. Mazinger <ps.m@gmx.net>
> -Date: Thu, 24 Mar 2011 00:15:25 +0000
> -Subject: iconv: Do not include __iconv_codesets into iconv utility
> -
> -Host iconv needs only L_iconv_main defined and __iconv_codesets
> -has to included, as host system does not provide it.
> -Keep __iconv_codesets out of iconv linked against uClibc.
> -
> -Signed-off-by: Peter S. Mazinger <ps.m@gmx.net>
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> -diff --git a/libc/misc/wchar/wchar.c b/libc/misc/wchar/wchar.c
> -index 412c557..0704096 100644
> ---- a/libc/misc/wchar/wchar.c
> -+++ b/libc/misc/wchar/wchar.c
> -@@ -1196,6 +1196,9 @@ libc_hidden_proto(__iconv_codesets)
> - #endif
> - 
> - #if defined L_iconv || defined L_iconv_main
> -+# ifdef L_iconv_main
> -+static
> -+# endif
> - const unsigned char __iconv_codesets[] =
> - 	"\x0a\xe0""WCHAR_T\x00"		/* superset of UCS-4 but platform-endian */
> - #if __BYTE_ORDER == __BIG_ENDIAN
> -diff --git a/utils/Makefile.in b/utils/Makefile.in
> -index bb85be3..1714d28 100644
> ---- a/utils/Makefile.in
> -+++ b/utils/Makefile.in
> -@@ -36,8 +36,7 @@ CFLAGS-ldd := $(CFLAGS-utils-shared) -DBUILDING_LINKAGE
> - # Need CFLAGS-utils explicitly, because the source file is not located in utils
> - CFLAGS-iconv := $(CFLAGS-utils) \
> -     $(CFLAGS-utils-shared) \
> --    -I$(top_srcdir)libc/misc/wchar \
> --    -DL_iconv_main \
> -+    -I$(top_srcdir)libc/misc/wchar
> - 
> - CFLAGS-locale := $(CFLAGS-utils)
> - CFLAGS-getconf :=$(CFLAGS-utils) \
> -diff --git a/utils/iconv.c b/utils/iconv.c
> -index 04e2c32..a0260df 100644
> ---- a/utils/iconv.c
> -+++ b/utils/iconv.c
> -@@ -108,7 +108,12 @@
> - #include <wchar.h>
> - #include "wchar.c" /* for _UC_iconv_t and __iconv_codesets */
> - 
> --extern const unsigned char __iconv_codesets[];
> -+#ifdef L_iconv_main
> -+static
> -+#else
> -+extern
> -+#endif
> -+const unsigned char __iconv_codesets[];
> - 
> - #define IBUF BUFSIZ
> - #define OBUF BUFSIZ
> ---
> -cgit v0.9.1
> diff --git a/package/uclibc/0.9.33.2/0066-mips-rename-siginfo-_timer-members.patch b/package/uclibc/0.9.33.2/0066-mips-rename-siginfo-_timer-members.patch
> deleted file mode 100644
> index 8ab7615..0000000
> --- a/package/uclibc/0.9.33.2/0066-mips-rename-siginfo-_timer-members.patch
> +++ /dev/null
> @@ -1,157 +0,0 @@
> -mips: rename siginfo _timer members
> -
> -Backport an upstream patch to fix a compilation problem of strace-4.9+ 
> -on MIPS platforms with uClibc.
> -
> -Upstream commit:
> -  http://git.uclibc.org/uClibc/commit/?id=a1b88fe87a9d2be5696247d266f5c4fd20f000bb
> -
> -Fixes:
> -  http://autobuild.buildroot.net/results/e8f/e8f4965b27c9dcc58d6ec77cdc48b83c218c5bec/
> -
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -From a1b88fe87a9d2be5696247d266f5c4fd20f000bb Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Wed, 3 Dec 2014 17:43:25 +0100
> -Subject: [PATCH] mips: rename siginfo _timer members
> -
> -Rename _timer[12] to si_tid and si_overrun to fix compilation of
> -strace-4.9+
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - libc/sysdeps/linux/mips/bits/siginfo.h |   51 ++++++++++++++++++++-----------
> - 1 files changed, 33 insertions(+), 18 deletions(-)
> -
> -diff --git a/libc/sysdeps/linux/mips/bits/siginfo.h b/libc/sysdeps/linux/mips/bits/siginfo.h
> -index a6e4135..5199d4d 100644
> ---- a/libc/sysdeps/linux/mips/bits/siginfo.h
> -+++ b/libc/sysdeps/linux/mips/bits/siginfo.h
> -@@ -69,6 +69,22 @@ typedef struct siginfo
> - 	    __uid_t si_uid;	/* Real user ID of sending process.  */
> - 	  } _kill;
> - 
> -+	/* POSIX.1b timers.  */
> -+	struct
> -+	  {
> -+	    int si_tid;		/* Timer ID.  */
> -+	    int si_overrun;	/* Overrun count.  */
> -+	    sigval_t si_sigval;	/* Signal value.  */
> -+	  } _timer;
> -+
> -+	/* POSIX.1b signals.  */
> -+	struct
> -+	  {
> -+	    __pid_t si_pid;	/* Sending process ID.  */
> -+	    __uid_t si_uid;	/* Real user ID of sending process.  */
> -+	    sigval_t si_sigval;	/* Signal value.  */
> -+	  } _rt;
> -+
> - 	/* SIGCHLD.  */
> - 	struct
> - 	  {
> -@@ -83,29 +99,15 @@ typedef struct siginfo
> - 	struct
> - 	  {
> - 	    void *si_addr;	/* Faulting insn/memory ref.  */
> -+	    short int si_addr_lsb;	/* Valid LSB of the reported address.  */
> - 	  } _sigfault;
> - 
> - 	/* SIGPOLL.  */
> - 	struct
> - 	  {
> --	    int si_band;	/* Band event for SIGPOLL.  */
> -+	    long int si_band;	/* Band event for SIGPOLL.  */
> - 	    int si_fd;
> - 	  } _sigpoll;
> --
> --	/* POSIX.1b timers.  */
> --	struct
> --	  {
> --	    unsigned int _timer1;
> --	    unsigned int _timer2;
> --	  } _timer;
> --
> --	/* POSIX.1b signals.  */
> --	struct
> --	  {
> --	    __pid_t si_pid;	/* Sending process ID.  */
> --	    __uid_t si_uid;	/* Real user ID of sending process.  */
> --	    sigval_t si_sigval;	/* Signal value.  */
> --	  } _rt;
> -       } _sifields;
> -   } siginfo_t;
> - 
> -@@ -113,6 +115,8 @@ typedef struct siginfo
> - /* X/Open requires some more fields with fixed names.  */
> - # define si_pid		_sifields._kill.si_pid
> - # define si_uid		_sifields._kill.si_uid
> -+# define si_timerid	_sifields._timer.si_tid
> -+# define si_overrun	_sifields._timer.si_overrun
> - # define si_status	_sifields._sigchld.si_status
> - # define si_utime	_sifields._sigchld.si_utime
> - # define si_stime	_sifields._sigchld.si_stime
> -@@ -120,6 +124,7 @@ typedef struct siginfo
> - # define si_int		_sifields._rt.si_sigval.sival_int
> - # define si_ptr		_sifields._rt.si_sigval.sival_ptr
> - # define si_addr	_sifields._sigfault.si_addr
> -+# define si_addr_lsb	_sifields._sigfault.si_addr_lsb
> - # define si_band	_sifields._sigpoll.si_band
> - # define si_fd		_sifields._sigpoll.si_fd
> - 
> -@@ -142,13 +147,14 @@ enum
> - # define SI_ASYNCIO	SI_ASYNCIO
> -   SI_QUEUE,			/* Sent by sigqueue.  */
> - # define SI_QUEUE	SI_QUEUE
> --  SI_USER,			/* Sent by kill, sigsend, raise.  */
> -+  SI_USER,			/* Sent by kill, sigsend.  */
> - # define SI_USER	SI_USER
> -   SI_KERNEL = 0x80		/* Send by kernel.  */
> - #define SI_KERNEL	SI_KERNEL
> - };
> - 
> - 
> -+# if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8
> - /* `si_code' values for SIGILL signal.  */
> - enum
> - {
> -@@ -207,10 +213,16 @@ enum
> - # define BUS_ADRALN	BUS_ADRALN
> -   BUS_ADRERR,			/* Non-existant physical address.  */
> - # define BUS_ADRERR	BUS_ADRERR
> --  BUS_OBJERR			/* Object specific hardware error.  */
> -+  BUS_OBJERR,			/* Object specific hardware error.  */
> - # define BUS_OBJERR	BUS_OBJERR
> -+  BUS_MCEERR_AR,		/* Hardware memory error: action required.  */
> -+#  define BUS_MCEERR_AR	BUS_MCEERR_AR
> -+  BUS_MCEERR_AO			/* Hardware memory error: action optional.  */
> -+#  define BUS_MCEERR_AO	BUS_MCEERR_AO
> - };
> -+# endif
> - 
> -+# ifdef __USE_XOPEN_EXTENDED
> - /* `si_code' values for SIGTRAP signal.  */
> - enum
> - {
> -@@ -219,7 +231,9 @@ enum
> -   TRAP_TRACE			/* Process trace trap.  */
> - # define TRAP_TRACE	TRAP_TRACE
> - };
> -+# endif
> - 
> -+# if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8
> - /* `si_code' values for SIGCHLD signal.  */
> - enum
> - {
> -@@ -253,6 +267,7 @@ enum
> -   POLL_HUP			/* Device disconnected.  */
> - # define POLL_HUP	POLL_HUP
> - };
> -+# endif
> - 
> - # undef __need_siginfo_t
> - #endif	/* !have siginfo_t && (have _SIGNAL_H || need siginfo_t).  */
> --- 
> -1.7.1
> -
> diff --git a/package/uclibc/0.9.33.2/0067-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch b/package/uclibc/0.9.33.2/0067-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
> deleted file mode 100644
> index a98ee68..0000000
> --- a/package/uclibc/0.9.33.2/0067-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 857420a3271dc5bbddbe45a9e9878b9dc88fd143 Mon Sep 17 00:00:00 2001
> -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Tue, 3 Mar 2015 14:56:17 -0300
> -Subject: [PATCH] sparc/clone.S: guard tcb-offsets.h include with RESET_PID
> -
> -Status: upstream [uClibc]
> -
> -Otherwise we have a broken scenario with non-threading builds.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ----
> - libc/sysdeps/linux/sparc/clone.S | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/libc/sysdeps/linux/sparc/clone.S b/libc/sysdeps/linux/sparc/clone.S
> -index 8d9da5a..1d0e3e6 100644
> ---- a/libc/sysdeps/linux/sparc/clone.S
> -+++ b/libc/sysdeps/linux/sparc/clone.S
> -@@ -22,7 +22,9 @@
> - 
> - #include <asm/errno.h>
> - #include <asm/unistd.h>
> -+#ifdef RESET_PID
> - #include <tcb-offsets.h>
> -+#endif
> - #include <sysdep.h>
> - 
> - #define CLONE_VM	0x00000100
> --- 
> -2.0.5
> -
> diff --git a/package/uclibc/0.9.33.2/0068-Fix-getopt-implementations-conditional-compilation.patch b/package/uclibc/0.9.33.2/0068-Fix-getopt-implementations-conditional-compilation.patch
> deleted file mode 100644
> index 18f6a9f..0000000
> --- a/package/uclibc/0.9.33.2/0068-Fix-getopt-implementations-conditional-compilation.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 5184289b9f453b1e160fbfd2f0922e5ed586d910 Mon Sep 17 00:00:00 2001
> -From: Max Filippov <jcmvbkbc@gmail.com>
> -Date: Tue, 17 Mar 2015 02:06:52 +0300
> -Subject: [PATCH] Fix getopt implementations conditional compilation
> -
> -Currently there's no way to disable getsubopt: either GNU or SUSv3
> -getsubopt is always built.
> -
> -Properly exclude SUSv3 getsubopt implementation when GNU getopt is
> -selected.
> -Exclude GNU getsubopt when SUSv3 getopt is selected. Honor getopt_long
> -configuration.
> -
> -This brings UCLIBC_HAS_GNU_GETOPT, UCLIBC_HAS_GNU_GETSUBOPT and
> -UCLIBC_HAS_GETOPT_LONG handling in sync with uClibc and uClibc-ng tips.
> -
> -Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ----
> - libc/unistd/Makefile.in | 22 +++++++++++-----------
> - 1 file changed, 11 insertions(+), 11 deletions(-)
> -
> -diff --git a/libc/unistd/Makefile.in b/libc/unistd/Makefile.in
> -index 2704177..ec51631 100644
> ---- a/libc/unistd/Makefile.in
> -+++ b/libc/unistd/Makefile.in
> -@@ -19,18 +19,18 @@ CSRC := $(filter-out __exec_alloc.c,$(CSRC))
> - endif
> - 
> - ifeq ($(UCLIBC_HAS_GNU_GETOPT),y)
> --CSRC := $(filter-out getopt-susv3.c getopt_long-simple.c,$(CSRC))
> -+  CSRC := $(filter-out getopt-susv3.c getsubopt-susv3.c getopt_long-simple.c,$(CSRC))
> -+  ifneq ($(UCLIBC_HAS_GNU_GETSUBOPT),y)
> -+    CSRC := $(filter-out getsubopt.c,$(CSRC))
> -+  endif
> - else
> --CSRC := $(filter-out getopt.c,$(CSRC))
> --ifneq ($(UCLIBC_HAS_GETOPT_LONG),y)
> --CSRC := $(filter-out getopt_long-simple.c,$(CSRC))
> --endif
> --endif
> --
> --ifeq ($(UCLIBC_HAS_GNU_GETSUBOPT),y)
> --CSRC := $(filter-out getsubopt-susv3.c,$(CSRC))
> --else
> --CSRC := $(filter-out getsubopt.c,$(CSRC))
> -+  CSRC := $(filter-out getopt.c getsubopt.c,$(CSRC))
> -+  ifneq ($(UCLIBC_HAS_GETOPT_LONG),y)
> -+    CSRC := $(filter-out getopt_long-simple.c,$(CSRC))
> -+  endif
> -+  ifneq ($(UCLIBC_HAS_GNU_GETSUBOPT),y)
> -+    CSRC := $(filter-out getsubopt-susv3.c,$(CSRC))
> -+  endif
> - endif
> - 
> - ifneq ($(UCLIBC_SUSV3_LEGACY),y)
> --- 
> -1.8.1.4
> -
> diff --git a/package/uclibc/0.9.33.2/0069-Add-missing-C99-float-ld-wrappers.patch b/package/uclibc/0.9.33.2/0069-Add-missing-C99-float-ld-wrappers.patch
> deleted file mode 100644
> index c19d5d7..0000000
> --- a/package/uclibc/0.9.33.2/0069-Add-missing-C99-float-ld-wrappers.patch
> +++ /dev/null
> @@ -1,870 +0,0 @@
> -From 6c4538905e65ceb203f59aaa9a61728e81c6bc0a Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Wed, 18 Mar 2015 21:32:22 +0000
> -Subject: libm: Add missing C99 float/ld wrappers
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -
> -Status: upstream [uClibc]
> -http://git.uclibc.org/uClibc/commit/?id=6c4538905e65ceb203f59aaa9a61728e81c6bc0a
> -
> -Removed patch for ./TODO.
> -Needed to avoid run-time errors with mesa3d which depends on fminf
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> -diff --git a/include/complex.h b/include/complex.h
> -index 91efc0d..ed7e502 100644
> ---- a/include/complex.h
> -+++ b/include/complex.h
> -@@ -79,6 +79,7 @@ __BEGIN_DECLS
> - #endif
> - #include <bits/cmathcalls.h>
> - #undef	_Mdouble_
> -+#undef	_Mfloat_
> - #undef	__MATH_PRECNAME
> - 
> - /* And the long double versions.  It is non-critical to define them
> -@@ -97,6 +98,7 @@ __BEGIN_DECLS
> - # include <bits/cmathcalls.h>
> - #endif
> - #undef	_Mdouble_
> -+#undef	_Mlong_double_
> - #undef	__MATH_PRECNAME
> - #undef	__MATHDECL_1
> - #undef	__MATHDECL
> -diff --git a/include/math.h b/include/math.h
> -index ecb9aa6..1b54c9e 100644
> ---- a/include/math.h
> -+++ b/include/math.h
> -@@ -129,6 +129,7 @@ __BEGIN_DECLS
> - # undef	_Mdouble_
> - # undef _Mdouble_BEGIN_NAMESPACE
> - # undef _Mdouble_END_NAMESPACE
> -+# undef _Mfloat_
> - # undef	__MATH_PRECNAME
> - # undef __MATH_maybe_libm_hidden_proto
> - 
> -@@ -176,6 +177,7 @@ extern long double __REDIRECT_NTH (nexttowardl, (long double __x, long double __
> - #  undef _Mdouble_
> - #  undef _Mdouble_BEGIN_NAMESPACE
> - #  undef _Mdouble_END_NAMESPACE
> -+#  undef _Mlong_double_
> - #  undef __MATH_PRECNAME
> - #  undef __MATH_maybe_libm_hidden_proto
> - 
> -diff --git a/libc/sysdeps/linux/common/bits/mathcalls.h b/libc/sysdeps/linux/common/bits/mathcalls.h
> -index 84b793c..9bebb51 100644
> ---- a/libc/sysdeps/linux/common/bits/mathcalls.h
> -+++ b/libc/sysdeps/linux/common/bits/mathcalls.h
> -@@ -74,8 +74,22 @@ __MATHCALLI (atan2,, (_Mdouble_ __y, _Mdouble_ __x))
> - 
> - /* Cosine of X.  */
> - __MATHCALLI (cos,, (_Mdouble_ __x))
> -+# if defined _LIBC && defined _Mlong_double_
> -+libm_hidden_proto(cosl)
> -+# endif
> -+# if defined _LIBC && defined _Mfloat_
> -+libm_hidden_proto(cosf)
> -+# endif
> -+
> - /* Sine of X.  */
> - __MATHCALLI (sin,, (_Mdouble_ __x))
> -+# if defined _LIBC && defined _Mlong_double_
> -+libm_hidden_proto(sinl)
> -+# endif
> -+# if defined _LIBC && defined _Mfloat_
> -+libm_hidden_proto(sinf)
> -+# endif
> -+
> - /* Tangent of X.  */
> - __MATHCALLI (tan,, (_Mdouble_ __x))
> - 
> -@@ -111,6 +125,9 @@ __END_NAMESPACE_C99
> - _Mdouble_BEGIN_NAMESPACE
> - /* Exponential function of X.  */
> - __MATHCALLI (exp,, (_Mdouble_ __x))
> -+# if defined _LIBC && defined _Mlong_double_
> -+libm_hidden_proto(expl)
> -+# endif
> - 
> - /* Break VALUE into a normalized fraction and an integral power of 2.  */
> - __MATHCALLI (frexp,, (_Mdouble_ __x, int *__exponent))
> -@@ -173,6 +190,9 @@ _Mdouble_END_NAMESPACE
> - __BEGIN_NAMESPACE_C99
> - /* Return `sqrt(X*X + Y*Y)'.  */
> - __MATHCALLI (hypot,, (_Mdouble_ __x, _Mdouble_ __y))
> -+# if defined _LIBC && defined _Mlong_double_
> -+libm_hidden_proto(hypotl)
> -+# endif
> - __END_NAMESPACE_C99
> - #endif
> - 
> -@@ -298,6 +318,9 @@ __MATHCALLI (rint,, (_Mdouble_ __x))
> - 
> - /* Return X + epsilon if X < Y, X - epsilon if X > Y.  */
> - __MATHCALLX (nextafter,, (_Mdouble_ __x, _Mdouble_ __y), (__const__))
> -+# if defined _LIBC && defined _Mlong_double_
> -+libm_hidden_proto(nextafterl)
> -+# endif
> - # if defined __USE_ISOC99 && !defined __LDBL_COMPAT
> - __MATHCALLX (nexttoward,, (_Mdouble_ __x, long double __y), (__const__))
> - # endif
> -diff --git a/libm/Makefile.in b/libm/Makefile.in
> -index 7511706..d886cdb 100644
> ---- a/libm/Makefile.in
> -+++ b/libm/Makefile.in
> -@@ -75,9 +75,6 @@ libm_CSRC := \
> - 	s_remquo.c w_exp2.c \
> - 	cexp.c sincos.c
> - 
> --# Not implemented [yet?], see comment in float_wrappers.c:
> --# fdimf.o fmaf.o fmaxf.o fminf.o
> --# nearbyintf.o remquof.o scalblnf.o tgammaf.o
> - FL_MOBJ := \
> - 	acosf.o \
> - 	acoshf.o \
> -@@ -98,7 +95,11 @@ FL_MOBJ := \
> - 	expf.o \
> - 	expm1f.o \
> - 	fabsf.o \
> -+	fdimf.o \
> - 	floorf.o \
> -+	fmaf.o \
> -+	fmaxf.o \
> -+	fminf.o \
> - 	fmodf.o \
> - 	frexpf.o \
> - 	gammaf.o \
> -@@ -116,11 +117,14 @@ FL_MOBJ := \
> - 	lrintf.o \
> - 	lroundf.o \
> - 	modff.o \
> -+	nearbyintf.o \
> -+	nexttowardf.o \
> - 	powf.o \
> - 	remainderf.o \
> -+	remquof.o \
> - 	rintf.o \
> - 	roundf.o \
> --	scalbf.o \
> -+	scalblnf.o \
> - 	scalbnf.o \
> - 	significandf.o \
> - 	sinf.o \
> -@@ -128,9 +132,24 @@ FL_MOBJ := \
> - 	sqrtf.o \
> - 	tanf.o \
> - 	tanhf.o \
> -+	tgammaf.o \
> - 	truncf.o \
> - 
> --# Not implemented [yet?]: nexttowardl.o
> -+ifeq ($(UCLIBC_SUSV3_LEGACY),y)
> -+FL_MOBJ += scalbf.o
> -+endif
> -+
> -+# Do not (yet?) implement the float variants of bessel functions
> -+ifeq (not-yet-implemented-$(DO_XSI_MATH),y)
> -+FL_MOBJ += \
> -+	j0f.o \
> -+	j1f.o \
> -+	jnf.o \
> -+	y0f.o \
> -+	y1f.o \
> -+	ynf.o
> -+endif
> -+
> - LD_MOBJ := \
> - 	__finitel.o \
> - 	__fpclassifyl.o \
> -@@ -180,6 +199,7 @@ LD_MOBJ := \
> - 	modfl.o \
> - 	nearbyintl.o \
> - 	nextafterl.o \
> -+	nexttowardl.o \
> - 	powl.o \
> - 	remainderl.o \
> - 	remquol.o \
> -@@ -196,6 +216,17 @@ LD_MOBJ := \
> - 	tgammal.o \
> - 	truncl.o \
> - 
> -+# Do not (yet?) implement the long double variants of bessel functions
> -+ifeq (not-yet-implemented-$(DO_XSI_MATH),y)
> -+LD_MOBJ += \
> -+	j0l.o \
> -+	j1l.o \
> -+	jnl.o \
> -+	y0l.o \
> -+	y1l.o \
> -+	ynl.o
> -+endif
> -+
> - else
> - 
> - # This list of math functions was taken from POSIX/IEEE 1003.1b-1993
> -diff --git a/libm/float_wrappers.c b/libm/float_wrappers.c
> -index 82b7963..105486e 100644
> ---- a/libm/float_wrappers.c
> -+++ b/libm/float_wrappers.c
> -@@ -38,19 +38,14 @@ long long func##f (float x) \
> - 	return func((double)x); \
> - }
> - 
> --
> --/* For the time being, do _NOT_ implement these functions
> -- * that are defined by SuSv3 [because we don't need them
> -- * and nobody asked to include them] */
> --#undef L_fdimf         /*float       fdimf(float, float);*/
> --#undef L_fmaf          /*float       fmaf(float, float, float);*/
> --#undef L_fmaxf         /*float       fmaxf(float, float);*/
> --#undef L_fminf         /*float       fminf(float, float);*/
> --#undef L_nearbyintf    /*float       nearbyintf(float);*/
> --#undef L_nexttowardf   /*float       nexttowardf(float, long double);*/
> --#undef L_remquof       /*float       remquof(float, float, int *);*/
> --#undef L_scalblnf      /*float       scalblnf(float, long);*/
> --#undef L_tgammaf       /*float       tgammaf(float);*/
> -+#ifndef __DO_XSI_MATH__
> -+# undef L_j0f	/* float j0f(float x); */
> -+# undef L_j1f	/* float j1f(float x); */
> -+# undef L_jnf	/* float jnf(int n, float x); */
> -+# undef L_y0f	/* float y0f(float x); */
> -+# undef L_y1f	/* float y1f(float x); */
> -+# undef L_ynf	/* float ynf(int n, float x); */
> -+#endif
> - 
> - /* Implement the following, as defined by SuSv3 */
> - #if 0
> -@@ -155,6 +150,7 @@ float copysignf (float x, float y)
> - 
> - #ifdef L_cosf
> - WRAPPER1(cos)
> -+libm_hidden_def(cosf)
> - #endif
> - 
> - #ifdef L_coshf
> -@@ -242,6 +238,21 @@ float hypotf (float x, float y)
> - int_WRAPPER1(ilogb)
> - #endif
> - 
> -+#ifdef L_j0f
> -+WRAPPER1(j0)
> -+#endif
> -+
> -+#ifdef L_j1f
> -+WRAPPER1(j1)
> -+#endif
> -+
> -+#ifdef L_jnf
> -+float jnf(int n, float x)
> -+{
> -+	return (float) jn(n, (double)x);
> -+}
> -+#endif
> -+
> - #ifdef L_ldexpf
> - float ldexpf (float x, int _exp)
> - {
> -@@ -306,7 +317,7 @@ WRAPPER1(nearbyint)
> - #ifdef L_nexttowardf
> - float nexttowardf (float x, long double y)
> - {
> --	return (float) nexttoward( (double)x, (double)y );
> -+	return (float) nexttoward( (double)x, (long double)y );
> - }
> - #endif
> - 
> -@@ -355,6 +366,7 @@ float scalbnf (float x, int _exp)
> - 
> - #ifdef L_sinf
> - WRAPPER1(sin)
> -+libm_hidden_def(sinf)
> - #endif
> - 
> - #ifdef L_sinhf
> -@@ -381,13 +393,6 @@ WRAPPER1(tgamma)
> - WRAPPER1(trunc)
> - #endif
> - 
> --#ifdef L_fmaf
> --float fmaf (float x, float y, float z)
> --{
> --	return (float) fma( (double)x, (double)y, (double)z );
> --}
> --#endif
> --
> - #if defined L_scalbf && defined __UCLIBC_SUSV3_LEGACY__
> - float scalbf (float x, float y)
> - {
> -@@ -402,3 +407,18 @@ WRAPPER1(gamma)
> - #ifdef L_significandf
> - WRAPPER1(significand)
> - #endif
> -+
> -+#ifdef L_y0f
> -+WRAPPER1(y0)
> -+#endif
> -+
> -+#ifdef L_y1f
> -+WRAPPER1(y1)
> -+#endif
> -+
> -+#ifdef L_ynf
> -+float ynf(int n, float x)
> -+{
> -+	return (float) yn(n, (double)x);
> -+}
> -+#endif
> -diff --git a/libm/ldouble_wrappers.c b/libm/ldouble_wrappers.c
> -index 118a78f..b4215cb 100644
> ---- a/libm/ldouble_wrappers.c
> -+++ b/libm/ldouble_wrappers.c
> -@@ -42,6 +42,15 @@ long long func##l(long double x) \
> - 	return func((double) x); \
> - }
> - 
> -+#ifndef __DO_XSI_MATH__
> -+# undef L_j0l  /* long double j0l(long double x); */
> -+# undef L_j1l  /* long double j1l(long double x); */
> -+# undef L_jnl  /* long double jnl(int n, long double x); */
> -+# undef L_y0l  /* long double y0l(long double x); */
> -+# undef L_y1l  /* long double y1l(long double x); */
> -+# undef L_ynl  /* long double ynl(int n, long double x); */
> -+#endif
> -+
> - /* Implement the following, as defined by SuSv3 */
> - #if 0
> - long double acoshl(long double);
> -@@ -156,6 +165,7 @@ WRAPPER1(cosh)
> - 
> - #ifdef L_cosl
> - WRAPPER1(cos)
> -+libm_hidden_def(cosl)
> - #endif
> - 
> - #ifdef L_erfcl
> -@@ -172,6 +182,7 @@ WRAPPER1(exp2)
> - 
> - #ifdef L_expl
> - WRAPPER1(exp)
> -+libm_hidden_def(expl)
> - #endif
> - 
> - #ifdef L_expm1l
> -@@ -222,12 +233,28 @@ WRAPPER1(gamma)
> - 
> - #ifdef L_hypotl
> - WRAPPER2(hypot)
> -+libm_hidden_def(hypotl)
> - #endif
> - 
> - #ifdef L_ilogbl
> - int_WRAPPER1(ilogb)
> - #endif
> - 
> -+#ifdef L_j0l
> -+	WRAPPER1(j0)
> -+#endif
> -+
> -+#ifdef L_j1l
> -+	WRAPPER1(j1)
> -+#endif
> -+
> -+#ifdef L_jnl
> -+long double jnl(int n, long double x)
> -+{
> -+	return (long double) jn(n, (double)x);
> -+}
> -+#endif
> -+
> - #ifdef L_ldexpl
> - long double ldexpl (long double x, int ex)
> - {
> -@@ -291,12 +318,18 @@ WRAPPER1(nearbyint)
> - 
> - #ifdef L_nextafterl
> - WRAPPER2(nextafter)
> -+libm_hidden_def(nextafterl)
> - #endif
> - 
> --/* Disabled in Makefile.in */
> --#if 0 /* def L_nexttowardl */
> --WRAPPER2(nexttoward)
> --libm_hidden_def(nexttowardl)
> -+#ifdef L_nexttowardl
> -+# if 0 /* TODO */
> -+strong_alias(nextafterl, nexttowardl)
> -+# else
> -+long double nexttowardl(long double x, long double y)
> -+{
> -+	return nextafterl(x, y);
> -+}
> -+#endif
> - #endif
> - 
> - #ifdef L_powl
> -@@ -344,6 +377,7 @@ WRAPPER1(sinh)
> - 
> - #ifdef L_sinl
> - WRAPPER1(sin)
> -+libm_hidden_def(sinl)
> - #endif
> - 
> - #ifdef L_sqrtl
> -@@ -370,6 +404,22 @@ WRAPPER1(trunc)
> - WRAPPER1(significand)
> - #endif
> - 
> -+#ifdef L_y0l
> -+WRAPPER1(y0)
> -+#endif
> -+
> -+#ifdef L_y1l
> -+WRAPPER1(y1)
> -+#endif
> -+
> -+#ifdef L_ynl
> -+long double ynl(int n, long double x)
> -+{
> -+	return (long double) yn(n, (double)x);
> -+}
> -+#endif
> -+
> -+
> - #if defined __DO_C99_MATH__ && !defined __NO_LONG_DOUBLE_MATH
> - 
> - # ifdef L___fpclassifyl
> -diff --git a/libm/s_fdim.c b/libm/s_fdim.c
> -index 6249219..6ed695c 100644
> ---- a/libm/s_fdim.c
> -+++ b/libm/s_fdim.c
> -@@ -6,13 +6,22 @@
> - 
> - #include "math.h"
> - #include "math_private.h"
> -+#include <errno.h>
> - 
> - double fdim(double x, double y)
> - {
> --  int c = __fpclassify(x);
> --  if (c == FP_NAN || c == FP_INFINITE)
> --    return HUGE_VAL;
> -+  int cx = __fpclassify(x); /* need both NAN and INF */
> -+  int cy = __fpclassify(y); /* need both NAN and INF */
> -+  if (cx == FP_NAN || cy == NAN)
> -+    return x - y;
> - 
> --  return x > y ? x - y : 0.0;
> -+  if (x <= y)
> -+	  return .0;
> -+
> -+  double z = x - y;
> -+  if (isinf(z) && cx != FP_INFINITE && cy != FP_INFINITE)
> -+	  __set_errno(ERANGE);
> -+
> -+  return z;
> - }
> - libm_hidden_def(fdim)
> -diff --git a/libm/s_fmax.c b/libm/s_fmax.c
> -index 21dfaa9..5f29ad8 100644
> ---- a/libm/s_fmax.c
> -+++ b/libm/s_fmax.c
> -@@ -9,10 +9,10 @@
> - 
> - double fmax(double x, double y)
> - {
> --  if (__fpclassify(x) == FP_NAN)
> --    return x;
> --  if (__fpclassify(y) == FP_NAN)
> -+  if (isnan(x))
> -     return y;
> -+  if (isnan(y))
> -+    return x;
> - 
> -   return x > y ? x : y;
> - }
> -diff --git a/libm/s_fmin.c b/libm/s_fmin.c
> -index 674d9a5..a549678 100644
> ---- a/libm/s_fmin.c
> -+++ b/libm/s_fmin.c
> -@@ -9,10 +9,10 @@
> - 
> - double fmin(double x, double y)
> - {
> --  if (__fpclassify(x) == FP_NAN)
> --    return x;
> --  if (__fpclassify(y) == FP_NAN)
> -+  if (isnan(x))
> -     return y;
> -+  if (isnan(y))
> -+    return x;
> - 
> -   return x < y ? x : y;
> - }
> -diff --git a/libm/s_nextafter.c b/libm/s_nextafter.c
> -index ee4621c..73a8ab2 100644
> ---- a/libm/s_nextafter.c
> -+++ b/libm/s_nextafter.c
> -@@ -32,7 +32,7 @@ double nextafter(double x, double y)
> - 	if(((ix>=0x7ff00000)&&((ix-0x7ff00000)|lx)!=0) ||   /* x is nan */
> - 	   ((iy>=0x7ff00000)&&((iy-0x7ff00000)|ly)!=0))     /* y is nan */
> - 	   return x+y;
> --	if(x==y) return x;		/* x=y, return x */
> -+	if(x==y) return y;		/* x=y, return y */
> - 	if((ix|lx)==0) {			/* x == 0 */
> - 	    INSERT_WORDS(x,hy&0x80000000,1);	/* return +-minsubnormal */
> - 	    y = x*x;
> -@@ -68,3 +68,5 @@ double nextafter(double x, double y)
> - 	return x;
> - }
> - libm_hidden_def(nextafter)
> -+strong_alias_untyped(nextafter, nexttoward)
> -+libm_hidden_def(nexttoward)
> -diff --git a/test/math/compile_test.c b/test/math/compile_test.c
> -index ab8c40c..aedfde6 100644
> ---- a/test/math/compile_test.c
> -+++ b/test/math/compile_test.c
> -@@ -22,11 +22,11 @@ r += exp2f(float_x);
> - r += expf(float_x);
> - r += expm1f(float_x);
> - r += fabsf(float_x);
> --/*r += fdimf(float_x, float_x); - uclibc does not have it (yet?) */
> -+r += fdimf(float_x, float_x);
> - r += floorf(float_x);
> --/*r += fmaf(float_x, float_x, float_x); - uclibc does not have it (yet?) */
> --/*r += fmaxf(float_x, float_x); - uclibc does not have it (yet?) */
> --/*r += fminf(float_x, float_x); - uclibc does not have it (yet?) */
> -+r += fmaf(float_x, float_x, float_x);
> -+r += fmaxf(float_x, float_x);
> -+r += fminf(float_x, float_x);
> - r += fmodf(float_x, float_x);
> - r += frexpf(float_x, &int_x);
> - r += gammaf(float_x);
> -@@ -44,17 +44,17 @@ r += logf(float_x);
> - r += lrintf(float_x);
> - r += lroundf(float_x);
> - r += modff(float_x, &float_x);
> --/*r += nearbyintf(float_x); - uclibc does not have it (yet?) */
> --/*r += nexttowardf(float_x, long_double_x); - uclibc does not have it (yet?) */
> -+r += nearbyintf(float_x);
> -+r += nexttowardf(float_x, long_double_x);
> - r += powf(float_x, float_x);
> - r += remainderf(float_x, float_x);
> --/*r += remquof(float_x, float_x, &int_x); - uclibc does not have it (yet?) */
> -+r += remquof(float_x, float_x, &int_x);
> - r += rintf(float_x);
> - r += roundf(float_x);
> - #ifdef __UCLIBC_SUSV3_LEGACY__
> - r += scalbf(float_x, float_x);
> - #endif
> --/*r += scalblnf(float_x, long_x); - uclibc does not have it (yet?) */
> -+r += scalblnf(float_x, long_x);
> - r += scalbnf(float_x, int_x);
> - r += significandf(float_x);
> - r += sinf(float_x);
> -@@ -62,7 +62,7 @@ r += sinhf(float_x);
> - r += sqrtf(float_x);
> - r += tanf(float_x);
> - r += tanhf(float_x);
> --/*r += tgammaf(float_x); - uclibc does not have it (yet?) */
> -+r += tgammaf(float_x);
> - r += truncf(float_x);
> - return r;
> - }
> -@@ -116,7 +116,7 @@ r += lroundl(long_double_x);
> - r += modfl(long_double_x, &long_double_x);
> - r += nearbyintl(long_double_x);
> - r += nextafterl(long_double_x, long_double_x);
> --/* r += nexttowardl(long_double_x, long_double_x); - uclibc doesn't provide this [yet?] */
> -+r += nexttowardl(long_double_x, long_double_x);
> - r += powl(long_double_x, long_double_x);
> - r += remainderl(long_double_x, long_double_x);
> - r += remquol(long_double_x, long_double_x, &int_x);
> -diff --git a/test/math/libm-test.inc b/test/math/libm-test.inc
> -index d0f0a0c..8f0db3c 100644
> ---- a/test/math/libm-test.inc
> -+++ b/test/math/libm-test.inc
> -@@ -115,6 +115,9 @@
> - # define _GNU_SOURCE
> - #endif
> - 
> -+#undef __CHK_COMPLEX_STUFF
> -+#define __CHK_COMPLEX_STUFF 0
> -+
> - #include "libm-test-ulps.h"
> - #include <complex.h>
> - #include <math.h>
> -@@ -1120,8 +1123,10 @@ cacosh_test (void)
> - 
> -   END (cacosh, complex);
> - }
> -+#endif
> - 
> - 
> -+#if __CHK_COMPLEX_STUFF
> - static void
> - carg_test (void)
> - {
> -@@ -1188,7 +1193,9 @@ carg_test (void)
> - 
> -   END (carg);
> - }
> -+#endif /* __CHK_COMPLEX_STUFF */
> - 
> -+#if 0
> - static void
> - casin_test (void)
> - {
> -@@ -1683,7 +1690,7 @@ ceil_test (void)
> - }
> - 
> - 
> --#if 0
> -+#if __CHK_COMPLEX_STUFF
> - static void
> - cexp_test (void)
> - {
> -@@ -1746,8 +1753,9 @@ cexp_test (void)
> - 
> -   END (cexp, complex);
> - }
> -+#endif /* __CHK_COMPLEX_STUFF */
> - 
> --
> -+#if 0
> - static void
> - cimag_test (void)
> - {
> -@@ -2588,7 +2596,6 @@ fabs_test (void)
> - }
> - 
> - 
> --#if 0
> - static void
> - fdim_test (void)
> - {
> -@@ -2624,7 +2631,6 @@ fdim_test (void)
> - 
> -   END (fdim);
> - }
> --#endif
> - 
> - 
> - static void
> -@@ -2694,7 +2700,6 @@ floor_test (void)
> - }
> - 
> - 
> --#if 0
> - static void
> - fma_test (void)
> - {
> -@@ -2797,7 +2802,6 @@ fmin_test (void)
> - 
> -   END (fmin);
> - }
> --#endif
> - 
> - 
> - static void
> -@@ -3002,7 +3006,7 @@ isnormal_test (void)
> -   END (isnormal);
> - }
> - 
> --#if defined __DO_XSI_MATH__
> -+#if defined __DO_XSI_MATH__ && !(defined TEST_LDOUBLE || defined TEST_FLOAT)
> - static void
> - j0_test (void)
> - {
> -@@ -3629,7 +3633,6 @@ modf_test (void)
> - }
> - 
> - 
> --#if 0
> - static void
> - nearbyint_test (void)
> - {
> -@@ -3710,7 +3713,6 @@ nexttoward_test (void)
> - 
> -   END (nexttoward);
> - }
> --#endif
> - 
> - 
> - static void
> -@@ -3950,7 +3952,6 @@ remainder_test (void)
> -   END (remainder);
> - }
> - 
> --#if 0
> - static void
> - remquo_test (void)
> - {
> -@@ -3981,7 +3982,6 @@ remquo_test (void)
> - 
> -   END (remquo);
> - }
> --#endif
> - 
> - static void
> - rint_test (void)
> -@@ -4229,12 +4229,12 @@ round_test (void)
> - #endif
> - 
> - 
> -+#ifdef __UCLIBC_SUSV3_LEGACY__
> - static void
> - scalb_test (void)
> - {
> -   START (scalb);
> - #ifndef TEST_LDOUBLE /* uclibc doesn't have scalbl */
> --#ifdef __UCLIBC_SUSV3_LEGACY__ /* scalbf is susv3 legacy */
> - 
> -   TEST_ff_f (scalb, 2.0, 0.5, nan_value, INVALID_EXCEPTION);
> -   TEST_ff_f (scalb, 3.0, -2.5, nan_value, INVALID_EXCEPTION);
> -@@ -4285,11 +4285,10 @@ scalb_test (void)
> - 
> -   TEST_ff_f (scalb, 0.8L, 4, 12.8L);
> -   TEST_ff_f (scalb, -0.854375L, 5, -27.34L);
> --#endif /* __UCLIBC_SUSV3_LEGACY__ */
> - #endif /* TEST_LDOUBLE */
> -   END (scalb);
> - }
> --
> -+#endif
> - 
> - static void
> - scalbn_test (void)
> -@@ -4313,7 +4312,6 @@ scalbn_test (void)
> - }
> - 
> - 
> --#if 0
> - static void
> - scalbln_test (void)
> - {
> -@@ -4334,7 +4332,6 @@ scalbln_test (void)
> - 
> -   END (scalbn);
> - }
> --#endif
> - 
> - 
> - static void
> -@@ -4539,7 +4536,6 @@ tanh_test (void)
> -   END (tanh);
> - }
> - 
> --#if 0
> - static void
> - tgamma_test (void)
> - {
> -@@ -4571,7 +4567,6 @@ tgamma_test (void)
> - 
> -   END (tgamma);
> - }
> --#endif
> - 
> - 
> - #if 0
> -@@ -4651,7 +4646,7 @@ trunc_test (void)
> - }
> - #endif
> - 
> --#if defined __DO_XSI_MATH__
> -+#if defined __DO_XSI_MATH__ && !(defined TEST_LDOUBLE || defined TEST_FLOAT)
> - static void
> - y0_test (void)
> - {
> -@@ -4979,11 +4974,11 @@ main (int argc, char **argv)
> -   logb_test ();
> -   modf_test ();
> -   ilogb_test ();
> -+#ifdef __UCLIBC_SUSV3_LEGACY__
> -   scalb_test ();
> -+#endif
> -   scalbn_test ();
> --#if 0
> -   scalbln_test ();
> --#endif
> -   significand_test ();
> - 
> -   /* Power and absolute value functions:  */
> -@@ -4998,16 +4993,12 @@ main (int argc, char **argv)
> -   erfc_test ();
> -   gamma_test ();
> -   lgamma_test ();
> --#if 0
> -   tgamma_test ();
> --#endif
> - 
> -   /* Nearest integer functions:  */
> -   ceil_test ();
> -   floor_test ();
> --#if 0
> -   nearbyint_test ();
> --#endif
> -   rint_test ();
> - #if 0
> -   rint_test_tonearest ();
> -@@ -5025,13 +5016,10 @@ main (int argc, char **argv)
> -   /* Remainder functions:  */
> -   fmod_test ();
> -   remainder_test ();
> --#if 0
> -   remquo_test ();
> --#endif
> - 
> -   /* Manipulation functions:  */
> -   copysign_test ();
> --#if 0
> -   nextafter_test ();
> -   nexttoward_test ();
> - 
> -@@ -5043,24 +5031,29 @@ main (int argc, char **argv)
> -   /* Multiply and add:  */
> -   fma_test ();
> - 
> -+
> -   /* Complex functions:  */
> -   cabs_test ();
> -+#if __CHK_COMPLEX_STUFF
> -+#if 0
> -   cacos_test ();
> -   cacosh_test ();
> -+#endif
> -   carg_test ();
> -+#if 0
> -   casin_test ();
> -   casinh_test ();
> -   catan_test ();
> -   catanh_test ();
> -   ccos_test ();
> -   ccosh_test ();
> -+#endif
> -   cexp_test ();
> -+#if 0
> -   cimag_test ();
> -   clog10_test ();
> -   clog_test ();
> --#if 0
> -   conj_test ();
> --#endif
> -   cpow_test ();
> -   cproj_test ();
> -   creal_test ();
> -@@ -5070,9 +5063,10 @@ main (int argc, char **argv)
> -   ctan_test ();
> -   ctanh_test ();
> - #endif
> -+#endif /* __CHK_COMPLEX_STUFF */
> - 
> -   /* Bessel functions:  */
> --#if defined __DO_XSI_MATH__
> -+#if defined __DO_XSI_MATH__ && !(defined TEST_LDOUBLE || defined TEST_FLOAT)
> -   j0_test ();
> -   j1_test ();
> -   jn_test ();
> ---
> -cgit v0.9.1
> diff --git a/package/uclibc/0.9.33.2/0070-libm-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch b/package/uclibc/0.9.33.2/0070-libm-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch
> deleted file mode 100644
> index 1b6ea6d..0000000
> --- a/package/uclibc/0.9.33.2/0070-libm-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -From 730db44f0824f505a31822e250b9f04b9f8e7a1b Mon Sep 17 00:00:00 2001
> -From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -Date: Tue, 24 Mar 2015 00:11:47 +0100
> -Subject: [PATCH] libm: honor NO_LONG_DOUBLE in ldouble_wrappers
> -
> -Fixes SH build breakage due to attempts to define hidden defs for
> -unavailable long double functions.
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> -[Gustavo: adapt to 0.9.33.2]
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ----
> - extra/Configs/Config.in.arch |  2 +-
> - ldso/ldso/sh/dl-syscalls.h   |  2 +-
> - libm/ldouble_wrappers.c      | 15 +++++++++------
> - 3 files changed, 11 insertions(+), 8 deletions(-)
> -
> -diff --git a/extra/Configs/Config.in.arch b/extra/Configs/Config.in.arch
> -index 68e03bf..0dae84b 100644
> ---- a/extra/Configs/Config.in.arch
> -+++ b/extra/Configs/Config.in.arch
> -@@ -191,7 +191,7 @@ config UCLIBC_HAS_FENV
> - config UCLIBC_HAS_LONG_DOUBLE_MATH
> - 	bool "Enable long double support"
> - 	depends on DO_C99_MATH
> --	depends on TARGET_i386 || TARGET_m68k || TARGET_sparc || TARGET_x86_64 || TARGET_powerpc || TARGET_sh || TARGET_microblaze
> -+	depends on TARGET_aarch64 || TARGET_alpha || TARGET_i386 || TARGET_ia64 || TARGET_m68k || TARGET_powerpc || TARGET_s390 || TARGET_sparc || TARGET_tile || TARGET_x86_64
> - 	default y
> - 	help
> - 	  If you want the uClibc math library to contain the full set of C99
> -diff --git a/ldso/ldso/sh/dl-syscalls.h b/ldso/ldso/sh/dl-syscalls.h
> -index f9f13c7..b99a9b5 100644
> ---- a/ldso/ldso/sh/dl-syscalls.h
> -+++ b/ldso/ldso/sh/dl-syscalls.h
> -@@ -1,4 +1,4 @@
> --#if __GNUC_PREREQ (4, 1)
> -+#if __GNUC_PREREQ (4, 1) && !__GNUC_PREREQ (4, 9)
> - #warning !!! gcc 4.1 and later have problems with __always_inline so redefined as inline
> - # ifdef __always_inline
> - # undef __always_inline
> -diff --git a/libm/ldouble_wrappers.c b/libm/ldouble_wrappers.c
> -index b4215cb..840293f 100644
> ---- a/libm/ldouble_wrappers.c
> -+++ b/libm/ldouble_wrappers.c
> -@@ -16,27 +16,28 @@
> - #include "math.h"
> - #include <complex.h>
> - 
> --#define WRAPPER1(func) \
> -+#if !defined __NO_LONG_DOUBLE_MATH
> -+# define WRAPPER1(func) \
> - long double func##l(long double x) \
> - { \
> - 	return (long double) func((double) x); \
> - }
> --#define WRAPPER2(func) \
> -+# define WRAPPER2(func) \
> - long double func##l(long double x, long double y) \
> - { \
> - 	return (long double) func((double) x, (double) y); \
> - }
> --#define int_WRAPPER1(func) \
> -+# define int_WRAPPER1(func) \
> - int func##l(long double x) \
> - { \
> - 	return func((double) x); \
> - }
> --#define long_WRAPPER1(func) \
> -+# define long_WRAPPER1(func) \
> - long func##l(long double x) \
> - { \
> - 	return func((double) x); \
> - }
> --#define long_long_WRAPPER1(func) \
> -+# define long_long_WRAPPER1(func) \
> - long long func##l(long double x) \
> - { \
> - 	return func((double) x); \
> -@@ -447,4 +448,6 @@ int_WRAPPER1(__isinf)
> - libm_hidden_def(__isinfl)
> - # endif
> - 
> --#endif
> -+#endif /* __DO_C99_MATH__ */
> -+
> -+#endif /* __NO_LONG_DOUBLE_MATH */
> --- 
> -2.0.5
> -
> diff --git a/package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch b/package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
> deleted file mode 100644
> index 287405d..0000000
> --- a/package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 7ed8bacef45a2537646e7235092bd2e5408cd0b5 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Sun, 14 Jun 2015 15:14:22 +0200
> -Subject: [PATCH] Fix libgcc_s_resume issue
> -
> -When built with gcc 5.1, uClibc fails to build with the following
> -issue:
> -
> -    LD librt-0.9.33.2.so
> -  librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
> -  rt-unwind-resume.c:(.text+0x3c): undefined reference to `libgcc_s_resume'
> -  collect2: error: ld returned 1 exit status
> -  make[2]: *** [lib/librt.so] Error 1
> -
> -This commit fixes the code in a way similar to what was done in glibc
> -in commit:
> -
> -   https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=175cef4163dd60f95106cfd5f593b8a4e09d02c9
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c | 3 ++-
> - libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c       | 3 ++-
> - 2 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
> -index f4d6f41..a6a0515 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
> -@@ -27,7 +27,8 @@
> - #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
> - 
> - static void *libgcc_s_handle;
> --static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
> -+static void (*libgcc_s_resume) (struct _Unwind_Exception *exc)
> -+  __attribute_used__;
> - static _Unwind_Reason_Code (*libgcc_s_personality)
> -   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
> - static _Unwind_Reason_Code (*libgcc_s_forcedunwind)
> -diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
> -index f9a4ffb..e2e2e0b 100644
> ---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
> -+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
> -@@ -25,7 +25,8 @@
> - #define __libc_dlclose          dlclose
> - #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
> - 
> --static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
> -+static void (*libgcc_s_resume) (struct _Unwind_Exception *exc)
> -+  __attribute_used__;
> - static _Unwind_Reason_Code (*libgcc_s_personality)
> -   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
> - 
> --- 
> -2.1.0
> -
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 1e4d892..7cbd45c 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -22,13 +22,6 @@ choice
>  	help
>  	  Select the version of uClibc you wish to use.
>  
> -	config BR2_UCLIBC_VERSION_0_9_33
> -		bool "uClibc 0.9.33.x"
> -		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
> -		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
> -		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL if !BR2_x86_i386
> -		depends on !(BR2_arc || BR2_mips64 || BR2_mips64el || BR2_xtensa)
> -
>  	config BR2_UCLIBC_VERSION_NG
>  		bool "uClibc-ng"
>  		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS if BR2_m68k
> @@ -56,13 +49,11 @@ config BR2_USE_UCLIBC_SNAPSHOT
>  
>  config BR2_UCLIBC_VERSION_STRING
>  	string
> -	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
>  	default "1.0.11"		if BR2_UCLIBC_VERSION_NG
>  	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
>  
>  config BR2_UCLIBC_CONFIG
>  	string "uClibc configuration file to use?"
> -	default "package/uclibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
>  	default "package/uclibc/uClibc-ng.config" if BR2_UCLIBC_VERSION_NG
>  	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
>  	help
> diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
> deleted file mode 100644
> index 104eb5c..0000000
> --- a/package/uclibc/uClibc-0.9.33.config
> +++ /dev/null
> @@ -1,277 +0,0 @@
> -#
> -# Automatically generated make config: don't edit
> -# Version: 0.9.32-git
> -# Fri Jul  9 22:31:59 2010
> -#
> -# TARGET_alpha is not set
> -# TARGET_arm is not set
> -# TARGET_avr32 is not set
> -# TARGET_bfin is not set
> -# TARGET_cris is not set
> -# TARGET_e1 is not set
> -# TARGET_frv is not set
> -# TARGET_h8300 is not set
> -# TARGET_hppa is not set
> -# TARGET_i386 is not set
> -# TARGET_i960 is not set
> -# TARGET_ia64 is not set
> -# TARGET_m68k is not set
> -# TARGET_microblaze is not set
> -# TARGET_mips is not set
> -# TARGET_nios is not set
> -# TARGET_nios2 is not set
> -# TARGET_powerpc is not set
> -# TARGET_sh is not set
> -# TARGET_sh64 is not set
> -# TARGET_sparc is not set
> -# TARGET_v850 is not set
> -# TARGET_vax is not set
> -# TARGET_x86_64 is not set
> -# TARGET_xtensa is not set
> -# TARGET_c6x is not set
> -
> -# CONFIG_GENERIC_ARM is not set
> -# CONFIG_ARM610 is not set
> -# CONFIG_ARM710 is not set
> -# CONFIG_ARM7TDMI is not set
> -# CONFIG_ARM720T is not set
> -# CONFIG_ARM920T is not set
> -# CONFIG_ARM922T is not set
> -# CONFIG_ARM926T is not set
> -# CONFIG_ARM10T is not set
> -# CONFIG_ARM1136JF_S is not set
> -# CONFIG_ARM1176JZ_S is not set
> -# CONFIG_ARM1176JZF_S is not set
> -# CONFIG_ARM_CORTEX_M3 is not set
> -# CONFIG_ARM_CORTEX_M1 is not set
> -# CONFIG_ARM_SA110 is not set
> -# CONFIG_ARM_SA1100 is not set
> -# CONFIG_ARM_XSCALE is not set
> -# CONFIG_ARM_IWMMXT is not set
> -
> -# COMPILE_IN_THUMB_MODE is not set
> -USE_BX=y
> -
> -TARGET_SUBARCH=""
> -#
> -# Target Architecture Features and Options
> -#
> -TARGET_ARCH="none"
> -FORCE_OPTIONS_FOR_ARCH=y
> -#
> -# Using ELF file format
> -#
> -# ARCH_LITTLE_ENDIAN is not set
> -# ARCH_BIG_ENDIAN is not set
> -# ARCH_WANTS_LITTLE_ENDIAN is not set
> -# ARCH_WANTS_BIG_ENDIAN is not set
> -ARCH_HAS_MMU=y
> -ARCH_USE_MMU=y
> -UCLIBC_HAS_FLOATS=y
> -UCLIBC_HAS_FPU=y
> -DO_C99_MATH=y
> -# DO_XSI_MATH is not set
> -# UCLIBC_HAS_FENV is not set
> -UCLIBC_HAS_LONG_DOUBLE_MATH=y
> -KERNEL_HEADERS="/usr/src/linux/include"
> -HAVE_DOT_CONFIG=y
> -
> -#
> -# General Library Settings
> -#
> -# HAVE_NO_PIC is not set
> -DOPIC=y
> -# ARCH_HAS_NO_SHARED is not set
> -# ARCH_HAS_NO_LDSO is not set
> -# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
> -LDSO_LDD_SUPPORT=y
> -# LDSO_CACHE_SUPPORT is not set
> -LDSO_PRELOAD_ENV_SUPPORT=y
> -# LDSO_PRELOAD_FILE_SUPPORT is not set
> -# LDSO_STANDALONE_SUPPORT is not set
> -# LDSO_PRELINK_SUPPORT is not set
> -# UCLIBC_STATIC_LDCONFIG is not set
> -LDSO_RUNPATH=y
> -LDSO_SEARCH_INTERP_PATH=y
> -LDSO_LD_LIBRARY_PATH=y
> -# LDSO_NO_CLEANUP is not set
> -UCLIBC_CTOR_DTOR=y
> -# LDSO_GNU_HASH_SUPPORT is not set
> -# HAS_NO_THREADS is not set
> -LINUXTHREADS_OLD=y
> -# LINUXTHREADS_NEW is not set
> -# UCLIBC_HAS_THREADS_NATIVE is not set
> -UCLIBC_HAS_THREADS=y
> -# PTHREADS_DEBUG_SUPPORT is not set
> -UCLIBC_HAS_SYSLOG=y
> -UCLIBC_HAS_LFS=y
> -# MALLOC is not set
> -# MALLOC_SIMPLE is not set
> -MALLOC_STANDARD=y
> -MALLOC_GLIBC_COMPAT=y
> -UCLIBC_DYNAMIC_ATEXIT=y
> -# COMPAT_ATEXIT is not set
> -UCLIBC_SUSV3_LEGACY=y
> -# UCLIBC_SUSV3_LEGACY_MACROS is not set
> -UCLIBC_SUSV4_LEGACY=y
> -# UCLIBC_STRICT_HEADERS is not set
> -# UCLIBC_HAS_STUBS is not set
> -UCLIBC_HAS_SHADOW=y
> -UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
> -UCLIBC_HAS___PROGNAME=y
> -UCLIBC_HAS_PTY=y
> -ASSUME_DEVPTS=y
> -UNIX98PTY_ONLY=y
> -UCLIBC_HAS_GETPT=y
> -UCLIBC_HAS_LIBUTIL=y
> -UCLIBC_HAS_TM_EXTENSIONS=y
> -UCLIBC_HAS_TZ_CACHING=y
> -UCLIBC_HAS_TZ_FILE=y
> -UCLIBC_HAS_TZ_FILE_READ_MANY=y
> -UCLIBC_TZ_FILE_PATH="/etc/TZ"
> -UCLIBC_FALLBACK_TO_ETC_LOCALTIME=y
> -
> -#
> -# Advanced Library Settings
> -#
> -UCLIBC_PWD_BUFFER_SIZE=256
> -UCLIBC_GRP_BUFFER_SIZE=256
> -
> -#
> -# Support various families of functions
> -#
> -UCLIBC_LINUX_MODULE_26=y
> -# UCLIBC_LINUX_MODULE_24 is not set
> -UCLIBC_LINUX_SPECIFIC=y
> -UCLIBC_HAS_GNU_ERROR=y
> -UCLIBC_BSD_SPECIFIC=y
> -UCLIBC_HAS_BSD_ERR=y
> -# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
> -# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
> -# UCLIBC_NTP_LEGACY is not set
> -# UCLIBC_SV4_DEPRECATED is not set
> -UCLIBC_HAS_REALTIME=y
> -UCLIBC_HAS_ADVANCED_REALTIME=y
> -UCLIBC_HAS_EPOLL=y
> -UCLIBC_HAS_XATTR=y
> -UCLIBC_HAS_PROFILING=y
> -UCLIBC_HAS_CRYPT_IMPL=y
> -# UCLIBC_HAS_SHA256_CRYPT_IMPL is not set
> -# UCLIBC_HAS_SHA512_CRYPT_IMPL is not set
> -UCLIBC_HAS_CRYPT=y
> -UCLIBC_HAS_NETWORK_SUPPORT=y
> -UCLIBC_HAS_SOCKET=y
> -UCLIBC_HAS_IPV4=y
> -# UCLIBC_HAS_IPV6 is not set
> -# UCLIBC_HAS_RPC is not set
> -# UCLIBC_HAS_FULL_RPC is not set
> -# UCLIBC_HAS_REENTRANT_RPC is not set
> -UCLIBC_USE_NETLINK=y
> -UCLIBC_SUPPORT_AI_ADDRCONFIG=y
> -# UCLIBC_HAS_BSD_RES_CLOSE is not set
> -UCLIBC_HAS_COMPAT_RES_STATE=y
> -# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
> -UCLIBC_HAS_RESOLVER_SUPPORT=y
> -UCLIBC_HAS_LIBRESOLV_STUB=y
> -UCLIBC_HAS_LIBNSL_STUB=y
> -
> -#
> -# String and Stdio Support
> -#
> -UCLIBC_HAS_STRING_GENERIC_OPT=y
> -UCLIBC_HAS_STRING_ARCH_OPT=y
> -UCLIBC_HAS_CTYPE_TABLES=y
> -UCLIBC_HAS_CTYPE_SIGNED=y
> -# UCLIBC_HAS_CTYPE_UNSAFE is not set
> -UCLIBC_HAS_CTYPE_CHECKED=y
> -# UCLIBC_HAS_CTYPE_ENFORCED is not set
> -# UCLIBC_HAS_WCHAR is not set
> -# UCLIBC_HAS_LOCALE is not set
> -UCLIBC_HAS_HEXADECIMAL_FLOATS=y
> -# UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
> -UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
> -# USE_OLD_VFPRINTF is not set
> -UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
> -UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
> -# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
> -# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
> -# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
> -# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
> -# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
> -UCLIBC_HAS_STDIO_BUFSIZ_4096=y
> -# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
> -UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
> -# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
> -# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
> -# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
> -UCLIBC_HAS_STDIO_GETC_MACRO=y
> -UCLIBC_HAS_STDIO_PUTC_MACRO=y
> -UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
> -# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
> -UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
> -# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
> -UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
> -UCLIBC_HAS_PRINTF_M_SPEC=y
> -UCLIBC_HAS_ERRNO_MESSAGES=y
> -# UCLIBC_HAS_SYS_ERRLIST is not set
> -UCLIBC_HAS_SIGNUM_MESSAGES=y
> -# UCLIBC_HAS_SYS_SIGLIST is not set
> -UCLIBC_HAS_GNU_GETOPT=y
> -UCLIBC_HAS_GNU_GETSUBOPT=y
> -
> -#
> -# Big and Tall
> -#
> -UCLIBC_HAS_REGEX=y
> -# UCLIBC_HAS_REGEX_OLD is not set
> -UCLIBC_HAS_FNMATCH=y
> -# UCLIBC_HAS_FNMATCH_OLD is not set
> -# UCLIBC_HAS_WORDEXP is not set
> -UCLIBC_HAS_NFTW=y
> -UCLIBC_HAS_FTW=y
> -# UCLIBC_HAS_FTS is not set
> -UCLIBC_HAS_GLOB=y
> -UCLIBC_HAS_GNU_GLOB=y
> -UCLIBC_HAS_UTMPX=y
> -
> -#
> -# Library Installation Options
> -#
> -RUNTIME_PREFIX="/"
> -DEVEL_PREFIX="/usr/"
> -MULTILIB_DIR="lib"
> -HARDWIRED_ABSPATH=y
> -
> -#
> -# Security options
> -#
> -# UCLIBC_BUILD_PIE is not set
> -# UCLIBC_HAS_ARC4RANDOM is not set
> -# HAVE_NO_SSP is not set
> -UCLIBC_HAS_SSP=y
> -# UCLIBC_HAS_SSP_COMPAT is not set
> -# SSP_QUICK_CANARY is not set
> -PROPOLICE_BLOCK_ABRT=y
> -# PROPOLICE_BLOCK_SEGV is not set
> -# UCLIBC_BUILD_SSP is not set
> -UCLIBC_BUILD_RELRO=y
> -UCLIBC_BUILD_NOW=y
> -UCLIBC_BUILD_NOEXECSTACK=y
> -
> -#
> -# uClibc development/debugging options
> -#
> -CROSS_COMPILER_PREFIX=""
> -UCLIBC_EXTRA_CFLAGS=""
> -# DODEBUG is not set
> -# DODEBUG_PT is not set
> -# DOSTRIP is not set
> -# DOASSERTS is not set
> -# SUPPORT_LD_DEBUG is not set
> -# SUPPORT_LD_DEBUG_EARLY is not set
> -# UCLIBC_MALLOC_DEBUGGING is not set
> -# UCLIBC_HAS_BACKTRACE is not set
> -WARNINGS="-Wall"
> -# EXTRA_WARNINGS is not set
> -# DOMULTI is not set
> -# UCLIBC_MJN3_ONLY is not set
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index 9acb82e..0a1fdf6 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -1,6 +1,3 @@
> -# Locally calculated after checking pgp signature
> -sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
> -
>  # From http://www.uclibc-ng.org/
>  sha256  2fdc6b9015f8049be0eb12a5e3e446de471fb80061115afd8d72ea582cb22b74        uClibc-ng-1.0.11.tar.xz
>  
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index c62a40f..ad5f607 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -15,9 +15,6 @@ BR_NO_CHECK_HASH_FOR += $(UCLIBC_SOURCE)
>  else ifeq ($(BR2_UCLIBC_VERSION_NG),y)
>  UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>  UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
> -else
> -UCLIBC_SITE = http://www.uclibc.org/downloads
> -UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
>  endif
>  
>  UCLIBC_INSTALL_STAGING = YES
> 
