From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 Nov 2019 22:53:25 +0000
Subject: [Buildroot] [Bug 12361] New: Init system (systemd) kills login on
 Raspberry Pi Zero
Message-ID: <bug-12361-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12361

            Bug ID: 12361
           Summary: Init system (systemd) kills login on Raspberry Pi Zero
           Product: buildroot
           Version: 2019.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: spynet314 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Starting with a raspberrypi0_defconfig, then selecting 
Toolchain/C library = glibc
System configuration / Init system = systemd
the device boots normally, but the welcome message and the login are shown
twice.
Trying to login with 'root', a password is then request, even if not set in the
configuration.
After entering 'root' and a blank password twice, the device block and it is no
more possible to continue.

Here's a piece of the bootlog:

[   13.773714] bcm2835_v4l2: module is from the staging directory, the quality
is unknown, you have been warned.
[   13.835338] bcm2835_codec: module is from the staging directory, the quality
is unknown, you have been warned.
[   14.074354] bcm2835-codec bcm2835-codec: Device registered as /dev/video10
[   14.143280] bcm2835-codec bcm2835-codec: Loaded V4L2 decode
[   14.211667] bcm2835-codec bcm2835-codec: Device registered as /dev/video11
[   14.283874] bcm2835-codec bcm2835-codec: Loaded V4L2 encode
[   14.347166] bcm2835-codec bcm2835-codec: Device registered as /dev/video12
[   14.422866] bcm2835-codec bcm2835-codec: Loaded V4L2 isp


Welcome to Buildroot
Welcome to Buildroot
buildroot login: buildroot login: root
buildroot login: root
Password:
Password:


Thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
