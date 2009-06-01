From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  1 Jun 2009 08:04:57 +0000 (UTC)
Subject: [Buildroot] [Bug 367] New: linux kernel compile error for arm926t
Message-ID: <bug-367-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=367

              Host: Debian 5.01
            Target: arm-linux-uclibcgnueabi
           Summary: linux kernel compile error for arm926t
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: alex_dobrynin at hotmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


In buildroot-2009.05-rc3 and internal toolchain
I get an error while compiling linux kernel (2.6.28):
  CC      arch/arm/kernel/traps.o
{standard input}: Assembler messages:
{standard input}:1094: Error: selected processor does not support `pld [r6,#0]'

It turns out that buildroot sets --with-arch=armv4t in gcc config
for target arm and variant arm926t.
Changing target/Config.in.arch to:
        default armv4t          if BR2_arm920t
        default armv4t          if BR2_arm922t
-       default armv4t          if BR2_arm926t
+       default armv5te         if BR2_arm926t
        default armv5t          if BR2_arm10t
        default armv6j          if BR2_arm1136jf_s
fixes the problem.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
