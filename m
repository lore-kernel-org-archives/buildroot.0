From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 06 Mar 2018 16:50:40 +0000
Subject: [Buildroot] [Bug 10846] New: error in compiling gnutls
Message-ID: <bug-10846-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10846

            Bug ID: 10846
           Summary: error in compiling gnutls
           Product: buildroot
           Version: 2018.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tinotom at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

it seems there is a bug in some header file in gnutls 3.5.17 .
Platform: Ubuntu 17.10 up-to-date on x86_64
Target: orange-pi-zero + systemd

Please read below an excerpt of the output:

[...]
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking how to run the C++ preprocessor... cpp
configure: error: in
`/home/santo/buildroot-2018.02/output/build/gnutls-3.5.17':
configure: error: C++ preprocessor "cpp" fails sanity check
See `config.log' for more details
package/pkg-generic.mk:237: recipe for target
'/home/santo/buildroot-2018.02/output/build/gnutls-3.5.17/.stamp_configured'
failed
make[1]: ***
[/home/santo/buildroot-2018.02/output/build/gnutls-3.5.17/.stamp_configured]
Error 1
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2
santo at lapin:~/buildroot-2018.02$
[...]

in the corresponding config.log:
[...]
ldroot-2018.02/output/host/arm-buildroot-linux-gnueabihf/bin --enable-shared
--disable-libgomp
Thread model: posix
gcc version 6.4.0 (Buildroot 2018.02) 
configure:5369: $? = 0
configure:5358:
/home/santo/buildroot-2018.02/output/host/bin/arm-buildroot-linux-gnueabihf-gcc
-V >&5
arm-buildroot-linux-gnueabihf-gcc.br_real: error: unrecognized command line
option '-V'
arm-buildroot-linux-gnueabihf-gcc.br_real: fatal error: no input files
compilation terminated.
configure:5369: $? = 1
configure:5358:
/home/santo/buildroot-2018.02/output/host/bin/arm-buildroot-linux-gnueabihf-gcc
-qversion >&5
[...]

Please let me know if teh above is not enough.
Thank you

-- 
You are receiving this mail because:
You are on the CC list for the bug.
