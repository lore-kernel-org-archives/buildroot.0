From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Aug 2011 20:51:07 +0000 (UTC)
Subject: [Buildroot] [Bug 4093] New: Grub fails to install bz2 patch after
 conversion to AUTOTARGETS
Message-ID: <bug-4093-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4093

             Build: buildroot-20110725
           Summary: Grub fails to install bz2 patch after conversion to
                    AUTOTARGETS
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cloak at theblackroom.ca
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


After the patch :
   grub: convert to AUTOTARGETS 
committed on 
   2011-07-10 13:28:23 (GMT)

the grub package no longer applies all the patches in boot/grub, specifially
the grub.400-nic_update2.patch.bz2.

The following line was removed from grub.mk: 
toolchain/patch-kernel.sh $(GRUB_DIR) boot/grub grub.\*.patch{,.bz2}

This handled application of the bz2 patch, and the new autotargets conversion
calls toolchain/patch-kernel.sh with grub*.patch grub*.patch.{ARCH} as the
script parameters. There is no ability for autotargets to use compressed patch
files.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
