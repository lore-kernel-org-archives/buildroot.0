From: Kevin Tomary <kevin.tomary@hotmail.com>
Date: Mon, 2 Nov 2020 17:10:38 +0000
Subject: [Buildroot] mkfs.ext4: Could not allocate block in ext2 filesystem
 while populating file system
Message-ID: <AM0PR10MB2433AA0D0ED377CB19D8F22A82100@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Evryone

I got the following error after the build of the image.  With less packages I didn?t get make errors like these.
I wanted to include  WiFi and Bluetooth according to this blog but the make failed after a long period of building

https://tewarid.github.io/2014/10/10/wireless-on-raspberry-pi-with-buildroot.html
https://tewarid.github.io/2014/10/29/bluetooth-on-raspberry-pi-with-buildroot.html





>>>   Generating filesystem image rootfs.ext2
mkdir -p /home/mehdi/buildroot/output/images
rm -rf /home/mehdi/buildroot/output/build/buildroot-fs/ext2
mkdir -p /home/mehdi/buildroot/output/build/buildroot-fs/ext2
rsync -auH --exclude=/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM /home/mehdi/buildroot/output/target/ /home/mehdi/buildroot/output/build/buildroot-fs/ext2/target
echo '#!/bin/sh' > /home/mehdi/buildroot/output/build/buildroot-fs/ext2/fakeroot
echo "set -e" >> /home/mehdi/buildroot/output/build/buildroot-fs/ext2/fakeroot
echo "chown -h -R 0:0 /home/mehdi/buildroot/output/build/buildroot-fs/ext2/target" >> /home/mehdi/buildroot/output/build/buildroot-fs/ext2/fakeroot
PATH="/home/mehdi/buildroot/output/host/bin:/home/mehdi/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" /home/mehdi/buildroot/support/scripts/mkusers /home/mehdi/buildroot/output/build/buildroot-fs/full_users_table.txt /home/mehdi/buildroot/output/build/buildroot-fs/ext2/target >> /home/mehdi/buildroot/output/build/buildroot-fs/ext2/fakeroot
echo "/home/mehdi/buildroot/output/host/bin/makedevs -d /home/mehdi/buildroot/output/build/buildroot-fs/full_devices_table.txt /home/mehdi/buildroot/output/build/buildroot-fs/ext2/target" >> /home/mehdi/buildroot/output/build/buildroot-fs/ext2/fakeroot
printf '   \n' >> /home/mehdi/buildroot/output/build/buildroot-fs/ext2/fakeroot
printf '        rm -f /home/mehdi/buildroot/output/images/rootfs.ext2\n /home/mehdi/buildroot/output/host/sbin/mkfs.ext4 -d /home/mehdi/buildroot/output/build/buildroot-fs/ext2/target -r 1 -N 0 -m 5 -L "" -O ^64bit /home/mehdi/buildroot/output/images/rootfs.ext2 "120M" || { ret=$?; echo "*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)" 1>&2; exit $ret; }\n' >> /home/mehdi/buildroot/output/build/buildroot-fs/ext2/fakeroot
chmod a+x /home/mehdi/buildroot/output/build/buildroot-fs/ext2/fakeroot
PATH="/home/mehdi/buildroot/output/host/bin:/home/mehdi/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" FAKEROOTDONTTRYCHOWN=1 /home/mehdi/buildroot/output/host/bin/fakeroot -- /home/mehdi/buildroot/output/build/buildroot-fs/ext2/fakeroot
rootdir=/home/mehdi/buildroot/output/build/buildroot-fs/ext2/target
table='/home/mehdi/buildroot/output/build/buildroot-fs/full_devices_table.txt'
mke2fs 1.44.5 (15-Dec-2018)
Creating regular file /home/mehdi/buildroot/output/images/rootfs.ext2
64-bit filesystem support is not enabled.  The larger fields afforded by this feature enable full-strength checksumming.  Pass -O 64bit to rectify.
Creating filesystem with 122880 1k blocks and 30720 inodes
Filesystem UUID: 1990b9bd-d682-4181-b757-d2a3c2153ba5
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Copying files into the device: __populate_fs: Could not allocate block in ext2 filesystem while writing file "nmap-os-db"
mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system
*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)
fs/ext2/ext2.mk:46: recipe for target '/home/mehdi/buildroot/output/images/rootfs.ext2' failed
make: *** [/home/mehdi/buildroot/output/images/rootfs.ext2] Error 1



Kevin

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201102/88484dc3/attachment.html>
