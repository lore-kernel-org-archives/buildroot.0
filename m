From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 4 Nov 2016 17:52:05 -0200
Subject: [Buildroot] warp7_defconfig build error
Message-ID: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Getting the following build error on a warp7_defconfig build with
latest mainline:

>>>   Copying overlay board/warp7/rootfs_overlay
>>>   Generating root filesystem image rootfs.ext2
rm -f /home/fabio/buildroot/output/build/_fakeroot.fs
rm -f /home/fabio/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
rm -f /home/fabio/buildroot/output/build/_users_table.txt
echo '#!/bin/sh' > /home/fabio/buildroot/output/build/_fakeroot.fs
echo "set -e" >> /home/fabio/buildroot/output/build/_fakeroot.fs
echo "chown -h -R 0:0 /home/fabio/buildroot/output/target" >>
/home/fabio/buildroot/output/build/_fakeroot.fs
printf '   \n' >> /home/fabio/buildroot/output/build/_users_table.txt
PATH="/home/fabio/buildroot/output/host/bin:/home/fabio/buildroot/output/host/sbin:/home/fabio/buildroot/output/host/usr/bin:/home/fabio/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
/home/fabio/buildroot/support/scripts/mkusers
/home/fabio/buildroot/output/build/_users_table.txt
/home/fabio/buildroot/output/target >>
/home/fabio/buildroot/output/build/_fakeroot.fs
cat system/device_table.txt >
/home/fabio/buildroot/output/build/_device_table.txt
printf '   /bin/busybox                     f 4755 0  0 - - - - -\n
/dev/console c 622 0 0 5 1 - - -\n\n' >>
/home/fabio/buildroot/output/build/_device_table.txt
echo "/home/fabio/buildroot/output/host/usr/bin/makedevs -d
/home/fabio/buildroot/output/build/_device_table.txt
/home/fabio/buildroot/output/target" >>
/home/fabio/buildroot/output/build/_fakeroot.fs
printf '   PATH="/home/fabio/buildroot/output/host/bin:/home/fabio/buildroot/output/host/sbin:/home/fabio/buildroot/output/host/usr/bin:/home/fabio/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
mke2img -d /home/fabio/buildroot/output/target -G 4 -R 1 -B 0 -I 0 -o
/home/fabio/buildroot/output/images/rootfs.ext2\n' >>
/home/fabio/buildroot/output/build/_fakeroot.fs
chmod a+x /home/fabio/buildroot/output/build/_fakeroot.fs
PATH="/home/fabio/buildroot/output/host/bin:/home/fabio/buildroot/output/host/sbin:/home/fabio/buildroot/output/host/usr/bin:/home/fabio/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
/home/fabio/buildroot/output/host/usr/bin/pseudo --
/home/fabio/buildroot/output/build/_fakeroot.fs
Warning: PSEUDO_PREFIX unset, defaulting to
/home/fabio/buildroot/output/host/usr.
rootdir=/home/fabio/buildroot/output/target
table='/home/fabio/buildroot/output/build/_device_table.txt'
makedevs: line 23: Couldnt create node
/home/fabio/buildroot/output/target/dev/console: File exists
fs/ext2/ext2.mk:46: recipe for target
'/home/fabio/buildroot/output/images/rootfs.ext2' failed
make[1]: *** [/home/fabio/buildroot/output/images/rootfs.ext2] Error 1
Makefile:76: recipe for target '_all' failed
make: *** [_all] Error 2

Does anyone have any ideas on how to fix this error?

Thanks
