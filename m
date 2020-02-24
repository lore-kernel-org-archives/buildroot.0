From: vadim4j at gmail.com <vadim4j@gmail.com>
Date: Mon, 24 Feb 2020 23:00:46 +0200
Subject: [Buildroot] [PATCH 2/3] package/rtrlib: new package
In-Reply-To: <20200224205313.109d44bd@windsurf>
References: <20200224172652.30932-1-vadim4j@gmail.com>
 <20200224172652.30932-3-vadim4j@gmail.com>
 <20200224205313.109d44bd@windsurf>
Message-ID: <20200224210046.GB34982@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Feb 24, 2020 at 08:53:13PM +0100, Thomas Petazzoni wrote:
> Hello Vadim,
> 
> On Mon, 24 Feb 2020 19:26:51 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > diff --git a/package/rtrlib/Config.in b/package/rtrlib/Config.in
> > new file mode 100644
> > index 0000000000..440eeb5d63
> > --- /dev/null
> > +++ b/package/rtrlib/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_RTRLIB
> > +	bool "rtrlib"
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS
> > +	depends on BR2_TOOLCHAIN_HAS_SSP
> 
> It's pretty uncommon for a package to require SSP support. Can you tell
> it instead to not pass -fstack-protector when building, and let
> Buildroot decide when to pass it ?
> 

I will try, but actually actually I was wrong that this package is
required by ffr, it is required but optionally for rpki support. So,
this patch might be dropped with not enabled rpki feature in frr.

Thanks,
Vadim Kochan
