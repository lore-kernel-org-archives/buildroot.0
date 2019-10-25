From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 25 Oct 2019 19:32:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnu-efi: fix efilink
In-Reply-To: <20191025184715.488317a1@windsurf.dhcp.lyon.intranet>
References: <20191024193308.56695-1-james.hilliard1@gmail.com>
 <20191025184715.488317a1@windsurf.dhcp.lyon.intranet>
Message-ID: <CADvTj4oHVv-UCiidRUf1JW-_4m6U1Z_7rvAsekxtMSZ7S-E3aA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 25, 2019 at 6:47 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Thu, 24 Oct 2019 13:33:08 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Fixes: fatal error: stdint.h: No such file or directory
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> In which configuration? When building what?
Well I was seeing it when trying to build systemd-boot by itself for testing
https://github.com/systemd/systemd/pull/13842.
>
> I understand the problem, but the commit log really is too terse.
>
> I tried to reproduce by building syslinux with efi support, using the
> following defconfig:
>
> BR2_x86_64=y
> BR2_x86_core2=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2019.05.1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_SYSLINUX=y
> BR2_TARGET_SYSLINUX_EFI=y
>
> but it failed with a different issue:
>
> /home/thomas/projets/buildroot/output/build/syslinux-6.03/efi/main.c:32:8: error: unknown type name ?jmp_buf?
>
> Could you resend your patch with more details about the build
> failure ?
Sure.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
