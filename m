From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 09:16:54 +0200
Subject: [Buildroot] [PATCH] alsa-lib: Add option to allow calculations
 in float for soft float targets
In-Reply-To: <1462603525-4427-1-git-send-email-joerg.krause@embedded.rocks>
References: <1462603525-4427-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160507091654.0b03f2fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 08:45:25 +0200, J?rg Krause wrote:

> -ifeq ($(BR2_SOFT_FLOAT),y)
> +ifeq ($(BR2_PACKAGE_ALSA_LIB_NO_FLOAT),y)
>  ALSA_LIB_CONF_OPTS += --with-softfloat
>  endif

So we were already passing --with-softfloat when BR2_SOFT_FLOAT=y. So
what your option brings is:

 - Ability to use floating point operations when BR2_SOFT_FLOAT=y.

 - Ability to not use floating point operations when BR2_SOFT_FLOAT is
   disabled.

Do you have any actual use for such possibilities ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
