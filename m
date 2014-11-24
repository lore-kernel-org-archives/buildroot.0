From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Nov 2014 06:33:24 +0200
Subject: [Buildroot] [PATCH] mpdecimal: disable static build
In-Reply-To: <20141123221518.GM11143@free.fr>
References: <235ca63e3c273ed4feb8d39cfbb5c05b1fe50d0f.1416733726.git.baruch@tkos.co.il>
 <20141123221518.GM11143@free.fr>
Message-ID: <20141124043324.GA2241@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Nov 23, 2014 at 11:15:18PM +0100, Yann E. MORIN wrote:
> On 2014-11-23 11:08 +0200, Baruch Siach spake thusly:
> > diff --git a/package/mpdecimal/Config.in b/package/mpdecimal/Config.in
> > index 929d41514399..2aae520c15d9 100644
> > --- a/package/mpdecimal/Config.in
> > +++ b/package/mpdecimal/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_MPDECIMAL
> >  	bool "mpdecimal"
> >  	help
> > +	depends on !BR2_PREFER_STATIC_LIB
> >  	  mpdecimal is a package for correctly-rounded arbitrary
> >  	  precision decimal floating point arithmetic. Starting from
> >  	  version 2.4, mpdecimal includes only the libmpdec
> 
> Really? This makes the "depends on" part of the help text...

Ah, my bad. I already marked this patch as Superseded in patchwork, as Thomas' 
patch will hopefully actually fix static build.

Thanks for reviewing, anyway.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
