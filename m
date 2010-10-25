From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Oct 2010 12:57:26 +0000 (UTC)
Subject: [Buildroot] [Bug 2725] New: Buildroot overrides kernel config
Message-ID: <bug-2725-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2725

           Summary: Buildroot overrides kernel config
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: chromy at asix.cz
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Buildroot overrides certain directives in kernel configuration.

Example: when doing a clean build, unless BR2_TARGET_ROOTFS_INITRAMFS in
Buildroot's config file is set, kernel is built without initramfs support
despite it was enabled in file referenced by
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE.

On the other hand if BR2_TARGET_ROOTFS_INITRAMFS is set, kernel image contains
complete root filesytem.

This is unacceptable - this way it is a problem to build kernel with initramfs
support but without actual filesystem embedded in the kernel, Buildroot shall
not be such invasive when custom configuration file is provided.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
