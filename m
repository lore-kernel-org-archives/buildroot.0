From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Jul 2018 08:42:35 +0000
Subject: [Buildroot] [Bug 11181] New: Switching toolchain does not work
Message-ID: <bug-11181-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11181

            Bug ID: 11181
           Summary: Switching toolchain does not work
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: buildroot at cookiesoft.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

I build several kernels for debugging purpose.
For this I need the gcc7 and gcc4, but when I switch the compiler in the
toolchain menu, it won't use the selected compiler. 

Steps to reproduce.
make menuconfig
-> toolchain
-> GCC compiler Version 
  gcc 4.9.x
-> Exit and Save
make

make menuconfig
-> toolchain
-> GCC compiler Version
  gcc 7.x
-> Exit and Save
make (note, this works!)

make menuconfig 
-> toolchain
-> GCC compiler Version 
  gcc 4.9.x
-> Exit and Save
make (now it builds with gcc 7)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
