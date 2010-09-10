From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Sep 2010 12:51:58 +0000 (UTC)
Subject: [Buildroot] [Bug 2551] New: [PATCH] native toolchain in the target
 filesystem fails
Message-ID: <bug-2551-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2551

           Summary: [PATCH] native toolchain in the target filesystem
                    fails
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: arpinf at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2449
  --> https://bugs.busybox.net/attachment.cgi?id=2449
Patch to fix native toolchain in target filesystem

Buildroot version: 2010.08
Host: x86_64
Target: i686

Selecting:
Package Selection for the target  --->
    Development tools  --->
        [*] native toolchain in the target filesystem

Fails with:
mkdir -p /home/illuminate/buildroot-2010.08/output/toolchain/gcc-4.4.4-final
touch
/home/illuminate/buildroot-2010.08/output/build/gcc-4.4.4-target/.prepared
touch: cannot touch
`/home/illuminate/buildroot-2010.08/output/build/gcc-4.4.4-target/.prepared':
No such file or directory
make: ***
[/home/illuminate/buildroot-2010.08/output/build/gcc-4.4.4-target/.prepared]
Error 1

Cause:
Creating the .prepared file in a missing directory.
$(GCC_BUILD_DIR4)/.prepared: $(STAMP_DIR)/gcc_libs_target_installed
$(GCC_TARGET_PREREQ)
        mkdir -p $(GCC_BUILD_DIR3)

fixed by changing $(GCC_BUILD_DIR3) to $(GCC_BUILD_DIR4)


Included fix in the patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
