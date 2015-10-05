From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  5 Oct 2015 02:28:56 +0000 (UTC)
Subject: [Buildroot] [Bug 8386] New: build failed with external toolchain
Message-ID: <bug-8386-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8386

           Summary: build failed with external toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: glscantlen at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 6176
  --> https://bugs.busybox.net/attachment.cgi?id=6176
my defconfig

using :
git clone git://git.busybox.net/buildroot
commit# latest 2015.10.04

Build with external toolchain failed.
improper pre-compile condition statement.
toolchain/toolchain-wrapper.c ~line 147

#elif BR_CROSS_PATH_ABS

should it be: ?

#elif defined BR_CROSS_PATH_ABS

It works for me :)
Gary

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
