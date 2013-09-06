From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Sep 2013 15:28:51 +0200
Subject: [Buildroot] [git commit] uclibc: add upstream 0.9.33 fixes
Message-ID: <20130906133535.2BD969A98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=055f1c02d35068d0b089f3b29ffdd4fb2717bb5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has a large number of patches lined up for the next 0.9.33.x bugfix
release;

http://git.uclibc.org/uClibc/log/?h=0.9.33

Add them here, as atleast some of them are quite critical (E.G. the eventfd
issue gets triggered by recent glib versions).

I've skipped the microblaze and xtensa fixes as we don't currently support
those with 0.9.33.2.

Drop uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CMSG_CLOEXE.patch
as that is a subset of uclibc-0035-socket.h-pull-socket_type.h-from-eglibc.patch

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ion-of-MSG_WAITFORONE-and-MSG_CMSG_CLOEXE.patch |   39 -
 ...ventfd-Implement-eventfd2-and-fix-eventfd.patch |   64 +
 .../uclibc-0014-pread-pwrite-backport-fix.patch    |  219 ++++
 .../0.9.33.2/uclibc-0015-add-posix_madvise.c.patch |   61 +
 ...ptl-sh-fix-race-condition-in-lll_wait_tid.patch |   38 +
 ...d-SIGCANCEL-to-the-list-of-blocked-signal.patch |   37 +
 ...18-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch |   52 +
 ...nclude-elf.h-update-for-ELFOSABI_-changes.patch |   34 +
 ...0020-update-ptrace.h-to-latest-from-glibc.patch |  113 ++
 .../uclibc-0021-pread-pwrite-fix-for-threads.patch |   37 +
 ...x-authnone_marshal-in-multithreading-cont.patch |  128 ++
 ...t-__syscall_error-callers-to-use-a0-for-a.patch |   57 +
 ...-instead-of-v0-for-__syscall_error-argume.patch |   63 +
 ...se-.arm-mode-for-resolver-unconditionally.patch |   29 +
 ...s-getpid-behave-similar-to-the-common-one.patch |   53 +
 ...yscalls.h-allow-immediate-values-as-6th-s.patch |   33 +
 ...-0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch |   57 +
 ...libc-0029-inet-rpc-fix-build-in-NPTL-case.patch |   58 +
 ...plement-assignment-allocation-m-character.patch |  190 +++
 ...map-sys_mmap2-do-unsigned-shift-of-offset.patch |   35 +
 ...e-handle-renamed-syscalls-in-common-ppc-x.patch |  114 ++
 .../uclibc-0033-rpmatch-backport-function.patch    |   78 ++
 .../uclibc-0034-statfs-support-f_frsize.patch      |  189 +++
 ...5-socket.h-pull-socket_type.h-from-eglibc.patch | 1374 ++++++++++++++++++++
 .../0.9.33.2/uclibc-0036-mount.h-update.patch      |   91 ++
 ...n_bits_syscall_h-do-not-leave-undefined-S.patch |   38 +
 ...38-libc-sysdeps-sync-bits-in.h-with-glibc.patch |  117 ++
 ...-reuse-free-slots-at-the-end-of-exit-func.patch |   43 +
 ...ame-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch |  200 +++
 .../uclibc-0041-libc-add-posix_fallocate.patch     |  337 +++++
 ...-fix-overflow-checking-in-int_add_no_wrap.patch |   44 +
 ...Add-missing-SYMBOL_PREFIX-to-symbol-names.patch |   86 ++
 ...inet-do-not-filter-responses-in-res_query.patch |   46 +
 ...-Remove-pragma-weak-for-undeclared-symbol.patch |   39 +
 ...tting-the-nameserver-from-_res-state-afte.patch |   34 +
 ...-use-fputws_unlocked-S-F-instead-of-fputw.patch |   30 +
 ...48-Fix-a-problem-with-scanning-wide-chars.patch |   66 +
 ...agileness-in-dlopen-do_dlopen-wrapper-wor.patch |   66 +
 ...lopen-implementation-from-statically-link.patch |   60 +
 ...ce-fix-backtrace-for-statically-linked-ap.patch |  168 +++
 ...libubacktrace-fix-build-due-to-some-typos.patch |   39 +
 ...plicitly-include-uClibc_page.h-to-make-PA.patch |   30 +
 42 files changed, 4647 insertions(+), 39 deletions(-)

Patch is too large, so refusing to show it
