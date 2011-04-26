From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 Apr 2011 01:44:47 +0000 (UTC)
Subject: [Buildroot] [Bug 3529] alsa-lib 1.0.24.1 build fails with daily
 snapshot (2011-03-29)
In-Reply-To: <bug-3529-163@https.bugs.busybox.net/>
References: <bug-3529-163@https.bugs.busybox.net/>
Message-ID: <20110426014447.EBFE382A6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3529

--- Comment #6 from Kelvin Cheung <keguang.zhang@gmail.com>  ---
(In reply to comment #0)
> make[4]: Entering directory
> `/home/mjhammel/src/ximba/bb/bld/buildroot-snapshot/output/build/alsa-lib-1.0.24.1/src/ucm'
>   CC     utils.lo
>   CC     parser.lo
>   CC     main.lo
> parser.c: In function 'uc_mgr_scan_master_configs':
> parser.c:1138: error: 'versionsort' undeclared (first use in this function)
> parser.c:1138: error: (Each undeclared identifier is reported only once
> parser.c:1138: error: for each function it appears in.)
> 
> I'm on Fedora 13, using an external Crosstool-NG 1.10.0 toolchain.
> 
> Tomorrow I'll try back-patching to 1.0.23 and see if that works.

The same problem also happened to me.
And when I try uClibc 0.9.31 in crosstool-ng 1.10.1, I got this error below:

[ALL  ]   
/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/tools/bin/install
-c -m 644 ./libiberty.a
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/lib/`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/./gcc/xgcc
-B/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/./gcc/
-B/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/bin/
-B/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/lib/
-isystem
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/include
-isystem
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/sys-include
-g -Os   -print-multi-os-directory`/./libiberty.an
[ALL  ]    ( cd
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/lib/`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/./gcc/xgcc
-B/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/./gcc/
-B/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/bin/
-B/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/lib/
-isystem
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/include
-isystem
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/sys-include
-g -Os   -print-multi-os-directory` ; chmod 644 ./libiberty.an;
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/bin/ranlib
./libiberty.an )
[ALL  ]    mv -f
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/lib/`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/./gcc/xgcc
-B/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/./gcc/
-B/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/bin/
-B/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/lib/
-isystem
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/include
-isystem
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/sys-include
-g -Os   -print-multi-os-directory`/./libiberty.an
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/lib/`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/./gcc/xgcc
-B/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/./gcc/
-B/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/bin/
-B/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/lib/
-isystem
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/include
-isystem
/opt/buildroot_real6410/output_fs2410/host/usr/arm-unknown-linux-uclibcgnueabi/sys-include
-g -Os   -print-multi-os-directory`/./libiberty.a
[ALL  ]    make[7]: Entering directory
`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/arm-unknown-linux-uclibcgnueabi/libiberty/testsuite'
[ALL  ]    make[7]: Nothing to be done for `install'.
[ALL  ]    make[7]: Leaving directory
`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/arm-unknown-linux-uclibcgnueabi/libiberty/testsuite'
[ALL  ]    make[6]: Leaving directory
`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc/arm-unknown-linux-uclibcgnueabi/libiberty'
[ALL  ]    make[5]: Leaving directory
`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc'
[ALL  ]    make[4]: Leaving directory
`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc'
[ALL  ]    ln: creating symbolic link
`/opt/buildroot_real6410/output_fs2410/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cc':
File exists
[ERROR]    Build failed in step 'Installing final compiler'
[ERROR]    Error happened in
'/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/scripts/functions'
in function 'CT_DoExecLog' (line unknown, sorry)
[ERROR]          called from
'/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/scripts/build/cc/gcc.sh'
at line # 534 in function 'do_cc'
[ERROR]          called from
'/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.10.1/scripts/crosstool-NG.sh'
at line # 606 in function 'main'
[ERROR]    Look at '/opt/buildroot_real6410/output_fs2410/host/usr/build.log'
for more info on this error.
[ERROR]  (elapsed: 15:38.24)
make[3]: *** [build] Error 1
make[2]: *** [build.2] Error 2
make[1]: ***
[/opt/buildroot_real6410/output_fs2410/stamps/ct-ng-toolchain-built] Error 2
make: *** [all] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
