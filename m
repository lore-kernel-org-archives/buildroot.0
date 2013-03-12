From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Mar 2013 16:54:29 +0000 (UTC)
Subject: [Buildroot] [Bug 6092] New: Bootable ISO image creation seems to
 have stopped working since 2012.08
Message-ID: <bug-6092-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6092

           Summary: Bootable ISO image creation seems to have stopped
                    working since 2012.08
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gfx229-uclibc at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


2012.08 and prior generated bootable ISO images whereas the changes after this
(which defaulted to CPIO initramfs from Ext2 filesystem image) seems to have
stopped working (could be operator error but no obvious documentation in this
scenario).

Repro (2012.11 to 2013.02) - used mostly straight-line defaults:
 [ ] Linux kernel - Install kernel image to /boot in target, used 
                    i386_defconfig extracted from Linux kernel build as
                    defined kernel config
 [ ] Bootloaders - specified both grub and syslinux (Install isolinux)
 [ ] Filesystem images - iso image, fs/iso9660/menu.lst
                       - cpio the root filesystem (no compression method)
 [ ] Package selection - nothing but BusyBox

Observed behavior - burned ISO boots and hangs after "Loading Stage2 ....."

Previous good (2012.08) 
 [ ] Burned ISO bootable (I think because initrd is Ext2 rather than
Initramfs/CPIO)

---

Perhaps I'm doing something wrong or need other configuration parameters for
the Linux kernel (I tried adding other filesystem module support but that did
not help nor do I suspect it is necessary).  If there is some BuildRoot
documentation that I'm overlooking or need to do more directly with Linux
kernel configuration to ensure even a "linked-in" initramfs copy works, I'm
happy to further investigate my own issues.  (It just was working fine with the
Ext2 initrd but seems to have stopped after the changes in 2012.11 so I was
wondering where I've gone wrong or if this is not a widely tested scenario.)

Thank you very much and best regards.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
