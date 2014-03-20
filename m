From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Mar 2014 20:50:52 +0100
Subject: [Buildroot] Builtroot toolchain with gcc snapshot version
 4.9-20140309 compile failure
In-Reply-To: <trinity-75f996d8-d171-4abd-9868-076266c3faed-1395307804240@3capp-gmx-bs26>
References: <trinity-75f996d8-d171-4abd-9868-076266c3faed-1395307804240@3capp-gmx-bs26>
Message-ID: <20140320205052.2bd501d8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 20 Mar 2014 10:30:04 +0100, Peter Seiderer wrote:

> The following (draft) patch fixes the compile for me:
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 236297d..c1da387 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -151,9 +151,7 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
>  HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
>  endif
>  
> -ifeq ($(BR2_arc),y)
>  HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
> -endif
>  
>  ifeq ($(BR2_SOFT_FLOAT),y)
> 
> Any chance to add these dependency for gcc snapshot version >= 4.9 (any hint
> how to do this)?

Maybe something like:

ifneq ($(or $(BR2_arc),$(BR2_GCC_VERSION_SNAP)),)
HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
endif

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
