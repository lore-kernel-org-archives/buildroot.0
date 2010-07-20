From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Jul 2010 07:09:17 +0000 (UTC)
Subject: [Buildroot] [Bug 2251] New: directory output/build after make
 *_defconfig not found
Message-ID: <bug-2251-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2251

           Summary: directory output/build after make *_defconfig not
                    found
           Product: buildroot
           Version: 2010.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mensch0815 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


when you build a defconfig with make something_defconfig and afterwards want to
edit the linux kernel configuration (make linux26-menuconfig), then buildroot
can't chdir in the output/build directory, because it is not  yet created.
some output (sorry error message is in german):

bzcat /home/ich/buildroot-2010.02/dl/linux-2.6.32.9.tar.bz2 | tar -C
/home/ich/buildroot-2010.02/output/build  -xf -
tar: /home/ich/buildroot-2010.02/output/build: Kann chdir nicht ausf?hren:
Datei oder Verzeichnis nicht gefunden

when you create the output/build folder by your own, it works.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
