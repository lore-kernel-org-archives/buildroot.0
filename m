From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 11:16:50 +0200
Subject: [Buildroot] [PATCH 3/3] package/libv4l: needs argp-standalone
 with musl toolchains
In-Reply-To: <20150802152903.GF3647@free.fr>
References: <1438448118-26198-1-git-send-email-romain.naour@openwide.fr>
 <1438448118-26198-3-git-send-email-romain.naour@openwide.fr>
 <20150802152903.GF3647@free.fr>
Message-ID: <20150803111650.55613002@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 2 Aug 2015 17:29:03 +0200, Yann E. MORIN wrote:

> Ditto, you also need to adjust the build dependencies in the .mk .
> 
> However, that one is doing things differently than the other two. It
> currently build-depends on argp-standalone and links with it as soon as
> the package is enabled.
> 
> I'm nt sure that's the best soltuion; it should only do that if built
> against uClibc or musl, like rng-tools and elfutils currently do.

Since argp-standalone/Config.in has:

	depends on !BR2_TOOLCHAIN_USES_GLIBC

then there is really no difference between:

ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
...
endif

and

ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),y)
...
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
