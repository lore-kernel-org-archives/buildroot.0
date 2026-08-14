Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317D5C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C7280E83;
	Fri, 14 Aug 2026 13:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz5c1mkJ6i6S; Fri, 14 Aug 2026 13:20:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB6F481327
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713615;
	bh=UqCG3brN+qYkDWJdngsMBclDcdmUBk1gl25DF0GbIac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r/3g5dEtGof/ocX4SHHuIIPf11jO/l3OQe0S1fJVAW1u7sU5SHJUoOuopsK34wuRQ
	 GCKu2BmvfG4BmiZ60O87dht4y5LE2z0NRYvKZoOySUup6bbfk6gTbBcEu7qvtnv0Nw
	 6e2jJ2U2sW0z1y3oWPVhiJmuSJV+d41mhLI15Ls808IgMOlmkoCqh/SgoHx/BQ7nz6
	 gyRu2zZTnPq8rSxTbT8DR4d0/C17+MpT/uG1JYBCpJ0dXTLuMBCxYRDvDVIdGpOLJg
	 YzLy+TneXdPeWZE1ccygqxM5C1kSYP3i62P+lke+rlgJjKHxTSnUQD2UVrERelX4+0
	 mCM+dfaiL8S0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB6F481327;
	Fri, 14 Aug 2026 13:20:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0F51139C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2BE66068A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-Jz7lbiwx6O for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2199A60803
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2199A60803
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 260F08D66B; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:42:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c42c90ef48eed438c9dcbbf6135f61e35c582d8d
X-Git-Newrev: 0565093a1a9ec25a9cc1e0b37f41046a9086c96e
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.260F08D66B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: bump to
 1.0.59
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0565093a1a9ec25a9cc1e0b37f41046a9086c96e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Changes made in this release:

Ben Wolsieffer (1):
      nptl: fix getting main stack size on no-MMU

Max Filippov (4):
      stdio: fix %a formatting of inf and nan
      stdio: fix radix point output for %a
      stdio: output sign with NaNs
      stdio: restrict first digit of %a output to 0 or 1

Ramin Moussavi (19):
      libintl.h: route stubs through format_arg inlines; fix gettext_noop
      build: scope .NOTPARALLEL to locale targets only, restore parallel build
      limits.h: define PAGE_SIZE/PAGESIZE like musl, fixing the gdb build
      wait4: fall back to waitid(2) at runtime when wait4 returns ENOSYS
      pagesize: restore PAGE_SHIFT fallback for binfmt_flat (no auxv)
      buildsys: build locale headers in-tree, not via a recursive sub-make
      extra/locale: skip locales the build host cannot provide
      csky: fix struct semid_ds layout for TIME64
      csky: make __kernel_uid_t/__kernel_gid_t 32-bit
      hppa: fix inotify/signalfd/timerfd flag values
      hppa: do not set IPC_64 for the SysV IPC *ctl commands
      x86: fix struct semid_ds layout for TIME64
      i386: add CFI to __libc_i386_syscall6 for cancellation unwinding
      i386: do not set IPC_64 for the SysV IPC *ctl commands on 5.1+ kernels
      buildsys: terminate .eh_frame in shared objects
      m68k: make the __jmp_buf layout match what setjmp.S actually saves
      inet: use the direct accept4 syscall when __NR_accept is missing
      m68k: implement atomic operations with the CAS instruction
      libc: fix struct shmid_ds layout for TIME64

Waldemar Brodkorb (10):
      netinet/in.h: sync with glibc
      bits/fcntl-linux.h: sync with glibc
      add copy_file_range syscall wrapper
      sys/fanotify.h: drop include to fix c-sky compilation
      adjtimex: fix for architectures lacking __NR_clock_adjtime, f.e. frv
      sys/user.h: restore required macros
      netinet/tcp.h: sync with glibc
      loongarch: add basic static only support
      riscv: setcontext: fix linking error
      bump version for 1.0.59 release

ramin (16):
      ldso: harden _dl_tls_get_addr_soft against an unusable DTV
      microblaze: implement atomic operations with lwx/swx
      ldso: microblaze: add missing addend to R_MICROBLAZE_TLSDTPREL32
      ldso: make the _dl_tls_get_addr_soft DTV check microblaze-specific
      microblaze: fix struct semid_ds layout for TIME64
      m68k: fix struct semid_ds layout for TIME64
      mips: fix fallocate() 64-bit argument passing on n32
      mips: fix mmap64() for large offsets on n32
      mips: fix setjmp() on n32/n64 (.cpreturn, not .cprestore)
      mips: always set IPC_64 for the SysV IPC *ctl commands
      libc: fix struct msqid_ds layout for TIME64 on all common-header arches
      linuxthreads: fix SIGSEGV in MIPS cancellable wrappers (waitpid, nanosleep)
      ldso: serialize dl_iterate_phdr to fix concurrent unwind hang on SMP
      nptl: cancel the current thread directly instead of via SIGCANCEL
      mips: only n32/n64 always need IPC_64, not o32
      m68k: use the kernel cmpxchg helper for atomics on ColdFire

Patch 0001 is applied upstream and is removed here.

Fixes:
  - https://autobuild.buildroot.net/results/2bd/2bd73b0060cad4f44649ffe4ea60c4775160d86e

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b94d3eb728546aeb196941472b98922843e36279)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...store-PAGE_SHIFT-fallback-for-binfmt_flat.patch | 169 ---------------------
 package/uclibc/uclibc.hash                         |   4 +-
 package/uclibc/uclibc.mk                           |   2 +-
 3 files changed, 3 insertions(+), 172 deletions(-)

diff --git a/package/uclibc/0001-pagesize-restore-PAGE_SHIFT-fallback-for-binfmt_flat.patch b/package/uclibc/0001-pagesize-restore-PAGE_SHIFT-fallback-for-binfmt_flat.patch
deleted file mode 100644
index fdfd286042..0000000000
--- a/package/uclibc/0001-pagesize-restore-PAGE_SHIFT-fallback-for-binfmt_flat.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From 7730f0d05a51cd89a7123bd696e4638c3c035d7b Mon Sep 17 00:00:00 2001
-From: Ramin Moussavi <ramin.moussavi@yacoub.de>
-Date: Fri, 29 May 2026 19:47:34 +0200
-Subject: [PATCH] pagesize: restore PAGE_SHIFT fallback for binfmt_flat (no
- auxv)
-
-binfmt_flat builds the initial process stack from only argc/argv/envp;
-it does not place an auxiliary vector. Commit 487af1498 ("drop
-__pagesize, make _dl_pagesize the single source of truth") assumed
-AT_PAGESZ is always supplied by the kernel and changed the _dl_pagesize
-fallback from PAGE_SIZE to 0. On noMMU/FLAT targets that leaves
-_dl_pagesize == 0, so every mmap-based malloc rounds its length to 0,
-mmap() fails with EINVAL and the first allocation aborts -- busybox dies
-with "init: out of memory" before it can run anything.
-
-Restore the fallback that arc/nds32 bits/uClibc_page.h have always
-documented ("_dl_pagesize = auxvt[AT_PAGESZ].a_un.a_val ? : PAGE_SIZE"),
-expressed as (1UL << PAGE_SHIFT) so it keeps working now that PAGE_SIZE
-is no longer defined in <bits/uClibc_page.h>:
-
-  - Seed _dl_pagesize with (1UL << PAGE_SHIFT) at its definition in the
-    two translation units that own the symbol: the dynamic linker
-    (ldso.c, used by ld.so) and the static-libc support (dl-support.c).
-  - Override it from AT_PAGESZ only when that entry is actually present
-    (a_type == AT_PAGESZ) and non-zero, instead of unconditionally
-    resetting it to 0.
-
-libdl.c (!SHARED) previously also defined _dl_pagesize. That was
-harmless while dl-support.c's definition was tentative (the two merged),
-but giving both a non-zero initializer makes them two strong .data
-definitions, which collide as "multiple definition of `_dl_pagesize'"
-when a static link pulls both objects out of libc.a (e.g. NPTL builds
-that drag in libdl). Drop the redundant libdl.c definition: dl-support.c
-is always co-linked from libc.a and provides the symbol.
-
-For FLAT, skip the aux-vector scan in __uClibc_main() altogether: there
-is nothing valid past the envp NULL, so _dl_aux_init() is not called and
-_dl_auxv_start stays NULL. Guard getauxval()'s slow-path loop against
-that NULL so a lookup of an uncached (>= AUX_MAX_AT_ID) tag returns
-ENOENT instead of dereferencing NULL.
-
-Verified on riscv32 noMMU/FLAT (gcc 15.2.0, linux 6.18.33): busybox
-boots as init and the testsuite runs (was "init: out of memory"
-before). Dynamic + NPTL links are unaffected -- x86_64 NPTL static
-busybox links cleanly and ld-uClibc loads the testsuite.
-
-Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/7730f0d05a51cd89a7123bd696e4638c3c035d7b
-Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- ldso/ldso/ldso.c                    | 7 ++++---
- ldso/libdl/libdl.c                  | 2 +-
- libc/misc/auxvt/getauxval.c         | 3 ++-
- libc/misc/elf/dl-support.c          | 7 ++++---
- libc/misc/internals/__uClibc_main.c | 7 +++++--
- 5 files changed, 16 insertions(+), 10 deletions(-)
-
-diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
-index 9c00e4a61..55f7d7e45 100755
---- a/ldso/ldso/ldso.c
-+++ b/ldso/ldso/ldso.c
-@@ -52,7 +52,7 @@ char *_dl_library_path         = NULL;	/* Where we look for libraries */
- char *_dl_preload              = NULL;	/* Things to be loaded before the libs */
- #endif
- int _dl_errno                  = 0;	/* We can't use the real errno in ldso */
--size_t _dl_pagesize            = 0;	/* Store the page size for use later */
-+size_t _dl_pagesize            = (1UL << PAGE_SHIFT);	/* fallback; overridden from AT_PAGESZ if present */
- struct r_debug *_dl_debug_addr = NULL;	/* Used to communicate with the gdb debugger */
- void *(*_dl_malloc_function) (size_t size) = NULL;
- void (*_dl_free_function) (void *p) = NULL;
-@@ -460,8 +460,9 @@ void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
- 
- 	_dl_memset(app_tpnt, 0, sizeof(*app_tpnt));
- 
--	/* Store the page size for later use */
--	_dl_pagesize = (_dl_auxvt[AT_PAGESZ].a_un.a_val) ? (size_t) _dl_auxvt[AT_PAGESZ].a_un.a_val : 0;
-+	/* Override the fallback only if AT_PAGESZ is present and non-zero */
-+	if (_dl_auxvt[AT_PAGESZ].a_type == AT_PAGESZ && _dl_auxvt[AT_PAGESZ].a_un.a_val)
-+		_dl_pagesize = (size_t) _dl_auxvt[AT_PAGESZ].a_un.a_val;
- 	/* Make it so _dl_malloc can use the page of memory we have already
- 	 * allocated.  We shouldn't need to grab any more memory.  This must
- 	 * be first since things like _dl_dprintf() use _dl_malloc()...
-diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
-index b78d6d9a3..f28801d7b 100644
---- a/ldso/libdl/libdl.c
-+++ b/ldso/libdl/libdl.c
-@@ -109,7 +109,7 @@ void (*_dl_free_function) (void *p);
- char *_dl_library_path         = NULL;         /* Where we look for libraries */
- #endif
- int _dl_errno                  = 0;         /* We can't use the real errno in ldso */
--size_t _dl_pagesize            = 0; /* Store the page size for use later */
-+/* _dl_pagesize is provided by dl-support.c (always co-linked from libc.a) */
- /* This global variable is also to communicate with debuggers such as gdb. */
- struct r_debug *_dl_debug_addr = NULL;
- 
-diff --git a/libc/misc/auxvt/getauxval.c b/libc/misc/auxvt/getauxval.c
-index 7610b7e5c..4af637071 100755
---- a/libc/misc/auxvt/getauxval.c
-+++ b/libc/misc/auxvt/getauxval.c
-@@ -33,7 +33,8 @@ unsigned long int __getauxval (unsigned long int __type)
- 	}
- 
- 	// Otherwise we have to iterate the auxiliary vector.
--	for (ElfW(auxv_t) *entry = _dl_auxv_start; entry->a_type != AT_NULL; entry++)
-+	// _dl_auxv_start is NULL when there is no aux vector (e.g. FLAT).
-+	for (ElfW(auxv_t) *entry = _dl_auxv_start; entry && entry->a_type != AT_NULL; entry++)
- 		if (entry->a_type == __type)
- 			return entry->a_un.a_val;
- 
-diff --git a/libc/misc/elf/dl-support.c b/libc/misc/elf/dl-support.c
-index 738f0ed3a..7ad57c090 100644
---- a/libc/misc/elf/dl-support.c
-+++ b/libc/misc/elf/dl-support.c
-@@ -30,7 +30,7 @@ void (*_dl_init_static_tls) (struct link_map *) = &_dl_nothread_init_static_tls;
- 
- ElfW(Phdr) *_dl_phdr;
- size_t _dl_phnum;
--size_t _dl_pagesize;
-+size_t _dl_pagesize = (1UL << PAGE_SHIFT);	/* fallback; overridden from AT_PAGESZ if present */
- 
- ElfW(auxv_t) _dl_auxvt[AUX_MAX_AT_ID];
- ElfW(auxv_t) *_dl_auxv_start;
-@@ -52,8 +52,9 @@ void internal_function _dl_aux_init (ElfW(auxv_t) *av)
-    /* Get the number of program headers from the aux vect */
-    _dl_phnum = (size_t) _dl_auxvt[AT_PHNUM].a_un.a_val;
- 
--   /* Get the pagesize from the aux vect */
--   _dl_pagesize = (_dl_auxvt[AT_PAGESZ].a_un.a_val) ? (size_t) _dl_auxvt[AT_PAGESZ].a_un.a_val : 0;
-+   /* Override the fallback only if AT_PAGESZ is present and non-zero */
-+   if (_dl_auxvt[AT_PAGESZ].a_type == AT_PAGESZ && _dl_auxvt[AT_PAGESZ].a_un.a_val)
-+      _dl_pagesize = (size_t) _dl_auxvt[AT_PAGESZ].a_un.a_val;
- }
- 
- #if defined(USE_TLS) && USE_TLS
-diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
-index 35cb73fcc..549606505 100644
---- a/libc/misc/internals/__uClibc_main.c
-+++ b/libc/misc/internals/__uClibc_main.c
-@@ -369,7 +369,7 @@ void __uClibc_main(int (*main)(int, char **, char **), int argc,
- 		    char **argv, void (*app_init)(void), void (*app_fini)(void),
- 		    void (*rtld_fini)(void), void *stack_end attribute_unused)
- {
--#ifndef SHARED
-+#if !defined(SHARED) && !defined(__UCLIBC_FORMAT_FLAT__)
-     unsigned long *aux_dat;
- #endif
- 
-@@ -395,7 +395,9 @@ void __uClibc_main(int (*main)(int, char **, char **), int argc,
-     }
- 
- #ifndef SHARED
--    /* Pull stuff from the ELF header when possible */
-+# ifndef __UCLIBC_FORMAT_FLAT__
-+    /* Pull stuff from the ELF header when possible. binfmt_flat passes no
-+       aux vector, so skip this for FLAT. */
-     aux_dat = (unsigned long*)__environ;
-     while (*aux_dat) {
- 	aux_dat++;
-@@ -404,6 +406,7 @@ void __uClibc_main(int (*main)(int, char **, char **), int argc,
-     /* Get the program headers (_dl_phdr) from the aux vector
-        It will be used into __libc_setup_tls. */
-     _dl_aux_init ((ElfW(auxv_t) *)aux_dat);
-+# endif
- #endif
- 
-     /* We need to initialize uClibc.  If we are dynamically linked this
--- 
-2.47.3
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 4c2a579ddf..4e5fd587e2 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.58/uClibc-ng-1.0.58.tar.xz.sha256
-sha256  9e8100a442f7079b9728ca286e3035f67df0578606166ea2d1ef865a4a12ddb9  uClibc-ng-1.0.58.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.59/uClibc-ng-1.0.59.tar.xz.sha256
+sha256  86c6f15971bfb14156850f2e36906dac5a69df7b3e688216d1aea09d2db54174  uClibc-ng-1.0.59.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 6f3668715b..0cee106014 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.58
+UCLIBC_VERSION = 1.0.59
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
