From: Mikhail B. WproxyM <w.proxy.m@gmail.com>
Date: Wed, 28 Apr 2021 11:07:13 +0300
Subject: [Buildroot] boot/grub2: grub-core-build-fixes-for-i386
 (grub-2.04 + binutils-2.35.2 + pseudo-op .code64)
In-Reply-To: <20210426225630.113ee3d7@windsurf>
References: <CANTg=Qj3vMern005jEMmUs2dWvi0oJ9Y3aoS4ocsrD91KoXW5Q@mail.gmail.com>
 <20210426225630.113ee3d7@windsurf>
Message-ID: <CANTg=Qig12wrSU2WUBPmXFkjSpmmTo1gfEn1x6rgDR8vTM-82g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Thomas.

I have the build error, when building *from i686* to i686.

You do not have the build error, when building *from x86-64* to i686.
Looks like it is the reason.

Grub2 developers do not run build tests under i386/i686. Even you do
not run build tests under i686.

P.S.: Common build platform for most developers is x86-64, so I am not
surprised. It is too simple to lose compatibility by using too many
levels of assumptions, facades and abstractions.

--
Best regards

--
Best regards, Mikhail B.


??, 26 ???. 2021 ?. ? 23:56, Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
>
> Hello Mikhail,
>
> On Tue, 20 Apr 2021 12:35:16 +0300
> "Mikhail B. WproxyM" <w.proxy.m@gmail.com> wrote:
>
> > We are using binutils-2.35.2+ (later then 2.29.1), grub-2.04,
> > cross-compiling on recent buildroot under i386/i686 and getting error:
> >
> > > lib/i386/relocator64.S:66: Error: unknown pseudo-op: `.code64'
> >
> > So, the working patch is attached. Please add it to buildroot.
>
> Do you have some details on the conditions to reproduce this issue?
> Indeed, I just tried to build grub2, with the following configuration:
>
> BR2_x86_core2=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_GRUB2=y
> BR2_TARGET_GRUB2_I386_EFI=y
>
> So it's using a i686 target system, with a toolchain that uses binutils
> 2.34 (i.e later than the 2.29 you're pointing). And it builds fine,
> including relocator64.S, which gets built as part of the build process.
>
> Note: I am building *from* an x86-64 system. But how can that matter,
> as relocator64.S is built using the cross-compiler?
>
> Also, why isn't this patch in upstream Grub ?
>
> Thanks a lot for the additional details you could provide.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
