From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Aug 2019 19:45:44 +0000
Subject: [Buildroot] [Bug 12121] New: PyQt5.QtSerialPort and other modules
 not being built.
Message-ID: <bug-12121-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12121

            Bug ID: 12121
           Summary: PyQt5.QtSerialPort and other modules not being built.
           Product: buildroot
           Version: 2019.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sahajsarup at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

when enabling python-pyqt5, many modules like PyQt5.QtSerialPort don't get
built because python-pt5 only has qt5base as dependencies.

So even if qt5serialport is enabled, the python module gets built first and
fails to find qtserialport installed, as reported by this error:

Project ERROR: Unknown module(s) in QT: serialport

Test:

A) Setup a regular buildroot build with python-qt5 and qt5 and qt5serialport
enabled. The error pops up.

B) Make clean. Run make qtserialport and then build python-qt5, and now the
serialport modules get built.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
