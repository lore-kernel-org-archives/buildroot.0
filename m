From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Apr 2019 13:01:26 +0000
Subject: [Buildroot] [Bug 11766] New: Console (getty) issues with systemd
Message-ID: <bug-11766-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11766

            Bug ID: 11766
           Summary: Console (getty) issues with systemd
           Product: buildroot
           Version: 2019.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: isak.tjernberg at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7976
  --> https://bugs.busybox.net/attachment.cgi?id=7976&action=edit
Comparison between console-getty.service contents between 2018.11 and 2019.02.1

When using an image built with Buildroot for the Raspberry Pi 3 (64 bit) using
systemd as init system, the serial console reached through 3 of the GPIO pins
reports various errors and is generally unstable (misses characters
sporadically). One common error I get printed is: "Inappropriate ioctl for
device" from Getty.

This is on version 2019.02.1. The same config works fine with Buildroot
2018.11.

The error/issues goes away if I replace the contents in the file
/etc/systemd/system/getty.target.wants/console-getty.service with the content
in the same file from the image built with version 2018.11.

I can attach one file only, so the file contains the contents both from version
2018.11 (working) and 2019.02.1 (not working).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
