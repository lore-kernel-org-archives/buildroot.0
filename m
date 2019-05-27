From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 May 2019 15:27:17 +0800
Subject: [Buildroot] [PATCH V2 5/9] package/gcc: Add C-SKY support
In-Reply-To: <20190526225335.2d3e436d@windsurf>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <1557305915-11247-5-git-send-email-guoren@kernel.org>
 <20190526225335.2d3e436d@windsurf>
Message-ID: <20190527072717.GA10769@guoren-Inspiron-7460>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx,

On Sun, May 26, 2019 at 10:53:35PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed,  8 May 2019 16:58:31 +0800
> guoren at kernel.org wrote:
> 
> > diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> > index 8e22a4c..c123a84 100644
> > --- a/package/gcc/Config.in.host
> > +++ b/package/gcc/Config.in.host
> > @@ -3,6 +3,7 @@ comment "GCC Options"
> >  choice
> >  	prompt "GCC compiler Version"
> >  	default BR2_GCC_VERSION_ARC if BR2_arc
> > +	default BR2_GCC_VERSION_CSKY if BR2_csky
> >  	default BR2_GCC_VERSION_OR1K if BR2_or1k
> >  	default BR2_GCC_VERSION_7_X
> >  	help
> > @@ -14,6 +15,12 @@ config BR2_GCC_VERSION_ARC
> >  	depends on BR2_arc
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
> >  
> > +config BR2_GCC_VERSION_CSKY
> > +	bool "gcc csky"
> > +	# Only supported architecture
> > +	depends on BR2_csky
> > +	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
> 
> I don't see what will prevent me from selecting an upstream gcc 6.x or
> 7.x for C-SKY here. Are you sure you should not add a bunch of "depends
> on !BR2_csky" to the other gcc version options ?
Yes, I'll add !BR2_csky to the other gcc version options.

Best Regards
 Guo Ren
