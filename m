From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 13:29:59 +0200
Subject: [Buildroot] Disabling Synopsys ARC pre-built toolchains in
 Buildroot
In-Reply-To: <1429699622.2596.34.camel@synopsys.com>
References: <20150410112156.6b0e42f7@free-electrons.com>
 <1429260577.2846.27.camel@synopsys.com> <5531634E.5070104@mind.be>
 <1429699622.2596.34.camel@synopsys.com>
Message-ID: <20150422132959.6ee06b65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On Wed, 22 Apr 2015 10:47:03 +0000, Alexey Brodkin wrote:

> Please note that we added missing options:
>  * UCLIBC_HAS_UTMP=y
>  * UCLIBC_HAS_UTMPX=y
>  * UCLIBC_HAS_LIBUTIL=y
>  * UCLIBC_USE_NETLINK=y
>  * UCLIBC_SUPPORT_AI_ADDRCONFIG=y
>  * UCLIBC_HAS_LIBNSL_STUB=y

Great.

> in uClibc defconfigs for ARC so the next release of ARC toolchain will have them -
> https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc/commit/ab87ede75f9b9b837d579c8eeef3ab4f22fd45d1
> 
> As for remaining differences between Buildroot and ARC uClibc defconfigs
> these are ones I may see (comparing
> https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc/blob/arc-mainline-dev/extra/Configs/defconfigs/arc/defconfig with "uClibc-snapshot.config" from http://patchwork.ozlabs.org/patch/462812/):
> 
>  [1] MALLOC_GLIBC_COMPAT=y
>  [2] UCLIBC_HAS_GETPT=y
>  [3] UCLIBC_HAS_CTYPE_CHECKED=y
>  [4] UCLIBC_HAS_HEXADECIMAL_FLOATS=y
>  [5] UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
>  [6] UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
>  [7] UCLIBC_HAS_PRINTF_M_SPEC=y
>  [8] UCLIBC_HAS_SSP=y
>  [9] UCLIBC_BUILD_NOW=y
> 
> Most of these options enable more compatibility with glibc or even
> expand support for non-standard features like
> UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE.
> 
> Do you think some of them are really important and we may want to add
> them in ARC defconfigs?

I think the closer you are to the Buildroot uClibc defconfig, the less
compatibility issues we'll have. So unless you have a good reason to
not use the Buildroot uClibc defconfig, I would suggest to just use it.
Of course, feel free to *add* more features than this defconfig, but
try to not have less features.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
