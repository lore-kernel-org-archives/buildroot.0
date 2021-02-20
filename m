From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Feb 2021 09:58:26 +0000
Subject: [Buildroot] [Bug 13541] New: 2021.02.rc2: irqbalance: Daemon
 couldn't be bound to the file-based socket
Message-ID: <bug-13541-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13541

            Bug ID: 13541
           Summary: 2021.02.rc2: irqbalance: Daemon couldn't be bound to
                    the file-based socket
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: alfredo.pons at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8771
  --> https://bugs.busybox.net/attachment.cgi?id=8771&action=edit
My S13irqbalance file

Tested on RPI3defconf

You can see this log in /var/log/messages: /usr/sbin/irqbalance: Daemon
couldn't be bound to the file-based socket.

The bug is this: https://gitlab.alpinelinux.org/alpine/aports/-/issues/10671

One solution could be add 'mkdir -p /var/run/irqbalance'  on start section in 
"/etc/init.d/S13irqbalance"

Thanks.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
