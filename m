From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 21:09:24 +0100
Subject: [Buildroot] [PATCH] add insserv to use LSB compliant init
 scripts and dynamically configure init order
In-Reply-To: <96b265c099c9a9d7673ed6061aa562878ac45be0.1291587953.git.smiley73@users.sourceforge.net>
References: <96b265c099c9a9d7673ed6061aa562878ac45be0.1291587953.git.smiley73@users.sourceforge.net>
Message-ID: <20101206210924.75330f3d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Dec 2010 16:26:19 -0600
heiko at zuerker.org wrote:

> +config BR2_PACKAGE_INSSERV
> +	bool "insserv"
> +	help
> +	  This small package provides a tool for process controlling
> +	  in System V boot scripts.
> +	  It works for LSB compliant init scripts.
> +	  http://wiki.debian.org/LSBInitScripts

Just curious, how do you use this in the context of Buildroot ?

By default, Buildroot uses Busybox init, which isn't SysV compliant (it
doesn't support runlevels). And how would this interact with the
Buildroot build process ?

> +#INSSERV_DEPENDENCIES=zlib
> +#HOST_INSSERV_DEPENDENCIES=host-zlib

Useful ? Comments ?

> +define INSSERV_CONFIGURE_CMDS
> +	echo "#!/bin/sh" > $(@D)/tests/common
> +	echo "exit 0" >> $(@D)/tests/common
> +	chmod +x $(@D)/tests/common
> +endef
> +
> +define HOST_INSSERV_CONFIGURE_CMDS
> +	echo "#!/bin/sh" > $(@D)/tests/common
> +	echo "exit 0" >> $(@D)/tests/common
> +	chmod +x $(@D)/tests/common
> +endef

Those sound strange. Maybe a short comment above would clarify a bit.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
