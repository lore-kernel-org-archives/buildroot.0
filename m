From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 29 Mar 2015 17:52:43 +0300
Subject: [Buildroot] [PATCH 1/2] squid: bump to version 3.5.3
In-Reply-To: <1427639612-25592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427639612-25592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150329145243.GF12479@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Sun, Mar 29, 2015 at 11:33:31AM -0300, Gustavo Zacarias wrote:
> +# Atomics support requires __sync_add_and_fetch_8 (64-bits)
> +# That's only handled in gcc's libatomic for 32-bit arches

Maybe you mean "64-bit arches"? Otherwise the code does not match.

> +ifeq ($(BR2_ARCH_HAS_ATOMICS)$(BR2_ARCH_IS_64),yy)
> +	SQUID_CONF_ENV += squid_cv_gnu_atomics=yes
> +else
> +	SQUID_CONF_ENV += squid_cv_gnu_atomics=no
> +endif
> +
>  # On uClibc librt needs libpthread
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
>  	SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
