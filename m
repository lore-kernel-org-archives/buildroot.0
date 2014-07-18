From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 10:54:18 +0200
Subject: [Buildroot] [git commit] python-numpy: disable on non-supported
 architectures
In-Reply-To: <20140718084558.GA4914@tarshish>
References: <20140718080136.0BB869D27D@busybox.osuosl.org>
 <20140718084558.GA4914@tarshish>
Message-ID: <20140718105418.5582c7dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 18 Jul 2014 11:45:58 +0300, Baruch Siach wrote:

> >  config BR2_PACKAGE_PYTHON_NUMPY
> >  	bool "python-numpy"
> > +	# Numpy has some CPU specific code
> > +	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
> > +		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
> > +		|| BR2_sh || BR2_sh || BR2_x86_64
> 
> Duplicate BR2_sh.

Argh, yes. Thanks for spotting. Fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
