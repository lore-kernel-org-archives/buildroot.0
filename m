From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:36:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/uclibc: libm: Add missing C99
 float/ld wrappers (backport)
In-Reply-To: <20150329135608.38d08f5e@free-electrons.com>
References: <1427588948-13933-1-git-send-email-bernd.kuhls@t-online.de>
 <20150329135608.38d08f5e@free-electrons.com>
Message-ID: <20150407223635.04679618@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

Could you get back to me about the below comments, ideally with a new
iteration of the patches?

Thanks a lot!

Thomas

On Sun, 29 Mar 2015 13:56:08 +0200, Thomas Petazzoni wrote:
> Dear Bernd Kuhls,
> 
> On Sun, 29 Mar 2015 01:29:07 +0100, Bernd Kuhls wrote:
> > This commit adds a patch to uclibc with a backport from upstream
> > to provide a proper fix for mesa3d which depends on fminf.
> > Also remove the mesa3d patch which provided a crappy workaround.
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  .../0002-Fix-runtime-error-with-uClibc.patch       |   58 --
> >  .../0069-Add-missing-C99-float-ld-wrappers.patch   |  870 ++++++++++++++++++++
> >  2 files changed, 870 insertions(+), 58 deletions(-)
> >  delete mode 100644 package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
> >  create mode 100644 package/uclibc/0.9.33.2/0069-Add-missing-C99-float-ld-wrappers.patch
> 
> I think we might need to keep the crappy workaround, or an improved
> version of it. The problem with doing a uClibc patch is that it will
> only work with internal uClibc toolchains: all uClibc toolchains will
> continue to be broken.
> 
> So we might want to do both:
> 
>  1/ Fix uClibc properly, so that in the future (3-6 months from now),
>  we can get rid of the mesa3d specific fix, after most of the external
>  uClibc toolchains have been updated.
> 
>  2/ Keep a mesa3d workaround for a little while.
> 
> Thomas



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
