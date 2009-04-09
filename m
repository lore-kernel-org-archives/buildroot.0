From: Mike Sander <msander@cogeco.ca>
Date: Thu, 09 Apr 2009 09:37:08 -0400
Subject: [Buildroot] losetup /dev/loop0: No such device or address
Message-ID: <49DDFA04.8040904@cogeco.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Im using buildroot-2009.02 on atmel at91sam9g20ek.  It is a fairly stock 
cofiguration. 

When I execute "losetup /dev/loop0 /mnt/flash/backing_file.vfat" i get 
the error "losetup /dev/loop0: No such device or address".    /mnt/flash 
exist and has a mounted jffs2 filesystem on it.As far as I can tell, it 
is working correctly.  I can read/write files. I have checked all the 
obvious suspects (including erroneous error message)

here is the output from mount
# mount                      
rootfs on / type rootfs (rw)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /tmp type tmpfs (rw)
sysfs on /sys type sysfs (rw)
/dev/mtdblock2 on /mnt/flash type jffs2 (rw)

looks like a valid mounted filesystem.

# ls /mnt/flash
backing_file.vfat  hosts

the file I am trying to connect to loop0 definately exists.  I copied 
/etc/hosts to it to verify read/write operation.


here are the /dev/loop* devices
# ls -atl loop*
brw-r-----    1 root     root       7,   0 Dec 31 17:00 loop0
brw-r-----    1 root     root       7,   1 Dec 31 17:00 loop1
 
/dev/loop0 definitely exists and appears to be correctly defined (I think).

Anyone aware of issues using losetup?   Is there some obscure dependency 
I might be missing.  any suggestions on how to debug this short of 
printf() from losetup code?

Regards,

mike
