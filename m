From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Sep 2020 12:45:47 +0000
Subject: [Buildroot] [Bug 13226] New: external toolchain helper deletes libs
 if link doesn't exist
Message-ID: <bug-13226-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13226

            Bug ID: 13226
           Summary: external toolchain helper deletes libs if link doesn't
                    exist
           Product: buildroot
           Version: 2020.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: protectivedad at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The function copy_toolchain_lib_root in helpers.mk never checks to see if
LIBPATH actually exists. If it doesn't say due to the readlink -f it processes
a blank LIBPATH which deletes items in the library that have been already
copied.

A change to the while true to test for LIBPATH != "" will fix this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
