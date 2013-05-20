From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 May 2013 16:52:04 +0200
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
Message-ID: <20130520165204.0269d05a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Assaf Inbal,

On Mon, 20 May 2013 15:56:36 +0300, Assaf Inbal wrote:

> +define LBASE64_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC" so
> +endef

Using $(TARGET_CONFIGURE_OPTS) here would be better if possible.

Also, we're normally supposed to handle both the shared library and
static library build. Ideally, when BR2_PREFER_STATIC_LIB is disabled,
build both the shared and the static library, and when
BR2_PREFER_STATIC_LIB is enabled, build only the static library.

> +
> +define LBASE64_INSTALL_TARGET_CMDS
> +	$(INSTALL) "$(@D)/base64.so" "$(TARGET_DIR)/usr/lib/lua"
> +endef

We normally don't quote file paths, and we use the following syntax:

	$(INSTALL) -D $(@D)/base64.so $(TARGET_DIR)/usr/lib/lua/base64.so

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
