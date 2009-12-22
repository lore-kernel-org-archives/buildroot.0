From: joyful at sonic.net <joyful@sonic.net>
Date: Mon, 21 Dec 2009 16:01:41 -0800
Subject: [Buildroot] uclibc/buildroot build error
In-Reply-To: <87oclsxbyz.fsf@macbook.be.48ers.dk>
References: <8351cdc2a3a8abf9b1f031824d6770e4.squirrel@webmail.sonic.net>
	<87fx772veo.fsf@macbook.be.48ers.dk>
	<d8fdfca5396745cde67af9bc66e27177.squirrel@webmail.sonic.net>
	<87oclsxbyz.fsf@macbook.be.48ers.dk>
Message-ID: <62f4f618adb8f0fb041b8033370948f3.squirrel@webmail.sonic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thanks for helping me. I was merely trying to create a whole new platform.
When I type make defconfig, there was no old config
file, then I just select items that may fit my needs by hit enter or y or n.

With 2009.11 verison buildroot, I think it is much better, but I
got this message at the end, indication something I was not configured
correctly:

echo "Welcome to Buildroot" > /tmp/buildroot-2009.11/output/target/etc/issue
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=i386
INSTALL_MOD_PATH=/tmp/buildroot-2009.11/output/target
CROSS_COMPILE=/tmp/bui
ldroot-2009.11/output/staging/usr/bin/i386-linux-uclibc-
LDFLAGS="-L/tmp/buildroot-2009.11/output/staging/lib
-L/tmp/buildroot-2009.11/outpu
t/staging/usr/lib --sysroot=/tmp/buildroot-2009.11/output/staging/"
LZMA="/tmp/buildroot-2009.11/output/toolchain/bin/lzma" \
               -C /tmp/buildroot-2009.11/output/build/linux-2.6.31.6 zImage
make[1]: Entering directory
`/tmp/buildroot-2009.11/output/build/linux-2.6.31.6'
make[1]: *** No rule to make target `zImage'.  Stop.
make[1]: Leaving directory
`/tmp/buildroot-2009.11/output/build/linux-2.6.31.6'
make: *** [/tmp/buildroot-2009.11/output/images/zImage] Error 2

I just want to get something working first, then look how to fine tailor
it. But I was not able to get it running now.  Sorry I am too new to this.
Thanks for your help a lot!

Joy


>>>>>> "joyful" == joyful  <joyful@sonic.net> writes:
>
> Hi,
>
>  joyful> Hi Peter, thanks for answering my question. However, the
>  joyful> problem is in buildroot building uclic part.  Somehow the make
>  joyful> file either in buildroot or uclibc missing an operand.  I
>  joyful> copied the .config file in the directory manually did not help.
>
>  joyful> cp -dpf
> /tmp/buildroot/project_build_i686/uclibc/linux-2.6.29.2/.config
>  joyful> cp: missing destination file operand after
>
> That line is afaik from the kernel build, not from uclibc building.
>
> Please check if you see the same problem with buildroot 2009.11, and if
> you do, send the .config file to the list and I'll take a look.
>
> --
> Bye, Peter Korsgaard
>
>
