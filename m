From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:48:30 +0200
Subject: [Buildroot] [PATCH v6 1/2] rhash: new package
In-Reply-To: <20170602101641.63979-1-Vincent.Riera@imgtec.com>
References: <20170602101641.63979-1-Vincent.Riera@imgtec.com>
Message-ID: <20170606224830.7fa7037d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Jun 2017 11:16:40 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I've applied, after minor fixes, see below.

> +define RHASH_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +	$(RHASH_MAKE_OPTS) $(RHASH_BUILD_TARGETS)

Indentation of the second line should have had two tabs, not one.

> +define RHASH_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/librhash \
> +		DESTDIR="$(TARGET_DIR)" $(RHASH_MAKE_OPTS) $(RHASH_INSTALL_TARGETS)
> +endef
> +
> +ifeq ($(BR2_PACKAGE_RHASH_BIN),y)
> +define RHASH_INSTALL_TARGET_RHASH_BIN
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		DESTDIR="$(TARGET_DIR)" $(RHASH_MAKE_OPTS) install-shared
> +endef
> +RHASH_POST_INSTALL_TARGET_HOOKS += RHASH_INSTALL_TARGET_RHASH_BIN
> +endif

Using post install target hooks is not really needed here, calling the
variable directly from RHASH_INSTALL_TARGET_CMDS is a bit more common
in generic-package packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
