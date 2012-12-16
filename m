From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Dec 2012 01:07:59 +0100
Subject: [Buildroot] Results of an all-package build
In-Reply-To: <50C9901D.2020704@mind.be> (Arnout Vandecappelle's message of
 "Thu, 13 Dec 2012 09:21:49 +0100")
References: <50C9901D.2020704@mind.be>
Message-ID: <871ueqhna8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  As part of the test of the disable-doc patch I just sent, I
 Arnout> built something approaching an allyespackageconfig for x86_64
 Arnout> with a Sourcery-2012.09 toolchain.  Interesting to look at the
 Arnout> results.

 Arnout> - The following fail to build:

 Arnout>  * classpath
 Arnout>  * diffutils
 Arnout>  * gpsd
 Arnout>  * ipsec-tools
 Arnout>  * linux-pam
 Arnout>  * ltp-testsuite
 Arnout>  * matchbox-desktop
 Arnout>  * metacity
 Arnout>  * webkit
 Arnout>  * neard
 Arnout>  * netatalk
 Arnout>  * network-manager
 Arnout>  * pcmanfm
 Arnout>  * pv
 Arnout>  * sconeserver-http-sconesite-image
 Arnout>  * xdriver_xf86-video-geode
 Arnout>  * xdriver_xf86-input-synaptics
 Arnout>  * valgrind (because glibc 2.16 is not supported, needs valgrind bump)
 Arnout>  * xstroke
 Arnout>  * grub
 Arnout>  * uboot (wrong ARCH parameter)

 Arnout>  midori and jamvm are not built because they depend on the above.

Interesting, and better than I feared ;) Do you have the build errors
archived somewhere? I would like to see atleast the classpath issue.


 Arnout>  There are a few more that fail to build in my environment if the
 Arnout> libxml2/mesa3d and linux-fusion patches are not applied. Also xenomai
 Arnout> must be extracted manually before the build, otherwise linux fails to
 Arnout> build.

 Arnout> - About 920 packages (host+target) are built, from 843 source
 Arnout> tarballs.

 Arnout> - legal-info succeeds without problems, except that sylpheed's
 Arnout> license file is not correctly defined.

Ok, could you provide a bit more info or send patches, please?


 Arnout> -rw-r--r-- 1 arnout arnout 374M Dec 13 05:47 bzImage
 Arnout> -rwxr-xr-x 1 arnout arnout  24K Dec 13 05:31 isolinux.bin*
 Arnout> -rwxr-xr-x 1 arnout arnout  27K Dec 13 05:31 pxelinux.bin*
 Arnout> -rw-r--r-- 1 arnout arnout 378M Dec 13 05:38 rootfs.cloop
 Arnout> -rw-r--r-- 1 arnout arnout 903M Dec 13 05:40 rootfs.cpio
 Arnout> -rw-r--r-- 1 arnout arnout 1.1G Dec 13 05:42 rootfs.ext2
 Arnout> -rw-r--r-- 1 arnout arnout 473M Dec 13 05:51 rootfs.jffs2
 Arnout> -rw-r--r-- 1 arnout arnout 899M Dec 13 05:54 rootfs.romfs
 Arnout> -rw-r--r-- 1 arnout arnout 369M Dec 13 05:56 rootfs.squashfs
 Arnout> -rw-r--r-- 1 arnout arnout 922M Dec 13 05:59 rootfs.tar
 Arnout> -rw-r--r-- 1 arnout arnout 251M Dec 13 06:12 rootfs.tar.lzma
 Arnout> -rw-r--r-- 1 arnout arnout 516M Dec 13 06:15 rootfs.ubi
 Arnout> -rw-r--r-- 1 arnout arnout 508M Dec 13 06:15 rootfs.ubifs

 Arnout> - The output directory (including all these images) is 31GB: 21GB
 Arnout> for build, 6.5GB for images, 2.9GB for host of which 2GB for staging.
 Arnout> The sources (excluding toolchain) are 1.6GB.

 Arnout> - Time for a clean build (without ccache and JLEVEL=3) on my laptop
 Arnout> is 6 hours. A yocto build takes roughly the same time on my laptop,
 Arnout> but has less than half as many packages.

Heh. Nice, it seems doable to do this on a relatively regular schedule.

Thanks!

-- 
Bye, Peter Korsgaard
