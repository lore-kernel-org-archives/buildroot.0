From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 11:14:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: disable for static build
In-Reply-To: <20150802152333.GC3647@free.fr>
References: <1438506439-3096-1-git-send-email-joerg.krause@embedded.rocks>
 <20150802152333.GC3647@free.fr>
Message-ID: <20150803111403.53eb7ffb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 2 Aug 2015 17:23:33 +0200, Yann E. MORIN wrote:

> > diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> > index c5ec792..69063fc 100644
> > --- a/package/nodejs/Config.in
> > +++ b/package/nodejs/Config.in
> > @@ -8,17 +8,18 @@ config BR2_PACKAGE_NODEJS
> >  	depends on !BR2_ARM_CPU_ARMV4
> >  	# uses fork()
> >  	depends on BR2_USE_MMU
> > +	depends on !BR2_STATIC_LIBS # dlopen, etc.
> 
> That's not entirely true. For armv5, nodejs 0.10 does not require
> dynamic libraries.

Do we really care? Nodejs is a big stuff, unlikely to be used in
static-only configurations. Plus the latest version of NodeJS, 0.12.x,
no longer supports ARMv5. So I'm tempted to simply not support static
linking at all, even if indeed for a very specific case it could be
supported.

What do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
