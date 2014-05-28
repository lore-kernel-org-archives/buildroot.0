From: Rohit Kumar <rkthebest@gmail.com>
Date: Wed, 28 May 2014 17:32:25 +0900
Subject: [Buildroot] how to enable -mfloat-abi=hard in cross toolchain
	for ARM1136
In-Reply-To: <20140528095100.719c69ac@free-electrons.com>
References: <CABzetm3LyoP3JCsvMZOO1fbQBuaSLbahJJU81gSzLB2yeG_+Uw@mail.gmail.com>
 <20140528095100.719c69ac@free-electrons.com>
Message-ID: <CABzetm3NU_ZZrpU0+uw+iA8f2gcTRqVEVNP7023Vho=G4RFE7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,


On Wed, May 28, 2014 at 4:51 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Rohit Kumar,
>
> On Wed, 28 May 2014 16:09:02 +0900, Rohit Kumar wrote:
>
> > i created toolchain using buildroot for ARM1136
> > attached is the configuration file.
> > i want to cross compile the program with "-mfloat-abi=hard" option, i
> > get following error
> >
> >
> /home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs.h:10:29:
> > fatal error: gnu/stubs-hard.h: No such file or directory
> > compilation terminated.
> >
> > how to enable above in buildroot configuration?
>
> Use EABIhf instead of EABI in the Buildroot configuration, under
> "Target options".
>

enabling it leads to errors in compiling


checking for .previous assembler directive... yes
checking for .protected and .hidden assembler directive... yes
checking whether __attribute__((visibility())) is supported... yes
checking for broken __attribute__((visibility()))... no
checking for broken __attribute__((alias()))... no
checking whether to put _rtld_local into .sdata section... no
checking for .preinit_array/.init_array/.fini_array support... no
configure: error: Need linker with .init_array/.fini_array support.
make: ***
[/home/rohit/Desktop/buildroot/output/build/glibc-2.18/.stamp_configured]
Error 1


> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
With Regards,

Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140528/4ad3e2f1/attachment.html>
