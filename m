From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Mar 2012 10:54:00 +0000 (UTC)
Subject: [Buildroot] [Bug 4958] New: Qt 4.7.4 build crashes with Linux 2.6.29
Message-ID: <bug-4958-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4958

              Host: x86_64
            Target: arm
           Summary: Qt 4.7.4 build crashes with Linux 2.6.29
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jeremie.scheer at armadeus.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm using Linux 2.6.29.6 kernel and headers and I compile rootfs for ARM.

When Qt is being compiled, it crashed on this error:

linking ../../lib/libQtNetwork.so.4.7.4
.obj/debug-shared-emb-arm/qnativesocketengine_unix.o: In function
`qt_safe_accept':
/srv/developpements/armadeus_4-1/buildroot/output/build/qt-4.7.4/src/network/../../include/QtNetwork/private/../../../src/network/socket/qnet_unix_p.h:121:
undefined reference to `accept4'
.obj/debug-shared-emb-arm/qlocalserver_unix.o: In function `qt_safe_accept':
/srv/developpements/armadeus_4-1/buildroot/output/build/qt-4.7.4/src/network/socket/qnet_unix_p.h:121:
undefined reference to `accept4'
collect2: ld returned 1 exit status
make[3]: *** [../../lib/libQtNetwork.so.4.7.4] Error 1
make[3]: Leaving directory
`/srv/developpements/armadeus_4-1/buildroot/output/build/qt-4.7.4/src/network'
make[2]: *** [sub-network-make_default-ordered] Error 2
make[2]: Leaving directory
`/srv/developpements/armadeus_4-1/buildroot/output/build/qt-4.7.4'
make[1]: ***
[/srv/developpements/armadeus_4-1/buildroot/output/build/qt-4.7.4/.stamp_built]
Error 2
make[1]: Leaving directory `/srv/developpements/armadeus_4-1/buildroot'
make: *** [all] Error 2

The problem is that the function 'accept4' doesn't exist in Linux 2.6.29. It is
only defined in Linux 2.6.36 or more.
So when I rebuild all rootfs and Qt against Linux 2.6.38.8, it finished
successfully.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
