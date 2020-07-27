From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 17:01:26 +0200
Subject: [Buildroot] [PATCHv3] package/bat: new package
In-Reply-To: <20200727140922.2614959-1-romain.naour@gmail.com>
References: <20200727140922.2614959-1-romain.naour@gmail.com>
Message-ID: <20200727170126.51d45e8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Jul 2020 16:09:22 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> +	# less needs ncurses
> +	select BR2_PACKAGE_NCURSES

less already selects ncurses, so why do we need ncurses here ?

> +BAT_CARGO_OPTS = \
> +	 --bins \
> +	 --$(BAT_CARGO_MODE) \
> +	 --target=$(RUSTC_TARGET_NAME) \
> +	 --manifest-path=$(@D)/Cargo.toml
> +
> +define BAT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(BAT_CARGO_ENV) \
> +	CC_$(subst -,_,$(RUSTC_TARGET_NAME))=$(TARGET_CC) \

I am still not happy with this. There is no reason why this should be
passed on a per-package basis, it should be handled by "cargo" and all
the cross-compilation configuration it has.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
