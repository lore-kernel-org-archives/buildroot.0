From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 May 2019 21:55:51 +0000
Subject: [Buildroot] [Bug 11866] New: iniramfs file system fails to boot
 using Grub on EFI x86_64
Message-ID: <bug-11866-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11866

            Bug ID: 11866
           Summary: iniramfs file system fails to boot using Grub on EFI
                    x86_64
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pmorici at dev295.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm not 100% sure this is a bug and not my own oversight but I'm unable to
successfully boot the kernel produced by buildroot when the initramfs
filesystem option is selected using Grub on an x86_64 EFI system

To isolate to the bare minimum number of changes I started with
pc_x86_64_efi_defconfig, changed the file system selection from ext2 to
initramfs and modified the post image script to account for the differences. 
The result is that after Grub I see only a frozen cursor in the upper left of
an otherwise blank screen.

The config and modified post script needed to reproduce are attached.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
