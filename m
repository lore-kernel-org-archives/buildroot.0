From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 18:28:50 +0100
Subject: [Buildroot] [PATCH 5/5] package/musl: bump to version 1.2.2
In-Reply-To: <20210131223304.1857838-5-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 31 Jan 2021 23:33:03 +0100")
References: <20210131223304.1857838-1-thomas.petazzoni@bootlin.com>
 <20210131223304.1857838-5-thomas.petazzoni@bootlin.com>
Message-ID: <877dnrn1d9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Drop 0003-rewrite-wcsnrtombs-to-fix-buffer-overflow-and-other-.patch
 > as it is a backport of upstream commit
 > 3ab2a4e02682df1382955071919d8aa3c3ec40d4 which is part of the 1.2.2
 > release.

 > 1.2.2 release notes

 > major changes:
 > - child restrictions lifted after fork of multithreaded parent

 > new features:
 > - _Fork function (POSIX-future)
 > - reallocarray function (extension from OpenBSD, now widespread)
 > - gettid function (kernel tid as supported concept)
 > - SIGEV_THREAD_ID sigevent API (Linux extension)
 > - tcgetwinsize and tcsetwinsize functions (POSIX-future)

 > performance:
 > - faster software sqrt on archs without native sqrt instruction

 > compatibility:
 > - realpath no longer depends on procfs availability & accuracy
 > - time zone parser now always prefers 64-bit tables if present
 > - crypt_blowfish now supports $2b$ prefix
 > - res_query now reports errors via h_errno
 > - set*id and setrlimit are now safe in vforked/cloned child
 > - setgroups now applies to all threads
 > - dlopen debugger notification is improved, should work with lldb
 > - setrlimit no longer needs __synccall broadcast on linux 2.6.36+
 > - faccessat with AT_EACCESS no longer needs child process on linux 5.8+

 > bugs fixed:
 > - buffer overflow and infinite loop errors in wcsnrtombs (CVE-2020-28928)
 > - sem_close unmapped still-referenced semaphores
 > - fork of process with active aio could deadlock or crash paren
 > - pthread_cond_wait was broken with priority-inheritance mutex
 > - getgrouplist wrongly failed when nscd reported an empty list
 > - abort could leak modified SIGABRT disposition to fork or posix_spawn child
 > - regression with mallocng: malloc_usable_size(0) crashed
 > - readlink wrongly gave EINVAL on zero length dest buffer
 > - sqrtl was severely inaccurate (not correctly rounded) on ldquad archs
 > - assert failure wrongly flushed stdio (possible deadlock)
 > - MUSL_LOCPATH search was broken with multiple components
 > - missing newline in herror output
 > - possible deadlock in pthread_exit with pshared mutex or barrier usage
 > - pthread_mutexattr_getprotocol didn't read back protocol
 > - v4l2 ioctl translation for pre-time64 kernels didn't work

 > arch-specific bugs fixed:
 > - x86_64 longjmp failed to handle 0 argument reliably
 > - i386 __set_thread_area fallback for pre-2.6 kernels didn't work
 > - missing O_LARGEFILE macro value on x86_64, x32, mips64
 > - unpredictable s390x breakage from failure to preserve call-saved registers

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
