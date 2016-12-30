From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 14:42:34 +0000
Subject: [Buildroot] [Bug 9541] New: Platform drivers autoloading from info
 in device tree does not work
Message-ID: <bug-9541-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9541

            Bug ID: 9541
           Summary: Platform drivers autoloading from info in device tree
                    does not work
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: a.synytsyn at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello everyone! What is going on with autoloading modules for platform devices
from device tree? I've build image for raspberry pi, added device tree overlay
for enc28j60. I've checked: device tree node with this device exists in
/proc/device-tree/soc/spi at 7e204000. But lsmod does not shows that enc28j60.ko
is not loaded. In contrast of, raspbian distro successfully managed with this -
module loaded successfully.
Also, I've read this thread:
http://lists.busybox.net/pipermail/buildroot/2016-December/178779.html. As I
understand, command

find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0
modprobe -abq

does not work.

Regards,

Artem Synytsyn

-- 
You are receiving this mail because:
You are on the CC list for the bug.
