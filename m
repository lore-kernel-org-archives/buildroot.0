From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Oct 2013 23:23:07 +0200
Subject: [Buildroot] [PATCH] Compile static versions of gcc libraries
In-Reply-To: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
References: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
Message-ID: <20131011232307.7301b5d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 10 Oct 2013 11:40:42 +0200, J?r?me Pouiller wrote:

> +define  HOST_GCC_FINAL_CONFIGURE_CMDS
> +        (cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
> +                $(HOST_CONFIGURE_OPTS) \
> +                CFLAGS="$(HOST_CFLAGS)" \
> +                LDFLAGS="$(HOST_LDFLAGS)" \
> +                $(HOST_GCC_FINAL_CONF_ENV) \
> +                ./configure \
> +                --prefix="$(HOST_DIR)/usr" \
> +                --sysconfdir="$(HOST_DIR)/etc" \
> +                --enable-shared --enable-static \
> +                $(QUIET) $(HOST_GCC_FINAL_CONF_OPT) \
> +        )

Why aren't you simply doing:

HOST_GCC_FINAL_CONF_OPT += \
	--enable-shared --enable-static

instead ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
