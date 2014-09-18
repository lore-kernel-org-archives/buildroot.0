From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 18 Sep 2014 09:39:11 +0200
Subject: [Buildroot] [PATCH 3/6] python-rtslib-fb: new package
In-Reply-To: <5419E86C.3000100@trzebnica.net>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
 <1410953999-16520-4-git-send-email-cvubrugier@fastmail.fm>
 <5419E86C.3000100@trzebnica.net>
Message-ID: <20140918093911.6831517a@grp-cvubrugier>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

On Wed, 17 Sep 2014 22:00:44 +0200, Jerzy Grzegorek wrote :
> > rtslib-fb is an object-based Python library for configuring the
> > LIO generic SCSI target, present in 3.x Linux kernel versions.
> >
> > Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> > ---
> >   package/Config.in                         |  1 +
> >   package/python-rtslib-fb/Config.in        |  9 +++++++++
> >   package/python-rtslib-fb/python-rtslib.mk | 13 +++++++++++++
> 
> Shouldn't this be:
> 
> package/python-rtslib-fb/python-rtslib-fb.mk ?

Indeed. Thank you for catching this one!

Best regards,


> >   3 files changed, 23 insertions(+)
> >   create mode 100644 package/python-rtslib-fb/Config.in
> >   create mode 100644 package/python-rtslib-fb/python-rtslib.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 17930ea..7447036 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -503,6 +503,7 @@ menu "external python modules"
> >   	source "package/python-pysnmp-mibs/Config.in"
> >   	source "package/python-pyusb/Config.in"
> >   	source "package/python-pyzmq/Config.in"
> > +	source "package/python-rtslib-fb/Config.in"
> >   	source "package/python-serial/Config.in"
> >   	source "package/python-setuptools/Config.in"
> >   	source "package/python-simplejson/Config.in"
> > diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
> > new file mode 100644
> > index 0000000..b2aebcf
> > --- /dev/null
> > +++ b/package/python-rtslib-fb/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_PYTHON_RTSLIB_FB
> > +	bool "python-rtslib-fb"
> > +	depends on BR2_PACKAGE_PYTHON
> > +	help
> > +	  rtslib-fb is an object-based Python library for configuring
> > +	  the LIO generic SCSI target, present in 3.x Linux kernel
> > +	  versions.
> > +
> > +	  https://github.com/agrover/rtslib-fb
> > diff --git a/package/python-rtslib-fb/python-rtslib.mk b/package/python-rtslib-fb/python-rtslib.mk
> > new file mode 100644
> > index 0000000..70b0257
> > --- /dev/null
> > +++ b/package/python-rtslib-fb/python-rtslib.mk
> > @@ -0,0 +1,13 @@
> > +################################################################################
> > +#
> > +# python-rtslib-fb
> > +#
> > +################################################################################
> > +
> > +PYTHON_RTSLIB_FB_VERSION = v2.1.fb49
> > +PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
> > +PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
> > +PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
> > +PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
> > +
> > +$(eval $(python-package))
> 
