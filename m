From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:36:59 +0200
Subject: [Buildroot] [PATCH] libsoc: add Python bindings support
In-Reply-To: <1466771710-24749-1-git-send-email-yegorslists@googlemail.com>
References: <1466771710-24749-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160625153659.2f55837b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jun 2016 14:35:10 +0200, yegorslists at googlemail.com wrote:

> +# Install Python 2 bindings
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +LIBSOC_DEPENDENCIES += python
> +LIBSOC_CONF_OPTS += --enable-python=2
> +endif
> +
> +# Install Python 3 bindings
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)

I've grouped this condition with the previous one, using an "else
ifeq", since python/python3 are mutually exclusive.

> +LIBSOC_DEPENDENCIES += python3
> +LIBSOC_CONF_OPTS += --enable-python=3
> +endif

I've added:

else
LIBSOC_CONF_OPTS += --disable-python
endif

And applied. Let me know if there is any issue with the modifications.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
