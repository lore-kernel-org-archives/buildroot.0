From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Jul 2020 15:40:27 +0000
Subject: [Buildroot] [Bug 13071] New: toolchain not found error when
 building netsurf
Message-ID: <bug-13071-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13071

            Bug ID: 13071
           Summary: toolchain not found error when building netsurf
           Product: buildroot
           Version: 2020.05
          Hardware: Macintosh
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dr.ryanthach at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8526
  --> https://bugs.busybox.net/attachment.cgi?id=8526&action=edit
This is a screenshot of the Ubuntu VM's terminal

General summary: The bug occurred after the makefile.tools for netsurf goes to
auto-detect a toolchain.

Description of the bug:
  Overview:
    The bug happens when Netsurf's Makefile.tools goes to auto-detect a 
    toolchain.
    (Defined beginning at line 353 of the Makefile.tools file) For unknown 
    reasons the process failed, even though two valid toolchains were present
    (gcc and clang). 

  Steps to reproduce (This is not perfect):

     1. Make buildroot configure to output a Linux distro made for x86_64 PCs
for EFI and in the build options enable gcc and glibc

     2. Configure a distro that does not include libgtk3 in anyway

     3. Enable netsurf

     4. Compile

  Expected Results:
    Netsurf will compile successfully and the compilation will move on as usual

  Actual Results:
    Netsurf completely fails to detect a toolchain and fails 

  Build Date and Hardware: July 14, 2020 10:45 AM EST on a Macbook Pro mid-2017
running MacOS 10.14.6 running a Ubuntu VM

-- 
You are receiving this mail because:
You are on the CC list for the bug.
