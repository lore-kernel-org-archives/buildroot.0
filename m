From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Oct 2017 13:23:39 +0000
Subject: [Buildroot] [Bug 10406] New: Beaglebone black: Buggy SGX driver
 version, swapped red and blue channels
Message-ID: <bug-10406-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10406

            Bug ID: 10406
           Summary: Beaglebone black: Buggy SGX driver version, swapped
                    red and blue channels
           Product: buildroot
           Version: 2017.08
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: nikola.rajovic at zuehlke.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

I have built a buildroot image for BeagleBone Black using
beaglebone_qt5_defconfig config. The problem is with eglfs backend and SGX GPU
driver in turn swapping red and blue channels when rendering on 16-bit 7'' LCD
cape. Not tested with HDMI. It seems that SGX driver uses BGR instead of RGB
color mode (or vice versa).

fb-test application displays correct colors, everything matches. 

Any clue if it is possible to get an updated version of SGX driver which
resolves this issue. 


Thanks,
Nikola

-- 
You are receiving this mail because:
You are on the CC list for the bug.
