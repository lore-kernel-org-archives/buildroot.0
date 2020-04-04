From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 23:07:52 +0200
Subject: [Buildroot] [PATCH 1/2] boot/syslinux: fix build of efi part
 with gnu-efi 3.0.10
In-Reply-To: <20200324142356.1487610-1-thomas.petazzoni@bootlin.com>
References: <20200324142356.1487610-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200404230752.32dcd137@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Mar 2020 15:23:55 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The following defconfig:
> 
> BR2_x86_i686=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_TARGET_SYSLINUX=y
> BR2_TARGET_SYSLINUX_EFI=y
> 
> fails to build due to missing setjmp/longjmp definitions, which is a
> consequence of a change introduced between gnu-efi 3.0.9 and 3.0.10.
> 
> This build failure is fixed by adding another syslinux paytch, which
> has been submitted upstream.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../0015-efi-main.c-include-efisetjmp.h.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch

I've applied my two patches. Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
