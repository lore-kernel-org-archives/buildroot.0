From: Daniel Jabbour <daniel@laptouchinc.com>
Date: Fri, 30 Jan 2009 18:43:11 -0500
Subject: [Buildroot] Won't build kernel
Message-ID: <ED397211-8106-4E05-9702-625310A5CF37@laptouchinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm pretty new to buildroot. However, I have been successfully able to  
compile a toolchain and root fs. Now I am trying to also compile a  
kernel using buildroot.

I enabled the kernel build by going to make menuconfig and enabling  
the following:
Kernel--->
	Kernel type (linux (Advanced configuration)) --->
	Linux Kernel Version (The latest stable Linux kernel (2.6.28.2)) --->
	Linux Kernel Configuration --->
		Run make ARCH=$(ARCH) [xconfig|menuconfig] before build
		Preferred config tool (make menuconfig) --->
	kernel binary format (vmlinux) --->
	Destinations for linux kernel binaries  --->
		Copy kernel to <dir>... (binaries/)

make produces the following error:

rm -rf /home/djabbour/source/buildroot/project_build_i486/LtOS-1/ 
buildroot-config
mkdir -p /home/djabbour/source/buildroot/project_build_i486/LtOS-1
cp -dpRf package/config/buildroot-config /home/djabbour/source/ 
buildroot/project_build_i486/LtOS-1/buildroot-config
/home/djabbour/source/buildroot/toolchain_build_i486/bin/sed -i -e '/ 
CONFIG_AEABI=y/d' /home/djabbour/source/buildroot/project_build_i486/ 
LtOS-1/linux-2.6.28.2/.config
/home/djabbour/source/buildroot/toolchain_build_i486/bin/sed: can't  
read /home/djabbour/source/buildroot/project_build_i486/LtOS-1/ 
linux-2.6.28.2/.config: No such file or directory
make: *** [/home/djabbour/source/buildroot/project_build_i486/LtOS-1/ 
linux-2.6.28.2/.configured] Error 2

--
Daniel Jabbour
Software Engineer
Laptouch, Inc.
