From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Aug 2011 20:37:34 +0000 (UTC)
Subject: [Buildroot] [Bug 4117] New: 2011.08: default config with qt + ssl.
	Linking fails
Message-ID: <bug-4117-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4117

           Summary: 2011.08: default config with qt + ssl. Linking fails
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas at zicada.no
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Trying to link custom software (same code links on 2011.05 with same config).
Output:


/home/zicada/buildroot-2011.08/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/libgcc_eh.a(unwind-arm.o):
In function `__aeabi_unwind_cpp_pr0':
/home/zicada/buildroot-2011.08/output/toolchain/gcc-4.3.6/libgcc/../gcc/config/arm/unwind-arm.c:1251:
multiple definition of `__aeabi_unwind_cpp_pr0'
/home/zicada/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/librt.a(aeabi_unwind_cpp_pr1.os):aeabi_unwind_cpp_pr1.c:(.text+0x0):
first defined here
/home/zicada/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(sigprocmask.os):
In function `sigprocmask':
sigprocmask.c:(.text+0x0): multiple definition of `sigprocmask'
/home/zicada/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pt-sigprocmask.os):pt-sigprocmask.c:(.text+0x0):
first defined here
/home/zicada/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(sigaction.os):
In function `__libc_sigaction':
sigaction.c:(.text+0x0): multiple definition of `__libc_sigaction'
/home/zicada/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pt-sigaction.os):pt-sigaction.c:(.text+0x0):
first defined here
/home/zicada/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(sigaction.os):
In function `sigaction':
sigaction.c:(.text+0x84): multiple definition of `__sigaction'
/home/zicada/buildroot-2011.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libpthread.a(pt-sigaction.os):pt-sigaction.c:(.text+0x84):
first defined here
collect2: ld returned 1 exit status
make: *** [target/dist/jottaembedded] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
