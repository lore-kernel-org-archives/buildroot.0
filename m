From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Apr 2012 12:45:26 +0000 (UTC)
Subject: [Buildroot] [Bug 5054] New: amd64: cannot find init - due to
 missing /lib64 folder
Message-ID: <bug-5054-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5054

           Summary: amd64: cannot find init - due to missing /lib64 folder
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bos at je-eigen-domein.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


(May have reported it before a couple years back, but cannot find the bug
report)


When selecting architecture amd64, eglibc toolchain, the generated image fails
to boot with a "cannot find init" error.
This is caused by busybox being linked to /lib64/ld-linux-x86-64.so.2, while
there is no lib64 folder.


Workaround:

cd output/target
ln -s lib lib64

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
