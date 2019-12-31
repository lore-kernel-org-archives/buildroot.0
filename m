From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Dec 2019 15:33:07 +0100
Subject: [Buildroot] [PATCH] package/apitrace: fix build failure due to
 gcc bug 68485 and 85180
In-Reply-To: <20191227180020.22933-1-giulio.benetti@benettiengineering.com>
References: <20191227180020.22933-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191231153307.5ff83635@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Dec 2019 19:00:20 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> +APITRACE_CFLAGS = $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +APITRACE_CFLAGS += -O0
> +endif
> +
> +APITRACE_CONF_OPTS += -DCMAKE_C_FLAGS="$(APITRACE_CFLAGS)"
> +
> +APITRACE_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> +APITRACE_CXXFLAGS += -O0
> +endif
> +
> +APITRACE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(APITRACE_CXXFLAGS)"

I'm a bit confused as to why the bug 68485 is worked-around through
CFLAGS and bug 85180 is worked-around through CXXFLAGS. Could you
explain this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
