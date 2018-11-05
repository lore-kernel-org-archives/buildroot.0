From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 5 Nov 2018 09:46:52 +0530
Subject: [Buildroot] [PATCH 1/1] fwts: Enable optional efi_runtime
 kernel module build
In-Reply-To: <20181102191812.114ce345@windsurf>
References: <1541162207-8770-1-git-send-email-sumit.garg@linaro.org>
 <20181102191812.114ce345@windsurf>
Message-ID: <CAFA6WYM7GA5LNjU-h8=8nozHu0kya5JDpX5NZOvvNuBZ7SpXGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2 Nov 2018 at 23:48, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri,  2 Nov 2018 18:06:47 +0530, Sumit Garg wrote:
> > Firmware test suite does provides efi_runtime kernel module required
> > to run UEFI tests. So optionally enable this module build.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  package/fwts/Config.in | 8 ++++++++
> >  package/fwts/fwts.mk   | 6 ++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/package/fwts/Config.in b/package/fwts/Config.in
> > index 959d871..3ddb989 100644
> > --- a/package/fwts/Config.in
> > +++ b/package/fwts/Config.in
> > @@ -28,3 +28,11 @@ comment "fwts needs a glibc toolchain w/ wchar, threads"
> >       depends on BR2_USE_MMU
> >       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> >               !BR2_TOOLCHAIN_USES_GLIBC
> > +
> > +config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
> > +     bool "efi_runtime_module"
> > +     depends on BR2_PACKAGE_FWTS
> > +     depends on BR2_LINUX_KERNEL
> > +     help
> > +       Firmware Test Suite (FWTS) also provides EFI runtime kernel
> > +       module required to run UEFI tests.
>
> In addition to the other comments being made: when there is a "depends
> on BR2_LINUX_KERNEL", we typically need add something like this:
>
> comment "efi-runtime module needs a Linux kernel to be built"
>         depends on !BR2_LINUX_KERNEL
>

Sure will add this comment.

Regards,
Sumit

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
