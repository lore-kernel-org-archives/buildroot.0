From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 2 Apr 2008 18:23:14 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
	<8763v071sq.fsf@macbook.be.48ers.dk>
Message-ID: <0d6e01c894dd$dcebbfe0$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Because target/linux/Makefile.in uses KERNEL_ARCH for ARCH setting,
> and not what you have set ARCH to on the cmdline.
>
> KERNEL_ARCH is calculated in
> toolchain/kernel-headers/kernel-headers.mk - Notice that arch/ppc is
> deprecated, you should use arch/powerpc nowadays.


Thank you very much.

Now I can do this properly [*]:
$ make ARCH=ppc KERNEL_ARCH=ppc linux26

And also this:
$ make ARCH=ppc uclibc
$ make ARCH=ppc busybox

Now how do I combine it all in one line ? This doesn't work:
$ make ARCH=ppc KERNEL_ARCH=ppc


[*]: yet it fails at the very end:
[...]
cp -f arch/ppc/boot/simple/zvmlinux arch/ppc/boot/images/zImage.elf
rm -f arch/ppc/boot/simple/zvmlinux
make[1]: Leaving directory 
`/home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24'
cp -dpf 
/home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24/arch/ppc/boot/zImage 
/home/guinevere/buildroot/binaries/genepy/ppc-linux-2.6.24-20080402.z
cp: cannot stat 
`/home/guinevere/buildroot/project_build_ppc/genepy/linux-2.6.24/arch/ppc/boot/zImage': 
No such file or directory
make: *** 
[/home/guinevere/buildroot/binaries/genepy/ppc-linux-2.6.24-20080402.z] 
Error 1

-- 
Guillaume Dargaud
http://www.gdargaud.net/ 
