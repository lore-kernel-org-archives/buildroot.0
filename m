From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 17:48:13 +0000 (UTC)
Subject: [Buildroot] [Bug 3319] New: "make xconfig" takes fatal error
Message-ID: <bug-3319-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3319

           Summary: "make xconfig" takes fatal error
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: kevbroch at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Works fine in 2010.11 release but has regressed in git trunk head (see output
below):


labuser at sichotic:~/projects/buildroot/tb/buildroot$ make xconfig
mkdir -p
/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config/lxdialog
make CC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc"
obj=/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config
-C package/config -f Makefile.br qconf
make[1]: Entering directory
`/home/labuser/projects/buildroot/tb/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE 
-I/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config 
-MM *.c >
/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config/.depend
2>/dev/null || :
  CHECK   qt
make[1]: Leaving directory
`/home/labuser/projects/buildroot/tb/buildroot/package/config'
make[1]: Entering directory
`/home/labuser/projects/buildroot/tb/buildroot/package/config'
/usr/bin/moc -i qconf.h -o
/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config/qconf.moc
sed < lkc_proto.h >
/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config/lkc_defs.h
's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE 
-I/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config 
-DQT_SHARED -DQT3_SUPPORT -I/usr/include/qt4 -I/usr/include/qt4/QtCore
-I/usr/include/qt4/QtGui -I/usr/include/qt4/Qt3Support
-I/usr/include/qt4/QtNetwork -I/usr/include/qt4/QtSql   -D LKC_DIRECT_LINK -c
qconf.cc -o
/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config/qconf.o
In file included from qconf.cc:48:
/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config/qconf.moc:13:
fatal error: private/qucomextra_p.h: No such file or directory
compilation terminated.
make[1]: ***
[/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config/qconf.o]
Error 1
make[1]: Leaving directory
`/home/labuser/projects/buildroot/tb/buildroot/package/config'
make: ***
[/home/labuser/projects/buildroot/tb/buildroot/output/build/buildroot-config/qconf]
Error 2
labuser at sichotic:~/projects/buildroot/tb/buildroot$

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
