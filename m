From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 14 Sep 2009 08:02:49 +0200
Subject: [Buildroot] UBOOT 2009.08 & ARM Link Error
In-Reply-To: <2FAA2DE137CA432EBF8BEE2E967A7993@apexjs>
References: <2FAA2DE137CA432EBF8BEE2E967A7993@apexjs>
Message-ID: <4AADDC89.7070302@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert Johan skrev:
> Hi
>  
> Did anyone succeed in building the UBOOT 2009.08 version for ARM 
> (at91sam9260_config)?
>  
> I always end up with this error :
>  

Yes, I can build 2009.08 in my personal git tree.
git://git.busybox.net/~ulf/git/atmel-2009-08

You need some fixes, which are present there.
While I did not test the SAM9260 as such, this is a generic
problem for ARM, which gets fixed by my patches.

My git tree also contains linux-2.6.30.2 and an updated
at91bootstrap.
Still a lot of testing to be done.
Help appreciated.




> arm-linux-ld: ERROR: 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_udivsi3.o) 
> uses hardware FP, whereas u-boot uses software FP
> arm-linux-ld: failed to merge target specific data of file 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_udivsi3.o)
> arm-linux-ld: ERROR: 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_divsi3.o) 
> uses hardware FP, whereas u-boot uses software FP
> arm-linux-ld: failed to merge target specific data of file 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_divsi3.o)
> arm-linux-ld: ERROR: 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_umodsi3.o) 
> uses hardware FP, whereas u-boot uses software FP
> arm-linux-ld: failed to merge target specific data of file 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_umodsi3.o)
> arm-linux-ld: ERROR: 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_modsi3.o) 
> uses hardware FP, whereas u-boot uses software FP
> arm-linux-ld: failed to merge target specific data of file 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_modsi3.o)
> arm-linux-ld: ERROR: 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_dvmd_lnx.o) 
> uses hardware FP, whereas u-boot uses software FP
> arm-linux-ld: failed to merge target specific data of file 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_dvmd_lnx.o)
> arm-linux-ld: ERROR: 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_lshrdi3.o) 
> uses hardware FP, whereas u-boot uses software FP
> arm-linux-ld: failed to merge target specific data of file 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_lshrdi3.o)
> arm-linux-ld: ERROR: 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_ashldi3.o) 
> uses hardware FP, whereas u-boot uses software FP
> arm-linux-ld: failed to merge target specific data of file 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_ashldi3.o)
> arm-linux-ld: ERROR: 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_ashrdi3.o) 
> uses hardware FP, whereas u-boot uses software FP
> arm-linux-ld: failed to merge target specific data of file 
> /home/johan/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.3.3/libgcc.a(_ashrdi3.o)
> make: *** [u-boot] Error 1
>  
> The 2009.06 version does not produce this error, so i will be using this 
> one i guess .
>  
> I wonder if this is a toolchain issue or a uboot error .
>  
> If a recent version gets pushed into buildroot, does someone then 
> verifies it works ?
>  
> Johan
>  
>  
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
