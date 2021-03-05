From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Mar 2021 00:33:39 +0000
Subject: [Buildroot] [Bug 13576] New: Issues compiling buildroot for 5x86
Message-ID: <bug-13576-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13576

            Bug ID: 13576
           Summary: Issues compiling buildroot for 5x86
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ingineru_de_sistem at yahoo.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Tried to compile a buildroot environment to revive an old p1mmx machine.

1) when choosing MariaDB to provide MySQL, perl DBD::mysql and rsyslog have
trouble finding mysql.h, have to add -I/path/to/output/target/.../mysql.h to
them individually

2) syslinux hits umpteen double definitions when linking.
Finally need to override the linker to always add --alow-multiple-definition
always, otherwise it won't compile. (Not sure it works, though).
(Uboot is not an option on a PC, lilo is absent from buildroot even though it
would perfectly fit the need. Grub is not recommended when booting from SD
cards, it tends to erase stuff when attempting to write and not waiting for the
whole page to be rewritten)

3) for some reason, buildroot needs to download a rust binary, but refuses to
skip the hash if the hash is not in the hash file. Removing rust*hash fixes
this.

...and still going

If it matters, the host is a VM running Ubuntu 20.04 LTS x64 .
Buildroot is the last version available on git (git clone ....)


I guess not many people are into reviving P1MMX machines with the latest kernel
and libraries

-- 
You are receiving this mail because:
You are on the CC list for the bug.
