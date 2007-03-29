From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 28 Mar 2007 21:28:07 -0700
Subject: [Buildroot] [buildroot 0001294]: makedevs errors out in build
Message-ID: <87c585945a1c60d1ff53a52e08bbdbf6@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1294 
====================================================================== 
Reported By:                tony_cureington
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1294
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-28-2007 21:12 PDT
Last Modified:              03-28-2007 21:28 PDT
====================================================================== 
Summary:                    makedevs errors out in build
Description: 
I've attached the .config file that should contain all the info needed to
repro. I just extracted buildroot-20070328.tar.bz2, make menuconfig, make,
and got this error. I removed all USB support to get past the other error I
just reported.

/usr/bin/install -c -g root -o root -m 644 Problems Copyright README
ChangeLog timespec
/home/tony/Buildroot/buildroot/build_i486/root/usr/doc/at
rm -f /home/tony/Buildroot/buildroot/build_i486/root/usr/man/cat1/at.1*
/home/tony/Buildroot/buildroot/build_i486/root/usr/man/cat1/batch.1* \
       
/home/tony/Buildroot/buildroot/build_i486/root/usr/man/cat1/atq.1*
rm -f /home/tony/Buildroot/buildroot/build_i486/root/usr/man/cat1/atd.8*
make[1]: Leaving directory
`/home/tony/Buildroot/buildroot/build_i486/at-3.1.10'rootdir=/home/tony/Buildroot/buildroot/build_i486/root
table='target/generic/device_table.txt'
makedevs: line 42: regular file
'/home/tony/Buildroot/buildroot/build_i486/root/bin/busybox' does not
exist: No such file or directory
-rw-rw-r-- 1 tony tony 8028160 Mar 28 23:03
/home/tony/Buildroot/buildroot/rootfs.i486.ext2
[tony at penguin buildroot]$ find -name busybox
./package/busybox
./build_i486/busybox-1.5.0/_install/bin/busybox
./build_i486/busybox-1.5.0/include/config/busybox
./build_i486/busybox-1.5.0/busybox
[tony at penguin buildroot]$

====================================================================== 

---------------------------------------------------------------------- 
 tony_cureington - 03-28-07 21:28  
---------------------------------------------------------------------- 
I copied the busybox binary to the location makedevs expected it and things
seemed to build OK. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-28-07 21:12  tony_cureingtonNew Issue                                    
03-28-07 21:12  tony_cureingtonStatus                   new => assigned     
03-28-07 21:12  tony_cureingtonAssigned To               => buildroot       
03-28-07 21:12  tony_cureingtonFile Added: dot_config                       
03-28-07 21:28  tony_cureingtonNote Added: 0002289                          
======================================================================
