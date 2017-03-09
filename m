From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:18:50 +0100
Subject: [Buildroot] [PATCH v1] libxkbcommon: add support for
 interactive-wayland test program
In-Reply-To: <20170308215310.12819-1-ps.report@gmx.net>
References: <20170308215310.12819-1-ps.report@gmx.net>
Message-ID: <20170309221850.3a6ab20c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Mar 2017 22:53:10 +0100, Peter Seiderer wrote:

> +if BR2_PACKAGE_LIBXKBCOMMON && BR2_PACKAGE_WAYLAND
> +
> +config BR2_PACKAGE_LIBXKBCOMMON_INTERACTIVE_WAYLAND
> +	bool "interactive-wayland"
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS
> +	help
> +	  interactive-wayland is a wayland test application
> +	  for libxkbcommon.
> +
> +endif

This looks like a very very specific option. Shouldn't this be instead
BR2_PACKAGE_LIBXKBCOMMON_INSTALL_TESTS ?

> +define LIBXKBCOMMON_BUILD_INTERACTIVE_WAYLAND
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) test/interactive-wayland
> +endef
> +LIBXKBCOMMON_POST_BUILD_HOOKS = LIBXKBCOMMON_BUILD_INTERACTIVE_WAYLAND

There's already some logic in the build system to build tests. Can't we
use it instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
