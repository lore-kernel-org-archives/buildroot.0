From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Mar 2019 11:14:33 -0700
Subject: [Buildroot] [PATCH v2 2/5] configs: qemu_riscv32_virt: Upgrade
 to 4.20 kernel
In-Reply-To: <CAKmqyKPN-EOw898Rk1sdQW0QwNOptWbZ4D7KmpaMgFwOqubckw@mail.gmail.com>
References: <20190318210106.6347-1-alistair.francis@wdc.com>
 <20190318210106.6347-2-alistair.francis@wdc.com>
 <d7dc0632-940c-e87f-14c9-42b231106723@embecosm.com>
 <CAKmqyKPN-EOw898Rk1sdQW0QwNOptWbZ4D7KmpaMgFwOqubckw@mail.gmail.com>
Message-ID: <CAKmqyKO7vUtXuLHv=oWeuSysp9iqg1JbMi7VXOkL5cta20-D9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 19, 2019 at 11:02 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Mar 19, 2019 at 8:20 AM Mark Corbin <mark.corbin@embecosm.com> wrote:
> >
> > Hello Alistair
> >
> > On 18/03/2019 21:02, Alistair Francis wrote:
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  configs/qemu_riscv32_virt_defconfig | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> > > index fb37da6a89..6f9a61b11c 100644
> > > --- a/configs/qemu_riscv32_virt_defconfig
> > > +++ b/configs/qemu_riscv32_virt_defconfig
> > > @@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> > >  # Filesystem
> > >  BR2_TARGET_ROOTFS_EXT2=y
> > >
> > > -# Linux headers same as kernel, a 4.15 series
> > > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
> > > +# Linux headers same as kernel, a 4.20 series
> > > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
> > >
> > >  # Kernel
> > >  BR2_LINUX_KERNEL=y
> > >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
> > >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
> > > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fe92d7905c6ea0ebeabeb725b8040754ede7c220"
> > > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
> >
> > I wasn't sure that the 4.20 kernel worked for riscv32 under qemu which
> > is probably why it wasn't bumped from 4.15 in January when the
> > qemu_riscv64_virt_defconfig kernel version was.
> >
> > How did you manage to test this? I've tried both qemu 2.12.0 and 3.1.0
> > and neither version will boot the resulting kernel.
>
> I just tested this again and here are my results. All running on QEMU
> 3.1.0 and using OpenSBI
>
> With current master + my OpenSBI patches -> I can boot the 4.20
> kernel, but it never gets to a login prompt.
>
> With current master + my OpenSBI patches + defconfig update -> I can
> boot the 4.20 kernel and I get to a login prompt.
>
> I did some of my original tests with an updated defconfig but I
> thought I tested without any changed. I'll send a patch to update the
> defconfig.

I even tested BBL with my v4 series that I'm about to send and that
boots to a login prompt.

So everything should work with the updated config.

Alistair

>
> Alistair
>
> >
> > Regards
> >
> > Mark
> >
> > --
> > Mark Corbin
> > Embecosm Ltd.
> > https://www.embecosm.com
> >
