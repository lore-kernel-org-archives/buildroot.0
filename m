From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 18:03:05 +0200
Subject: [Buildroot] [PATCH 2/4 v2] package/kvm-unit-tests: introduce
 _ARCH_SUPPORTS
In-Reply-To: <20170708163045.GD3867@scaer>
References: <cover.1499522760.git.yann.morin.1998@free.fr>
 <0d5c040b902f29f870a4a941f1850d7c29e43144.1499522760.git.yann.morin.1998@free.fr>
 <b0102f89-d625-7b1a-074e-006c4bdebeaf@mind.be>
 <20170708163045.GD3867@scaer>
Message-ID: <20170709180305.5146f312@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Jul 2017 18:30:45 +0200, Yann E. MORIN wrote:

> >  GCC is *not* an arch dependency, so this should just be  
> 
> Yet we already use similar construct in other packages, like host-go:
> 
>     config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>         depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || [...]
> 
> or like kodi:
> 
>      config BR2_PACKAGE_KODI_ARCH_SUPPORTS
>         default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || [...]
> 
> or with libsigsegv:
> 
>     config BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS
>         default y if BR2_TOOLCHAIN_USES_GLIBC
>         default y if BR2_TOOLCHAIN_USES_MUSL
>         default y if BR2_TOOLCHAIN_USES_UCLIBC && [...archs...]
> 
> or libunwind, openal (interesting case), openblas, protobuf.
> 
> Arguaby, none of the above have a dependency on gcc, but some are on the
> C library, and others are on toolchain features...

Yes, but see what I replied to Carlos about adding a
BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS option, which would have encoded
non-architecture dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
