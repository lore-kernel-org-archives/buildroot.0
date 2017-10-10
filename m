From: Alejandro Ariel Fachini <alefachinic@gmail.com>
Date: Tue, 10 Oct 2017 14:41:47 -0300
Subject: [Buildroot] Windows bin
Message-ID: <CAHnuF33=Eb-DfNax5TD0YgnW2Mbj40PHXYiaxyG=Lz379EW7kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, im new at buildroot and I have not found help with my enviroment.
I have successfully created the images in a VM with ubuntu, now i need to
flash a SAM9x35 ek, inside nandflash.tcl i got:

   set bootstrapFile   "$env(O)/at91bootstrap.bin"
   set ubootFile       "$env(O)/u-boot.bin"
   set kernelFile      "$env(O)/zImage"
   set rootfsFile      "$env(O)/rootfs.ubi"
   set build_uboot_env "yes"

## NandFlash Mapping
set bootStrapAddr    0x00000000
set ubootAddr        0x00040000
set ubootEnvAddr    0x000c0000
set dtbAddr        0x00180000
set kernelAddr        0x00200000
set rootfsAddr        0x00800000

but if i flash:

   - At91bootstrap.bin 0x0
   - u-boot.bin             0x00040000
   - zImage                  0x00200000
   - rootfs.ubi              0x00800000

I get "wrong kernel Image" error in DBGU port. I flash all this with SAM-BA
on windows.

My questions are:

   1. boot.bin what is it for? which flashing address (if needed to flash
   it)?
   2. at91sam9x5ek-nandflashboot-uboot-3.8.7.bin what is it for? which
   flashing address (if needed to flash it)?
   3. at91sam9x35ek.dtb what is it for? which flashing address (if needed
   to flash it)?
   4. how should i make a *.bat file for flashing in windows? I mean,
   nandflash.tcl won't work for a *.bin pointing to it.
   5. if i use jffs2 format will it work or should i change another config
   in uboot conffiguration?

Thanks Alejandro.-

<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Libre
de virus. www.avast.com
<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171010/4a2158c0/attachment.html>
