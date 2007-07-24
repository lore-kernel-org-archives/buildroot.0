From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 24 Jul 2007 15:35:26 +0200
Subject: [Buildroot] svn commit:	trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <a512d1250707240533m7d9649eax588a5df1eefd3071@mail.gmail.com>
References: <20070724123242.85DCAA4645@busybox.net>
	<a512d1250707240533m7d9649eax588a5df1eefd3071@mail.gmail.com>
Message-ID: <20070724133526.GB18856@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 24, 2007 at 07:33:28PM +0700, brm wrote:
>| diff -rduNp linux-2.6.22.1.oorig/arch/i386/boot/compressed/Makefile
>linux-2.6.22.1/arch/i386/boot/compressed/Makefile
>| --- linux-2.6.22.1.oorig/arch/i386/boot/compressed/Makefile	2007-07-10
>20:56:30.000000000 +0200
>| +++ linux-2.6.22.1/arch/i386/boot/compressed/Makefile	2007-07-24
>14:17:46.000000000 +0200
>| @@ -4,15 +4,16 @@
>| # create a compressed vmlinux image from the original vmlinux
>| #
>|
>| -targets		:= vmlinux vmlinux.bin vmlinux.bin.gz head.o misc.o piggy.o \
>| -			vmlinux.bin.all vmlinux.relocs
>| +tragets		:= head.o lzma_misc.o piggy.o \
>
>targets?

yes, and my lzma barfs on 'e'. Do
cp toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch \
	toolchain/kernel-headers/linux-2.6.21.5-002-lzma-vmlinuz.01.patch

to see if that behaves now.

Thanks for the notice!
