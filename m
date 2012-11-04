From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Nov 2012 18:03:37 +0100
Subject: [Buildroot] [PATCH 1/3] qemu: needs pkg-config
In-Reply-To: <1352046926-10804-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1352046926-10804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20121104180337.76cc8973@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sun,  4 Nov 2012 17:35:24 +0100, Thomas Petazzoni wrote:

>  define HOST_QEMU_CONFIGURE_CMDS
> -	(cd $(@D); ./configure                          \
> +	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure   \
>  		--target-list="$(HOST_QEMU_TARGETS)"    \
>  		--prefix="$(HOST_DIR)/usr"              \
>  		--interp-prefix=$(STAGING_DIR)          \

I should have explained this change in the commit log: it is needed so
that $(HOST_DIR)/usr/bin/ is in the PATH, which allows Qemu's configure
script to find our pkg-config.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
