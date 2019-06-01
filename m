From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 09:01:23 +0200
Subject: [Buildroot] [PATCH] package/netsurf: disallow on archs
 requiring ABI specific CFLAGS
In-Reply-To: <20190601073351.4bf75739@thl530.multi.box>
References: <20190531214052.14297-1-peter@korsgaard.com>
 <20190601073351.4bf75739@thl530.multi.box>
Message-ID: <20190601090123.4ff808f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Jun 2019 07:33:51 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> >  comment "netsurf needs a toolchain w/ dynamic library"
> >  	depends on BR2_STATIC_LIBS
> > +	depends on BR2_PACKAGE_NETSURF_ARCH_SUPPORTS  
> 
> First, the comment is now not accurate anymore. It should also say
> something about the architectures where it is not available.

No, we never put comments about architecture dependencies, because
there's nothing the user can do about it.

> Then the logic below says that PACKAGE_NETSURF depends on "!STATIC_LIBS
> *AND* NETSURF_ARCH_SUPPORT". The dependency of the comment above is
> inverted, so I think this rather should be:
> 
>        depends on BR2_STATIC_LIBS || !BR2_PACKAGE_NETSURF_ARCH_SUPPORTS

No, because we precisely don't want the comment to show up when we're
on an architecture that cannot support the package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
