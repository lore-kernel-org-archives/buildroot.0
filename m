From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Nov 2011 19:42:13 +0000 (UTC)
Subject: [Buildroot] [Bug 4514] New: Booting OS,
 that requires automount of devtmpfs fails if fs image used as
 initramfs
Message-ID: <bug-4514-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4514

           Summary: Booting OS, that requires automount of devtmpfs fails
                    if fs image used as initramfs
           Product: buildroot
           Version: 2011.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fenixk19 at mail.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


System based on devtmpfs or udev with initramfs as root won't boot, because
kernel doesn't automount devtmpfs on initramfs. Using initramfs requires manual
mount for devtmpfs.

Manual mount can be done by adding a string in the beginning of /etc/inittab:
::sysinit:/bin/mount -t devtmpfs devtmpfs /dev

As a bug of buildroot it could be fixed by adding an option to mount manually
devtmpfs, that makes buildroot add corresponding string to inittab
automatically.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
