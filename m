From: Eldor =?UTF-8?B?UsO4ZHNldGg=?= <er@systemsoft.no>
Date: Fri, 27 Sep 2019 10:33:12 +0200
Subject: [Buildroot] grub.cfg "set fallback=XXX"
Message-ID: <F94D8A88-04A9-49EA-8E28-875789F6B164@systemsoft.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi! 

I have the following content in my buildroot/busybox/grub2-based EFI system grub.cfg-file: 


-------------------------------- start -------------------------
set default=rootfs2 
set fallback=rootfs1 
set timeout=5 

menuentry "Alternating SW Image (rootfs) 1 - Linux 4.20.8 root at sda2" --id rootfs1 { 
        linux /bzImage root=/dev/sda2 quiet loglevel=4 console=ttyS0,115200n8 id=rootfs1 
} 

menuentry "Alternating SW Image (rootfs) 2 - Linux 4.20.8 root at sda3" --id rootfs2 { 
        linux /bzImage root=/dev/sda3 quiet loglevel=4 console=ttyS0,115200n8 id=rootfs2 
} 

menuentry "USB Installation Disk - Linux 4.20.8 root at sdb2" --id usb { 
        linux /bzImage root=/dev/sdb2 rootwait quiet loglevel=4 console=ttyS0,115200n8 id=usb 
} 


-------------------------------- end -------------------------


Now; my problem is that even if I completely wipe-out the /dev/sda3 (i.e. --id rootfs2) to force a fallback to /dev/sda2 (i.e. --id rootfs1) the grub2 boot loader persistently only tries to boot from the corrupted entry (i.e. rootfs2). So ... what am I doing wrong ... ?

 

Med vennlig hilsen
Eldor R?dseth
Tlf. +47 95086888

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190927/b7665eaa/attachment.html>
