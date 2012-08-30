From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Aug 2012 11:28:30 +0000 (UTC)
Subject: [Buildroot] [Bug 5480] New: Choose default kernel configuration
 depending on the current architecture selected.
Message-ID: <bug-5480-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5480

           Summary: Choose default kernel configuration depending on the
                    current architecture selected.
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rsanchezs at infoglobal.es
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4526
  --> https://bugs.busybox.net/attachment.cgi?id=4526
linux: Choose default kernel configuration depending on the current
architecture selected.

Hello:

  I've found out that after initial configuration, including enabling of linux
kernel compilation, the default kernel config is not set and almost all make
targets fail with:

"linux/linux.mk:304: *** No kernel defconfig name specified, check your
BR2_LINUX_KERNEL_DEFCONFIG setting."

  One possible solution would have been tweaking the build system to avoid that
message or at least, be able to run the linux-menuconfig target. I didn't find
an easy way to do this and therefore I chose another option which is setting
kernel default configs depending on target architecture.

  Find the patch attached, regards,

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
