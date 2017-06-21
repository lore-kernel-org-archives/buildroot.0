From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 21:56:52 +0200
Subject: [Buildroot] [PATCH] package/lua-flu: new package
In-Reply-To: <20170620151631.4857-1-m.niestroj@grinn-global.com>
References: <20170620151631.4857-1-m.niestroj@grinn-global.com>
Message-ID: <20170621215652.75df8617@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 17:16:31 +0200, Marcin Niestroj wrote:

> +config BR2_PACKAGE_LUA_FLU
> +	bool "lua-flu"
> +	select BR2_PACKAGE_ATTR
> +	select BR2_PACKAGE_LIBFUSE
> +	depends on !BR2_STATIC_LIBS # libfuse
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
> +	depends on BR2_USE_MMU # libfuse

"depends on" should come before "select", so I've fixed that, and
applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
