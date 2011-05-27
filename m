From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 May 2011 01:38:22 +0000 (UTC)
Subject: [Buildroot] [Bug 3781] crosstool-ng-1.11.3 fails to build
In-Reply-To: <bug-3781-163@https.bugs.busybox.net/>
References: <bug-3781-163@https.bugs.busybox.net/>
Message-ID: <20110527013822.C59DF8369C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3781

--- Comment #3 from Kelvin Cheung <keguang.zhang@gmail.com>  ---
(In reply to comment #2)
> Created attachment 3325 [details]
> Force symlink creation
> 
> Please, try applying this patch to crosstool-NG, and re-run.

After applying this patch, the error becomes:

[ALL  ]    make[4]: Leaving directory
`/opt/buildroot_real6410/output_fs2410/build/crosstool-ng-1.11.3/.build/arm-unknown-linux-uclibcgnueabi/build/build-cc'
[ALL  ]   
`/opt/buildroot_real6410/output_fs2410/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cc'
-> `arm-unknown-linux-uclibcgnueabi-gcc'
[INFO ]  Installing final compiler: done in 294.83s (at 16:54)
[INFO ]  =================================================================
[INFO ]  Cleaning-up the toolchain's directory
[EXTRA]    Installing the populate helper
[EXTRA]    Installing a cross-ldd helper
[EXTRA]    Creating toolchain aliases
[ALL  ]    ln: creating symbolic link `arm-linux-addr2line': File exists
[ERROR]    
[ERROR]    >>  Build failed in step 'Cleaning-up the toolchain's directory'
[ERROR]    >>
[ERROR]    >>  Error happened in: CT_DoExecLog[scripts/functions]
[ERROR]    >>        called from: do_finish[scripts/build/internals.sh at 89]
[ERROR]    >>        called from: main[scripts/crosstool-NG.sh at 582]
[ERROR]    >>
[ERROR]    >>  For more info on this error, look at the file: 'build.log'
[ERROR]    >>  There is a list of known issues, some with workarounds, in:
[ERROR]    >>      'docs/B - Known issues.txt'
[ERROR]    
[ERROR]    Build failed in step 'Cleaning-up the toolchain's directory'
[ERROR]    
[ERROR]    (elapsed: 16:53.29)
make[3]: *** [build] Error 1
make[2]: *** [build.2] Error 2
make[1]: ***
[/opt/buildroot_real6410/output_fs2410/stamps/ct-ng-toolchain-built] Error 2
make: *** [all] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
