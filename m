From: Alex Corcoles <alex@corcoles.net>
Date: Sun, 19 Jan 2020 20:40:39 +0100
Subject: [Buildroot] "PATCH": hack to be able to build Rust targetting
 MIPS
In-Reply-To: <20200118212756.GG32369@scaer>
References: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
 <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
 <20200118212756.GG32369@scaer>
Message-ID: <CAPAYC_zexzuMfp9F=d8KL-jS8TxQF1sqh07W_zT9J9AiK0rjgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> RUSTC_TARGET_NAME is defined in package/rustc/rustc.mk:
>
>     10 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
>     11 RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
>     12 endif
>
> So, it is only defined if BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is
> set, and this is defined in package/rustc/Config.in.host. It needs a
> glibc toolchain (and an x86 or x86_64 host machine).
>
> But your configuration uses uClibc-ng, not glibc, so this is the reason
> that it does not work for you.
>
> If you believe the dependency on glibc is too stringent, then this is
> the place to fix stuff, not redefine the variable as you suggested.
>

Honestly, I don't have any idea what I'm doing :)

Rust itself supports uclibc on mipsel:

https://forge.rust-lang.org/release/platform-support.html

mipsel-unknown-linux-uclibc is a Tier 3 platform, which is not awesome, but
it could work. Frankly I don't know much about buildroot to hack this up
(or even to know if it's worth trying).

(I'm just trying to run rust-sdl/rust-sdl2 on a RG-300 which uses buildroot
for development purposes. I've managed to build C stuff using SDL
successfully in buildroot, but Rust is proving to be more complex)

-- 
   ___
 {~._.~}
  ( Y )
 ()~*~()  mail: alex at corcoles dot net
 (_)-(_)  http://alex.corcoles.net/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200119/a183a471/attachment.html>
