From: Christian Stewart <christian@paral.in>
Date: Wed, 18 Nov 2020 23:50:18 -0800
Subject: [Buildroot] [PATCH v3 4/5] board: add nvidia jetson tx2 support
In-Reply-To: <61b867a9-96d4-1ab2-813b-c1529c3fed1b@smile.fr>
References: <20201118025252.3806860-1-christian@paral.in>
 <20201118025252.3806860-4-christian@paral.in>
 <61b867a9-96d4-1ab2-813b-c1529c3fed1b@smile.fr>
Message-ID: <CA+h8R2ohK8Y+Dfii=sFYO_eYc9_Zbp4C3bUwWTAkZS0EGnRbwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Wed, Nov 18, 2020 at 6:59 AM Romain Naour <romain.naour@smile.fr> wrote:

> > +# Toolchain reference: docs.nvidia.com: "Jetson Linux Driver Package Toolchain"
> > +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > +BR2_BINUTILS_VERSION_2_32_X=y
>
> AFAIK, the nvidia sdk requires a specific gcc version too. I'm not sure it can
> build with GCC 9 or 10. Cuda libraries seems requires GCC 8.

This has been tested under my Skiff project with the following:

BR2_TOOLCHAIN_BUILDROOT=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_BINUTILS_VERSION_2_32_X=y
BR2_GCC_VERSION_7_X=y
BR2_GCC_ENABLE_LTO=n
BR2_USE_MMU=y

I have submitted another series revision with the additional GCC
Version specifier.

Note: both the tx2 and nano have been tested and known to work well even w/ GPU.

> The vanilla linux kernel doesn't even build with gcc 8, Matt Madison (the OE4T
> maintainer) backported a lot of patches on the kernel 4.9.140 released by Nvidia
> to fixes those issues.

As noted above this has been tested against gcc 7, so I'm not sure
about > gcc 7.

> Also this kernel include nvidia kernel stack, there is a hard dependency on the
> linux4tegra version (32.4.3).

This series includes l4t 32.4.3.

Thanks for the review.

Best regards,
Christian Stewart
