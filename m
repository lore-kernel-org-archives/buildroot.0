From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Feb 2014 12:40:15 +0100
Subject: [Buildroot] [PATCH 4 of 7] packages: remove support for
 documentation on target
In-Reply-To: <CAAXf6LXdTpmHf+k7ui+mADC9k--1a2_hqb5vEzmBcPkRRpX4FQ@mail.gmail.com>
References: <patchbomb.1391597406@argentina>
 <ab1e96c7872d5567b2a4.1391597410@argentina>
 <20140205134957.463211f6@skate>
 <CAAXf6LV0DwSccqT8Ur7p=NXn70FFka212O4t9pBbsS6t1VmuOQ@mail.gmail.com>
 <20140205141626.654ac08a@skate> <52F2AB5A.8000006@mind.be>
 <20140206093724.52c0fb0f@skate> <52F36363.5060004@mind.be>
 <CAAXf6LXdTpmHf+k7ui+mADC9k--1a2_hqb5vEzmBcPkRRpX4FQ@mail.gmail.com>
Message-ID: <20140206124015.752dfa3f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 6 Feb 2014 12:34:00 +0100, Thomas De Schampheleire wrote:

> >  But of course that's a large change, since all 846 autotools packages
> > would have to be checked...
> >
> >  So let's start with not adding anything to the global CONF_OPT :-)
> 
> With this conclusion, I'd say we mark the last patch as Rejected (the
> one removing the separate DISABLE_DOCUMENTATION variable).

I don't really come to the same conclusion. Arnout said to not add more
things to the global CONF_OPT.

The existing options in DISABLE_DOCUMENTATION are already part of the
CONF_OPT, so having a small refactoring that removes
DISABLE_DOCUMENTATION and makes it part of the global CONF_OPT doesn't
change anything in terms of removing those global options and moving
them to a per-package solution.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
