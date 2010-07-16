From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Jul 2010 15:17:15 +0000 (UTC)
Subject: [Buildroot] [Bug 2233] New: Atmel atstk target skeletons have
 /etc/mtab as a file, not a symlink
Message-ID: <bug-2233-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2233

           Summary: Atmel atstk target skeletons have /etc/mtab as a file,
                    not a symlink
           Product: buildroot
           Version: 2010.05
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nick at leverton.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


/etc/mtab in the target skeleton is supposed to be a symlink to ../proc/mounts,
and most device skeletons have it as such.

However, unless there's something strange with my git installation, the two
Atmel atstk100* skeleton filesystems have /etc/mtab as a regular file
containing the text ../proc/mounts .   The files in error are:

target/device/Atmel/atstk1005/target_skeleton/etc/mtab
target/device/Atmel/atstk100x/target_skeleton/etc/mtab

Atmel atngw100 is correct in having a symlink.

Fairly trivial, but things which check for mounted filesystems will fail
(oprofile was what I fell over this with on an atstk1006).  I can't supply a
patch as I don't know how to make git cope with the change in filetype - it
seems convinced that I have removed the files :-(

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
