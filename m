From: Charles Hardin <ckhardin@exablox.com>
Date: Wed, 11 May 2016 09:39:16 -0700
Subject: [Buildroot] [QUESTION] supporting both a GRUB2 EFI and BIOS target
Message-ID: <3A4B5FF0-CE09-4361-8FC0-0DE2630BFDC0@exablox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have a slight issue on a variation of two development boards where one
supports EFI and one supports BIOS - some hardware issue that prevents the
EFI BIOS from running.

The ?rest? of the rootfs is the same for the build collatoral, so is there a
best practice to build two variants of grub2 to get the images and tools out without
having to create a separate config file? or just clone the grub2 package
and modify it to build the setup? or some other magic incantation?

The current config is just an option for the target preventing multiple selection.

if BR2_TARGET_GRUB2

choice
        prompt "Platform"

config BR2_TARGET_GRUB2_I386_PC
        bool "i386-pc"
        help
          Select this option if the platform you're targetting is a
          x86 or x86-64 legacy BIOS based platform.

config BR2_TARGET_GRUB2_I386_EFI
        bool "i386-efi"
        help
          Select this option if the platform you're targetting has a
          32 bits EFI BIOS. Note that some x86-64 platforms use a 32
          bits EFI BIOS, and this option should be used in this case.

config BR2_TARGET_GRUB2_X86_64_EFI
        bool "x86-64-efi"
        depends on BR2_ARCH_IS_64
        help
          Select this option if the platform you're targetting has a
          64 bits EFI BIOS.

endchoice

Thanks in advance,
Charles

?
Bits go in, bytes go out


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160511/f569c9a8/attachment.html>
