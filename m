From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Jun 2021 15:05:42 +0000
Subject: [Buildroot] [Bug 13851] New: timespec on 32bit systems requires
 some toolchain header minimums if using a kernel over 5.6+
Message-ID: <bug-13851-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13851

            Bug ID: 13851
           Summary: timespec on 32bit systems requires some toolchain
                    header minimums if using a kernel over 5.6+
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matthew.weber at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The header mismatch seems like a dependency Buildroot could check to prevent
hidden time bugs where the kernel/glibc are all good(kernel 5.6+ and Glibc
2.32+), but someone uses old toolchain headers < 5.6 resulting in the
application using a 32bit timespec@runtime.

https://stackoverflow.com/questions/14361651/is-there-any-way-to-get-64-bit-time-t-in-32-bit-programs-in-linux/60709400#60709400

-- 
You are receiving this mail because:
You are on the CC list for the bug.
