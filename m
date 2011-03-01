From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Mar 2011 13:59:36 +0000 (UTC)
Subject: [Buildroot] [Bug 3349] New: host-module-init-tools-3.12 fails on
 Fedora 13 with buildroot-2011.02-rc2
Message-ID: <bug-3349-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3349

           Summary: host-module-init-tools-3.12 fails on Fedora 13 with
                    buildroot-2011.02-rc2
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jerkejacobs at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Buildroot fails on the last steps while linking the host-module-init-tools on
Fedora 13.

I tried to compile with the mini2440_defconfig with rc1 and rc2, also with some
menuconfig changes but that doesn't change anything. Maybe a developer can test
on a Fedora 13 or 14 (virtual)machine. Or find out what the real problem is.


mkdir -p /home/jerry/Downloads/buildroot-2011.02-rc2/output/target/etc
echo "buildroot" >
/home/jerry/Downloads/buildroot-2011.02-rc2/output/target/etc/hostname
mkdir -p /home/jerry/Downloads/buildroot-2011.02-rc2/output/target/etc
echo "Welcome to Buildroot" >
/home/jerry/Downloads/buildroot-2011.02-rc2/output/target/etc/issue
>>> host-module-init-tools 3.12 Building
PATH=/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/bin:/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/bin:/usr/lib/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/jerry/Android/SDK/tools:/home/jerry/bin:/home/jerry/Android/SDK/tools
LD_LIBRARY_PATH="/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/lib:"
PKG_CONFIG=""
PKG_CONFIG_LIBDIR="/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/lib/pkgconfig"
PERLLIB="/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/lib/perl" 
/usr/bin/make -j2  -C
/home/jerry/Downloads/buildroot-2011.02-rc2/output/build/host-module-init-tools-3.12/
make[1]: Entering directory
`/home/jerry/Downloads/buildroot-2011.02-rc2/output/build/host-module-init-tools-3.12'
MAKE i686-pc-linux-gnu : 0 * all-all
make[2]: Entering directory
`/home/jerry/Downloads/buildroot-2011.02-rc2/output/build/host-module-init-tools-3.12/build'
/usr/lib/ccache/gcc  -O2
-I/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/include
-I/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/include -Wunused
-Wall  -L/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/lib
-L/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/lib
-Wl,-rpath,/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/lib -o
depmod depmod.o zlibsupport.o tables.o  libmodtools.a 
/usr/lib/ccache/gcc  -O2
-I/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/include
-I/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/include -Wunused
-Wall -static -L/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/lib
-L/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/lib
-Wl,-rpath,/home/jerry/Downloads/buildroot-2011.02-rc2/output/host/usr/lib -o
insmod.static insmod.o libmodtools.a 
/usr/bin/ld: cannot find -lc
collect2: ld returned 1 exit status
make[2]: *** [insmod.static] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory
`/home/jerry/Downloads/buildroot-2011.02-rc2/output/build/host-module-init-tools-3.12/build'
make[1]: *** [all-all] Error 2
make[1]: Leaving directory
`/home/jerry/Downloads/buildroot-2011.02-rc2/output/build/host-module-init-tools-3.12'

If you need more info or my config file, please contact me.

Kind regards,
Jerry Jacobs

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
