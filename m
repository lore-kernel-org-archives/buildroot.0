From: Ossy <ossy1980@gmx.net>
Date: Mon, 12 Jul 2010 22:52:55 +0200
Subject: [Buildroot] Problems with custom config of kernel 2.6.34.1
Message-ID: <4C3B80A7.1040305@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,

I use the kernel version 2.6.33.6 without any problems. But since I 
updated to the newer version 2.6.34.1 I'm not able to use a custom 
config anymore.

I loaded the old config into the kernel menuconfig and stored it as new 
file linux-2.6.34.1.config. When I launched the overall make process the 
kernel patches were applied fine, but the process runs into text mode 
configuration:

...
 >>>   Configuring kernel
cp 
"target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.34.1.config" 
/home/ossy/buildroot/buildroot-dev/output/build/linux-2.
6.34.1/.config
/home/ossy/buildroot/buildroot-dev/output/toolchain/bin/sed -i -e 
"/CONFIG_AEABI/d" /home/ossy/buildroot/buildroot-dev/output/build/linux-2.
6.34.1/.config
echo "CONFIG_AEABI=y" >> 
/home/ossy/buildroot/buildroot-dev/output/build/linux-2.6.34.1/.config
/home/ossy/buildroot/buildroot-dev/output/toolchain/bin/sed -i -e 
"/CONFIG_IPV6/d" /home/ossy/buildroot/buildroot-dev/output/build/linux-2.6
.34.1/.config
echo "# CONFIG_IPV6 is not set" >> 
/home/ossy/buildroot/buildroot-dev/output/build/linux-2.6.34.1/.config
/home/ossy/buildroot/buildroot-dev/output/toolchain/bin/sed -i -e 
"/CONFIG_BLK_DEV_INITRD/d" /home/ossy/buildroot/buildroot-dev/output/build
/linux-2.6.34.1/.config
echo "# CONFIG_BLK_DEV_INITRD is not set" >> 
/home/ossy/buildroot/buildroot-dev/output/build/linux-2.6.34.1/.config
/home/ossy/buildroot/buildroot-dev/output/toolchain/bin/sed -i -e 
"/CONFIG_INITRAMFS_SOURCE/d" /home/ossy/buildroot/buildroot-dev/output/bui
ld/linux-2.6.34.1/.config
echo "CONFIG_INITRAMFS_SOURCE=\"\"" >> 
/home/ossy/buildroot/buildroot-dev/output/build/linux-2.6.34.1/.config
PATH="/home/ossy/buildroot/buildroot-dev/output/host/bin:/home/ossy/buildroot/buildroot-dev/output/host/usr/bin:/home/ossy/buildroot/buildro
ot-dev/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/games" 
PERLLIB="/home/ossy/buildroot/buildroot-dev/output/host/usr/lib/perl"
/usr/bin/make -j2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm 
INSTALL_MOD_PATH=/home/ossy/buildroot/buildroot-dev/output/target 
CROSS_COMPI
LE=/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi- 
LDFLAGS="-L/home/ossy/buildroot/buildroot-dev/
output/staging/lib 
-L/home/ossy/buildroot/buildroot-dev/output/staging/usr/lib" 
LZMA="/home/ossy/buildroot/buildroot-dev/output/host/usr/bin
/lzma" -C /home/ossy/buildroot/buildroot-dev/output/build/linux-2.6.34.1 
oldconfig
make[1]: Entering directory 
`/home/ossy/buildroot/buildroot-dev/output/build/linux-2.6.34.1'
scripts/kconfig/conf -o arch/arm/Kconfig
*
* Restart config...
*
*
* Enable the block layer
*
Enable the block layer (BLOCK) [Y/?] y
   Support for large (2TB+) block devices and files (LBDAF) [Y/n/?] (NEW)


Why is the configuration restarted? The config file was well copied from 
custom directory to output/build/linuxsrc/.config.
So why should I restart configuration in textmode?

Thanks for your help.

Regards,
Marcus
