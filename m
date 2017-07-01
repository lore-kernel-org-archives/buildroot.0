From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:40:56 +0200
Subject: [Buildroot] [PATCH v6] autofs: allow to use libtirpc instead of
 internal C implementation
In-Reply-To: <20170630085229.GA9830@waldemar-brodkorb.de>
References: <20170630085229.GA9830@waldemar-brodkorb.de>
Message-ID: <20170701104056.777ff0fb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 10:52:29 +0200, Waldemar Brodkorb wrote:

>  ...fig-to-search-for-libtirpc-to-fix-cross-c.patch | 957 +++++++++++++++++++++

This is a fairly massive patch. From the reading of your changelog, I
can see you're working with upstream to get it merged. Do you think it
will be merged soon?


> +ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)

I think this should instead be:

ifeq ($(BR2_PACKAGE_LIBTIRPC),y)

indeed, even if you have native RPC support, but have decided to anyway
enable libtirpc, it makes sense to use it IMO.

> +AUTOFS_CONF_OPTS += --with-libtirpc
> +AUTOFS_DEPENDENCIES += libtirpc
> +else
> +AUTOFS_CONF_OPTS += --without-libtirpc
> +endif
> +
>  $(eval $(autotools-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
