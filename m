From: Cyril HAENEL <chaenel@free.fr>
Date: Tue, 02 Dec 2008 15:09:57 +0100
Subject: [Buildroot] [Fwd: Re:  Problem with jffs2 image creation.]
Message-ID: <493541B5.1000706@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I use the default configuration : make at91sam9260dfc_defconfig

By default buildroot build 2 images, ext2 and jffs2, I have not changed 
any option in menuconfig :

[nlc at nlcLaptop buildroot]$ ls -l binaries/at91sam9260dfc/
total 15444
-rwxr-xr-x 1 nlc nlc    3708 2008-12-02 14:49 
at91sam9260dfc-dataflashcardboot-2.3.4.bin*
-rw-r--r-- 1 nlc nlc 1622380 2008-12-02 14:49 
at91sam9260dfc-linux-2.6.24.4-20081202.gz
-rwxr-xr-x 1 nlc nlc  167300 2008-12-02 14:49 
at91sam9260dfc-u-boot-1.2.0-atmel-20081202.bin*
-rw-r--r-- 1 nlc nlc     483 2008-12-02 14:49 autoscript
-rw-r--r-- 1 nlc nlc     555 2008-12-02 14:49 autoscript.at91sam9260dfc
-rw-r--r-- 1 nlc nlc 9576448 2008-12-02 14:49 rootfs.arm-20081202.ext2
-rw-r--r-- 1 nlc nlc 4392688 2008-12-02 14:50 rootfs.arm-20081202.jffs2

If I mount the ext2 image on my laptop everything is OK (devices are 
presents in /dev), and the image works fine when I put it in the board.
But when I mount the jffs2 image on my laptop, /dev, and even /etc are 
empty ! And of course the image doesn't work on the board.
ext2 and jffs2 images seems to not be generated with the same tool. I 
think there is a problem with the mkfs.jffs2 tool ?

-- 
> I am new to the list. I built a custom electronic board
> based on an 
> atmel AT91SAM9260 processor.
> I successfully finished a complete buildroot build, but I
> have a problem.
> The generated jffs2 image of the root filesystem is
> incorrect, in fact 
> the dev directory is not populated, thus I have this
> message after the 
> linux kernel has mounted the filesystem : "Unable to
> open an initial 
> console"
> 
> I tried the ext2 image in my board, it works correctly. But
> I absolutely 
> need to use jffs2 because my filesystem is in a Nand flash.
> 

You mean when you use an ext2 image (just changing from buildroot config) they create necessary files on /dev?

Send your config file.

--
Tiago Maluta.
