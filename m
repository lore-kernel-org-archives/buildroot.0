From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 26 Aug 2016 12:50:22 +0200
Subject: [Buildroot] [PATCH v1 1/9] package/acpica: Add host
 configuration to the tool
In-Reply-To: <1472133887-34746-2-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1472133887-34746-2-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <CAK4VdL3vQv-YkEmmreg0cgDA8QVeAj7XAEDzdAJwgg4Ox4cMCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Aug 25, 2016 at 4:04 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> +define HOST_ACPICA_BUILD_CMDS
> +       $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)                         \
> +               HARDWARE_NAME=$(BR2_ARCH) HOST=_LINUX CC="$(HOSTCC)"    \
> +               all
> +endef
> +
> +define HOST_ACPICA_INSTALL_CMDS
> +       $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)                         \
> +               HARDWARE_NAME=$(BR2_ARCH) DESTDIR="$(HOST_DIR)"         \
> +               INSTALLFLAGS=-m755 install
> +endef

HARDWARE_NAME should probably not be set to BR2_ARCH for the host
version of the package, as it contains the target architecture. Even
though it is a rather useless variable today (as pointed out by Thomas
in github https://github.com/acpica/acpica/pull/152), it makes even
less sense here.

Erico
