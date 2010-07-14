From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Jul 2010 12:29:31 +0000 (UTC)
Subject: [Buildroot] [Bug 2221] New: Qt does not compile (dependencies not
 taken into account?)
Message-ID: <bug-2221-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2221

           Summary: Qt does not compile (dependencies not taken into
                    account?)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: luca.ceresoli at tiscali.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Qt fails the configure step with the following output:

Creating qmake. Please wait...
make[2]: Entering directory
`/home/murray/devel/keyser/package/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
make[2]: Nothing to be done for `first'.
make[2]: Leaving directory
`/home/murray/devel/keyser/package/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
The DirectFB screen driver functionality test failed!
 You might need to modify the include and library search paths by editing
 QT_CFLAGS_DIRECTFB and QT_LIBS_DIRECTFB in

/home/murray/devel/keyser/package/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspecs/qws/linux-arm-g++.
make[1]: ***
[/home/murray/devel/keyser/package/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/.configured]
Error 1
make[1]: Leaving directory `/home/murray/devel/keyser/package/buildroot'
make: ***
[/home/murray/devel/keyser/package/buildroot/output/images/rootfs.arm.tar]
Error 2

After make exited I noticed that output/build/directfb*/ had not been created,
which suggests the dependency of Qt on DirectFB has not been taken into
account.
Nataraj S Narayan reported a problem that may have the same cause with Qt
trying to use mysql
(http://lists.busybox.net/pipermail/buildroot/2010-July/036068.html).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
