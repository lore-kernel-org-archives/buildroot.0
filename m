From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 10:23:18 +0000
Subject: [Buildroot] [Bug 11071] New: Building postgresql package on Debian
 9.4 x64 for armel target fails
Message-ID: <bug-11071-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11071

            Bug ID: 11071
           Summary: Building postgresql package on Debian 9.4 x64 for
                    armel target fails
           Product: buildroot
           Version: 2018.02.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dde at innovaphone.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm currently trying to build buildroot with the postgresql package.
I'm building on Debian Stretch x86_64.

The target configuration in buildroot is for armel:
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_GCC_TARGET_CPU="arm926ej-s"
BR2_GCC_TARGET_FLOAT_ABI="soft"
BR2_GCC_TARGET_MODE="arm"
BR2_BINFMT_SUPPORTS_SHARED=y
BR2_READELF_ARCH_NAME="ARM"
BR2_BINFMT_ELF=y
BR2_ARM_CPU_MAYBE_HAS_VFPV2=y
BR2_ARM_CPU_HAS_ARM=y
BR2_ARM_CPU_HAS_THUMB=y

The configure script of postgresql throws an error for libxml2 (I build with
--with-libxml as a custom option) and libz (this is standard, not changed by
me):

output/host/lib/libz.so: file not recognized: File format not recognized
output/host/lib/libxml2.so: file not recognized: File format not recognized

Seems as if the host libraries are wrong.
If I replace these two libraries with the libs found in output/target/usr/lib,
the build finishes without an error.

I do not have this issue on Debian Stretch x86 (32bit).

Greetings,
Daniel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
