From: rscr <rafacrespiramon@gmail.com>
Date: Fri, 13 Dec 2019 06:27:33 -0600 (CST)
Subject: [Buildroot] Custom tarball and .config file
In-Reply-To: <1576133977989-0.post@n4.nabble.com>
References: <1575964472511-0.post@n4.nabble.com>
 <20191210141145.5969eb63@windsurf> <1575986333615-0.post@n4.nabble.com>
 <1576133977989-0.post@n4.nabble.com>
Message-ID: <1576240053124-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, 

I don't know what I am doing wrong, but I am still not able to configure the
kernel through "linux-menuconfig". I* would like to use the bcmrpi_defconfig
as base and add my kernel driver as <M>. How can I achieve it? *

My steps:

a) I've got my kernel source (linux-rpi-4.19.y) in /home/tec/rcr/tools/src
with the driver.c, Makefile and Kconfig edited (I can build the kernel
source outside of buildroot)
b) Tar the kernel source
c) I go into buildroot's directory. I've myproject_defconfig file into
br2_external so I run:
make BR2_EXTERNAL=~/rcr/projects/cp4/rscr_br2_extree myproject_defconfig
make menuconfig

myproject_defconfig.myproject_defconfig
<http://buildroot-busybox.2317881.n4.nabble.com/file/t2824/myproject_defconfig.myproject_defconfig>  

e) Once the buildroot config is done, I run:
make linux-menuconfig

I get the following error:

make[2]: *** No rule to make target 'bcmrpi_defconfig'.  Stop.
linux/linux.mk:565: recipe for target
'/home/ibercomp/rcr/projects/cp4/buildroot/output/build/linux-custom/.stamp_dotconfig'
failed


What I am doing wrong?

Kind Regards




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
