From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Oct 2017 13:47:01 +0200
Subject: [Buildroot] [PATCH 1/1] samba4: Make python2 dependency for waf
 explicit
In-Reply-To: <87zi8gnbgp.fsf@sx4173-linuxdev.solectrix.de>
References: <20171018140304.19737-1-christian.kellermann@solectrix.de>
 <20171018140304.19737-2-christian.kellermann@solectrix.de>
 <20171018173732.368ed195@windsurf.home>
 <87zi8gnbgp.fsf@sx4173-linuxdev.solectrix.de>
Message-ID: <20171026134701.3e633e03@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please don't reply to me only, keep the mailing list in Cc so that
everybody can participate to the discussion.

On Tue, 24 Oct 2017 11:26:14 +0200, Christian Kellermann wrote:

> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> > On Wed, 18 Oct 2017 16:03:04 +0200, Christian Kellermann wrote:  
> >> Without this patch the build environment will pick up python3 if it is a
> >> dependency for other packages. Currently waf does not support
> >> python3.  
> >
> > Are we talking about host python or target python here ?  
> 
> host-python, sorry for being imprecise.

OK.

> >> -		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
> >> +		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python2-config" \  
> >
> > This is related to the *target* python, so how is this related to the
> > waf problem ?  
> 
> It needs to pick up the python headers. Without this I get the error:
> ?Could not find the python development headers?

I don't see how this modification changes anything. BR2_PACKAGE_SAMBA4
selects BR2_PACKAGE_PYTHON, and BR2_PACKAGE_PYTHON3 depends
on !BR2_PACKAGE_PYTHON.

So if you have samba4 enabled, the python version enabled for the
target is always Python 2.x, and therefore python-config and
python2-config in staging should be the same thing.

So we need to understand if this change is really necessary, and if it
is, why is it that it creates a difference.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
