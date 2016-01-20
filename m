From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 09:44:24 +0100
Subject: [Buildroot] [PATCH 1/1] iputils: resolve musl compatibility
In-Reply-To: <CAFt09wMh8yShhceAgcF75wDvR08cenG5M_HTwHT_v8_Y1ZveEw@mail.gmail.com>
References: <1453089044-10391-1-git-send-email-matt@thewebers.ws>
 <20160119221324.74332232@free-electrons.com>
 <CAFt09wMh8yShhceAgcF75wDvR08cenG5M_HTwHT_v8_Y1ZveEw@mail.gmail.com>
Message-ID: <20160120094424.26192fa0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

On Tue, 19 Jan 2016 21:04:23 -0600, Matthew Weber wrote:

> >> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> >> index 7510d99..d427b11 100644
> >> --- a/package/iputils/iputils.mk
> >> +++ b/package/iputils/iputils.mk
> >> @@ -4,13 +4,12 @@
> >>  #
> >>  ################################################################################
> >>
> >> -IPUTILS_VERSION = s20121011
> >> -IPUTILS_SITE = http://www.skbuff.net/iputils
> >> -IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
> >> -IPUTILS_LICENSE = GPLv2+, BSD-3c
> >> +IPUTILS_VERSION = c8ff6feaf0442f8efd96ccb415770c54f9e84d47
> >> +IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
> >
> > I don't understand why you are moving to github.
> > http://www.skbuff.net/iputils has some recent tarballs, which
> > correspond to the releases made on github.
> > http://www.skbuff.net/iputils/iputils-s20151218.tar.bz2 will most
> > likely contain the musl fixes.
> 
> The releases don't match.  The github repository was forked in 2014 to
> pull fixes from other distrobutions and centralize the changes after
> the upstream seemed to have gone dormant.  So the fork is the only
> repo that has the musl and other IPv6 updates.  I should have
> referenced the email link.
> http://www.spinics.net/lists/netdev/msg279881.html
> Thoughts?

OK, understood. Can you just put this in a comment in the .mk file?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
