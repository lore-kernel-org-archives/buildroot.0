From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 18:48:28 +0200
Subject: [Buildroot] [PATCH 5/5] kmod: does not support static builds
In-Reply-To: <52151C54.9010606@mind.be>
References: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1376996584-4462-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <52151C54.9010606@mind.be>
Message-ID: <20130827184828.7a7685b1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

(Resending with Buildroot list in Cc)

On Wed, 21 Aug 2013 22:00:20 +0200, Arnout Vandecappelle wrote:
> On 20/08/13 13:03, Thomas Petazzoni wrote:
> > Since kmod 14, the support for building a static library has been
> > removed completely from kmod. Therefore, we mark kmod as
> > !BR2_PREFER_STATIC_LIB, as well as all its reverse dependencies, which
> > includes the option to use the "udev" /dev management method.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
>   I don't think that patches that fix PREFER_STATIC builds are important 
> enough to still include in 2013.08.

I agree.

> > diff --git a/package/kmod/Config.in b/package/kmod/Config.in
> > index 4965237..bd44316 100644
> > --- a/package/kmod/Config.in
> > +++ b/package/kmod/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_KMOD
> >   	bool "kmod"
> > +	depends on !BR2_PREFER_STATIC_LIB
> >   	help
> >   	  handle kernel modules
> 
>   Shouldn't you also remove the
> 
> KMOD_CONF_OPT = --disable-static --enable-shared
> 
> ?

No because the default is --enable-static --enable-shared, and the
configure script of kmod bails out with an error when --enable-static
is passed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
