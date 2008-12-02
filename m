From: Cyril HAENEL <chaenel@free.fr>
Date: Tue, 02 Dec 2008 13:55:40 +0100
Subject: [Buildroot] Problem with jffs2 image creation.
Message-ID: <4935304C.2050206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am new to the list. I built a custom electronic board based on an 
atmel AT91SAM9260 processor.
I successfully finished a complete buildroot build, but I have a problem.
The generated jffs2 image of the root filesystem is incorrect, in fact 
the dev directory is not populated, thus I have this message after the 
linux kernel has mounted the filesystem : "Unable to open an initial 
console"

I tried the ext2 image in my board, it works correctly. But I absolutely 
need to use jffs2 because my filesystem is in a Nand flash.

To detect the problem I have mounted the jffs2 image on my laptop :

#modprobe mtdram total_size=24576 erase_size=128
#modprobe mtdblock
#dd 
if=/home/nlc/linuxEmbedded/buildroot/binaries/at91sam9260dfc/rootfs.arm-20081202.jffs2 
of=/dev/mtdblock
#mount -t jffs2 /dev/mtdblock0 /mnt/removable/

#ls /mnt/removable/
#bin/  boot/  config/  dev/  etc/  home/  lib/  linuxrc@  mnt/  opt/  
proc/  root/  sbin/  sys/  tmp/  usr/  var/

And dev is empty :

#ls -l /mnt/removable/dev/
total 0

Is someone have the same problem ? Where can be the problem, from 
mkfs.jffs2 ?

Sorry for my poor english !
Regards,
Cyril HAENEL

-- 

Cyril Haenel
Registered Linux User #332632
