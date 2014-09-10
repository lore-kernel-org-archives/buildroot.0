From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Sep 2014 18:09:50 +0000 (UTC)
Subject: [Buildroot] [Bug 7424] New: undefined reference to
	`__builtin_thread_pointer'
Message-ID: <bug-7424-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7424

           Summary: undefined reference to `__builtin_thread_pointer'
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: reddy.mrp at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


/usr/bin/make -j1  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" silentoldconfig
make[1]: Entering directory `/home/anu/elinux/buildroot-2014.08'
BR2_DEFCONFIG=''
KCONFIG_AUTOCONFIG=/home/anu/elinux/buildroot-2014.08/output/build/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=/home/anu/elinux/buildroot-2014.08/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/home/anu/elinux/buildroot-2014.08/output/build/buildroot-config/tristate.config
BR2_CONFIG=/home/anu/elinux/buildroot-2014.08/.config
BR2_EXTERNAL=support/dummy-external
/home/anu/elinux/buildroot-2014.08/output/build/buildroot-config/conf
--silentoldconfig Config.in
make[1]: Leaving directory `/home/anu/elinux/buildroot-2014.08'
>>> uclibc 0.9.33.2 Building
/usr/bin/make -j9 -C
/home/anu/elinux/buildroot-2014.08/output/build/uclibc-0.9.33.2 ARCH="arm"
CROSS_COMPILE="/home/anu/elinux/cross_compiler/usr/bin/arm-raspberry-linux-uclibcgnueabihf-"
UCLIBC_EXTRA_CFLAGS=" " HOSTCC="/usr/bin/gcc" PREFIX= DEVEL_PREFIX=/
RUNTIME_PREFIX=/ all
make[1]: Entering directory
`/home/anu/elinux/buildroot-2014.08/output/build/uclibc-0.9.33.2'
  LD ld-uClibc-0.9.33.2.so
ldso/ldso/ld-uClibc_so.a(ldso.oS): In function `_dl_nothread_init_static_tls':
ldso.c:(.text+0xf00): undefined reference to `__builtin_thread_pointer'
collect2: error: ld returned 1 exit status
make[1]: *** [lib/ld-uClibc.so] Error 1
make[1]: Leaving directory
`/home/anu/elinux/buildroot-2014.08/output/build/uclibc-0.9.33.2'
make: ***
[/home/anu/elinux/buildroot-2014.08/output/build/uclibc-0.9.33.2/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
