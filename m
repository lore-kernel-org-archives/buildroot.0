From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 13 Oct 2013 16:29:55 +0200
Subject: [Buildroot] Kernel module compiled but not found
Message-ID: <525AAE63.3060601@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I read the official documentation and this tutorial:

http://blog.willygroup.org/buildroot-aggiungere-modulo-al-kernel.html#fn-729-1

to add a custom kernel module.
It seems it is successfully compiled but I cannot find the .ko file in 
the Buildroot tree.
This is the relevant output:

 >>> sensoray2253 1.2.6 Building
/usr/bin/make -j5 
HOSTCC="/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/bin/ccache 
/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm 
INSTALL_MOD_PATH=/home/mark/dev/rpiqt5/buildroot-rpi/output/target 
CROSS_COMPILE="/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/bin/ccache 
/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/bin/arm-buildroot-linux-gnueabi-" 
DEPMOD=/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/sbin/depmod 
-C /home/mark/dev/rpiqt5/buildroot-rpi/output/build/linux-custom 
M=/home/mark/dev/rpiqt5/buildroot-rpi/output/build/sensoray2253-1.2.6 
modules
make[1]: Entering directory 
`/home/mark/dev/rpiqt5/buildroot-rpi/output/build/linux-custom'
   Building modules, stage 2.
   MODPOST 0 modules
make[1]: Leaving directory 
`/home/mark/dev/rpiqt5/buildroot-rpi/output/build/linux-custom'
 >>> sensoray2253 1.2.6 Installing to target
/usr/bin/make -j5 
HOSTCC="/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/bin/ccache 
/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm 
INSTALL_MOD_PATH=/home/mark/dev/rpiqt5/buildroot-rpi/output/target 
CROSS_COMPILE="/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/bin/ccache 
/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/bin/arm-buildroot-linux-gnueabi-" 
DEPMOD=/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/sbin/depmod 
-C /home/mark/dev/rpiqt5/buildroot-rpi/output/build/linux-custom 
M=/home/mark/dev/rpiqt5/buildroot-rpi/output/build/sensoray2253-1.2.6 
modules_install
make[1]: Entering directory 
`/home/mark/dev/rpiqt5/buildroot-rpi/output/build/linux-custom'
   DEPMOD  3.9.11
make[1]: Leaving directory 
`/home/mark/dev/rpiqt5/buildroot-rpi/output/build/linux-custom'
mkdir -p /home/mark/dev/rpiqt5/buildroot-rpi/output/target/etc
echo "rpi" > /home/mark/dev/rpiqt5/buildroot-rpi/output/target/etc/hostname


As you can see, there are no errors but I'm not sure the module is 
correctly installed!
According to the tutorial I should find it in:

buildroot_folder/output/target/lib/modules/kernel_version/extra/

but mine is empty.

How investigate further?
Thanks
Mark
