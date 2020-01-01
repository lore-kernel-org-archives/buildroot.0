From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Jan 2020 16:54:17 +0100
Subject: [Buildroot] [PATCH] package/proj: fix build failure due to gcc
 bug 68485(C++)
In-Reply-To: <20191231150957.122179-1-giulio.benetti@benettiengineering.com>
References: <20191231150957.122179-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200101165417.37ed565d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Dec 2019 16:09:57 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> +PROJ_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +PROJ_CXXFLAGS += -O0
> +endif
> +
> +PROJ_CONF_ENV += CXXFLAGS="$(PROJ_CXXFLAGS)"

The duplication of the condition was really not necessary, you can use
the same condition to tweak the CFLAGS/CXXFLAGS values.

I've adjusted that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
