From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 Oct 2010 19:26:07 +0000 (UTC)
Subject: [Buildroot] [Bug 2707] New: Can't compile linux kernel using
 buildroot + crosstool-ng
Message-ID: <bug-2707-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2707

           Summary: Can't compile linux kernel using buildroot +
                    crosstool-ng
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: phil at philpep.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2605
  --> https://bugs.busybox.net/attachment.cgi?id=2605
fix missing include of kernel-headers when using crosstool-ng toolchain

linux/linux.mk need KERNEL_ARCH defined in
toolchain/kernel-headers/kernel-headers.mk included usually by toolchain
makefiles, crosstool-ng don't causing an error when we compile the linux
kernel.

Fix attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
