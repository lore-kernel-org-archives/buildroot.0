From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 19 Dec 2007 23:14:37 +0100
Subject: [Buildroot] buildroot fail arm / arm_generic, on coreutils
References: <4768F0A8.4090901@gmx.net>
Message-ID: <024701c8429e$6e24f180$3ba6fea9@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

| hello list,
| 
| i try to build buildroot on i386 for arm, generic arm cpu. this is the
| actual revision from svn:
| 
| svn co svn://uclibc.org/trunk/buildroot
| Revision 20658.
| 
| during compilation error occurs in coreutils:
| 
| /mnt/svn/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
| -Os -pipe  -I/mnt/svn/buildroot/build_arm/staging_dir/usr/include
| -I/mnt/svn/buildroot/build_arm/staging_dir/include  -I.      -g -O2 -c
| mbchar.c
| In file included from mbchar.h:157,
|                 from mbchar.c:22:
| ./wchar.h:41:12: error: empty filename in #include
| In file included from mbchar.c:22:
| mbchar.h:242: error: expected ')' before 'wc'
| make[3]: *** [mbchar.o] Error 1
| make[3]: Leaving directory `/mnt/svn/buildroot/build_arm/coreutils-6.9/lib'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory `/mnt/svn/buildroot/build_arm/coreutils-6.9/lib'
| make[1]: *** [all-recursive] Fehler 1
| make[1]: Leaving directory `/mnt/svn/buildroot/build_arm/coreutils-6.9'
| make: *** [/mnt/svn/buildroot/build_arm/coreutils-6.9/src/vdir] Fehler 2
|

This is because you built your cross compiler without WCHAR support.

Best Regards
Ulf Samuelsson
