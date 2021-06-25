From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Jun 2021 08:51:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-augeas: new package
In-Reply-To: <20210624215353.GI2852@scaer>
References: <20210621203456.361929-1-thomas.petazzoni@bootlin.com>
 <20210624215353.GI2852@scaer>
Message-ID: <20210625085121.3c682b60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Jun 2021 23:53:53 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +PYTHON_AUGEAS_VERSION = 1.1.0
> > +PYTHON_AUGEAS_SITE = $(call github,hercules-team,python-augeas,v$(PYTHON_AUGEAS_VERSION))
> > +PYTHON_AUGEAS_SETUP_TYPE = setuptools
> > +PYTHON_AUGEAS_LICENSE = LGPL-2.1+
> > +PYTHON_AUGEAS_LICENSE_FILES = COPYING
> > +PYTHON_AUGEAS_DEPENDENCIES = augeas host-python-cffi host-pkgconf
> > +# This will tell python-augeas to not call xml2-config, and instead
> > +# use pkg-config to find libxml2. libxml2 is an indirect dependency of
> > +# augeas, which is why it's not in our dependencies. It's odd that
> > +# python-augeas searches for libxml2, but that's what it
> > +# does. Question asked in the pull request at
> > +# https://github.com/hercules-team/python-augeas/pull/49.  
> 
> They've now replied, and I am not sure I followed... Augeas' .pc does
> not yield libxml2' CFLAGS, because it is a Requires.Private.
> 
> So, why does python-augeas need the CFLAGS from libxml2?

Yeah, I was also confused by their reply, and didn't investigate
further at this point.

Thanks for looking at the patch and merging!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
