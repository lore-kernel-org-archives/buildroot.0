From: rscr <rafacrespiramon@gmail.com>
Date: Tue, 10 Dec 2019 07:58:53 -0600 (CST)
Subject: [Buildroot] Custom tarball and .config file
In-Reply-To: <20191210141145.5969eb63@windsurf>
References: <1575964472511-0.post@n4.nabble.com>
 <20191210141145.5969eb63@windsurf>
Message-ID: <1575986333615-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

I am new on Linux and buildroot, so it is possible I have misunderstood many
things. I will try to explain:

For testing purposes, I'm using a local linux source, downloaded from the
raspberry's github: linux-rpi-4.19.y

I have added to the linux source a kernel driver that I am testing ( If I
build the kernel out of buildroot it builds correct )

Now I want to use that linux kernel on Buildroot, so I tar the source, and I
set:

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="file://home/tec/rcr/tools/src/linux-rpi-4.19.y.tar.gz"


This is my buildroot's kernel configuration

BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/tec/rcr/projects/cp4/rscr_br2_extree/configs/ibLinux_defconfig"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

Now my q?estion:

*How can I configure my custom kernel in buildroot, in order to select the
device drivers I have added? If I run linux-menuconfig does not appear the
driver on the Device Drivers menu. It seems it is pointing to another linux
source*

Kind Regards, 

Rafa







--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
