From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 13:35:57 +0100
Subject: [Buildroot] [PATCH 1/1] samba4: Make python2 dependency for waf
 explicit
In-Reply-To: <20171026134701.3e633e03@windsurf>
References: <20171018140304.19737-1-christian.kellermann@solectrix.de>
 <20171018140304.19737-2-christian.kellermann@solectrix.de>
 <20171018173732.368ed195@windsurf.home>
 <87zi8gnbgp.fsf@sx4173-linuxdev.solectrix.de>
 <20171026134701.3e633e03@windsurf>
Message-ID: <20180101133557.5501db35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Oct 2017 13:47:01 +0200, Thomas Petazzoni wrote:

> > >> -		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
> > >> +		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python2-config" \    
> > >
> > > This is related to the *target* python, so how is this related to the
> > > waf problem ?    
> > 
> > It needs to pick up the python headers. Without this I get the error:
> > ?Could not find the python development headers?  
> 
> I don't see how this modification changes anything. BR2_PACKAGE_SAMBA4
> selects BR2_PACKAGE_PYTHON, and BR2_PACKAGE_PYTHON3 depends
> on !BR2_PACKAGE_PYTHON.
> 
> So if you have samba4 enabled, the python version enabled for the
> target is always Python 2.x, and therefore python-config and
> python2-config in staging should be the same thing.
> 
> So we need to understand if this change is really necessary, and if it
> is, why is it that it creates a difference.

Since you did not give further feedback, and I still don't understand
what problem this patch is solving, I've marked your patch as Rejected
in our patch tracking system.

Do not hesitate to send an updated version with an improved explanation
(for example with a defconfig that allows to reproduce the problem, and
some answers to the questions I've asked).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
