From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 Jul 2014 21:30:30 +0200
Subject: [Buildroot] [PATCH] ghostscript-fonts: new package
Message-ID: <trinity-3615ecec-e749-4e66-bc23-7071373ddf63-1404847829908@3capp-gmx-bs18>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, Jun 14, 2014 at 08:56:22PM +0200, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Sun,  8 Jun 2014 00:47:15 +0200, Peter Seiderer wrote:
> 
> >  comment "X libraries and helper libraries"
> >  source "package/dejavu/Config.in"
> > +source "package/ghostscript-fonts/Config.in"
> >  source "package/liberation/Config.in"
> >  source "package/libsexy/Config.in"
> >  source "package/x11r7/xkeyboard-config/Config.in"
> 
> The package looks good, but I'm wondering if "X libraries and helper
> libraries" is really the right places for fonts. I'm pretty sure
> liberation fonts are usable outside of X.org. Regarding
> ghostscript-fonts, I am not sure what programs are using them.

Dillo was requesting some ghostscript and DejaVu fonts as default fonts...

I think it was Qt5/gui module with fontconfig enabled (and without X installation)
which needed the Liberation fonts for text rendering...

> Depending on that, the package could be visible at a different location
> in menuconfig.
> 

Yes, here three suggestions:

a) add new 'Target packages -> Fonts' menu entry
b) add new 'Target packages -> Libraries -> Fonts' menu entry
c) add new 'Target packages -> Graphic libraries/Fonts' submenu entry

There is another font provider 'Google font directory' found at
'Target packages -> Miscellaneous'...

> Also:
> 
>  * Could you post an updated version on top of master. The entire
>    package/Config.in file has changed in terms of indentation.

O.k. will do...

> 
>  * This patch makes the assumption the dejavu package is applied, but
>    both patches are not part of the same series. So either make the
>    patches independent of each other (in separate branches on your
>    side), or post both of them together as a series.

O.k. will provide as patchset...

Regards,
Peter

> 
> The rest of the package looks good to me, it's really just this
> location in menuconfig that annoys me a bit.
> 
> Maybe other developers will have some suggestions on this?
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
