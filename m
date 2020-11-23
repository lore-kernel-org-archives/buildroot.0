From: Christian Stewart <christian@paral.in>
Date: Mon, 23 Nov 2020 15:07:01 -0800
Subject: [Buildroot] [PATCH v4 4/5] board: add nvidia jetson tx2 support
In-Reply-To: <bcfb1b77-8962-674f-1c08-fa7e60ec208e@smile.fr>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-4-christian@paral.in>
 <bcfb1b77-8962-674f-1c08-fa7e60ec208e@smile.fr>
Message-ID: <CA+h8R2pOAr8qXM23Na9KeB+a-vLyY2QaM21dK114DUfM7SAVOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Thu, Nov 19, 2020 at 5:40 AM Romain Naour <romain.naour@smile.fr> wrote:
> > +# Toolchain reference: docs.nvidia.com: "Jetson Linux Driver Package Toolchain"
> > +BR2_TOOLCHAIN_BUILDROOT=y
> > +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> > +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> > +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> > +BR2_BINUTILS_VERSION_2_32_X=y
> > +BR2_GCC_VERSION_7_X=y
>
> This means that you are not working on Buildroot master because gcc 7 has been
> removed already.
>
> This is anoying... either the latest NVIDIA SDK (jetpack 4.4.1) is already out
> of date because it require an old gcc version or gcc is moving too fast for such
> sdk.

I have tested this against GCC 8 and Buildroot 2020.08.x:

BR2_TOOLCHAIN_BUILDROOT=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_BINUTILS_VERSION_2_32_X=y
BR2_GCC_VERSION_8_X=y
BR2_USE_MMU=y

... and all works fine. Why do you think it won't work with GCC 8?

Best,
Christian
