From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:40:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdcadec: new package
In-Reply-To: <1429953408-32582-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429953408-32582-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150425114038.062c3759@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 25 Apr 2015 11:16:48 +0200, Bernd Kuhls wrote:

> +LIBDCADEC_VERSION = 7b3b44cd180c9345c98be9062eac701eab5c7454
> +LIBDCADEC_SITE = $(call github,foo86,dcadec,$(LIBDCADEC_VERSION))
> +LIBDCADEC_LICENSE = LGPLv2.1+
> +LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
> +LIBDCADEC_INSTALL_STAGING = YES
> +
> +define LIBDCADEC_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" -C $(@D)
> +endef
> +
> +define LIBDCADEC_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> +		DESTDIR=$(STAGING_DIR) PREFIX=/usr install
> +endef
> +
> +define LIBDCADEC_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> +		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
> +endef

It only builds a static library, so target installation may not really
be necessary, but it also installs a tool in usr/bin. So for now I've
kept your patch as is. Feel free to submit a patch that disables target
installation if we don't care about this tool on the target.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
