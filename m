From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jul 2018 19:14:12 +0000
Subject: [Buildroot] [Bug 11156] New: In python3 module 'socket' has no
 attribute 'AF_BLUETOOTH'
Message-ID: <bug-11156-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11156

            Bug ID: 11156
           Summary: In python3 module 'socket' has no attribute
                    'AF_BLUETOOTH'
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: grzegorz at blach.pl
                CC: buildroot at uclibc.org
  Target Milestone: ---

I have build system image for RaspberryPi 2 using `make raspberrypi2_defconfig`
with some customization. For eg. I have enabled bluez-tools, bluez-utils 5.x,
rpi-bt-firmware and of course python3. When I try to create bluetooth socket, I
get an error:

Python 3.6.3 (default, Jul 16 2018, 20:00:50) 
[GCC 7.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import socket
>>> s = socket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: module 'socket' has no attribute 'AF_BLUETOOTH'


Bluetooth sockets works correctly in python3 on Raspbian.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
