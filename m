From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Aug 2010 08:15:52 +0000 (UTC)
Subject: [Buildroot] [Bug 2371] New: QT MYSQL Module does not build
Message-ID: <bug-2371-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2371

           Summary: QT MYSQL Module does not build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul at pauljones.id.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


This is the output I get when trying to build QT for ARM with the mysql module
enabled.

InterBase auto-detection... ()
gmake[1]: Entering directory
`/media/dev/buildroot-arm/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/ibase'
compiling ibase.cpp
ibase.cpp:42:19: error: ibase.h: No such file or directory
gmake[1]: *** [ibase.o] Error 1
gmake[1]: Leaving directory
`/media/dev/buildroot-arm/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/ibase'
InterBase disabled.
MySQL (thread-safe) auto-detection... ()
gmake[1]: Entering directory
`/media/dev/buildroot-arm/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mysql_r'
compiling ../mysql/mysql.cpp
linking mysql_r
/usr/lib64/mysql/libmysqlclient_r.so: file not recognized: File format not
recognized
collect2: ld returned 1 exit status
gmake[1]: *** [mysql_r] Error 1
gmake[1]: Leaving directory
`/media/dev/buildroot-arm/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mysql_r'
MySQL (thread-safe) disabled.
MySQL (thread-unsafe) auto-detection... ()
gmake[1]: Entering directory
`/media/dev/buildroot-arm/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mysql'
compiling mysql.cpp
linking mysql
/usr/lib64/mysql/libmysqlclient.so: file not recognized: File format not
recognized
collect2: ld returned 1 exit status
gmake[1]: *** [mysql] Error 1
gmake[1]: Leaving directory
`/media/dev/buildroot-arm/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mysql'
MySQL (thread-unsafe) disabled.
MySQL support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.
make: ***
[/media/dev/buildroot-arm/output/build/qt-everywhere-opensource-src-4.6.2/.configured]
Error 101

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
