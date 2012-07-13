From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Fri, 13 Jul 2012 21:51:19 +0200 (CEST)
Subject: [Buildroot] [PATCH v2] libmad: Add optimization config options
In-Reply-To: <20120713214147.7fd4d1e8@skate>
Message-ID: <17811032.1339793.1342209079006.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > Changes for v2:
> >    - Factorize the 'able' in the $(if ).
> 
> I prefer the solution in v1 with regard to this, as it is much easier
> to read.

As you prefer.

> > +choice
> > +	prompt "Speed vs. accuracy"
> > +	default BR2_PACKAGE_LIBMAD_SPEED_ACCURACY
> 
> What about calling those options:
> 
>  BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED
>  BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY
>  BR2_PACKAGE_LIBMAD_OPTIMIZATION_DEFAULT
> 
> > +config BR2_PACKAGE_LIBMAD_SPEED_ACCURACY
> > +	bool "Optimize for both speed and accuracy"
> 
> This should rather be:
> 
> 	bool "Default"
> 
> or something like that. Technically, this option does not enable any
> special optimization for both speed and accuracy, it just uses the
> default options.

Actually, libmad's README says that the default options (neither --enable-speed
nor --enable-accuracy) imply an optimization of both:

"Note that you need not specify one of --enable-speed or --enable-accuracy; in
its default configuration, MAD is optimized for both."

But it refuses to configure with both options, and there is indeed technically
nothing special done by default.

I'll post a v3 doing all that.

Regards,
Beno?t
