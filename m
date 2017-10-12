From: Alejandro Ariel Fachini <alefachinic@gmail.com>
Date: Thu, 12 Oct 2017 16:11:38 -0300
Subject: [Buildroot] [BuildRoot] at91sam9x5ek_defconfig not booting
Message-ID: <CAHnuF31sDH93MRN8nU6kdvfymwD7LOAz56YckWrk-OLSdMx3Qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, im new to Buildroot and I understand this may be more related to
linux4sam website but i need some help.
I am currently beginning with at91sam9x35ek. I've read and followed these
documentations:

linux4sam/bin/view/Linux4SAM/BuildRootB ... nux_U_boot
<http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRootBuild#Customizing_Busybox_Linux_U_boot>
linux4sam/bin/view/Linux4SAM/BuildRoot_9x5
<http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot_9x5>

Doing what was described in these documents i got on Ubuntu 16.04 LTS the
following resulting files, I am using this buildroot tag; *2016.02-rc3*:

buildroot/output/images$ ls
at91bootstrap.bin at91sam9x35ek.dtb rootfs.ubifs
at91sam9g15ek.dtb at91sam9x5ek-nandflashboot-uboot-3.8.bin u-boot.bin
at91sam9g25ek.dtb boot.bin zImage
at91sam9g35ek.dtb rootfs.tar
at91sam9x25ek.dtb rootfs.ubi

I have to flash the device with windows where my Ubuntu VM runs.
The flashing addresses aree found inside the script for flashing being:

   - 0x0 for atboostrap.bin


   - 0x40000 for u-boot.bin


   - 0x180000 for at91sam9x35ek.dtb


   - 0x200000 for zImage


   - 0x800000 for rootfs.ubi

This configuration won't boot KERNEL. System goes to u-boot> prompt and
when i use:
*bootz 0x22000000 - 0x21000000*
Results in:

*Wrong Ramdisk Image FormatRamdisk image is corrupt or invalid*

Now. i have this demo:
*linux4sam-buildroot-at91sam9x5ek-4.2*

This demo contains the following files(relevant):

at91sam9x5ek-nandflashboot-uboot-3.6.0.bin
at91sam9x35ek.dtb
u-boot-at91sam9x5ek_nandflash.bin
ubootEnvtFileNandFlash.bin
zImage-at91_dt
rootfs-at91sam9.ubi

I flash them with SAM-BA 2.12 on windows 10 at the following addresses:

   - 0x0 for at91sam9x5ek-nandflashboot-uboot-3.6.0.bin


   - 0x40000 for u-boot-at91sam9x5ek_nandflash.bin


   - 0xc0000 for ubootEnvtFileNandFlash.bin


   - 0x180000 for at91sam9x35ek.dtb


   - 0x200000 for zImage-at91_dt


   - 0x800000 for rootfs-at91sam9.ubi

THis configuraion and these files work up to buildroot login prompt without
issues.

So i have a set of questions may be related to my inexperience:

1- In my Buildroots build on my Ubuntu enviroment, if the file
*at91bootstrap.bin* is my ATbootstrap bootloader, what is the file
*at91sam9x5ek-nandflashboot-uboot-3.8.bin*?

2- What is the file *boot.bin*?

3-Where is the file with the U_BOOT enviroment variables, in the compiled
Buildroot results?????

4-I used "make at91sam9x5ek_defconfig", then "make". Does this means that
the default configuration in these files are not working???

5- Where do i set for building the file with Uboot Environment Variables?

6- Do i need to apply patches to the newest Bootloader version?

7- How do i do to change UBI format to jffs2 for compiling? i know how to
do it in buildroot's menuconfig, but environment variables still sets to
UBI.


Thanks for your help and patience since I dont really know much about this.

On side note I tried using the latest Build from Buildroot master at git
and got same results. so All the above questons apply for BuildRoot
mainline too. PLease Help me and Im sorry for asking noob things here.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171012/75fcd5d4/attachment.html>
