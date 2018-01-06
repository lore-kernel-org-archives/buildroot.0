From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jan 2018 15:14:25 +0100
Subject: [Buildroot] [PATCH] package/enlightenment: bump to 0.22.1
In-Reply-To: <20180105163223.10142-1-romain.naour@gmail.com>
References: <20180105163223.10142-1-romain.naour@gmail.com>
Message-ID: <20180106151425.7e15f86f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Jan 2018 17:32:23 +0100, Romain Naour wrote:

> -ENLIGHTENMENT_CONF_OPTS = \
> -	--with-edje-cc=$(HOST_DIR)/bin/edje_cc \
> -	--with-eet-eet=$(HOST_DIR)/bin/eet \
> -	--with-eldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
> -	--disable-pam \
> -	--disable-rpath
> +ENLIGHTENMENT_MESON_OPTS += \
> +	--prefix=/usr \
> +	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
> +	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \

So sometimes the options are defined using =, sometimes not ? Is this
expected ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
