From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  7 Mar 2009 23:27:10 +0000 (UTC)
Subject: [Buildroot] [Bug 155] New: uClibc 0.9.28.3 fails to build
Message-ID: <bug-155-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=155

              Host: openSuSE 11.1
            Target: mipsel TViX DVICO m-6500
           Summary: uClibc 0.9.28.3 fails to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: luke_tucker at yahoo.co.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When building the default configuration with the following differences:
mipsel
-obsolete options on
-gcc 4.0.4
-binutils 2.18
-uClibc 0.9.28.3
-kernel-headers 2.6.20.4

The following build error occurs in uClibc:
make[5]: Entering directory
`/home/luke/buildroot/toolchain_build_mipsel/uClibc-0.9.28.3/libc/sysdeps/linux/mips'
/home/luke/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-gcc 
-Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing  -mips1 
-fno-builtin -nostdinc -D_LIBC -I../../../../include -I.  -Os -funit-at-a-time 
-mno-split-addresses -isystem
/home/luke/buildroot/build_mipsel/staging_dir/bin/../lib/gcc/mipsel-linux-uclibc/4.0.4/include
-DNDEBUG -fPIC  -c clone.S -o clone.o
clone.S:27:21: error: asm/asm.h: No such file or directory
make[5]: *** [clone.o] Error 1
make[5]: Leaving directory
`/home/luke/buildroot/toolchain_build_mipsel/uClibc-0.9.28.3/libc/sysdeps/linux/mips'
make[4]: *** [mips] Error 2
make[4]: Leaving directory
`/home/luke/buildroot/toolchain_build_mipsel/uClibc-0.9.28.3/libc/sysdeps/linux'
make[3]: *** [_dir_linux] Error 2
make[3]: Leaving directory
`/home/luke/buildroot/toolchain_build_mipsel/uClibc-0.9.28.3/libc/sysdeps'
make[2]: *** [_dir_sysdeps] Error 2
make[2]: Leaving directory
`/home/luke/buildroot/toolchain_build_mipsel/uClibc-0.9.28.3/libc'
make[1]: *** [_dir_libc] Error 2
make[1]: Leaving directory
`/home/luke/buildroot/toolchain_build_mipsel/uClibc-0.9.28.3'
make: ***
[/home/luke/buildroot/toolchain_build_mipsel/uClibc-0.9.28.3/lib/libc.a] Error
2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
