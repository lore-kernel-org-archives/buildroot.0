From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 21:48:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/cairo: Do not use -latomic with
 non-threaded toolchains
In-Reply-To: <1457254351-9933-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457254351-9933-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160306214842.780b4925@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  6 Mar 2016 09:52:31 +0100, Bernd Kuhls wrote:

>  # cairo can use C++11 atomics when available, so we need to link with
>  # libatomic for the architectures who need libatomic.
> -ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
>  CAIRO_CONF_ENV += LIBS="-latomic"
>  endif

Thanks for this patch! However, I believe a more general solution is
needed for this problem. I have just submitted two patches that aim at
fixing this issue. See:

  http://patchwork.ozlabs.org/patch/592591/
  http://patchwork.ozlabs.org/patch/592592/

Let me know what you think.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
