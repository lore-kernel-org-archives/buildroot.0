From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 May 2018 10:14:17 +0000
Subject: [Buildroot] [Bug 11031] New: ld-elf2flt: host/bin/ld.real': execvp:
 No such file or directory
Message-ID: <bug-11031-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11031

            Bug ID: 11031
           Summary: ld-elf2flt: host/bin/ld.real': execvp: No such file or
                    directory
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christophe.priouzeau at st.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

With the rc of 2018.05 preparation, it's not possible to generate uclibc with a
stm32 build. 
During the installation of uclibc, the call to elf2flt crash:

  CC utils/getconf
ld.real (ld-elf2flt): error trying to exec
'/mnt/internal_storage/stm32f7/buildroot_to_test/output/host/bin/ld.real':
execvp: No such file or directory
collect2: error: ld returned 255 exit status

Setup: 
  VERSION of buildroot: 2018.05-rc2
  PC with Ubuntu 16.04

How to reproduce:
  git clone git://git.buildroot.net/buildroot
  cd buildroot
  git checkout -b work 2018.05-rc2
  make stm32f469_disco_defconfig
  make 

Trace of compilation are available on attached file.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
