From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 17:15:53 +0100
Subject: [Buildroot] [PATCH 4/5] lttng-modules: bump to version 2.8.3
In-Reply-To: <20161029180339.24535-5-eeppeliteloop@gmail.com>
References: <20161029180339.24535-1-eeppeliteloop@gmail.com>
 <20161029180339.24535-5-eeppeliteloop@gmail.com>
Message-ID: <20161030171553.5033019c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 14:03:38 -0400, Philippe Proulx wrote:
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Again, the commit log is empty, even though the patch is doing much
more than a bump to 2.8.3.

> +LTTNG_MODULES_DEPENDENCIES = linux
> +
> +ifeq ($(BR2_PACKAGE_LTTNG_MODULES),y)
> +LINUX_NEEDS_MODULES = y
> +endif
> +
> +LTTNG_MODULES_MAKE_OPTS = \
> +	KERNELDIR="$(LINUX_DIR)" \
> +	ARCH="$(KERNEL_ARCH)" \
> +	CROSS_COMPILE="$(TARGET_CROSS)"
> +
> +define LTTNG_MODULES_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LTTNG_MODULES_MAKE_OPTS) -C $(@D)
> +endef
> +
> +define LTTNG_MODULES_INSTALL_STAGING_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LTTNG_MODULES_MAKE_OPTS) \
> +		INSTALL_MOD_PATH="$(STAGING_DIR)" -C $(@D) modules_install
> +endef
> +
> +define LTTNG_MODULES_INSTALL_TARGET_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LTTNG_MODULES_MAKE_OPTS) \
> +		INSTALL_MOD_PATH="$(TARGET_DIR)" -C $(@D) modules_install
> +endef
>  
> -$(eval $(kernel-module))

Why do you stop using the kernel-module infrastructure? This should
definitely be explained in the commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
