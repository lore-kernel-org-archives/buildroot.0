From: Ganesh <ganesh45in@gmail.com>
Date: Wed, 29 Apr 2020 07:32:55 -0500 (CDT)
Subject: [Buildroot] When building the net-next kernel,
 buildroot is asking for all the kernel config options one by one to
 enable
Message-ID: <1588163575379-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When using buildroot for my project, I am getting the following piece of
prompt.

*ganesh15255 at CHE-LT-I15255:/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot$
make linux-rebuild
rm -f
/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/build/linux-custom/.stamp_rsynced
rm -f
/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/build/linux-custom/.stamp_staging_installed
rm -f
/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/build/linux-custom/.stamp_target_installed
rm -f
/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/build/linux-custom/.stamp_images_installed
rm -f
/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/build/linux-custom/.stamp_host_installed
rm -f
/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/build/linux-custom/.stamp_built
>>> linux custom Syncing from source dir ../../kernel_net-next/net-next
rsync -au --chmod=u=rwX,go=rX  --exclude .svn --exclude .git --exclude .hg
--exclude .bzr --exclude CVS ../../kernel_net-next/net-next/
/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/build/linux-custom
>>> linux custom Building
PATH="/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/bin:/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program
Files/WindowsApps/CanonicalGroupLimited.Ubuntu18.04onWindows_2020.1804.7.0_x64__79rhkp1fndgsc:/mnt/c/Program
Files (x86)/Intel/Intel(R) Management Engine Components/iCLS/:/mnt/c/Program
Files/Intel/Intel(R) Management Engine Components/iCLS/:/mnt/c/Program Files
(x86)/Common
Files/Oracle/Java/javapath:/mnt/c/ProgramData/Oracle/Java/javapath:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/Program
Files (x86)/WebEx/Productivity Tools:/mnt/c/Program Files
(x86)/Microchip/xc32/v1.42/bin:/mnt/c/Program Files (x86)/Microsoft SQL
Server/100/Tools/Binn/:/mnt/c/Program Files/Microsoft SQL
Server/100/Tools/Binn/:/mnt/c/Program Files/Microsoft SQL
Server/100/DTS/Binn/:/mnt/c/Program Files (x86)/Intel/Intel(R) Management
Engine Components/DAL:/mnt/c/Program Files/Intel/Intel(R) Management Engine
Components/DAL:/mnt/c/Program Files (x86)/Intel/Intel(R) Management Engine
Components/IPT:/mnt/c/Program Files/Intel/Intel(R) Management Engine
Components/IPT:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program
Files/Perforce:/mnt/c/Program Files
(x86)/Microchip/xc32/v2.20-TC4/bin:/mnt/c/Users/I15255/AppData/Local/Programs/Python/Python37-32/Scripts/:/mnt/c/Users/I15255/AppData/Local/Programs/Python/Python37-32/:/mnt/c/Users/I15255/AppData/Local/Microsoft/WindowsApps:/mnt/c/Python27:/mnt/c/Python27/Scripts:/mnt/c/Users/I15255/AppData/Local/atom/bin:/snap/bin"
PKG_CONFIG="/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/lib/pkgconfig:/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/share/pkgconfig"
BR_BINARIES_DIR=/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/images
KCFLAGS=-Wno-attribute-alias /usr/bin/make -j5
HOSTCC="/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/bin/ccache
/usr/bin/gcc -O2
-I/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/include
-L/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/lib
-Wl,-rpath,/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/lib"
ARCH=arm
INSTALL_MOD_PATH=/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/target
CROSS_COMPILE="/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-"
DEPMOD=/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/host/sbin/depmod
INSTALL_MOD_STRIP=1 -C
/mnt/d/Local_Linux_Repos/Buildroot_Latest/buildroot/output/build/linux-custom
all
scripts/kconfig/conf  --syncconfig Kconfig
*
* Restart config...
*
*
* GCC plugins
*
GCC plugins (GCC_PLUGINS) [Y/n/?] (NEW) *

My board is an SAMA5D3 (ARM ) board.

I have done the following steps before starting the kernel build:

1. Put my defconfig inside the kernel/arch/arm/config 
2. Go to buildroot directory, make <my_project_defconfig>
3. make 

my_project_defconfig has the following lines of concern:

BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="<kernel path of the defconfig>"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="My_dts.dts"

After giving the make, am getting a series of prompts from the buildroot
like enabling drivers for a specific product, starting with the GCC thing
and most of which I do not know .
What I expected was that I have already specified the defconfig and that
buildroot should be able to enable the necessary things automatically.

Can anyone tell me where I have gone wrong?

P.S: I am a total newbie to linux and this is my first project.

Buildroot download path: $ git clone
https://github.com/linux4sam/buildroot-at91.git
Kernel : net-next

Thanks in advance,
Ganesh



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
