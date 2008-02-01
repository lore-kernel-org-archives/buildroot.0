From: Albert Causing <albertcausing@gmail.com>
Date: Fri, 1 Feb 2008 10:08:01 +0800
Subject: [Buildroot] Uboot or Grub
Message-ID: <afc3bae70801311808w4e942543oa5c7cfe48cfdff3a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I need help on buildroott grub and uboot

I've succesfully create an image without bootloaders...

but when i select grub, it needs graphics.h, and when i tried puting a
graphics.h problem was ncurses.h, any dependencies on building grub? i
think its totally lots of error...

and in the document, it says about uboot to be compiled together in
the binaries directory, sad to say theres none, anything i should be
checking on the menuconfig?

badly need your help, thats what missing after 3 days of compiling buildroot.

after adding, graphics.h and curses.h from ncurses.
---------
/opt/buildroot/buildroot/build_i686/grub-0.97/lib/device.c:909:
undefined reference to `errnum'
collect2: ld returned 1 exit status
make[3]: *** [grub] Error 1
make[3]: Leaving directory `/opt/buildroot/buildroot/build_i686/grub-0.97/grub'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/opt/buildroot/buildroot/build_i686/grub-0.97'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/opt/buildroot/buildroot/build_i686/grub-0.97'
make: *** [/opt/buildroot/buildroot/build_i686/grub-0.97/grub/grub] Error 2
--------------

bbox u# ls -ahl
total 69M
-rw-r--r-- 1 root root 4.4M Jan 31 22:12 -linux-2.6.23-20080131.bz
-rw-r--r-- 1 root root  36M Feb  1 10:04 -linux-2.6.23-20080201.bz
drwxr-xr-x 2 root root 4.0K Feb  1 10:06 ./
drwxr-xr-x 4 root root 4.0K Jan 31 19:49 ../
-rw-r--r-- 1 root root  15M Jan 31 22:12 rootfs.i686.ext2
-rw-r--r-- 1 root root 7.1M Jan 31 22:12 rootfs.i686.ext2.bz2
-rw-r--r-- 1 root root  39K Feb  1 10:04 rootfs.i686.initramfs_list
-rwx------ 1 root root 7.2M Jan 31 22:12 rootfs.i686.squashfs*
bbox u#

need
