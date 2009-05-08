From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 May 2009 08:01:36 +0000 (UTC)
Subject: [Buildroot] [Bug 323] New: gen_matypes fails to execute during
 build of Mesa when using cross toolchain
Message-ID: <bug-323-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=323

              Host: x86 and x86_64
            Target: i686
           Summary: gen_matypes fails to execute during build of Mesa when
                    using cross toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: spambox at nurd.se
                CC: buildroot at uclibc.org
   Estimated Hours: 0.1


Created an attachment (id=291)
 --> (https://bugs.busybox.net/attachment.cgi?id=291)
patch to build gen_matypes using the host compiler

gen_matypes is built with the cross toolchain. In my case i was using the
uClibc toolchain and gen_matypes is built depending on uClibc.

gen_matypes is executed on the build host during the build in order to generate
an .h-file. This execution fails if the build host does not have uClibc.

A simple solution is to build gen_matypes using the host compiler.

I have attached a proposed patch that fixes the problem:

package/x11r7/mesa3d/mesa3d-7.2-gen_matypes-fix.patch

Patch have been tested successfully on x86 and x86_64 build hosts using i686 as
a target architecture.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
