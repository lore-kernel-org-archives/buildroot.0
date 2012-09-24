From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Sep 2012 11:05:46 +0000 (UTC)
Subject: [Buildroot] [Bug 5570] New: Cannot compile software on the target
	machine
Message-ID: <bug-5570-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5570

              Host: x86_64 Arch Linux box
            Target: arm (littel endian) arm1176jzf-s (BCM2708)
           Summary: Cannot compile software on the target machine
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mari.hahn at uni-muenster.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Version: buildroot-20120922.tar.bz2

While compiling simple hello world programs on the target machine does work,
compiling complex software doesn't.

I get error messages like this one:

libtool: link: warning: library `/usr/lib/libintl.la' was moved.
grep:
/home/maribu/buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib//libiconv.la:
No such file or directory
sed:
/home/maribu/buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib//libiconv.la:
No such file or directory
libtool: link:
`/home/maribu/buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib//libiconv.la'
is not a valid libtool archive

the libtool archive "libintl.la" is present at /usr/lib, but libtool is
searching for it in
"/home/maribu/buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/"
which was the correct path on the cross compiling host, but not on the target.
I tried to export LD_LIBARY_PATH=/usr/lib which does work as root, bus for some
reason is completely ignored (without any feedback) as normal user.

I think this is a bug, because in my humble opinion there should be no
reference to host specific paths within the resulting image.

I would be very happy if someone would suggest a quick workaround so I can
start compiling again.

Regards,
Maribu

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
