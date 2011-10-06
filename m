From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Oct 2011 08:51:26 +0000 (UTC)
Subject: [Buildroot] [Bug 4117] 2011.08: default config with qt + ssl.
	Linking fails
In-Reply-To: <bug-4117-163@https.bugs.busybox.net/>
References: <bug-4117-163@https.bugs.busybox.net/>
Message-ID: <20111006085126.40C498DFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4117

--- Comment #1 from AWa. <awa_wp@wp.pl>  ---
I confirm this bug.

arm-linux-gcc test.c -o test  -lpthread -static
/home/dl3/src/buildroot-2011.08_test/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/libgcc_eh.a(unwind-arm.o):
In function `__aeabi_unwind_cpp_pr0':
/home/dl3/src/buildroot-2011.08_test/output/toolchain/gcc-4.3.6/libgcc/../gcc/config/arm/unwind-arm.c:1251:
multiple definition of `__aeabi_unwind_cpp_pr0'
/home/dl3/src/buildroot-2011.08_test/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(aeabi_unwind_cpp_pr1.os):/home/dl3/src/buildroot-2011.08_test/output/toolchain/uClibc-0.9.32/./libc/sysdeps/linux/arm/../../../../libc/sysdeps/linux/arm/aeabi_unwind_cpp_pr1.c:29:
first defined here
/home/dl3/src/buildroot-2011.08_test/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(sigprocmask.os):
In function `*__GI_sigprocmask':
/home/dl3/src/buildroot-2011.08_test/output/toolchain/uClibc-0.9.32/libc/sysdeps/linux/common/sigprocmask.c:27:
multiple definition of `sigprocmask'
/home/dl3/src/buildroot-2011.08_test/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pt-sigprocmask.os):/home/dl3/src/buildroot-2011.08_test/output/toolchain/uClibc-0.9.32/./libc/sysdeps/linux/arm/../../../../libc/sysdeps/linux/common/sigprocmask.c:27:
first defined here
/home/dl3/src/buildroot-2011.08_test/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(sigaction.os):
In function `__libc_sigaction':
/home/dl3/src/buildroot-2011.08_test/output/toolchain/uClibc-0.9.32/./libc/sysdeps/linux/arm/sigaction.c:50:
multiple definition of `__libc_sigaction'
/home/dl3/src/buildroot-2011.08_test/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pt-sigaction.os):/home/dl3/src/buildroot-2011.08_test/output/toolchain/uClibc-0.9.32/./libc/sysdeps/linux/arm/sigaction.c:50:
first defined here
/home/dl3/src/buildroot-2011.08_test/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(sigaction.os):
In function `__sigaction':
/home/dl3/src/buildroot-2011.08_test/output/toolchain/uClibc-0.9.32/libpthread/nptl/sysdeps/pthread/sigaction.c:32:
multiple definition of `__sigaction'
/home/dl3/src/buildroot-2011.08_test/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pt-sigaction.os):/home/dl3/src/buildroot-2011.08_test/output/toolchain/uClibc-0.9.32/libpthread/nptl/sysdeps/pthread/pt-sigaction.c:32:
first defined here
collect2: ld returned 1 exit status

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
