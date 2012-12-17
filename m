From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 09:49:55 +0100
Subject: [Buildroot] Results of an all-package build
In-Reply-To: <871ueqhna8.fsf@dell.be.48ers.dk>
References: <50C9901D.2020704@mind.be> <871ueqhna8.fsf@dell.be.48ers.dk>
Message-ID: <50CEDCB3.2070705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/12/12 01:07, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle<arnout@mind.be>  writes:
> 
> Hi,
> 
>   Arnout>   As part of the test of the disable-doc patch I just sent, I
>   Arnout>  built something approaching an allyespackageconfig for x86_64
>   Arnout>  with a Sourcery-2012.09 toolchain.  Interesting to look at the
>   Arnout>  results.
> 
>   Arnout>  - The following fail to build:
> 
>   Arnout>   * classpath
>   Arnout>   * diffutils
>   Arnout>   * gpsd
>   Arnout>   * ipsec-tools
>   Arnout>   * linux-pam
>   Arnout>   * ltp-testsuite
>   Arnout>   * matchbox-desktop
>   Arnout>   * metacity
>   Arnout>   * webkit
>   Arnout>   * neard
>   Arnout>   * netatalk
>   Arnout>   * network-manager
>   Arnout>   * pcmanfm
>   Arnout>   * pv
>   Arnout>   * sconeserver-http-sconesite-image
>   Arnout>   * xdriver_xf86-video-geode
>   Arnout>   * xdriver_xf86-input-synaptics
>   Arnout>   * valgrind (because glibc 2.16 is not supported, needs valgrind bump)
>   Arnout>   * xstroke
>   Arnout>   * grub
>   Arnout>   * uboot (wrong ARCH parameter)
> 
>   Arnout>   midori and jamvm are not built because they depend on the above.
> 
> Interesting, and better than I feared ;) Do you have the build errors
> archived somewhere? I would like to see atleast the classpath issue.

 No I haven't, but they're easy enough to reproduce.

 For classpath:

checking for QtCore QtGui >= 4.1.0... yes
checking QT_CFLAGS... -I/home/arnout/src/buildroot/output-ext-toolchain-x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/QtGui -DQT_SHARED -I/home/arnout/src/buildroot/output-ext-toolchain-x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include -I/home/arnout/src/buildroot/output-ext-toolchain-x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/QtCore  
checking QT_LIBS... -lQtGui -L/home/arnout/src/buildroot/output-ext-toolchain-x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib -lQtCore  
checking for /home/arnout/src/buildroot/output-ext-toolchain-x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/QtGui/QWidget... configure: error: cannot check for file existence when cross compiling


 I'll try to re-run current HEAD (which has fixed quite a few packages
already) with make -k and put it on a pastebin.


>   Arnout>   There are a few more that fail to build in my environment if the
>   Arnout>  libxml2/mesa3d and linux-fusion patches are not applied. Also xenomai
>   Arnout>  must be extracted manually before the build, otherwise linux fails to
>   Arnout>  build.
> 
>   Arnout>  - About 920 packages (host+target) are built, from 843 source
>   Arnout>  tarballs.
> 
>   Arnout>  - legal-info succeeds without problems, except that sylpheed's
>   Arnout>  license file is not correctly defined.
> 
> Ok, could you provide a bit more info or send patches, please?

 You already fixed it :-)

[snip]
>   Arnout>  - Time for a clean build (without ccache and JLEVEL=3) on my laptop
>   Arnout>  is 6 hours. A yocto build takes roughly the same time on my laptop,
>   Arnout>  but has less than half as many packages.
> 
> Heh. Nice, it seems doable to do this on a relatively regular schedule.

 Yep. Although the Linaro toolchain is probably a more appropriate choice.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
