From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 08:13:39 +0200
Subject: [Buildroot] [PATCH 2/4] package: remove 'v' prefix from
 tarball-fetched packages
In-Reply-To: <3afd50b3-5cf1-d240-a7b9-f2f352411f70@mind.be>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-3-victor.huesca@bootlin.com>
 <3afd50b3-5cf1-d240-a7b9-f2f352411f70@mind.be>
Message-ID: <20190620081339.48ebdbb5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jun 2019 23:06:22 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > -FLANNEL_VERSION = v0.5.5
> > +FLANNEL_VERSION = 0.5.5
> >  FLANNEL_SITE = https://github.com/coreos/flannel/archive
> > -FLANNEL_SOURCE = $(FLANNEL_VERSION).tar.gz
> > +FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
> >  
> >  FLANNEL_LICENSE = Apache-2.0
> >  FLANNEL_LICENSE_FILES = LICENSE
> >  
> > -FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
> > +FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=v$(FLANNEL_VERSION)  
> 
>  I don't think this is really needed. Adam, do you think the v belongs in there
> or not? BTW, if the v is removed, it should be noted in the commit log.

Let's see Adam's answer, but what Victor did here is what preserves the
existing behavior.

> > -PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
> > -PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)?
> > +PRU_SOFTWARE_SUPPORT_VERSION = 5.1.0
> > +PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)  
> 
>  It might be just me, but this doesn't look correct... Definitely should be
> explained in the commit message (and therefore, a separate patch).

Indeed, this looks weird, a "v" should have been added before $(PRU_SOFTWARE_SUPPORT_VERSION)

>  Otherwise looks good to me. It would be nice to generally split it up into
> patches that only contain changes that are really the same pattern. So e.g. the
> spidev-test patch is a little different, so it should be a separate patch.
> 
>  Also, I wonder it it's a good idea to make this change for all packages. It
> might be better to limit to packages that actually exist on
> release-monitoring.org. Otherwise, it might happen that when it appears on
> release-monitoring, some package *does* have a prefix, and that would be silly...

Well, I think if a package on release-monitoring.org has a prefix, then
it is its release-monitoring.org definition that is wrong and should be
fixed.

>  Obviously, one way to make sure all of them are on release-monitoring is to add
> the ones which are missing :-)

Victor has already added on release-monitoring.org a number of our
packages. But it's really a massive effort, and I don't think we can
expect one single person to do it all, it will be a very gradual
process.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
