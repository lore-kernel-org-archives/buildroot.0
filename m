From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Nov 2009 20:12:58 +0000 (UTC)
Subject: [Buildroot] [Bug 729] New: sstrip creates corrupted headers
Message-ID: <bug-729-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=729

              Host: x86_64-linux
            Target: MIPS/MIPSel
           Summary: sstrip creates corrupted headers
           Product: buildroot
           Version: 2009.11
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: minimod at morethan.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Although only a static file is shown, results are the same for dynamic objects.

Having selected sstrip:
mszick at deb2core:/Builds/BLDRT/buildroot$ ls -l output/target/sbin/pkgdetails
-rwxr-xr-x 1 mszick mszick 42199 2009-11-18 12:41 output/target/sbin/pkgdetails

mszick at deb2core:/Builds/BLDRT/buildroot$ file output/target/sbin/pkgdetails
output/target/sbin/pkgdetails: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
version 1 (SYSV), statically linked, corrupted section header size

Having selected strip:
mszick at deb2core:/Builds/BLDRT/buildroot/output/target/sbin$ ls -l pkgdetails
-rwxr-xr-x 1 mszick mszick 46992 2009-11-18 13:38 pkgdetails

mszick at deb2core:/Builds/BLDRT/buildroot/output/target/sbin$ file pkgdetails
pkgdetails: ELF 32-bit LSB executable, MIPS, MIPS32 rel2 version 1 (SYSV),
statically linked, with unknown capability 0xf41 = 0x756e6700, stripped


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
