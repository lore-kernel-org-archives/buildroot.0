From: Davide Viti <zinosat@tiscali.it>
Date: Wed, 26 Mar 2014 20:52:59 +0100
Subject: [Buildroot] [v3,2/2] canfestival: new package
In-Reply-To: <1388673820-5710-3-git-send-email-s.martin49@gmail.com>
References: <1388673820-5710-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140326195259.GA26115@zinosat.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 02, 2014 at 03:43:40PM +0100, Samuel Martin wrote:
...
> +define CANFESTIVAL_CONFIGURE_CMDS
> +	cd $(@D) && \
> +		$(TARGET_CONFIGURE_OPTS) ./configure \
> +		--binutils=$(TARGET_CROSS) --cc="$(TARGET_CC)" \
> +		--cxx="$(TARGET_CC)" --ld="$(TARGET_CC)" \
> +		--can=$(BR2_PACKAGE_CANFESTIVAL_DRIVER) \
> +		--MAX_CAN_BUS_ID=$(BR2_PACKAGE_CANFESTIVAL_NBMMAXCAN)
> +endef

I've tested the patch with an arm toolchain and noticed that installed
files end up not properly prefixed (i.e. /usr/arm-buildroot-linux-gnueabi/lib)

It can be fixed by passing "--prefix=/usr" to configure

regards,
Davide
