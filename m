From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 19 Oct 2012 17:02:22 +0200
Subject: [Buildroot] Kernel does not boot : dts is not appended to the
	kernel (Karo TX53 [imx53])
Message-ID: <1E9ED8BFF49147018F72AEB3007FC941@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi all

I am trying to build the Kernel from within buildroot but fails starting.

When I build the kernel from the commandline en append the dts file then it works :

This is giving me a working kernel:

#The DT configuration data needs to be converted to a binary blob and
#appended to the kernel zImage:
#1. Compile the kernel (including modules and DT data):
make ARCH=arm CROSS_COMPILE=arm-linux- zImage dtbs modules

#2. Concatenate the kernel with the generated DT blob:
cat arch/arm/boot/zImage arch/arm/boot/tx53.dtb > arch/arm/boot/zImage_tx53

When I look under output/images I see only zImage, not the kernel with the appended dts blob (zImge_tx53).
So is there something I am overlooking ?

Regards
Sagaert Johan
