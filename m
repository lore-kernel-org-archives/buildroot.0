From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  3 Mar 2014 00:07:01 +0000 (UTC)
Subject: [Buildroot] [Bug 6944] New: building toolchain for sh4 fails
Message-ID: <bug-6944-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6944

           Summary: building toolchain for sh4 fails
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gdalex at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello support,

I'm trying to build a toolchain for Renesas SH4.

The process fails at the end with the following log:

make[3]: Leaving directory
`/home/g/toolchain/output/build/host-gcc-final-4.7.3/build/gcc'
make[2]: Leaving directory
`/home/g/toolchain/output/build/host-gcc-final-4.7.3/build'
make[1]: Leaving directory
`/home/g/toolchain/output/build/host-gcc-final-4.7.3/build'
if [ ! -e /home/g/toolchain/output/host/usr/bin/sh4-buildroot-linux-gnu-cc ];
then ln -snf sh4-buildroot-linux-gnu-gcc
/home/g/toolchain/output/host/usr/bin/sh4-buildroot-linux-gnu-cc; fi
if [ ! -e /home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/bin/cc ];
then ln -snf gcc
/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/bin/cc; fi
(cd /home/g/toolchain/output/host/usr/bin; for i in sh4-buildroot-linux-gnu-*;
do ln -snf $i sh4-linux${i##sh4-buildroot-linux-gnu}; done)
cp -dpf
/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libgcc_s*
/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/sysroot/lib/
cp: cannot stat
?/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libgcc_s*?: No
such file or directory
make:
[/home/g/toolchain/output/build/host-gcc-final-4.7.3/.stamp_host_installed]
Error 1 (ignored)
cp -dpf
/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libgcc_s*
/home/g/toolchain/output/target/lib/
cp: cannot stat
?/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libgcc_s*?: No
such file or directory
make:
[/home/g/toolchain/output/build/host-gcc-final-4.7.3/.stamp_host_installed]
Error 1 (ignored)
mkdir -p /home/g/toolchain/output/target/usr/lib
for i in  libstdc++ libmudflapth ; do cp -dpf
/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/${i}.so*
/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/sysroot/usr/lib/ ; cp
-dpf /home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/${i}.a
/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/sysroot/usr/lib/ ; cp
-dpf /home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/${i}.so*
/home/g/toolchain/output/target/usr/lib/ ; done
cp: cannot stat
?/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libstdc++.so*?:
No such file or directory
cp: cannot stat
?/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libstdc++.a?:
No such file or directory
cp: cannot stat
?/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libstdc++.so*?:
No such file or directory
cp: cannot stat
?/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libmudflapth.so*?:
No such file or directory
cp: cannot stat
?/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libmudflapth.a?:
No such file or directory
cp: cannot stat
?/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*/libmudflapth.so*?:
No such file or directory
make: ***
[/home/g/toolchain/output/build/host-gcc-final-4.7.3/.stamp_host_installed]
Error 1
g at g-ThinkPad-X220:~/toolchain/buildroot$ 




I'm using the SHA 5970e883419a55f25ea900d776287ae6ea34b62e from the buildroot
git repo.

The build tries to copy everything that's under
/home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*

Under that, I have only one folder named !m4



ls -la /home/g/toolchain/output/host/usr/sh4-buildroot-linux-gnu/lib*
total 12
drwxr-xr-x 3 g g 4096 Mar  2 14:16 .
drwxr-xr-x 6 g g 4096 Mar  2 14:23 ..
drwxr-xr-x 2 g g 4096 Mar  2 18:56 !m4


I guess the ! sign confuses the copy command.

I started the build with this command:  make O=../output toolchain

Attached is my config file.

Am I doing something wrong?



Cheers
George

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
