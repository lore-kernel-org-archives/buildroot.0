From: brm <brm@hyac.in.th>
Date: Tue, 24 Jul 2007 19:33:28 +0700
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <20070724123242.85DCAA4645@busybox.net>
References: <20070724123242.85DCAA4645@busybox.net>
Message-ID: <a512d1250707240533m7d9649eax588a5df1eefd3071@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

| diff -rduNp linux-2.6.22.1.oorig/arch/i386/boot/compressed/Makefile
linux-2.6.22.1/arch/i386/boot/compressed/Makefile
| --- linux-2.6.22.1.oorig/arch/i386/boot/compressed/Makefile	2007-07-10
20:56:30.000000000 +0200
| +++ linux-2.6.22.1/arch/i386/boot/compressed/Makefile	2007-07-24
14:17:46.000000000 +0200
| @@ -4,15 +4,16 @@
| # create a compressed vmlinux image from the original vmlinux
| #
|
| -targets		:= vmlinux vmlinux.bin vmlinux.bin.gz head.o misc.o piggy.o \
| -			vmlinux.bin.all vmlinux.relocs
| +tragets		:= head.o lzma_misc.o piggy.o \

targets?

| +			vmlinux.bin.all vmlinux.relocs \
| +			vmlinux vmlinux.bin vmlinux.bin.gz


On 7/24/07, aldot at uclibc.org <aldot@uclibc.org> wrote:
> Author: aldot
> Date: 2007-07-24 05:32:40 -0700 (Tue, 24 Jul 2007)
> New Revision: 19244
>
> Log:
> - forward port lzma-vmlinux and ipmisensors to 2.6.22.1
>
>
> Added:
>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-001-lzma-vmlinuz.00.patch
>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-ipmisensors-20070314-1214.patch
>
>
> Changeset:
>
> Sorry, the patch is too large to include (28781 lines).
> Please use ViewCVS to see it!
>
> http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19244
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
