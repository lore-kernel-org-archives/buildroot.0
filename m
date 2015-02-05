From: Thierry Bultel <tbultel@free.fr>
Date: Thu, 05 Feb 2015 13:54:17 +0100
Subject: [Buildroot] grub2 failure with gcc-4.9
Message-ID: <54D367F9.4060108@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just figured out that my PC target was failing to boot,
because I upgraded the compiler from (buildroot toolchain) gcc-4.8.x to 
gcc-4.9.x

The configuration is:
BR2_TARGET_GRUB2_I386_PC=y
BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos 
part_gpt part_bsd normal biosdisk sleep echo video videoinfo help jpeg 
uhci ehci usb usb_keyboard usbms usbtest gfxterm gfxmenu vbe vga 
video_bochs video_cirrus font search search_fs_file search_label test 
test_blockarg keylayouts at_keyboard cat configfile loadenv eval serial 
regexp"

(I know, that makes a lot but work like a charm with gcc-4.8.2)

The symptom is :
-------------------------------
'' is already set
Aborted. Press any key to exit.
-------------------------------

After some (printf) debugging, I found out that when 'loading' the 
builtin modules at startup, some modules names are corrupted.
I am about to get into deeper investigation, but has anyone
encountered it ?

Best regards
Thierry
