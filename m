From: Craig Swank <craigswank@fastmail.fm>
Date: Sat, 26 Dec 2015 08:31:46 -0800
Subject: [Buildroot] trying to use
 https://github.com/beagleboard/linux.git with buildroot
In-Reply-To: <n5mdi8$5go$1@ger.gmane.org>
References: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
 <20151223184751.12365336@free-electrons.com>
 <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
 <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
 <20151223193943.21a6f0fc@free-electrons.com>
 <1450910736.3752716.475291418.490BB3EA@webmail.messagingengine.com>
 <20151223235253.0afe702e@free-electrons.com>
 <1450917779.3775953.475348978.37FAC3A8@webmail.messagingengine.com>
 <n5mdi8$5go$1@ger.gmane.org>
Message-ID: <1451147506.3374639.476669938.3CCE8A61@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks again, Chris.  I was sitting here thinking whether or not I
should bug you when you email arrived.

'make linux-menuconfig' fails because:

BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/../beaglebone_buildroot_files/Patch_files/linux-4.1.13-ti-r36"

Is there anything I need to put in that directory?



On Sat, Dec 26, 2015, at 08:00 AM, Chris LaRocque wrote:
> Craig Swank wrote:
> 
> > Here is another thing I've found:
> > 
> > https://github.com/beagleboard/linux/issues/49
> > 
> > In that issue the person had some addresses set incorrectly in uEnv.txt,
> > but mine doesn't have any addresses set:
> > 
> > bootpart=0:1
> > bootdir=
> > uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ram
> > boot
> > 
> > Is there something that needs to be set in uEnv.txt?
> > 
> > 
> > On Wed, Dec 23, 2015, at 02:52 PM, Thomas Petazzoni wrote:
> >> Dear Craig Swank,
> >> 
> >> On Wed, 23 Dec 2015 14:45:36 -0800, Craig Swank wrote:
> >> > Is it strange to you that when I do the build the output/build
> >> > directory has both of these dirs?
> >> > 
> >> > ?  buildroot git:(master) ? ls output/build/linux-*
> >> > output/build/linux-4.1.4-ti-r9
> >> > output/build/linux-headers-3.12.10
> >> 
> >> No, it is perfectly fine. linux-headers is used when building the
> >> toolchain. linux is used to build the kernel itself.
> >> 
> >> Thomas
> >> --
> >> Thomas Petazzoni, CTO, Free Electrons
> >> Embedded Linux, Kernel and Android engineering
> >> http://free-electrons.com
> > 
> > 
> Hello Craig
> 
> Hopefully the attachments will be accepted.
> 
> The kernel defconfig from beagleboard.org:
> 
> 1> doesn't set DEPRECATED_PARAM_STRUCT [=y] in the kernel .config.
> uEnv.txt 
> (uboot) passes in the console config as "console=ttyO0,115200n8"
> 
> 2> doesn't set EXT2_FS [=y] and the default buildroot .config FS image is 
> ext2. at least for the beaglebone black and I'm trying to keep things
> sane.
> 
> You'll want to do a make source and them make linux-menuconfig and change 
> the parameters above.
> 
> I haven't created a patch file because I'm lazy.
> 
> Also attached is my patch (hack) for dtc, derived from Robert Nelsons 
> bb.org-overlays.
> 
> The dtc patch file goes into BR2_GLOBAL_PATCH_DIR , 
> BR2_GLOBAL_PATCH_DIR"/dtc"
> 
> Look in the buildroot .config for how I set BR2_GLOBAL_PATCH_DIR. you'll 
> need to point that to your own global patch directory.
> 
> Regards
> 
> Chris
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> Email had 2 attachments:
> + host-dtc-1.4.1.patch
>   33k (text/x-patch)
> + cleaned_buildroot_v41_12182015_01.config
>   61k (text/plain)


-- 
  Craig Swank
  craigswank at fastmail.fm
