From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 4 Apr 2014 21:15:33 +0200
Subject: [Buildroot] [PATCH] postgresql: new package
In-Reply-To: <20140403223952.37034a1a@skate>
References: <1396249169-14126-1-git-send-email-ps.report@gmx.net>,
 <20140403223952.37034a1a@skate>
Message-ID: <trinity-ef30a0b8-52c5-420b-a46f-3dd07e701ffc-1396638933006@3capp-gmx-bs34>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Donnerstag, 03. April 2014 um 22:39 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>
> Betreff: Re: [Buildroot] [PATCH] postgresql: new package
>
> Dear Peter Seiderer,
> 
> On Mon, 31 Mar 2014 08:59:29 +0200, Peter Seiderer wrote:
> 
> > diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> > new file mode 100644
> > index 0000000..bc0305b
> > --- /dev/null
> > +++ b/package/postgresql/Config.in
> > @@ -0,0 +1,20 @@
> > +config BR2_PACKAGE_POSTGRESQL
> > +	bool "PostgreSQL"
> 
> lower case, please.

o.k.

> 
> > +	depends on BR2_INET_IPV6
> 
> Since it currently doesn't build with uClibc, can you make this package
> depends on !BR2_TOOLCHAIN_USES_UCLIBC ?
> 

o.k. postgresql compiles with uClibc without locale/i18n, will add appropriate dependency...

> 
> > +if [ ! -f /srv/pgsql/data/PG_VERSION ]; then
> 
> I thought we changed to /var/lib/pgsql ?
> 

sorry, missed that one, will fix...

> Maybe you should create a variable that contains /var/lib/pgsql to
> avoid this duplication.
> 
> 
> > +ifeq ($(BR2_PACKAGE_ZLIB),y)
> > +	POSTGRESQL_DEPENDENCIES += zlib
> > +else
> > +	POSTGRESQL_CONF_OPT += --wihtout-zlib
> 
> Typo.

o.k, fixed...

> 
> > +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> > +	POSTGRESQL_DEPENDENCIES += openssl
> > +	POSTGRESQL_CONF_OPT += --with-openssl
> 
> else
> 	POSTGRESQL_CONF_OPT += --without-openssl

no need for the else branch, because no autodetection of openssl
package (without openssl is the default already), but I can add
a comment to make this clear?

Peter

> 
> Other than that, looks good.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
