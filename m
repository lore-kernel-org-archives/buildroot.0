From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 20:00:21 +0200
Subject: [Buildroot] [PATCH] jemalloc: bump version to 4.5.0
In-Reply-To: <20170402175418.19941-1-eric.le.bihan.dev@free.fr>
References: <20170402175418.19941-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170407200021.6aa2f4b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 19:54:18 +0200, Eric Le Bihan wrote:

> +# configure is missing but gpm seems not compatible with our autoreconf
> +# mechanism so we have to do it manually instead of using
> +# JEMALLOC_AUTORECONF = YES
> +define JEMALLOC_RUN_AUTOGEN
> +        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +
> +JEMALLOC_PRE_CONFIGURE_HOOKS += JEMALLOC_RUN_AUTOGEN

All this is not needed if you use the release tarball published by the
project at
https://github.com/jemalloc/jemalloc/releases/download/4.5.0/jemalloc-4.5.0.tar.bz2.
It has the configure already generated.

So I've removed all the autoreconf related code you added, and used
this tarball instead.

I've applied after changing this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
