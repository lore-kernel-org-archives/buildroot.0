From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Aug 2015 18:27:36 +0200
Subject: [Buildroot] [PATCH 3/3] package/libv4l: needs argp-standalone
 with musl toolchains
In-Reply-To: <20150803111650.55613002@free-electrons.com>
References: <1438448118-26198-1-git-send-email-romain.naour@openwide.fr>
 <1438448118-26198-3-git-send-email-romain.naour@openwide.fr>
 <20150802152903.GF3647@free.fr>
 <20150803111650.55613002@free-electrons.com>
Message-ID: <20150803162736.GN3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-03 11:16 +0200, Thomas Petazzoni spake thusly:
> On Sun, 2 Aug 2015 17:29:03 +0200, Yann E. MORIN wrote:
> > Ditto, you also need to adjust the build dependencies in the .mk .
> > 
> > However, that one is doing things differently than the other two. It
> > currently build-depends on argp-standalone and links with it as soon as
> > the package is enabled.
> > 
> > I'm nt sure that's the best soltuion; it should only do that if built
> > against uClibc or musl, like rng-tools and elfutils currently do.
> 
> Since argp-standalone/Config.in has:
> 
> 	depends on !BR2_TOOLCHAIN_USES_GLIBC
> 
> then there is really no difference between:
> 
> ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> ...
> endif
> 
> and
> 
> ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),y)
> ...
> endif

OK, but in this case the two other packages should be changed to use the
same conditional code.

In the end, I don't mind which we use, as lon as we use it consistently
across packages.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
