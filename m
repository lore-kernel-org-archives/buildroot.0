From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Jan 2017 09:55:32 +0000
Subject: [Buildroot] [Bug 9586] New: usbmount: usbmount slows down the
 system... to a state of unsusable...
Message-ID: <bug-9586-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9586

            Bug ID: 9586
           Summary: usbmount: usbmount slows down the system... to a state
                    of unsusable...
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lipkegu at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When selecting the package usbmount "we say USB" the package tries every 2
seconds to remount the rootfs "/" and every 2 seconds all usb drives which
results in a state where the system begins to lag. 

In my situation im using the bkuhls/kodi17 branch which is merged into a clean
cloned buildroot-upstream. Kodi gets lagging and the CPu usage is always at 42%
and Drive-leds alwys active. the sence is clear to me... "mount and unmount"
usb drives.

But now we can get problems with the drives power management capabilities.

Packages like hdidle cant bring the drives into a state where we can set them
into standby.

to reproduce the problem:

- clone a clean environment of buildroot.
- put a ui for example kodi + samba + dropbear + usbmount
- build the environment and let it boot then wait also 10 minutes.
- in the 10 minutes the system gets unresponseable for every 2 seconds.
- after seeing the problem... (remounting all devices) disable usbmount and
reboot your test box and repeat the steps without usbmount.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
