From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 23:19:20 +0200
Subject: [Buildroot] [PATCH 2/4] netatop: new package
In-Reply-To: <20161007203031.21528-2-ricardo.martincoski@datacom.ind.br>
References: <20161007203031.21528-1-ricardo.martincoski@datacom.ind.br>
 <20161007203031.21528-2-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161007231920.2a4050e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Oct 2016 17:30:29 -0300, Ricardo Martincoski wrote:

> diff --git a/package/netatop/netatop.hash b/package/netatop/netatop.hash
> new file mode 100644
> index 0000000..f721ddd
> --- /dev/null
> +++ b/package/netatop/netatop.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  0bdde8315d2c6e4a1d87fd10d27659d76d07949b31f0dc5e81662e67e1d0fdd0  netatop-1.0.tar.gz
> diff --git a/package/netatop/netatop.mk b/package/netatop/netatop.mk
> new file mode 100644
> index 0000000..623bed7
> --- /dev/null
> +++ b/package/netatop/netatop.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# netatop
> +#
> +################################################################################
> +
> +NETATOP_VERSION = 1.0
> +NETATOP_SITE = http://www.atoptool.nl/download
> +NETATOP_LICENSE = GPLv2
> +# no license file. It will be added for the next version
> +NETATOP_LICENSE_FILES = module/netatop.c
> +
> +NETATOP_MODULE_SUBDIRS = module
> +
> +define NETATOP_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 $(@D)/netatop.init \
> +		$(TARGET_DIR)/etc/init.d/S50netatop
> +endef
> +
> +$(eval $(kernel-module))
> +$(eval $(generic-package))

In addition to the kernel module, netatop also builds a daemon,
netatopd, which gets started by the init script if available. But
your .mk file does not seem to build the netatopd daemon. Why so?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
