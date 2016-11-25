From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Nov 2016 17:14:14 +0000
Subject: [Buildroot] [Bug 9446] New: make raspberrypi3_defconfig compilation
	failure
Message-ID: <bug-9446-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9446

            Bug ID: 9446
           Summary: make raspberrypi3_defconfig compilation failure
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sajjan.jyothisv at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

libtool: compile:  /usr/bin/gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I..
-D__GMP_WITHIN_GMP -I.. -DOPERATION_sec_add_1
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -O2
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -c sec_add_1.c 
-fPIC -DPIC -o .libs/sec_add_1.o
libtool: compile:  /usr/bin/gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I..
-D__GMP_WITHIN_GMP -I.. -DOPERATION_sec_sub_1
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -O2
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -c sec_sub_1.c 
-fPIC -DPIC -o .libs/sec_sub_1.o
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -std=gnu99
-DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo sec_invert
| sed 's/_$//'` -I/home/sajjan/BuildRoot/buildroot/output/host/usr/include  -O2
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -c -o sec_invert.lo
sec_invert.c
libtool: compile:  /usr/bin/gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I..
-D__GMP_WITHIN_GMP -I.. -DOPERATION_sec_invert
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -O2
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -c sec_invert.c 
-fPIC -DPIC -o .libs/sec_invert.o
gcc: internal compiler error: Segmentation fault (program as)
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -std=gnu99
-DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo trialdiv |
sed 's/_$//'` -I/home/sajjan/BuildRoot/buildroot/output/host/usr/include  -O2
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -c -o trialdiv.lo
trialdiv.c
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-4.9/README.Bugs> for instructions.
Makefile:492: recipe for target 'sec_powm.lo' failed
make[4]: *** [sec_powm.lo] Error 1
make[4]: *** Waiting for unfinished jobs....
libtool: compile:  /usr/bin/gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I..
-D__GMP_WITHIN_GMP -I.. -DOPERATION_trialdiv
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -O2
-I/home/sajjan/BuildRoot/buildroot/output/host/usr/include -c trialdiv.c  -fPIC
-DPIC -o .libs/trialdiv.o
Makefile:955: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
Makefile:774: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:216: recipe for target
'/home/sajjan/BuildRoot/buildroot/output/build/host-gmp-6.1.1/.stamp_built'
failed
make[1]: ***
[/home/sajjan/BuildRoot/buildroot/output/build/host-gmp-6.1.1/.stamp_built]
Error 2
Makefile:76: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
