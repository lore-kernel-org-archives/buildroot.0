From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:47:29 +0200
Subject: [Buildroot] [PATCH] docs/manual/adding-packages-cargo.txt:
 re-add FOO_CARGO_MODE variable
In-Reply-To: <2e60c4dc-6a6f-7124-c512-2b4495482f4c@green-sparklet.de>
References: <2e60c4dc-6a6f-7124-c512-2b4495482f4c@green-sparklet.de>
Message-ID: <20210720234729.04a7349c@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210720214729.WSEJAO5tlx79mTmq1uIQCREqU-YKgFAkMgtoim7AAc0@z>

Hello Stefan,

On Tue, 15 Jun 2021 15:55:54 +0200
Stefan <buildroot-list_21@green-sparklet.de> wrote:

> +16: FOO_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
> +17:
> +18: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
> +19:
> +20: FOO_CARGO_OPTS = \
> +21:    $(if $(BR2_ENABLE_DEBUG),,--release) \
> +22:    --target=$(RUSTC_TARGET_NAME) \
> +23:    --manifest-path=$(@D)/Cargo.toml
> +24:
> +25: define FOO_BUILD_CMDS
> +26:    $(TARGET_MAKE_ENV) $(FOO_CARGO_ENV) \
> +27:            cargo build $(FOO_CARGO_OPTS)
> +28: endef
> +29:
> +30: define FOO_INSTALL_TARGET_CMDS
> +31:    $(INSTALL) -D -m 0755 $(@D)/$(FOO_BIN_DIR)/foo \
> +32:            $(TARGET_DIR)/usr/bin/foo
> +33: endef
> +34:
> +35: $(eval $(generic-package))

Thanks for the patch. However, it seems like the only package that uses
this currently is not formatted like you're suggesting. See
package/ripgrep/ripgrep.mk. First, it uses BR2_ENABLE_RUNTIME_DEBUG
instead of BR2_ENABLE_DEBUG, and it does it in a different way.

Could you adjust the documentation according to what
package/ripgrep/ripgrep.mk is doing ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
