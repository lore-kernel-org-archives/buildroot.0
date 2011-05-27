From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 May 2011 04:55:58 +0000 (UTC)
Subject: [Buildroot] [Bug 3781] crosstool-ng-1.11.3 fails to build
In-Reply-To: <bug-3781-163@https.bugs.busybox.net/>
References: <bug-3781-163@https.bugs.busybox.net/>
Message-ID: <20110527045558.105DF83694@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3781

--- Comment #4 from Kelvin Cheung <keguang.zhang@gmail.com>  ---
(In reply to comment #3)
> (In reply to comment #2)
> > Created attachment 3325 [details] [details]
> > Force symlink creation
> > 
> > Please, try applying this patch to crosstool-NG, and re-run.
> 
> After applying this patch, the error becomes:
> 
> [ALL  ]    make[4]: Leaving directory
> `/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.11.3/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc'
> [ALL  ]   
> `/opt/buildroot_real6410/output_fs2410/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cc'
> -> `arm-unknown-linux-uclibcgnueabi-gcc'
> [INFO ]  Installing final compiler: done in 294.83s (at 16:54)
> [INFO ]  =================================================================
> [INFO ]  Cleaning-up the toolchain's directory
> [EXTRA]    Installing the populate helper
> [EXTRA]    Installing a cross-ldd helper
> [EXTRA]    Creating toolchain aliases
> [ALL  ]    ln: creating symbolic link `arm-linux-addr2line': File exists
> [ERROR]    
> [ERROR]    >>  Build failed in step 'Cleaning-up the toolchain's directory'
> [ERROR]    >>
> [ERROR]    >>  Error happened in: CT_DoExecLog[scripts/functions]
> [ERROR]    >>        called from: do_finish[scripts/build/internals.sh at 89]
> [ERROR]    >>        called from: main[scripts/crosstool-NG.sh at 582]
> [ERROR]    >>
> [ERROR]    >>  For more info on this error, look at the file: 'build.log'
> [ERROR]    >>  There is a list of known issues, some with workarounds, in:
> [ERROR]    >>      'docs/B - Known issues.txt'
> [ERROR]    
> [ERROR]    Build failed in step 'Cleaning-up the toolchain's directory'
> [ERROR]    
> [ERROR]    (elapsed: 16:53.29)
> make[3]: *** [build] Error 1
> make[2]: *** [build.2] Error 2
> make[1]: ***
> [/opt/buildroot_real6410/output_fs2410/stamps/ct-ng-toolchain-built] Error 2
> make: *** [all] Error 2

After fixing this problem as your patch did, the compilation still failed as
last:

[ALL  ]   
`/opt/buildroot_real6410/output_fs2410/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cc'
-> `arm-unknown-linux-uclibcgnueabi-gcc'
[INFO ]  Installing final compiler: done in 314.20s (at 16:05)
[INFO ]  =================================================================
[INFO ]  Cleaning-up the toolchain's directory
[EXTRA]    Installing the populate helper
[EXTRA]    Installing a cross-ldd helper
[EXTRA]    Creating toolchain aliases
[ALL  ]    `arm-linux-addr2line' -> `arm-unknown-linux-uclibcgnueabi-addr2line'
[ALL  ]    `arm-linux-ar' -> `arm-unknown-linux-uclibcgnueabi-ar'
[ALL  ]    `arm-linux-as' -> `arm-unknown-linux-uclibcgnueabi-as'
[ALL  ]    `arm-linux-c++' -> `arm-unknown-linux-uclibcgnueabi-c++'
[ALL  ]    `arm-linux-c++filt' -> `arm-unknown-linux-uclibcgnueabi-c++filt'
[ALL  ]    `arm-linux-cc' -> `arm-unknown-linux-uclibcgnueabi-cc'
[ALL  ]    `arm-linux-cpp' -> `arm-unknown-linux-uclibcgnueabi-cpp'
[ALL  ]    `arm-linux-ct-ng.config' ->
`arm-unknown-linux-uclibcgnueabi-ct-ng.config'
[ALL  ]    `arm-linux-g++' -> `arm-unknown-linux-uclibcgnueabi-g++'
[ALL  ]    `arm-linux-gcc' -> `arm-unknown-linux-uclibcgnueabi-gcc'
[ALL  ]    `arm-linux-gcc-4.4.3' -> `arm-unknown-linux-uclibcgnueabi-gcc-4.4.3'
[ALL  ]    `arm-linux-gccbug' -> `arm-unknown-linux-uclibcgnueabi-gccbug'
[ALL  ]    `arm-linux-gcov' -> `arm-unknown-linux-uclibcgnueabi-gcov'
[ALL  ]    `arm-linux-gprof' -> `arm-unknown-linux-uclibcgnueabi-gprof'
[ALL  ]    `arm-linux-ld' -> `arm-unknown-linux-uclibcgnueabi-ld'
[ALL  ]    `arm-linux-ldd' -> `arm-unknown-linux-uclibcgnueabi-ldd'
[ALL  ]    `arm-linux-nm' -> `arm-unknown-linux-uclibcgnueabi-nm'
[ALL  ]    `arm-linux-objcopy' -> `arm-unknown-linux-uclibcgnueabi-objcopy'
[ALL  ]    `arm-linux-objdump' -> `arm-unknown-linux-uclibcgnueabi-objdump'
[ALL  ]    `arm-linux-populate' -> `arm-unknown-linux-uclibcgnueabi-populate'
[ALL  ]    `arm-linux-ranlib' -> `arm-unknown-linux-uclibcgnueabi-ranlib'
[ALL  ]    `arm-linux-readelf' -> `arm-unknown-linux-uclibcgnueabi-readelf'
[ALL  ]    `arm-linux-size' -> `arm-unknown-linux-uclibcgnueabi-size'
[ALL  ]    `arm-linux-sstrip' -> `arm-unknown-linux-uclibcgnueabi-sstrip'
[ALL  ]    `arm-linux-strings' -> `arm-unknown-linux-uclibcgnueabi-strings'
[ALL  ]    `arm-linux-strip' -> `arm-unknown-linux-uclibcgnueabi-strip'
[EXTRA]    Removing access to the build system tools
[EXTRA]    Removing installed documentation
[INFO ]  Cleaning-up the toolchain's directory: done in 1.35s (at 16:06)
[INFO ]  Build completed at 20110527.124433
[INFO ]  (elapsed: 16:05.58)
[INFO ]  Finishing installation (may take a few seconds)...
[ERROR]    
[ERROR]    >>
[ERROR]    >>  Error happened in: main[scripts/crosstool-NG.sh]
[ERROR]    >>
[ERROR]    >>  For more info on this error, look at the file: 'build.log'
[ERROR]    >>  There is a list of known issues, some with workarounds, in:
[ERROR]    >>      'docs/B - Known issues.txt'
[ERROR]    
[ERROR]    Build failed in step 'Cleaning-up the toolchain's directory'
[ERROR]    
[ERROR]    (elapsed: 16:06.08)
make[3]: *** [build] Error 1
make[2]: *** [build.2] Error 2
make[1]: ***
[/opt/buildroot_real6410/output_fs2410/stamps/ct-ng-toolchain-built] Error 2
make: *** [all] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
