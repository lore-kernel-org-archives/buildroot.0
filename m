From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Feb 2015 13:33:03 +0200
Subject: [Buildroot] [PATCH for next 2/2] toolchain: create symlink to
 'lib' from ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <1424098379-8320-3-git-send-email-patrickdepinguin@gmail.com>
References: <1424098379-8320-1-git-send-email-patrickdepinguin@gmail.com>
 <1424098379-8320-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150217113303.GG2302@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Feb 16, 2015 at 03:52:59PM +0100, Thomas De Schampheleire wrote:
> -# We make a symlink lib32->lib or lib64->lib as appropriate
> -# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
> -ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
> -LIB_SYMLINK = lib64
> -else
> -LIB_SYMLINK = lib32
> -endif

[...]

> diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> index b30cc33..e1fe1f4 100644
> --- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> +++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> @@ -12,6 +12,17 @@ BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
>  
>  TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
>  
> +ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
> +LIB_SYMLINK = lib64
> +else
> +LIB_SYMLINK = lib32-fp

This changes the original logic. We currently have 'LIB_SYMLINK = lib32' here 
(see above).

> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
