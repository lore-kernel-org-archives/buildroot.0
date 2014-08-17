From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 09:36:21 +0200
Subject: [Buildroot] [PATCH] package/lame: Fix compile on 32bit Intel
 with gcc-4.9.x
In-Reply-To: <1408227494-20770-1-git-send-email-bernd.kuhls@t-online.de>
References: <1408227494-20770-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140817093621.664fad88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 17 Aug 2014 00:18:14 +0200, Bernd Kuhls wrote:

> +# http://lists.linuxfromscratch.org/pipermail/blfs-dev/2014-April/027259.html
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56145
> +ifeq ($(BR2_i386)$(BR2_GCC_VERSION_4_9_X),yy)
> +define LAME_COMPILE_FIX
> +	$(SED) '/xmmintrin\.h/d' $(@D)/configure
> +endef
> +LAME_PRE_CONFIGURE_HOOKS += LAME_COMPILE_FIX
> +endif

Unfortunately, this sort of check is not really acceptable, because it
doesn't work with external toolchains: BR2_GCC_VERSION_* symbols are
defined only for internal toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
