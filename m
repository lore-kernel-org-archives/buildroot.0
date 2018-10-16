From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Oct 2018 12:31:26 +0000
Subject: [Buildroot] [Bug 11401] New: Impossible do build a qt program using
 kf5-networkmanager-qt
Message-ID: <bug-11401-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11401

            Bug ID: 11401
           Summary: Impossible do build a qt program using
                    kf5-networkmanager-qt
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: carrier.nicolas0 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When trying to build a minimal c++ code, making use of the
kf5-networkmanager-qt library, I obtain the following error:

    Project ERROR: Unknown module(s) in QT: NetworkManagerQt

There is a .pri file installed here:

    output/target/usr/mkspecs/modules/qt_NetworkManagerQt.pri

Which doesn't seem to be taken into account. When cp-ed alongsidef the qt .pri
files:

    cp ../output/target/usr/mkspecs/modules/qt_NetworkManagerQt.pri
../output/host/mkspecs/modules/

The build fails this time with the following error:

    i686-buildroot-linux-gnu-g++: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include/KF5/NetworkManagerQt'

Which seems to indicate that either the pri file isn't used properly or that
its content is buggy.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
