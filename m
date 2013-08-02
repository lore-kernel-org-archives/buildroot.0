From: Sundareson, Prabindh <prabu@ti.com>
Date: Fri, 2 Aug 2013 03:59:41 +0000
Subject: [Buildroot] Using the new Ti-gfx with Qt5
In-Reply-To: <CALo-6+gxOM0m2fztO-Xu58Jq0mhZKgqC-2uj_M27Ooy242vfPA@mail.gmail.com>
References: <CALo-6+jacTWNK9aO4FFCUDAyNtSED5wy3q+hMSvFWM3Jciafdw@mail.gmail.com>
 <20130801073520.622bf499@skate>
 <CALo-6+gxOM0m2fztO-Xu58Jq0mhZKgqC-2uj_M27Ooy242vfPA@mail.gmail.com>
Message-ID: <321768C95D21724485BCE784F1BE98473EB85D97@DBDE04.ent.ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I see you are on 3.10 kernel, the SDK has been tested so far with 3.8 and might need minor patches for looking at the right header files with later kernels.

regards,
Prabu


-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Charles Krinke
Sent: Thursday, August 01, 2013 10:45 PM
To: Thomas Petazzoni
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Using the new Ti-gfx with Qt5

Dear Thomas:

Thank you for your kind words as usual as I try to understand the new additions to buildroot.

I did find in "hardware handling" an enable for ti-gfx and enabled it along with the kernel and was able to get all the way to the compilation of the ti-gfx stuff until it errored in compilation.

So, at this point, I cannot quite tell if this is a mis-configuration or a missing patch in the ti-gfx stuff.

I did get this all working 2 months ago with some hand tweaking before Spenser added his patches and am circling back to test the new stuff to see if I can move to it.

I am including the .config file currently being used with the
buildroot-20130731 test for reference. I totally understand you are very busy keeping all the rest of this together so I will keep studying in the background and look forward to any advice you can offer.

Charles



make[1]: Leaving directory
`/home/ckrinke/buildroot-20130731/output/build/linux-3.10.4'
# Installing dtc (device tree compiler) as host tool, if selected if grep -q "CONFIG_DTC=y"
/home/ckrinke/buildroot-20130731/output/build/linux-3.10.4/.config;
then /usr/bin/install -D -m 0755
/home/ckrinke/buildroot-20130731/output/build/linux-3.10.4/scripts/dtc/dtc
/home/ckrinke/buildroot-20130731/output/host/usr/bin/dtc ; fi
>>> linux 3.10.4 Installing to images directory
cp /home/ckrinke/buildroot-20130731/output/build/linux-3.10.4/vmlinux
/home/ckrinke/buildroot-20130731/output/images
>>> ti-gfx 4_09_00_01 Configuring
>>> ti-gfx 4_09_00_01 Building
/usr/bin/make -j9 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/ckrinke/buildroot-20130731/output/target
CROSS_COMPILE="
/home/ckrinke/buildroot-20130731/output/host/usr/bin/arm-arago-linux-gnueabi-"
DEPMOD=/home/ckrinke/buildroot-20130731/output/host/usr/sbin/depmod
BUILD=debug TI_PLATFORM=omap3 OMAPES=3.x SUPPORT_XORG=0
KERNELDIR=/home/ckrinke/buildroot-20130731/output/build/linux-3.10.4
-C /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM
all
make[1]: Entering directory
`/home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM'
/usr/bin/make -C
/home/ckrinke/buildroot-20130731/output/build/linux-3.10.4 M=`pwd`
make[2]: Entering directory
`/home/ckrinke/buildroot-20130731/output/build/linux-3.10.4'
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/queue.o
  LD      /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/built-in.o
  LD      /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/built-in.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_displayclass.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/hash.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/perproc.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/mem.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/power.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/deviceclass.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/metrics.o
  LD [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb.o
  LD [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bufferclass_ti.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/resman.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/buffer_manager.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/pvrsrv.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/handle.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/lists.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/ra.o
  CC [M]  /home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/devicemem.o
In file included from
/home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/common/queue.c:75:0:
/home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:84:48:
error: expected declaration specifiers or '...' before 'read_proc_t'
/home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:84:70:
error: expected declaration specifiers or '...' before 'write_proc_t'
/home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:86:58:
error: expected declaration specifiers or '...' before 'read_proc_t'
/home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:86:80:
error: expected declaration specifiers or '...' before 'write_proc_t'
/home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:110:9:
error: expected declaration specifiers or '...' before 'write_proc_t'
/home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/env/linux/proc.h:120:9:
error: expected declaration specifiers or '...' before 'write_proc_t'
make[3]: *** [/home/ckrinke/buildroot-20130731/output/build/ti-gfx-4_09_00_01/GFX_Linux_KM/services4/srvkm/c

On 7/31/13, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Dear Charles Krinke,
>
> On Wed, 31 Jul 2013 13:26:20 -0700, Charles Krinke wrote:
>> I am trying to get ti-gfx to configure with last nights build, that 
>> is, buildroot-20130731.
>>
>> I see enabling the kernel compile is necessary and I assume 
>> "omap2plus_defconfig" is appropriate for an AM3517EVM board.
>>
>> I am having trouble finding the combination of settings to get 
>> buildroot to configure OPENGL_ES and OPENGL_EGL so that ti-gfx will 
>> become operational.
>>
>> Would someone be willing to give me a pointer on the error of my 
>> ways, please
>
> A defconfig as below should work (for just ti-gfx, qt5 is not enabled) :
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109=y
> BR2_PACKAGE_TI_GFX=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_DEFCONFIG="omap2plus_defconfig"
>
> The critical part for ti-gfx is that you need to have a (e)glibc 
> toolchain, not an uClibc toolchain.
>
> Remember that you can discover dependencies of packages by searching 
> them in menuconfig using '/', and typing the package name. This would 
> give you the following information:
>
> Symbol: BR2_PACKAGE_TI_GFX [=n]
>   ? Type  : boolean
>   ? Prompt: ti-gfx
>   ?   Defined at package/ti-gfx/Config.in:1
>   ?   Depends on: BR2_LINUX_KERNEL [=n] && BR2_TOOLCHAIN_USES_GLIBC [=n] &&
> BR2_arm [=y]
>   ?   Location:
>   ?     -> Package Selection for the target
>   ? (6)   -> Hardware handling
>   ?   Selects: BR2_PACKAGE_HAS_OPENGL_EGL [=n] && BR2_PACKAGE_HAS_OPENGL_ES
> [=n] && BR2_PACKAGE_HAS_POWERVR [=n]
>
> This tells you that the ti-gfx package is available only on ARM (which 
> is already selected), requires a Linux kernel to be built (not 
> selected
> yet) and a toolchain based on glibc (not selected yet).
>
> As far as Qt5 is concerned, I got it running on top of ti-gfx, but I 
> don't remember if patches were needed. I can dig through my archives 
> if you're interested.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux development, consulting, 
> training and support.
> http://free-electrons.com
>


--
Charles Krinke
