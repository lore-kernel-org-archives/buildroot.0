From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 29 Jul 2013 17:27:27 +0800
Subject: [Buildroot] [noMMU] How to generate FLAT executable for busybox?
In-Reply-To: <1375076435.4630.2.camel@phoenix>
References: <1375076435.4630.2.camel@phoenix>
Message-ID: <CAFRkauAXEpeZu6PNDvR2TiU9D=EidiaREJCFTjCP1BqrX0Y8zA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/7/29 Axel Lin <axel.lin@ingics.com>:
> Hi,
> I have BR2_BINFMT_FLAT=y in my setting.
> However, the build system still generates ELF executable for busybox.
>
> $ file output/target/bin/busybox
> output/target/bin/busybox: setuid ELF 32-bit LSB executable, ARM, version 1 (SYSV), statically linked, stripped

Hi,
In output/build/busybox-1.21.1/busybox_unstripped.out, I found below messages:

/opt/test/buildroot/buildroot/output/host/usr/lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-uclinux-uclibcgnueabi/bin/ld:
warning: cannot find entry symbol lf2flt; defaulting to
00000000000080ac

This looks like the linker does not understand -elf2flt and treat is
as -e lf2flt.

Any idea how to fix this?

Thanks,
Axel
