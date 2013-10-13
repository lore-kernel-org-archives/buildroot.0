From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Oct 2013 09:51:40 +0200
Subject: [Buildroot] [PATCH] ruby: fix 'pcrel too far' build problem on
 SuperH architectures
In-Reply-To: <873298952161de3ed5aa.1381650276@argentina>
References: <873298952161de3ed5aa.1381650276@argentina>
Message-ID: <20131013095140.7a9e70e5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 13 Oct 2013 09:44:36 +0200, Thomas De Schampheleire wrote:

> +# With some SuperH toolchains (like Sourcery CodeBench 2012.09), ruby fails to
> +# build with 'pcrel too far'. This seems to be caused by the -Os option we pass
> +# by default. To fix the problem, use standard -O2 optimization instead.
> +ifeq ($(BR2_sh)$(BR2_sh64),y)
> +TARGET_CFLAGS += -O2
> +endif

I don't think it's the right way of fixing the problem. This is going to
affect the CFLAGS of *all* packages. You shouldn't change
TARGET_CFLAGS, but instead do:

RUBY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
