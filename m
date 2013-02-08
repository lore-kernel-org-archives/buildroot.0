From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Feb 2013 18:41:47 +0100
Subject: [Buildroot] [PATCH 2/6] package/dosfstools: add host-package
	selection
In-Reply-To: <cb7500992ef0651a3689443522eaa5a54afe10c3.1360344619.git.yann.morin.1998@free.fr>
References: <cover.1360344619.git.yann.morin.1998@free.fr>
 <cb7500992ef0651a3689443522eaa5a54afe10c3.1360344619.git.yann.morin.1998@free.fr>
Message-ID: <20130208184147.5559416c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  8 Feb 2013 18:32:56 +0100, Yann E. MORIN wrote:

> +define HOST_DOSFSTOOLS_BUILD_CMDS
> +	$(MAKE) CC="$(HOSTCC)" -C $(@D)
> +endef
> +
> +define HOST_DOSFSTOOLS_INSTALL_CMDS
> +	$(MAKE) -C $(@D) CC="$(HOSTCC)" PREFIX=$(HOST_DIR)/usr install
> +endef

$(HOST_CONFIGURE_OPTS) here maybe instead of CC="$(HOSTCC)" ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
