From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  4 Jun 2011 05:14:27 +0000 (UTC)
Subject: [Buildroot] [Bug 3817] New: Failed to compile binutils-2.21
Message-ID: <bug-3817-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3817

           Summary: Failed to compile binutils-2.21
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fhbxl at hotmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Enviornment: Fedora 15 
I downloaded buildroot-20110603.tar.bz2, unzipped it, only saved directly to
use the default values in menuconfig. Then do a simple "make". I got a compile
error when compiling binutils-2.21, the error is:

# gcc >= 4.3.0 have to also build all-target-libgcc
/usr/bin/make -j2 -C
/home/haibo/learn/buildroot/output/toolchain/gcc-4.3.5-intermediate all-gcc
all-target-libgcc
make[3]: Nothing to be done for `all'.
make[4]: Nothing to be done for `all'.
make[4]: Nothing to be done for `all'.
make[3]: Nothing to be done for `all'.
make[3]: Nothing to be done for `all'.
make[3]: Nothing to be done for `all'.
test -f config.h || (rm -f stamp-h1 && /usr/bin/make stamp-h1)
Checking multilib configuration for libgcc...
/bin/sh: error while loading shared libraries: /usr/lib/libc.so: invalid ELF
header
# If this is the top-level multilib, build all the other
/bin/sh: error while loading shared libraries: /usr/lib/libc.so: invalid ELF
header
make[3]: *** [all-multi] Error 127
make[2]: *** [all-target-libgcc] Error 2
make[1]: ***
[/home/haibo/learn/buildroot/output/toolchain/gcc-4.3.5-intermediate/.compiled]
Error 2
make: *** [all] Error 2

I could work around this problem by doing the following:
$cd /usr/lib
$rm libc.so
$ln -s /lib/libc.so.6 libc.so

But this is not the best way, because ASCII file /usr/lib/libc.so's missing
incurs other problems, fox example "make menuconfig" fails to launch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
