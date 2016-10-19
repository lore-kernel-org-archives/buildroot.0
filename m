From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Oct 2016 12:30:30 +0300
Subject: [Buildroot] [PATCH 2/2] liburcu: needs MMU
In-Reply-To: <20161019112757.483622d2@free-electrons.com>
References: <ef30f526d3d31123695b867262dac86030da8af2.1476867634.git.baruch@tkos.co.il>
 <5feff8d883fff7c5e9929d9b191d776c27de3cfa.1476867634.git.baruch@tkos.co.il>
 <20161019112757.483622d2@free-electrons.com>
Message-ID: <20161019093030.s5wt6nklyczbachq@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 19, 2016 at 11:27:57AM +0200, Thomas Petazzoni wrote:
> On Wed, 19 Oct 2016 12:00:34 +0300, Baruch Siach wrote:
> 
> > diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
> > index 49510da4956c..915b17ab9d6d 100644
> > --- a/package/liburcu/Config.in
> > +++ b/package/liburcu/Config.in
> > @@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> >  config BR2_PACKAGE_LIBURCU
> >  	bool "liburcu"
> >  	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> > +	depends on BR2_USE_MMU # fork() in test
> 
> You want to put this in BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS so that you
> don't have to propagate it to reverse dependencies of liburcu (which
> BTW your patch forgot to do).

Good point. Will do.

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
