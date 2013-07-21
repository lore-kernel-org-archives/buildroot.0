From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jul 2013 17:35:39 +0200
Subject: [Buildroot] [PATCH 1/9] gcc/bfin: doesn't support --with-cpu
 defaults
In-Reply-To: <1374324735-2286-2-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
 <1374324735-2286-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130721173539.28707500@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 20 Jul 2013 09:52:07 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

> +# GCC doesn't support --with-cpu for bfin
> +ifeq ($(BR2_bfin),)
>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
>  HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
> @@ -166,6 +168,7 @@ else
>  HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
>  endif
>  endif
> +endif

This looks odd because the BR2_GCC_TARGET_CPU_REVISION thing was added
by Sonic Zhang, see 66d41890ec2b76189bcd427a0cc3966ff56f9712. So it is
specifically useful on Blackfin. Maybe just with Analog Devices
toolchains, I don't know. But clearly, removing that for Blackfin seems
wrong.


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
